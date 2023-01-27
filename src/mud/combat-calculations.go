package mud

import (
	"github.com/chippolot/go-mud/src/utils"
)

func calculateAttackDamage(e *Entity, tgt *Entity) int {
	return utils.MaxInts(0, calculateBaseAttackPower(e)-calculateDEF(tgt))
}

func calculateDEF(e *Entity) int {
	if e.player != nil {
		return calculatePlayerDEF(e.stats)
	} else {
		return calculateMonsterDEF(e.stats)
	}
}

func calcuateDodgeChance(e *Entity, w *World, tgt *Entity) int {
	//  Mechanics: RO Classic
	flee := calculateStatusFlee(tgt.stats)
	if tgt.player != nil {
		numAttackers := numAttackers(tgt, w)
		flee = utils.MaxInts(0, flee-utils.MaxInts(0, numAttackers-2)*10)
	}
	return 80 + calculateHit(e.stats) - flee
}

func calculateBaseAttackPower(e *Entity) int {
	//  Mechanics: RO Classic
	if e.player != nil {
		return calculateStatusAttackPower(e.stats)
	}
	return 0
}
