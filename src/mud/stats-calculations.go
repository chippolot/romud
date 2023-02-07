package mud

import (
	"log"
	"math"

	"github.com/chippolot/go-mud/src/utils"
)

func calculateAndUpdatePlayerStats(e *Entity) {
	e.stats.Set(Stat_MaxHP, calculateMaxHP(e))
	e.stats.Set(Stat_MaxSP, calculateMaxSP(e))
	e.stats.Set(Stat_MaxMov, calculateMaxMov(e.stats))
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
	case Speed_Very_Slow:
		return 3
	case Speed_Slow:
		return 6
	case Speed_Fast:
		return 10
	case Speed_Very_Fast:
		return 14
	}
	log.Printf("unknown speed %v", s.cfg.Speed)
	return 0
}

func calculateCarryingCapacity(e *Entity) int {
	// Mechanics: RO Classic
	str := e.stats.Get(Stat_Str)
	wgtJob := 0
	wgtMod := 0 // TODO: Implement
	if e.job != nil {
		wgtJob = e.job.cfg.CarryingCapacityMod
	}
	return 2000 + 30*str + wgtJob + wgtMod
}

func calculateMaxHP(e *Entity) int {
	// Mechanics: RO Classic
	lvl := e.stats.Get(Stat_Level)
	baseHP := 35 + 5*lvl
	if e.job != nil {
		for i := 2; i <= lvl; i++ {
			baseHP += int(math.Round(float64(i) * e.job.cfg.MaxHPMod))
		}
	}
	return int(float64(baseHP) * (1 + e.stats.GetFloat(Stat_Vit)*0.1))
}

func calculateMaxSP(e *Entity) int {
	// Mechanics: RO Classic
	jobMod := 0.0
	if e.job != nil {
		jobMod = e.job.cfg.MaxSPMod
	}
	baseSP := 10 + jobMod*e.stats.GetFloat(Stat_Level)
	return int(baseSP * (1.0 + e.stats.GetFloat(Stat_Int)*0.1))
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

func calculateAttackSpeed(e *Entity) int {
	// Mechanics: RO Classic
	weaponDelay := 50.0
	if e.job != nil {
		weaponType := WeaponType_Fist
		if w, _, ok := e.GetWeapon(); ok {
			weaponType = w.Type
		}
		weaponDelay = float64(e.job.cfg.AspdBase[weaponType])
	}
	speedMod := 0.0 // TODO: Speed mod
	agi := e.stats.GetFloat(Stat_Agi)
	dex := e.stats.GetFloat(Stat_Dex)
	aspd := int(200.0 - (weaponDelay-((weaponDelay*agi/25.0)+(weaponDelay*dex/100.0))/10.0)*(1.0-speedMod))
	// 200 - (1 - ((1/25)+(1/100))/10)
	return utils.ClampInt(aspd, 0, 190)
}

func calculateAttacksPerRound(e *Entity) float64 {
	// Mechanics: RO Classic
	aspd := float64(calculateAttackSpeed(e))
	return 50.0 / (200.0 - aspd)
}

func calculateStatusRangedAttackPower(s *Stats) int {
	// Mechanics: RO Classic
	str := s.GetFloat(Stat_Str)
	dex := s.GetFloat(Stat_Dex)
	luk := s.GetFloat(Stat_Luk)
	return int(dex + math.Pow(dex/10.0, 2) + str/5.0 + luk/5.0)
}

func calculateStatusMeleeAttackPower(s *Stats) int {
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
