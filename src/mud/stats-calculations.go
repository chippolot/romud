package mud

import (
	"log"
	"math"

	"github.com/chippolot/go-mud/src/utils"
)

func calculateAndUpdatePlayerStats(s *Stats) {
	s.Set(Stat_MaxHP, calculateMaxHP(s))
	s.Set(Stat_MaxSP, calculateMaxSP(s))
	s.Set(Stat_MaxMov, calculateMaxMov(s))
}

func calculateAndUpdateMonsterStats(s *Stats) {
	s.Set(Stat_MaxMov, calculateMaxMov(s))
	s.Set(Stat_Mov, s.Get(Stat_MaxMov))
}

func calculateChanceToWander(s *Stats) float64 {
	// Mechanics: RO Classic
	switch s.cfg.Speed {
	case Speed_Immovable:
		return 0
	case Speed_VerySlow:
		return 3
	case Speed_Slow:
		return 6
	case Speed_Fast:
		return 10
	case Speed_VeryFast:
		return 14
	}
	log.Printf("unknown speed %v", s.cfg.Speed)
	return 0
}

func calculateCarryingCapacity(s *Stats) int {
	// Mechanics: RO Classic
	str := s.Get(Stat_Str)
	wgtJob := 0 // TODO: Implement
	wgtMod := 0 // TODO: Implement
	return 2000 + 30*str + wgtJob + wgtMod
}

func calculateMaxHP(s *Stats) int {
	// Mechanics: RO Classic
	baseHP := 35 + 5*s.GetFloat(Stat_Level)
	return int(baseHP * (1 + s.GetFloat(Stat_Vit)*0.1))
}

func calculateMaxSP(s *Stats) int {
	// Mechanics: RO Classic
	baseSP := 10 + 2*s.GetFloat(Stat_Level)
	return int(baseSP * (1.0 + s.GetFloat(Stat_Int)*0.1))
}

func calculateMaxMov(s *Stats) int {
	// Mechanics: RO Classic
	baseMov := 33 + 2*s.GetFloat(Stat_Level)
	return int(baseMov * (1 + s.GetFloat(Stat_Agi)*0.1))
}

func calculatePlayerSoftDef(s *Stats) int {
	// Mechanics: RO Classic
	vit := s.GetFloat(Stat_Vit)
	vit30 := int(vit * 0.3)
	vit50 := int(vit * 0.5)
	return vit30 + utils.RandRange(0, int(math.Pow(vit, 2)/150.0-1)) + vit50
}

func calculateMonsterSoftDef(s *Stats) int {
	// Mechanics: RO Classic
	vit := s.GetFloat(Stat_Vit)
	return int(vit) + utils.RandRange(0, int(math.Pow(vit/20.0, 2)-1.0))
}

func calculateSoftMagicDef(s *Stats) int {
	// Mechanics: RO Classic
	return s.Get(Stat_Int) + s.Get(Stat_Vit)/2
}

func calculateCastTime(s *Stats, base utils.Seconds) float64 {
	// Mechanics: RO Classic
	return float64(base) * (1.0 - s.GetFloat(Stat_Dex)/150.0)
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

func calculateMAtkRange(s *Stats) (int, int) {
	// Mechanics: RO Classic
	sint := s.Get(Stat_Int)
	return sint + (sint/7)*(sint/7), sint + (sint/5)*(sint/5)
}

func calculateExpValue(s *Stats) int {
	// Mechanics: RO Classic
	return s.cfg.ExpBase + (s.Get(Stat_MaxHP) * s.cfg.ExpPerHP)
}

func calculateStatPointsGainedForLevelUp(nextLevel int) int {
	// Mechanics: RO Classic
	x := float64(nextLevel - 1)
	return int(x/5.0) + 3
}

func calculateStatPointsRequiredForStatIncrease(s *Stats, stat StatType) int {
	// Mechanics: RO Classic
	statVal := s.Get(stat)
	if statVal >= 99 {
		return -1
	}
	return int(float64(statVal-1)/10.0) + 2
}

func calculateHPRestoration(s *Stats) int {
	// Mechanics: RO Classic
	gain := utils.MaxInt(1, int(s.GetFloat(Stat_MaxHP)/200.0))
	gain += int(s.GetFloat(Stat_Vit) / 5.0)
	return gain
}

func calculateSPRestoration(s *Stats) int {
	// Mechanics: RO Classic
	sint := s.GetFloat(Stat_Int)
	gain := utils.MaxInt(1, int(s.GetFloat(Stat_MaxSP)/100.0))
	gain += int(sint / 6.0)
	if sint >= 120 {
		gain += int(sint/2.0 - 56.0)
	}
	return gain
}
