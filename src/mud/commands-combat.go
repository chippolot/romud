package mud

import (
	"strconv"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

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
	requestedLevel := 0
	if dotIdx := strings.IndexRune(key, '.'); dotIdx != -1 {
		preDot := key[:dotIdx]
		if num, err := strconv.Atoi(preDot); err == nil {
			requestedLevel = num
			key = key[dotIdx+1:]
		}
	}

	skill, ok := w.skillConfigs[key]
	if !ok {
		Write("%s isn't any skill you've ever heard of!", key).ToPlayer(e).Send()
		return
	}

	if !mudConfig.Skills.AllowCastUnlearnedSkills && !e.skills.KnowsSkill(key) {
		Write("You haven't learned that skill!").ToPlayer(e).Send()
		return
	}

	level := utils.MaxInt(1, e.skills.SkillLevel(key))
	if requestedLevel != 0 {
		if !skill.SelectableLevel() {
			Write("You can't select cast level for %s!", skill.Name).ToPlayer(e).Send()
			return
		} else if requestedLevel > level {
			Write("You've only practiced %s to level %d!", skill.Name, level).ToPlayer(e).Send()
			return
		} else {
			level = requestedLevel
		}
	}

	// Get skill target
	var target *Entity
	switch skill.TargetType {
	case SkillTargetType_Self:
		target = e
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

	performSkill(e, w, target, skill, level)
}
