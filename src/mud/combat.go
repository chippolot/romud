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
	// Can't fight when you're dead!
	if e.Dead() || tgt.Dead() {
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
	critMiss := hitBase == 1
	critHit := hitBase == 20
	hitMod := GetAbilityModifier(e.data.Stats.Str)
	hitProf := 3 // TODO Real proficiency bonus here
	hit := hitBase + hitMod + hitProf

	if (critMiss || hit < tgt.data.Stats.AC) && !critHit {
		dam = 0
	} else {
		// Roll for damage
		if critHit {
			dam = e.cfg.Stats.Attack.CriticalRoll()
		} else {
			dam = e.cfg.Stats.Attack.Roll()
		}
		dam = applyDamage(tgt, w, e, dam)
	}

	r := w.rooms[e.data.RoomId]
	if dam > 0 {
		if critHit {
			SendToPlayer(e, "<c yellow>Wow, that was strong!</c>")
			SendToPlayer(tgt, "<c red>Ouch, that one stung!</c>")
		}
		SendToPlayer(e, "Your attack hits %s <c yellow>(%d)</c>", tgt.cfg.Name, dam)
		SendToPlayer(tgt, "%s's attack hits you <c red>(%d)</c>", e.cfg.Name, dam)
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
