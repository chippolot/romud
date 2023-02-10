package mud

import (
	"fmt"
	"sort"
	"strings"

	"github.com/chippolot/romud/src/utils"
)

func DoConsider(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Who do you want to consider attacking?").ToPlayer(e).Send()
		return
	}

	query, ok, _ := parseSearchQuery(tokens[1:], false)
	if ok {
		if ents := SearchEntities(query, e, r); len(ents) > 0 {
			tgt := ents[0]
			if e == tgt {
				Write("You size yourself up.").ToPlayer(e).Send()
				return
			}

			diff := e.stats.Get(Stat_Level) - tgt.stats.Get(Stat_Level)

			if diff <= 2 && diff >= -2 {
				Write("You feel evenly matched. It's anyone's game.").ToPlayer(e).Send()
			} else if diff > 15 {
				Write("You could take them with your hands tied behind your back!").ToPlayer(e).Send()
			} else if diff > 8 {
				Write("It would be an easy fight.").ToPlayer(e).Send()
			} else if diff > 2 {
				Write("They appear weaker than you.").ToPlayer(e).Send()
			} else if diff < -10 {
				Write("Never in a million years!").ToPlayer(e).Send()
			} else if diff < -2 {
				Write("They appear stronger than you.").ToPlayer(e).Send()
			}
			return
		}
	}
	Write("You don't see them here.").ToPlayer(e).Send()
}

func DoLook(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write(fmt.Sprintf("%s%s", r.Describe(e), utils.NewLine)).ToPlayer(e).Send()
		return
	}

	// Is the player trying to look in something?
	if tokens[1] == "in" {
		containerQuery, ok, _ := parseSearchQuery(tokens[2:], false)
		if !ok {
			Write("What do you want to look in?").ToPlayer(e).Send()
			return
		}
		if containers := SearchItems(containerQuery, e, r); len(containers) > 0 {
			Write(containers[0].DescribeContents()).ToPlayer(e).Send()
			return
		}
		Write("You don't see that here.").ToPlayer(e).Send()
		return
	}

	// Looking at entity or item?
	query, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		Write("You don't see that here.").ToPlayer(e).Send()
		return
	}
	if ents := SearchEntities(query, e, r); len(ents) > 0 {
		Write(ents[0].Describe()).ToPlayer(e).Send()
	} else if itms := SearchItems(query, r, e); len(itms) > 0 {
		Write(itms[0].Describe()).ToPlayer(e).Send()
	} else {
		Write("You don't see that here.").ToPlayer(e).Send()
	}
}

func DoInventory(e *Entity, _ *World, _ []string) {
	Write(e.DescribeInventory()).ToPlayer(e).Send()
}

func DoEquipment(e *Entity, _ *World, _ []string) {
	Write(e.DescribeEquipment()).ToPlayer(e).Send()
}

func DoStatus(e *Entity, w *World, tokens []string) {
	numtoks := len(tokens)
	if numtoks < 2 {
		Write(e.DescribeStatus()).ToPlayer(e).Send()
		return
	}

	// TODO: Make admin only
	query, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		Write("You don't see that here.").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]
	if ents := SearchEntities(query, e, r); len(ents) > 0 {
		Write(ents[0].DescribeStatus()).ToPlayer(e).Send()
	} else {
		Write("You don't see that here.").ToPlayer(e).Send()
	}
}

func DoWho(e *Entity, w *World, _ []string) {
	var sb utils.StringBuilder
	sb.WriteLinef("Online Players: %d", len(w.players))
	sb.WriteHorizontalDivider()
	sb.WriteLinef("  (you) %s", e.GetName())
	for _, e2 := range w.players {
		if e2 != e {
			sb.WriteLinef("  %s", e2.GetName())
		}
	}
	Write(sb.String()).ToPlayer(e).Send()
}

func DoListCommands(e *Entity, _ *World, _ []string) {
	var sb utils.StringBuilder
	sb.WriteLine("Available Commands:")
	sb.WriteHorizontalDivider()
	for _, cmd := range Commands {
		if len(cmd.aliases) == 1 {
			sb.WriteLinef("%-20s: %s", cmd.aliases[0], cmd.desc)
		} else {
			lines := utils.LineBreak(strings.Join(cmd.aliases, ","), 15, ",")
			sb.WriteLinef("%-20s: %s", lines[0], cmd.desc)
			for i := 1; i < len(lines); i++ {
				sb.WriteLinef("  %s", lines[i])
			}
		}
	}
	Write(sb.String()).ToPlayer(e).Send()
}

func DoListJobs(e *Entity, w *World, tokens []string) {
	if e.job == nil {
		Write("You are forever jobless!").ToPlayer(e).Send()
		return
	}

	curJobLvl := e.stats.Get(Stat_JobLevel)
	curTier := e.job.cfg.JobTier
	curType := e.job.cfg.JobType

	var sb utils.StringBuilder
	for i := 0; ; i++ {
		jobType := JobTypeMask(1 << i)
		if jobType == JobType_Num {
			break
		}

		// Skip job types which the player can't possibly be promoted to
		cfg, _ := w.TryGetJobConfig(jobType)
		if cfg.JobTier <= curTier {
			continue
		}

		// Don't show future jobs on different job path
		if curTier == JobTier_First && cfg.Base != curType {
			continue
		}

		// Determine job requirements
		requirement := "None"
		if cfg.baseJob != nil {
			lvlReq := 10
			if cfg.baseJob.JobTier == JobTier_First {
				lvlReq = 40
			}
			if curJobLvl >= lvlReq {
				requirement = "* Ready *"
			} else {
				requirement = fmt.Sprintf("%-9s Lv.%d", cfg.baseJob.Name, lvlReq)
			}
		}

		// Create row
		sb.WriteLinef("%-20s%-20s", cfg.Name, requirement)
	}

	if sb.Len() > 0 {
		Write("%-20s%-20s", "Job", "Requirement").ToPlayer(e).Send()
		Write(utils.HorizontalDivider).ToPlayer(e).Send()
		Write(sb.String()).ToPlayer(e).Send()
	} else {
		Write("There are no further jobs you can be promoted to!").ToPlayer(e).Send()
		return
	}
}

