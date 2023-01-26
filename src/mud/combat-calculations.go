package mud

import (
	"github.com/chippolot/go-mud/src/utils"
)

func calculateAttackDamage(e *Entity, tgt *Entity) int {
	return utils.MaxInts(0, calculateAttackPower(e)-calculateDEF(tgt))
}

func calculateAttackPower(e *Entity) int {
	if e.player != nil {
		return calculateBaseAttackPower(e.stats)
	} else {
		/*minAtk := e.stats.Get(Stat_MinAtk)
		maxAtk := e.stats.Get(Stat_MaxAtk)
		if minAtk == maxAtk {
			return minAtk
		}
		return rand.Intn(maxAtk-minAtk+1) + minAtk*/
		return 0
		// TODO NOT READY
	}
}

func calculateDEF(e *Entity) int {
	if e.player != nil {
		return calculatePlayerDEF(e.stats)
	} else {
		return calculateMonsterDEF(e.stats)
	}
}
