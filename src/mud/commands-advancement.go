package mud

func DoRaiseStat(e *Entity, w *World, tokens []string) {
	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Which stat do you want to raise?").ToPlayer(e).Send()
		return
	}

	stat, err := ParseStatType(tokens[1])
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
	calculateAndUpdatePlayerStats(e)
	Write("Raised %s from %d -> %d!", stat.String(), oldValue, oldValue+1).ToPlayer(e).Send()

	if e.player != nil {
		w.SavePlayerCharacter(e.player.id)
	}
}
