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
		applyDamage(e, w, nil, dam, DamCtx_Admin, 0, false, "hit", "hits")
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
		Write("Admin: Healed Player! ").ToPlayer(e).Send()
		e.stats.Add(Stat_HP, 999999)
		e.stats.Add(Stat_SP, 999999)
		e.stats.Add(Stat_Mov, 999999)
	case "pdam":
		if len(tokens) <= 2 {
			Write("Admin: How much damage?").ToPlayer(e).Send()
			return
		}
		dam, _ := strconv.Atoi(tokens[2])
		Write("Admin: Damaging Player for %d", dam).ToPlayer(e).Send()
		applyDamage(e, w, nil, dam, DamCtx_Admin, 0, false, "hit", "hits")
	case "pxp":
		if len(tokens) <= 2 {
			Write("Admin: How much xp?").ToPlayer(e).Send()
			return
		}
		xp, _ := strconv.Atoi(tokens[2])
		Write("Admin: Added XP %d", xp).ToPlayer(e).Send()
		applyXp(e, w, xp)
	case "pgold":
		if len(tokens) <= 2 {
			Write("Admin: How much gold?").ToPlayer(e).Send()
			return
		}
		amt, _ := strconv.Atoi(tokens[2])
		e.stats.Add(Stat_Gold, amt)
		Write("Admin: Added %dz", amt).ToPlayer(e).Send()
	case "spawne":
		if len(tokens) <= 2 {
			Write("Admin: Which entity?").ToPlayer(e).Send()
			return
		}
		key := tokens[2]
		if ent := spawnEntityByKey(key, w, r.cfg.Id); ent != nil {
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
		if item := spawnItemByKey(key, r); item != nil {
			Write("Admin: Spawned Item %s", key).ToPlayer(e).Send()
		} else {
			Write("Admin: Failed to load item %s", key).ToPlayer(e).Send()
		}
	default:
		Write("Admin: Unrecognized command: %s", tokens[1]).ToPlayer(e).Send()
	}
}
