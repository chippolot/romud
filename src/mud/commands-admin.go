package mud

import "strconv"

func DoAdmin(e *Entity, w *World, tokens []string) {
	if len(tokens) < 2 {
		Write("What command do you want to run?").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]

	switch tokens[1] {
	case "pkill":
		dam := 9999
		Write("Admin: Damaging Player for %d", dam).ToPlayer(e).Send()
		applyDamage(e, w, nil, dam, DamCtx_Admin, Dam_Slashing, false, "hit", "hits")
	case "pstatus":
		if len(tokens) <= 2 {
			Write("Admin: Which effect?").ToPlayer(e).Send()
			return
		}
		statusStr := tokens[2]
		if status, err := ParseStatusEffectType(statusStr); err == nil {
			Write("Admin: Adding %s effect on Player", status.String()).ToPlayer(e).Send()
			performAddStatusEffect(e, w, status, 10)
		} else {
			Write("Admin: Failed to parse status effect '%s'", statusStr).ToPlayer(e).Send()
		}
	case "pheal":
		heal := 9999
		Write("Admin: Healing Player for %d", heal).ToPlayer(e).Send()
		e.stats.Add(Stat_HP, heal)
	case "pdam":
		if len(tokens) <= 2 {
			Write("Admin: How much damage?").ToPlayer(e).Send()
			return
		}
		dam, _ := strconv.Atoi(tokens[2])
		Write("Admin: Damaging Player for %d", dam).ToPlayer(e).Send()
		applyDamage(e, w, nil, dam, DamCtx_Admin, Dam_Slashing, false, "hit", "hits")
	case "pxp":
		if len(tokens) <= 2 {
			Write("Admin: How much xp?").ToPlayer(e).Send()
			return
		}
		xp, _ := strconv.Atoi(tokens[2])
		Write("Admin: Added XP %d", xp).ToPlayer(e).Send()
		applyXp(e, w, xp)
	case "spawne":
		if len(tokens) <= 2 {
			Write("Admin: Which entity?").ToPlayer(e).Send()
			return
		}
		key := tokens[2]
		if cfg, ok := w.TryGetEntityConfig(key); ok {
			ent := NewEntity(cfg)
			w.AddEntity(ent, r.cfg.Id)
			Write("Admin: Spawned Entity %s", key).ToPlayer(e).Send()
		} else {
			Write("Admin: Failed to load entity %s", key).ToPlayer(e).Send()
		}
	case "spawni":
		if len(tokens) <= 2 {
			Write("Admin: Which item?").ToPlayer(e).Send()
			return
		}
		key := tokens[2]
		if cfg, ok := w.TryGetItemConfig(key); ok {
			itm := NewItem(cfg)
			w.AddItem(itm, r.cfg.Id)
			Write("Admin: Spawned Item %s", key).ToPlayer(e).Send()
		} else {
			Write("Admin: Failed to load item %s", key).ToPlayer(e).Send()
		}
	default:
		Write("Admin: Unrecognized command: %s", tokens[1]).ToPlayer(e).Send()
	}
}
