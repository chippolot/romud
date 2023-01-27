package mud

import (
	"github.com/chippolot/go-mud/src/utils"
)

func calculateAttackDamage(e *Entity, tgt *Entity, critical bool) int {
	// Mechanics: RO Classic
	// https://irowiki.org/classic/Attacks

	// Calculate defensive reductions
	hardDEFMult := 1.0 - float64(calculateHardDEF(e))/100.0
	// Crtitical attacks negate hardDEF
	if critical {
		hardDEFMult = 1
	}
	softDEF := float64(calculateSoftDEF(e))

	var dam int
	if e.player != nil {
		sizeModifier := 1.0 // TODO: Size modification based on weapon type
		combinedAtkPower := float64(calculateBaseAttackPower(e)) + float64(calculateWeaponAttackPower(e))*sizeModifier
		dam = int(combinedAtkPower*hardDEFMult - softDEF)
	} else {
		dam = calculateWeaponAttackPower(e)*int(hardDEFMult) - int(softDEF)
	}
	return utils.MaxInts(0, dam)
}

func calculateSoftDEF(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		return calculatePlayerSoftDEF(e.stats)
	}
	return calculateMonsterSoftDEF(e.stats)
}

func calculateHardDEF(e *Entity) int {
	// Mechanics: RO Classic
	def := 0
	return utils.ClampInts(def, 0, 100) // TODO: Impleement
}

func calcuateDodgeChance(e *Entity, w *World, tgt *Entity) int {
	// Mechanics: RO Classic
	flee := calculateStatusFlee(tgt.stats)
	if tgt.player != nil {
		numAttackers := numAttackers(tgt, w)
		flee = utils.MaxInts(0, flee-utils.MaxInts(0, numAttackers-2)*10)
	}
	return 80 + calculateHit(e.stats) - flee
}

func calculateBaseAttackPower(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		return calculateStatusAttackPower(e.stats)
	} else {
		return 0
	}
}

func calculateWeaponAttackPower(e *Entity) int {
	// Mechanics: RO Classic
	var min, max int
	if e.player != nil {
		atk := 0 // TODO: Weapon power
		min = utils.MinInts(atk, e.stats.Get(Stat_Dex))
		max = atk
	} else {
		min = e.cfg.Attack.Power.Min
		max = e.cfg.Attack.Power.Max
	}
	return utils.RandRange(min, max)
}
