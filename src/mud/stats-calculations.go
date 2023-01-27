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
	// Mechanics: RO Classic
	return s.Get(Stat_Str)*10 + 50
}

func calculateMaxHP(s *Stats) int {
	// Mechanics: RO Classic
	baseHP := 35 + 5*s.GetFloat(Stat_Level)
	return int(baseHP * (1 + s.GetFloat(Stat_Vit)) * 0.1)
}

func calculateMaxSP(s *Stats) int {
	// Mechanics: RO Classic
	baseSP := 10 + 2*s.GetFloat(Stat_Level)
	return int(baseSP * (1.0 + s.GetFloat(Stat_Int)) * 0.1)
}

func calculateMaxMov(s *Stats) int {
	// Mechanics: RO Classic
	baseMov := 33 + 2*s.GetFloat(Stat_Level)
	return int(baseMov * (1 + s.GetFloat(Stat_Agi)) * 0.1)
}

func calculatePlayerSoftDEF(s *Stats) int {
	// Mechanics: RO Classic
	vit := s.GetFloat(Stat_Vit)
	vit30 := int(vit * 0.3)
	vit50 := int(vit * 0.5)
	minA := vit30
	maxA := utils.MaxInt(vit30, int(math.Pow(vit, 2)/150.0-1))
	return vit50 + utils.RandRange(minA, maxA)
}

func calculateMonsterSoftDEF(s *Stats) int {
	// Mechanics: RO Classic
	vit := s.GetFloat(Stat_Vit)
	return int(vit) + utils.RandRange(0, int(math.Pow(vit/20.0, 2)-1.0))
}

func calculateHit(s *Stats) int {
	// Mechanics: RO Classic
	return s.Get(Stat_Level) + s.Get(Stat_Dex)
}

func calculateStatusFlee(s *Stats) int {
	// Mechanics: RO Classic
	return s.Get(Stat_Level) + s.Get(Stat_Agi)
}

func calculatePerfectDodge(s *Stats) int {
	// Mechanics: RO Classic
	return utils.MinInt(100, int(s.GetFloat(Stat_Luk)/10.0)+1)
}

func calculateStatusCritical(s *Stats) int {
	// Mechanics: RO Classic
	return int(1 + s.GetFloat(Stat_Luk)/3.0)
}

func calculateCrticialShield(s *Stats) int {
	// Mechanics: RO Classic
	return int(s.GetFloat(Stat_Luk) / 5.0)
}

func calculateAttackSpeed(s *Stats) int {
	// Mechanics: RO Classic
	weaponDelay := 50.0 // TODO: Weapon types
	speedMod := 0.0     // TODO: Speed mod
	agi := s.GetFloat(Stat_Agi)
	dex := s.GetFloat(Stat_Dex)
	aspd := int(200.0 - (weaponDelay-((weaponDelay*agi/25.0)+(weaponDelay*dex/100.0))/10.0)*(1.0-speedMod))
	// 200 - (1 - ((1/25)+(1/100))/10)
	return utils.ClampInt(aspd, 0, 190)
}

func calculateAttacksPerRound(s *Stats) float64 {
	// Mechanics: RO Classic
	aspd := float64(calculateAttackSpeed(s))
	return 50.0 / (200.0 - aspd)
}

func calculateStatusAttackPower(s *Stats) int {
	// Mechanics: RO Classic
	str := s.GetFloat(Stat_Str)
	dex := s.GetFloat(Stat_Dex)
	luk := s.GetFloat(Stat_Luk)
	return int(str + math.Pow(str/10.0, 2) + dex/5.0 + luk/5.0)
}
