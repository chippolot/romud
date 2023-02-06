package mud

func DoAttack(e *Entity, w *World, tokens []string) {
	q, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		Write("What do you want to attack?").ToPlayer(e).Send()
		return
	}

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]
	targets := SearchEntities(q, e, r)
	if len(targets) == 0 {
		Write("They don't seem to be here...").ToPlayer(e).Send()
		return
	}
	target := targets[0]
	if target == e {
		Write("Stop hitting yourself!").ToPlayer(e).Send()
		Write("%s hits %sself??", ObservableName(e), e.Gender().GetObjectPronoun()).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
		return
	}
	performAttack(e, w, target)
}

func DoSkill(e *Entity, w *World, tokens []string) {
	numtoks := len(tokens)
	if numtoks < 2 {
		Write("Which skill did you want to use?").ToPlayer(e).Send()
		return
	}

	key := tokens[1]
	skill, ok := w.skillConfigs[key]
	if !ok {
		Write("%s isn't any skill you've ever heard of!", key).ToPlayer(e).Send()
		return
	}
	// Get skill target
	var target *Entity
	switch skill.TargetType {
	case SkillTargetType_Self:
		target = e
	// TODO: Skill: Support single ally and single entity
	case SkillTargetType_Single_Enemy, SkillTargetType_Single_Ally, SkillTargetType_Single_Entity:
		if numtoks < 3 {
			if e.combat == nil || e.combat.target == nil {
				Write("What do you want to use this skill on?").ToPlayer(e).Send()
				return
			} else {
				target = e.combat.target
			}
		} else {
			q, ok, _ := parseSearchQuery(tokens[2:], false)
			if !ok {
				Write("What do you want to use this skill on?").ToPlayer(e).Send()
				return
			}

			r := w.rooms[e.data.RoomId]
			targets := SearchEntities(q, e, r)
			if len(targets) == 0 {
				Write("They don't seem to be here...").ToPlayer(e).Send()
				return
			}
			target = targets[0]
		}
	}

	// TODO: Skill: Level
	performSkill(e, w, target, skill, 1)
}
