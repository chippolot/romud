package mud

import (
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

func GetAbilityModifier(score int) int {
	return (score - 10) / 2
}

type CombatData struct {
	target     *Entity
	nextAttack time.Time
}

func (c *CombatData) Valid(e *Entity) bool {
	return c != nil &&
		c.target != nil &&
		e.data.RoomId == c.target.data.RoomId &&
		!e.Dead() &&
		!c.target.Dead()
}

func (c *CombatData) AttackCooldown() time.Duration {
	return time.Second * 2
}

type CombatList struct {
	utils.List[*Entity]
}

func (c *CombatList) StartCombat(e *Entity, tgt *Entity) {
	// Already fighting!
	if e.combat != nil && e.combat.target == tgt {
		return
	}
	log.Printf("%s starting combat with %s", e.Name(), tgt.Name())

	if e.combat != nil {
		e.combat.target = tgt
	} else if !c.Contains(e) {
		e.combat = &CombatData{tgt, time.Now()}
		c.Add(e)
	}
}

func (c *CombatList) EndCombat(e *Entity) {
	if e.combat == nil {
		return
	}
	log.Printf("%s ending combat", e.Name())
	c.Remove(e)
	e.combat = nil
}

func performAttack(e *Entity, w *World, tgt *Entity) {
	if e.data.RoomId != tgt.data.RoomId {
		log.Printf("Trying to hit target %d in different room!", tgt.id)
		return
	}

	w.inCombat.StartCombat(e, tgt)

	var dam int

	// Roll to hit
	hitBase := D20.Roll()
	hitMod := GetAbilityModifier(e.data.Stats.Str)
	hitProf := 3 // TODO Real proficiency bonus here
	hit := hitBase + hitMod + hitProf
	log.Printf("HitRoll: %d + %d + %d = %d >? %d", hitBase, hitMod, hitProf, hit, tgt.data.Stats.AC)
	if hit <= tgt.data.Stats.AC {
		dam = 0
	} else {
		// Roll for damage
		dam = e.data.Stats.attack.Roll()
		dam = applyDamage(tgt, w, e, dam)
	}

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
	// TODO MORE
	return dam
}
