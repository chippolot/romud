package mud

import (
	"github.com/chippolot/go-mud/src/utils"
)

func calculatePhysicalAttackDamage(e *Entity, tgt *Entity, attackWeaponType WeaponType, attackElement Element, atkBonus float64, critical bool) int {
	// Mechanics: RO Classic
	// https://irowiki.org/classic/Attacks

	atkBonusMultiplier := 1.0 + atkBonus

	// Calculate defensive reductions
	hardDefMult := 1.0 - float64(calculateHardDef(tgt))/100.0
	softDef := float64(calculateSoftDef(tgt))

	// Crtitical attacks negate Def
	if critical {
		hardDefMult = 1
		softDef = 0
	}

	sizeModifier := DefenderSizeModifierLookup[tgt.stats.cfg.Size][attackWeaponType]
	combinedAtkPower := float64(calculateBaseAttackPower(e)) + float64(calculateWeaponAttackPower(e, critical))*sizeModifier*atkBonusMultiplier
	dam := combinedAtkPower*hardDefMult - softDef
	dam *= DefenderElementModifierLookup[tgt.stats.cfg.ElementLevel][tgt.stats.cfg.Element][attackElement]
	return utils.MaxInt(int(dam), 1)
}

func calculateMagicAttackDamage(e *Entity, tgt *Entity, attackElement Element, mAtkBonus float64) int {
	// Mechanics: RO Classic
	// https://irowiki.org/classic/Attacks
	mAtkBonusMultiplier := 1.0 + mAtkBonus

	minMAtk, maxMAtk := calculateMAtkRange(e.stats)
	mAtk := utils.RandRange(minMAtk, maxMAtk)

	mWeaponAtkBoost := 1.0 + calculateWeaponMagicAttackBoost(e)

	mDefMod := 1.0 - float64(calculateHardMagicDef(tgt)/100.0)
	elemMod := DefenderElementModifierLookup[tgt.stats.cfg.ElementLevel][tgt.stats.cfg.Element][attackElement]

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

func calculateBaseAttackPower(e *Entity) int {
	// Mechanics: RO Classic
	if e.player != nil {
		return calculateStatusAttackPower(e.stats)
	} else {
		return 0
	}
}

func calculateWeaponAttackPower(e *Entity, returnMax bool) int {
	// Mechanics: RO Classic
	var min, max int
	if e.player != nil {
		atk := 0
		wLvl := 0.0
		if w, _, ok := e.GetWeapon(); ok {
			atk = w.Atk
			wLvl = float64(w.Level)
		}
		dex := e.stats.GetFloat(Stat_Dex)
		min = utils.MinInt(int(dex*(0.8+0.2*wLvl)), atk)
		max = atk
	} else {
		min = e.cfg.Attack.Power.Min
		max = e.cfg.Attack.Power.Max
	}
	if returnMax {
		return max
	}
	return utils.RandRange(min, max)
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
