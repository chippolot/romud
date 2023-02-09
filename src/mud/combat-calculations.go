package mud

import (
	"math"

	"github.com/chippolot/ro-mud/src/utils"
)

func calculatePhysicalAttackDamage(e *Entity, tgt *Entity, weaponType WeaponType, element Element, atkBonus float64, critical bool) int {
	// Mechanics: RO Classic
	// https://irowiki.org/classic/Attacks

	atkBonusMultiplier := 1.0 + atkBonus
	sizeModifier := DefenderSizeModifierLookup[tgt.stats.cfg.Size][weaponType]

	combinedAtkPower := 0
	if e.player != nil {
		weaponLevel := 1
		atk := 0
		ammoAtk := 25 // TODO: Arrow: Check equipped arrows
		// TODO: Arrow: Arrow elements + Status
		// TODO: Arrow: Don't allow for ranged attacks when out of arrows!
		if w, _, ok := e.GetWeapon(); ok {
			weaponLevel = w.Level
			atk = w.Atk
		}
		dex := e.stats.GetFloat(Stat_Dex)
		dexAtk := math.Min(dex*(0.8+0.2*float64(weaponLevel)), float64(atk))
		var minAtk, maxAtk int
		baseAtk := 0
		if !weaponType.Ranged() {
			baseAtk = calculateBaseMeleeAttackPower(e)
			minAtk = int(dexAtk)
			maxAtk = atk
		} else {
			baseAtk = calculateBaseRangedAttackPower(e)
			minAtk = int((float64(atk) / 100.0) * dexAtk)
			maxAtk = utils.MaxInt(minAtk, atk) + ammoAtk
		}
		if critical {
			minAtk = maxAtk
		}
		combinedAtkPower = baseAtk + int(float64(utils.RandRange(minAtk, maxAtk))*sizeModifier*atkBonusMultiplier)
	} else {
		combinedAtkPower = utils.RandRange(e.cfg.Attack.Power.Min, e.cfg.Attack.Power.Max)
	}
	// Calculate defensive reductions
	hardDefMult := 1.0 - float64(calculateHardDef(tgt))/100.0
	softDef := float64(calculateSoftDef(tgt))

	// Crtitical attacks negate Def
	if critical {
		hardDefMult = 1
		softDef = 0
	}
	dam := float64(combinedAtkPower)*hardDefMult - softDef
	dam *= DefenderElementModifierLookup[tgt.stats.cfg.ElementLevel][tgt.stats.cfg.Element][element]
	return utils.MaxInt(int(dam), 1)
}

func calculateMagicAttackDamage(e *Entity, tgt *Entity, element Element, mAtkBonus float64) int {
	// Mechanics: RO Classic
	// https://irowiki.org/classic/Attacks
	mAtkBonusMultiplier := 1.0 + mAtkBonus

	minMAtk, maxMAtk := calculateMAtkRange(e.stats)
	mAtk := utils.RandRange(minMAtk, maxMAtk)

	mWeaponAtkBoost := 1.0 + calculateWeaponMagicAttackBoost(e)

	mDefMod := 1.0 - float64(calculateHardMagicDef(tgt)/100.0)
	elemMod := DefenderElementModifierLookup[tgt.stats.cfg.ElementLevel][tgt.stats.cfg.Element][element]

	dam := (float64(mAtk)*mWeaponAtkBoost*mAtkBonusMultiplier*mDefMod - float64(calculateSoftMagicDef(tgt.stats))) * elemMod
	return utils.MaxInt(int(dam), 0)
}

func calculateSoftDef(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		return calculatePlayerSoftDef(e.stats)
	}
	return calculateMonsterSoftDef(e.stats)
}

func calculateHardDef(e *Entity) int {
	// Mechanics: RO Classic
	def := 0
	for _, eq := range e.equipped {
		if eq.cfg.Equipment == nil || eq.cfg.Equipment.Armor == nil {
			continue
		}
		def += eq.cfg.Equipment.Armor.Def
	}
	return utils.ClampInt(def, 0, 100)
}

func calculateHardMagicDef(e *Entity) int {
	// Mechanics: RO Classic
	def := 0
	for _, eq := range e.equipped {
		if eq.cfg.Equipment == nil || eq.cfg.Equipment.Armor == nil {
			continue
		}
		def += eq.cfg.Equipment.Armor.MDef
	}
	return utils.ClampInt(def, 0, 100)
}

func calculateeCriticalChance(e *Entity, tgt *Entity) int {
	if e.player != nil {
		return calculateStatusCritical(e.stats) - calculateCrticialShield(tgt.stats)
	} else {
		return 0
	}
}

func calcuateHitChance(e *Entity, w *World, tgt *Entity, hitBonus float64) int {
	// Mechanics: RO Classic
	hitBonusMultiplier := 1 + hitBonus
	hitChance := 0

	// Target's FLEE
	flee := calculateStatusFlee(tgt.stats)
	if tgt.player != nil {
		numAttackers := numAttackers(tgt, w)
		flee = utils.MaxInt(0, flee-utils.MaxInt(0, numAttackers-2)*10)
	}

	if e.player != nil {
		hit := int(float64(calculateHit(e.stats)) * hitBonusMultiplier)
		if tgt.player != nil {
			// Chance for player to hit player
			hitChance = 80 + hit - flee
		} else {
			// Chance for player to hit monster
			hitChance = 100 + hit - tgt.cfg.Stats.Hit100
		}
	} else {
		// Chance for monster to hit player
		hitChance = 100 - int(float64(95+flee-e.cfg.Stats.Flee95)*hitBonusMultiplier)
	}
	return utils.MinInt(95, hitChance)
}

func calculateBaseMeleeAttackPower(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		return calculateStatusMeleeAttackPower(e.stats)
	} else {
		return 0
	}
}

func calculateBaseRangedAttackPower(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		return calculateStatusRangedAttackPower(e.stats)
	} else {
		return 0
	}
}

func calculateWeaponAttackPower(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		if w, _, ok := e.GetWeapon(); ok {
			return w.Atk
		}
	}
	return 0
}

func calculateWeaponMagicAttackBoost(e *Entity) float64 {
	// Mechanics: RO Classic
	if e.player != nil {
		if w, _, ok := e.GetWeapon(); ok {
			return w.MAtkBonus
		}
		return 0
	} else {
		return 0
	}
}

func calculateAttackRange(e *Entity) int {
	// Mechanics: RO Classic
	aRange := 1
	if w, _, ok := e.GetWeapon(); ok {
		if w.Range > 0 {
			aRange = w.Range
		}
	} else if e.cfg.Attack.Range > 0 {
		aRange = e.cfg.Attack.Range
	}
	return aRange
}
