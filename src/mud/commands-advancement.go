package mud

import "strings"

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

	statPoints := e.stats.Get(Stat_StatPoints)
	oldValue := e.stats.Get(stat)
	raiseCost := calculateStatPointsRequiredForStatIncrease(e.stats, stat)
	if statPoints < raiseCost {
		Write("You need %d stat points to raise your %s", raiseCost, stat.String()).ToPlayer(e).Send()
		return
	}

	e.stats.Add(Stat_StatPoints, -raiseCost)
	e.stats.Add(stat, 1)
	calculateAndUpdateStats(e)
	Write("Raised %s from %d -> %d!", stat.String(), oldValue, oldValue+1).ToPlayer(e).Send()

	if e.player != nil {
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
		if job.Base == 0 {
			Write("You can't promote to a %s!", jobType.String()).ToPlayer(e).Send()
			return
		}

		curJobLvl := e.stats.Get(Stat_JobLevel)
		curTier := e.job.cfg.JobTier
		curType := e.job.cfg.JobType

		baseJob, _ := w.TryGetJobConfig(job.Base)
		if job.Base != curType {
			Write("You need to be a %s to be promoted to a %s!", baseJob.Name, job.Name).ToPlayer(e).Send()
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
