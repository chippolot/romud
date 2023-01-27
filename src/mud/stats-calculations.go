package mud

import (
	"math"

	"github.com/chippolot/go-mud/src/utils"
)

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

func calculatePlayerSoftDEF(s *Stats) int {
	// Mechanics: RO Classic
	vit := s.GetFloat(Stat_Vit)
	vit30 := int(vit * 0.3)
	vit50 := int(vit * 0.5)
	minA := vit30
	maxA := utils.MaxInts(vit30, int(math.Pow(vit, 2)/150.0-1))
	return vit50 + utils.RandRange(minA, maxA)
}

func calculateMonsterSoftDEF(s *Stats) int {
	return (s.Get(Stat_Vit) + s.Get(Stat_Level)) / 2
}

func calculateExpValue(s *Stats) int {
	return int(float64(s.cfg.BaseExp) + s.cfg.ExpPerHP*s.GetFloat(Stat_MaxHP))
}

func calculateNextLevelXp(lvl int) int {
	return int(0.75 * math.Pow(float64(lvl), 2.5))
}

func calculateHit(s *Stats) int {
	return 175 + s.Get(Stat_Level) + s.Get(Stat_Dex) + int(s.GetFloat(Stat_Luk)/3.0)
}

func calculateStatusFlee(s *Stats) int {
	return 100 + s.Get(Stat_Level) + s.Get(Stat_Agi) + int(s.GetFloat(Stat_Luk)/5.0)
}

func calculatePerfectDodge(s *Stats) int {
	// Mechanics: RO Classic
	return utils.MinInts(100, int(s.GetFloat(Stat_Luk)/10.0)+1)
}

func calculateStatusCritical(s *Stats) int {
	// Mechanics: RO Classic
	return int(1 + s.GetFloat(Stat_Luk)/3.0)
}

func calculateCrticialShield(s *Stats) int {
	// Mechanics: RO Classic
	return int(s.GetFloat(Stat_Luk) / 5.0)
}

func calculateAttacksPerRound(s *Stats) float64 {
	// Mechanics: RO Classic
	aspd := s.GetFloat(Stat_AtkSpd)
	return 0.025*aspd - 0.00025*math.Pow(aspd, 2) + math.Pow(10, -6)*math.Pow(aspd, 3)
}

func calculateStatusAttackPower(s *Stats) int {
	// Mechanics: RO Classic
	str := s.GetFloat(Stat_Str)
	dex := s.GetFloat(Stat_Dex)
	luk := s.GetFloat(Stat_Luk)
	return int(str + math.Pow(str/10.0, 2) + dex/5.0 + luk/5.0)
}
