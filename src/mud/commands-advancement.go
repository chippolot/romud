package mud

import (
	"strconv"
	"strings"
)

func DoRaiseStat(e *Entity, w *World, tokens []string) {
	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Which stat do you want to raise?").ToPlayer(e).Send()
		return
	}

	statStr := strings.ToLower(tokens[1])
	stat, err := ParseStatType(statStr)
	if err != nil {
		Write("That's not a stat type!").ToPlayer(e).Send()
		return
	}

	amt := 1
	if numtoks > 2 {
		if amt, err = strconv.Atoi(tokens[2]); err != nil || amt <= 0 {
			Write("%s is not a valid amount to raise %s by", amt, stat.String()).ToPlayer(e).Send()
			return
		}
	}

	oldValue := e.stats.Get(stat)
	if oldValue >= MaxStatValue {
		Write("You've already maxed out %s", stat.String()).ToPlayer(e).Send()
		return
	}

	for i := 0; i < amt; i++ {
		cost := calculateStatPointsRequiredForStatIncrease(e.stats, stat)
		if e.stats.Get(Stat_StatPoints) < cost {
			Write("You need %d stat points to raise your %s", cost, stat.String()).ToPlayer(e).Send()
			break
		}

		e.stats.Add(Stat_StatPoints, -cost)
		e.stats.Add(stat, 1)
	}

	newValue := e.stats.Get(stat)
	calculateAndUpdateStats(e)

	if oldValue != newValue && e.player != nil {
		Write("Raised %s from %d -> %d!", stat.String(), oldValue, newValue).ToPlayer(e).Send()
		e.player.saveRequested = true
	}
}

func DoChangeJob(e *Entity, w *World, tokens []string) {
	if e.job == nil {
		Write("You are forever jobless!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Which job do you want to change to?").ToPlayer(e).Send()
		return
	}

	jobTypeStr := strings.ToLower(tokens[1])
	jobType, err := ParseJobTypeMask(jobTypeStr)
	if err != nil {
		Write("That's not a job type!").ToPlayer(e).Send()
		return
	}
	job, _ := w.TryGetJobConfig(jobType)

	if !mudConfig.Jobs.IgnoreJobRequirements {
		if job.baseJob == nil {
			Write("You can't promote to a %s!", jobType.String()).ToPlayer(e).Send()
			return
		}

		curJobLvl := e.stats.Get(Stat_JobLevel)
		curTier := e.job.cfg.JobTier

		if job.Base != e.job.cfg.JobType {
			Write("You need to be a %s to be promoted to a %s!", job.baseJob.Name, job.Name).ToPlayer(e).Send()
			return
		}

		// TODO: Job: Make constant
		requiredLvl := 10
		if curTier == JobTier_First {
			requiredLvl = 40
		}
		if curJobLvl < requiredLvl {
			Write("You need to be job level %d to be promoted to a %s!", requiredLvl, job.Name).ToPlayer(e).Send()
			return
		}
	}

	// Change jobs
	e.job = newJob(job)
	e.data.Job.JobType = jobType
	e.job.data = e.data.Job
	calculateAndUpdateStats(e)

	Write("You have been promoted to a %s!", job.Name).ToPlayer(e).Colorized(Color_PositiveBld).Send()
	Write("Hooray! %s has been promoted to a %s", e.GetName(), job.Name).ToEntityRoom(w, e).Ignore(e).Send()

	if e.player != nil {
		e.player.saveRequested = true
	}
}

func DoLearnSkill(e *Entity, w *World, tokens []string) {
	if e.job == nil {
		Write("You need a job to learn skills!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Which skill do you want to learn?").ToPlayer(e).Send()
		return
	}

	skey := strings.ToLower(tokens[1])
	skill, ok := w.TryGetSkillConfig(skey)
	if !ok {
		Write("That's not a skill!").ToPlayer(e).Send()
		return
	}

	if e.skills.KnowsSkill(skill.Key) {
		Write("You've already learned %s!", skill.Name).ToPlayer(e).Send()
		return
	}

	if !mudConfig.Skills.IgnorePoints && e.stats.Get(Stat_SkillPoints) < 1 {
		Write("You've need a skill point to learn %s!", skill.Name).ToPlayer(e).Send()
		return
	}

	if !mudConfig.Skills.IgnorePreRequirements && skill.PreReqs != nil {
		if e.skills.SkillLevel(skill.PreReqs.Key) < skill.PreReqs.Level {
			preReqSkill, _ := w.TryGetSkillConfig(skill.PreReqs.Key)
			Write("Learning %s requires that you know %s Lv.%d", skill.Name, preReqSkill.Name, skill.PreReqs.Level).ToPlayer(e).Send()
			return
		}
	}

	if !e.job.CanLearnSkill(skill.Key) {
		Write("%ss cannot learn %s!", e.job.cfg.Name, skill.Name).ToPlayer(e).Send()
		return
	}

	// Learn Skill
	if !mudConfig.Skills.IgnorePoints {
		e.stats.Add(Stat_SkillPoints, -1)
	}
	e.skills.Learn(skill.Key)
	Write("You learn %s!", skill.Name).ToPlayer(e).Colorized(Color_PositiveBld).Send()

	if e.player != nil {
		e.player.saveRequested = true
	}
}

func DoPracticeSkill(e *Entity, w *World, tokens []string) {
	if e.job == nil {
		Write("You need a job to practice skills!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Which skill do you want to practice?").ToPlayer(e).Send()
		return
	}

	skey := strings.ToLower(tokens[1])
	skill, ok := w.TryGetSkillConfig(skey)
	if !ok {
		Write("That's not a skill!").ToPlayer(e).Send()
		return
	}

	if !e.skills.KnowsSkill(skill.Key) {
		Write("You haven't learned %s!", skill.Name).ToPlayer(e).Send()
		return
	}

	if e.skills.SkillMastered(skill.Key) {
		Write("You've already mastered %s!", skill.Name).ToPlayer(e).Send()
		return
	}

	if !mudConfig.Skills.IgnorePoints && e.stats.Get(Stat_SkillPoints) < 1 {
		Write("You've need a skill point to practice %s!", skill.Name).ToPlayer(e).Send()
		return
	}

	// Learn Skill
	if !mudConfig.Skills.IgnorePoints {
		e.stats.Add(Stat_SkillPoints, -1)
	}
	e.skills.LevelUp(skill.Key)
	Write("You practice %s, improving it to level %d", skill.Name, e.skills.SkillLevel(skill.Key)).ToPlayer(e).Colorized(Color_PositiveBld).Send()

	if e.player != nil {
		e.player.saveRequested = true
	}
}
