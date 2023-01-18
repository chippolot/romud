package mud

import "strconv"

func DoAdmin(e *Entity, w *World, tokens []string) {
	tokens = lowerTokens(tokens)

	if len(tokens) < 2 {
		SendToPlayer(e, "What command do you want to run?")
		return
	}

	r := w.rooms[e.data.RoomId]

	switch tokens[1] {
	case "pkill":
		dam := 9999
		SendToPlayer(e, "Admin: Damaging Player for %d", dam)
		applyDamage(e, w, nil, dam, DamCtx_Admin, Dam_Slashing, "hit", "hits")
	case "pstatus":
		if len(tokens) <= 2 {
			SendToPlayer(e, "Admin: Which effect?")
			return
		}
		statusStr := tokens[2]
		if status, err := ParseStatusEffectType(statusStr); err == nil {
			SendToPlayer(e, "Admin: Adding %s effect on Player", status.String())
			performAddStatusEffect(e, w, status, 10)
		} else {
			SendToPlayer(e, "Admin: Failed to parse status effect '%s'", statusStr)
		}
	case "pheal":
		heal := 9999
		SendToPlayer(e, "Admin: Healing Player for %d", heal)
		e.stats.Add(Stat_HP, heal)
	case "pdam":
		if len(tokens) <= 2 {
			SendToPlayer(e, "Admin: How much damage?")
			return
		}
		dam, _ := strconv.Atoi(tokens[2])
		SendToPlayer(e, "Admin: Damaging Player for %d", dam)
		applyDamage(e, w, nil, dam, DamCtx_Admin, Dam_Slashing, "hit", "hits")
	case "pxp":
		if len(tokens) <= 2 {
			SendToPlayer(e, "Admin: How much xp?")
			return
		}
		xp, _ := strconv.Atoi(tokens[2])
		applyXp(e, xp)
		SendToPlayer(e, "Added XP %d", xp)
	case "spawne":
		if len(tokens) <= 2 {
			SendToPlayer(e, "Admin: Which entity?")
			return
		}
		key := tokens[2]
		if cfg, ok := w.TryGetEntityConfig(key); ok {
			ent := NewEntity(cfg)
			w.AddEntity(ent, r.cfg.Id)
			SendToPlayer(e, "Admin: Spawned Entity %s", key)
		} else {
			SendToPlayer(e, "Admin: Failed to load entity %s", key)
		}
	case "spawni":
		if len(tokens) <= 2 {
			SendToPlayer(e, "Admin: Which item?")
			return
		}
		key := tokens[2]
		if cfg, ok := w.TryGetItemConfig(key); ok {
			itm := NewItem(cfg)
			w.AddItem(itm, r.cfg.Id)
			SendToPlayer(e, "Admin: Spawned Item %s", key)
		} else {
			SendToPlayer(e, "Admin: Failed to load item %s", key)
		}
	default:
		SendToPlayer(e, "Admin: Unrecognized command: %s", tokens[1])
	}
}