func DoListSkills(e *Entity, w *World, tokens []string) {
	var sb utils.StringBuilder

	// TODO: Skills: List skill descriptions

	if len(tokens) > 1 {
		jobTypeStr := strings.ToLower(tokens[1])
		jobType, err := ParseJobTypeMask(jobTypeStr)
		if err != nil {
			Write("That's not a job type!").ToPlayer(e).Send()
			return
		}
		job, _ := w.TryGetJobConfig(jobType)

		listJobSkills(e, job, w, &sb, fmt.Sprintf("%s Skills", job.Name), true)
	} else {

		// List skills that player has learned
		for _, skill := range e.skills.data.Learned {
			lvlStr := "* MAX *"
			if skill.Level < skill.cfg.MaxLevel {
				lvlStr = fmt.Sprintf("%d/%d", skill.Level, skill.cfg.MaxLevel)
			}
			selStr := "No"
			if skill.cfg.SelectableLevel() {
				selStr = "Yes"
			}
			sb.WriteLinef("%-20s%-20s%-10s%-10s", skill.cfg.Name, skill.cfg.Key, lvlStr, selStr)
		}
		if sb.Len() > 0 {
			Write("Known Skills").ToPlayer(e).Send()
			Write(utils.HorizontalDivider).ToPlayer(e).Send()
			Write("%-20s%-20s%-10s%-10s", "Skill", "Keyword", "Level", "Selectable").ToPlayer(e).Send()
			Write(utils.HorizontalDivider).ToPlayer(e).Send()
			Write(sb.String()).ToPlayer(e).Send()
			sb.Reset()
		}

		// List skills that player can learn
		if e.job != nil {
			listJobSkills(e, e.job.cfg, w, &sb, "Learnable Skills", false)
		}
	}
}

func DoAlias(e *Entity, _ *World, tokens []string) {
	if e.player == nil {
		return
	}
	switch len(tokens) {
	case 0, 1:
		var sb utils.StringBuilder
		sb.WriteLine("Current Aliases")
		sb.WriteHorizontalDivider()
		aliasKeys := utils.Keys(e.player.data.Aliases)
		sort.Strings(aliasKeys)
		for _, aKey := range aliasKeys {
			sb.WriteLinef("  %s -> %s", aKey, e.player.data.Aliases[aKey])
		}
		Write(sb.String()).ToPlayer(e).Send()
	case 2:
		Write("What do you want %s to expand to?", tokens[1]).ToPlayer(e).Send()
	default:
		if _, ok := CommandsLookup[tokens[1]]; ok {
			Write("Cannot add alias %s -- command already exists", tokens[1]).ToPlayer(e).Send()
			return
		}
		e.player.data.Aliases[tokens[1]] = strings.Join(tokens[2:], " ")
		Write("Added alias for %s", tokens[1]).ToPlayer(e).Send()
	}
}

func DoUnalias(e *Entity, _ *World, tokens []string) {
	if e.player == nil {
		return
	}
	switch len(tokens) {
	case 0, 1:
		Write("What do you want to unalias?").ToPlayer(e).Send()
	default:
		aliasKey := tokens[1]
		if _, ok := e.player.data.Aliases[aliasKey]; !ok {
			Write("You don't have an alias for %s", tokens[1]).ToPlayer(e).Send()
		} else {
			delete(e.player.data.Aliases, aliasKey)
			Write("Removed alias for %s", tokens[1]).ToPlayer(e).Send()
		}
	}
}

func DoSave(e *Entity, w *World, _ []string) {
	if e.player != nil {
		e.player.saveRequested = true
	}
	Write("Saved game.").ToPlayer(e).Send()
}

func DoQuit(e *Entity, w *World, _ []string) {
	if e.player != nil {
		w.LogoutPlayer(e.player)
	}
}

func listJobSkills(e *Entity, jobCfg *JobConfig, w *World, sb *utils.StringBuilder, header string, includeKnownSkills bool) {
	for skey, _ := range jobCfg.learnableSkills {
		if includeKnownSkills && e.skills.KnowsSkill(skey) {
			continue
		}
		skill, _ := w.TryGetSkillConfig(skey)
		if skill == nil {
			continue
		}
		reqsStr := ""
		if skill.PreReqs != nil {
			prereqSkill, _ := w.TryGetSkillConfig(skill.PreReqs.Key)
			reqsStr = fmt.Sprintf("%s Lv.%d", prereqSkill.Name, skill.PreReqs.Level)
		}
		sb.WriteLinef("%-20s%-20s%-20s", skill.Name, skill.Key, reqsStr)
	}
	Write(header).ToPlayer(e).Send()
	Write(utils.HorizontalDivider).ToPlayer(e).Send()
	Write("%-20s%-20s%-20s", "Skill", "Keyword", "Reqs").ToPlayer(e).Send()
	Write(utils.HorizontalDivider).ToPlayer(e).Send()
	if sb.Len() > 0 {
		Write(sb.String()).ToPlayer(e).Send()
		sb.Reset()
	} else {
		Write("None.").ToPlayer(e).Send()
	}
}
