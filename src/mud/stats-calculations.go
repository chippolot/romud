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
	baseHP := 35 + 5*s.GetFloat(Stat_Level)
	return int(baseHP * (1 + s.GetFloat(Stat_Vit)) * 0.1)
}

func calculateMaxSP(s *Stats) int {
	baseSP := 10 + 2*s.GetFloat(Stat_Level)
	return int(baseSP * (1 + s.GetFloat(Stat_Int)) * 0.1)
}

func calculateMaxMov(s *Stats) int {
	baseMov := 33 + 2*s.GetFloat(Stat_Level)
	return int(baseMov * (1 + s.GetFloat(Stat_Agi)) * 0.1)
}

func calculatePlayerDEF(s *Stats) int {
	return int(s.GetFloat(Stat_Vit)/2.0 + s.GetFloat(Stat_Agi)/5.0 + s.GetFloat(Stat_Level)/2.0)
}

func calculateMonsterDEF(s *Stats) int {
	return (s.Get(Stat_Vit) + s.Get(Stat_Level)) / 2
}

func calculateExpValue(s *Stats) int {
	return int(float64(s.cfg.BaseExp) + s.cfg.ExpPerHP*s.GetFloat(Stat_MaxHP))
}

func calculateNextLevelXp(lvl int) int {
	return int(0.75 * math.Pow(float64(lvl), 2.5))
}

func calculateAttacksPerRound(s *Stats) float64 {
	aspd := s.GetFloat(Stat_AtkSpd)
	return 0.025*aspd - 0.00025*math.Pow(aspd, 2) + math.Pow(10, -6)*math.Pow(aspd, 3)
}

func calculateBaseAttackPower(s *Stats) int {
	return int(s.GetFloat(Stat_Level)/4.0 + s.GetFloat(Stat_Str) + s.GetFloat(Stat_Dex)/5.0 + s.GetFloat(Stat_Luk)/3.0)
}
