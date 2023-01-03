package mud

import (
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type CombatData struct {
	target     *Entity
	nextAttack time.Time
}

func (c *CombatData) Valid(e *Entity) bool {
	return c != nil &&
		c.target != nil &&
		e.data.RoomId == c.target.data.RoomId &&
		e.Dead() &&
		c.target.Dead()
}

func (c *CombatData) AttackCooldown() time.Duration {
	return time.Second * 2
}

type CombatList EntityList

func (c *CombatList) StartCombat(e *Entity, target *Entity) {
	// Already fighting!
	if e.combat != nil && e.combat.target == target {
		return
	}

	if e.combat != nil {
		e.combat.target = target
	} else {
		e.combat = &CombatData{target, time.Now()}
		*c = utils.AddUnique(*c, e)
	}
}

func (c CombatList) InCombat(e *Entity) bool {
	return utils.FindIndex(c, e) != -1
}

func (c *CombatList) EndCombat(e *Entity) {
	if e.combat == nil {
		return
	}
	idx := utils.FindIndex(*c, e)
	if idx == -1 {
		return
	}
	*c = utils.SwapDelete(*c, idx)
	e.combat = nil
}

func performAttack(e *Entity, w *World, tgt *Entity) {
	if e.data.RoomId != tgt.data.RoomId {
		log.Printf("Trying to hit target %d in different room!", tgt.id)
		return
	}
	dam := applyDamage(tgt, w, e, e.data.Stats.Attack.Roll())

	r := w.rooms[e.data.RoomId]
	if dam > 0 {
		SendToPlayer(e, "Your attack hits %s for %d damage!", tgt.cfg.Name, dam)
		SendToPlayer(tgt, "%s's attack hits you for %d damage!", e.cfg.Name, dam)
		BroadcastToRoomExcept2(r, e, tgt, "%s's attack misses %s", e.cfg.Name, tgt.cfg.Name)
	} else {
		SendToPlayer(e, "Your attack misses %s...", tgt.cfg.Name)
		SendToPlayer(tgt, "%s's attack misses you...", e.cfg.Name)
		BroadcastToRoomExcept2(r, e, tgt, "%s's attack misses %s", e.cfg.Name, tgt.cfg.Name)
	}
	// TODO MORE
}

func applyDamage(tgt *Entity, w *World, from *Entity, dam int) int {
	// Start fighting damage source
	if from != nil {
		w.inCombat.StartCombat(tgt, from)
	}
	dam = utils.MinInts(dam, tgt.data.Stats.HP)
	tgt.data.Stats.HP = tgt.data.Stats.HP - dam
	if tgt.Dead() {
		w.inCombat.EndCombat(tgt)
	}
	// TODO MORE
	return dam
}
