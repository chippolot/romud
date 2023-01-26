package mud

import "math"

func calculateAndUpdatePlayerStats(s *Stats) {
	s.Set(Stat_MaxHP, calculateMaxHP(s))
	s.Set(Stat_MaxSP, calculateMaxSP(s))
	s.Set(Stat_MaxMov, calculateMaxMov(s))
}

func calculateCarryingCapacity(s *Stats) int {
	return s.Get(Stat_Str)*10 + 50
}

func calculateMaxHP(s *Stats) int {
	baseHP := 35 + 5*s.Get(Stat_Level)
	return int(float64(baseHP) * (1 + float64(s.Get(Stat_Vit))*0.1))
}

func calculateMaxSP(s *Stats) int {
	baseSP := 10 + 2*s.Get(Stat_Level)
	return int(float64(baseSP) * (1 + float64(s.Get(Stat_Int))*0.1))
}

func calculateMaxMov(s *Stats) int {
	baseMov := 33 + 2*s.Get(Stat_Level)
	return int(float64(baseMov) * (1 + float64(s.Get(Stat_Agi))*0.1))
}

func calculateExpValue(s *Stats) int {
	return int(float64(s.cfg.BaseExp) + s.cfg.ExpPerHP*float64(s.Get(Stat_MaxHP)))
}

func calculateNextLevelXp(lvl int) int {
	return int(0.75 * math.Pow(float64(lvl), 2.5))
}

func calculateAttacksPerRound(s *Stats) float64 {
	aspd := float64(s.Get(Stat_AtkSpd))
	return 0.025*aspd - 0.00025*math.Pow(aspd, 2) + math.Pow(10, -6)*math.Pow(aspd, 3)
}
