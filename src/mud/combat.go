package mud

import (
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type DamageType int

const (
	Dam_Melee DamageType = iota
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
		e.data.Stats.Condition() > Cnd_Stunned &&
		c.target.data.Stats.Condition() != Cnd_Dead
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
	if e.data.Stats.Condition() <= Cnd_Stunned || tgt.data.Stats.Condition() == Cnd_Dead {
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
	if e.position < Pos_Standing {
		SendToPlayer(e, "You can't fight while you're knocked down!")
		return
	}
	if e.data.Stats.Condition() <= Cnd_Stunned {
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
	}
	applyDamage(tgt, w, e, dam, Dam_Melee)
}

func applyDamage(tgt *Entity, w *World, from *Entity, dam int, damType DamageType) int {
	// Start fighting damage source
	if from != nil && tgt.combat == nil && from.data.Stats.Condition() > Cnd_Stunned {
		w.inCombat.StartCombat(tgt, from)
	}
	tgt.data.Stats.HP = tgt.data.Stats.HP - dam

	// Send damage messages
	r := w.rooms[tgt.data.RoomId]
	switch damType {
	case Dam_Melee:
		if dam > 0 {
			SendToPlayer(from, "Your attack hits %s <c yellow>(%d)</c>", tgt.cfg.Name, dam)
			SendToPlayer(tgt, "%s's attack hits you <c red>(%d)</c>", from.cfg.Name, dam)
			BroadcastToRoomExcept2(r, from, tgt, "%s's attack misses %s", from.cfg.Name, tgt.cfg.Name)
		} else {
			SendToPlayer(from, "Your attack misses %s...", tgt.cfg.Name)
			SendToPlayer(tgt, "%s's attack misses you...", from.cfg.Name)
			BroadcastToRoomExcept2(r, from, tgt, "%s's attack misses %s", from.cfg.Name, tgt.cfg.Name)
		}
	}

	// Send status messages
	switch tgt.data.Stats.Condition() {
	case Cnd_Stunned:
		SendToPlayer(tgt, "You are stunned, but may regain consciousness in time")
		BroadcastToRoomExcept(r, tgt, "%s is stunned, but may regain consciousness in time", tgt.cfg.Name)
	case Cnd_Incapacitated:
		SendToPlayer(tgt, "You are incapacitated and will die soon if not healed")
		BroadcastToRoomExcept(r, tgt, "%s is incapacitated and will die soon if not healed", tgt.cfg.Name)
	case Cnd_MortallyWounded:
		SendToPlayer(tgt, "You are bleeding profusely and will die soon if not healed")
		BroadcastToRoomExcept(r, tgt, "%s is bleeding profusely and will die soon if not healed", tgt.cfg.Name)
	case Cnd_Dead:
		SendToPlayer(tgt, "You feel your soul slip from your body. You are DEAD")
		BroadcastToRoomExcept(r, tgt, "%s is DEAD. R.I.P.", tgt.cfg.Name)
	default:
		if dam > tgt.data.Stats.MaxHP/4 {
			SendToPlayer(tgt, "<c red>Ouch, that one stung!</c>")
		}
		if tgt.data.Stats.HP < tgt.data.Stats.MaxHP/4 {
			SendToPlayer(tgt, "You sure are BLEEDING a lot!")
		}
	}
	return dam
}
