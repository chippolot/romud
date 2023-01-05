package mud

import (
	"fmt"
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type DamageType int

const (
	Dam_Melee DamageType = iota
	Dam_Bleeding
	Dam_Admin = 999
)

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
	hitProf := ProficiencyChart[e.data.Stats.Level]
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
	cnd := tgt.data.Stats.Condition()
	if cnd == Cnd_Dead {
		return 0
	}

	// Start fighting damage source
	if from != nil && tgt.combat == nil && from.data.Stats.Condition() > Cnd_Stunned {
		w.inCombat.StartCombat(tgt, from)
	}

	tgt.data.Stats.HP = tgt.data.Stats.HP - dam
	cnd = tgt.data.Stats.Condition()

	// Send damage messages
	r := w.rooms[tgt.data.RoomId]
	switch damType {
	case Dam_Melee:
		sendDamageMessages(dam, from, tgt, r, "slash", "slashes")

	}

	// Send status messages
	sendStatusMessages(dam, tgt, r)

	// Handle kills
	if cnd == Cnd_Dead {
		if from != nil {
			xp := tgt.cfg.Stats.XPValue
			xp = applyXp(from, xp)
			if xp > 0 {
				SendToPlayer(from, "You gain %d XP from defeating %s", xp, tgt.Name())
			}
		}
	}

	return dam
}

func applyXp(e *Entity, xp int) int {
	if !IsMaxLevel(e) {
		e.data.Stats.AddXP(xp)
		if IsReadyForLevelUp(e) {
			SendToPlayer(e, "You're ready for level %d!", e.data.Stats.Level+1)
		}
		return xp
	}
	return 0
}

func sendDamageMessages(dam int, src *Entity, dst *Entity, r *Room, atkVerbSingular string, atkVerbPlural string) {
	var toSrc, toDst, toRoom string
	if dam <= 0 {
		toSrc = fmt.Sprintf("Your %s misses %s", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s's %s misses you", src.Name(), atkVerbSingular)
		toRoom = fmt.Sprintf("%s tries to %s %s, but misses", src.Name(), atkVerbSingular, dst.Name())
	} else if dam <= 2 {
		toSrc = fmt.Sprintf("Your %s lightly grazes %s", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s's %s lightly grazes you", src.Name(), atkVerbSingular)
		toRoom = fmt.Sprintf("%s's %s lightly grazes %s", src.Name(), atkVerbSingular, dst.Name())
	} else if dam <= 4 {
		toSrc = fmt.Sprintf("You barely %s %s", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s barely %s you", src.Name(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s barely %s %s", src.Name(), atkVerbPlural, dst.Name())
	} else if dam <= 6 {
		toSrc = fmt.Sprintf("You %s %s", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you", src.Name(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s", src.Name(), atkVerbPlural, dst.Name())
	} else if dam <= 8 {
		toSrc = fmt.Sprintf("You %s %s hard", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you hard", src.Name(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s hard", src.Name(), atkVerbPlural, dst.Name())
	} else if dam <= 10 {
		toSrc = fmt.Sprintf("You %s %s very hard", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you very hard", src.Name(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s very hard", src.Name(), atkVerbPlural, dst.Name())
	} else {
		toSrc = fmt.Sprintf("You %s %s EXTREMELY hard", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you EXTREMELY hard", src.Name(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s EXTREMELY hard", src.Name(), atkVerbPlural, dst.Name())
	}
	// TODO More here?
	SendToPlayer(src, toSrc+" <c yellow>(%d)</c>", dam)
	SendToPlayer(dst, toDst+" <c red>(%d)</c>", dam)
	BroadcastToRoomExcept2(r, src, dst, toRoom)
}

func sendStatusMessages(dam int, target *Entity, r *Room) {
	switch target.data.Stats.Condition() {
	case Cnd_Stunned:
		SendToPlayer(target, "You are stunned, but may regain consciousness in time")
		BroadcastToRoomExcept(r, target, "%s is stunned, but may regain consciousness in time", target.cfg.Name)
	case Cnd_Incapacitated:
		SendToPlayer(target, "You are incapacitated and will die soon if not healed")
		BroadcastToRoomExcept(r, target, "%s is incapacitated and will die soon if not healed", target.cfg.Name)
	case Cnd_MortallyWounded:
		SendToPlayer(target, "You are bleeding profusely and will die soon if not healed")
		BroadcastToRoomExcept(r, target, "%s is bleeding profusely and will die soon if not healed", target.cfg.Name)
	case Cnd_Dead:
		SendToPlayer(target, "You feel your soul slip from your body. You are DEAD!")
		BroadcastToRoomExcept(r, target, "%s is DEAD. R.I.P.", target.cfg.Name)
	default:
		if dam > target.data.Stats.MaxHP/4 {
			SendToPlayer(target, "<c red>Ouch, that one stung!</c>")
		}
		if target.data.Stats.HP < target.data.Stats.MaxHP/4 {
			SendToPlayer(target, "You sure are BLEEDING a lot!")
		}
	}
}
