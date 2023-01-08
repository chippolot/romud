package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type DamageType int

const (
	Dam_Acid DamageType = iota
	Dam_Bludgeoning
	Dam_Cold
	Dam_Fire
	Dam_Force
	Dam_Lightning
	Dam_Necrotic
	Dam_Piercing
	Dam_Poison
	Dam_Psychic
	Dam_Radiant
	Dam_Slashing
	Dam_Thunder
)

func ParseDamageType(str string) (DamageType, error) {
	switch str {
	case "acid":
		return Dam_Acid, nil
	case "bludgeoning":
		return Dam_Bludgeoning, nil
	case "cold":
		return Dam_Cold, nil
	case "fire":
		return Dam_Fire, nil
	case "force":
		return Dam_Force, nil
	case "lightning":
		return Dam_Lightning, nil
	case "necrotic":
		return Dam_Necrotic, nil
	case "piercing":
		return Dam_Piercing, nil
	case "poison":
		return Dam_Poison, nil
	case "psychic":
		return Dam_Psychic, nil
	case "radiant":
		return Dam_Radiant, nil
	case "slashing":
		return Dam_Slashing, nil
	case "thunder":
		return Dam_Thunder, nil
	default:
		return 0, fmt.Errorf("unknown damage type: %s", str)
	}
}

func (dt *DamageType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *dt, err = ParseDamageType(str); err != nil {
		return nil
	} else {
		return err
	}
}

// TODO Support multi-attack
type AttackConfig struct {
	Name         string
	ToHit        int
	Damage       Dice
	DamageType   DamageType
	VerbSingular string
	VerbPlural   string
	Weight       float32
}

type DamageContext int

const (
	DamCtx_Melee DamageContext = iota
	DamCtx_Bleeding
	DamCtx_Admin = 999
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

	// Select attack
	attack := e.RandomAttack()
	toHit := attack.ToHit
	if e.player != nil {
		toHit = GetAbilityModifier(e.data.Stats.Str) + ProficiencyChart[e.data.Stats.Level]
	}

	// Roll to hit
	hitBase := D20.Roll()
	critMiss := hitBase == 1
	critHit := hitBase == 20
	hit := hitBase + toHit

	if (critMiss || hit < tgt.data.Stats.AC) && !critHit {
		dam = 0
	} else {
		// Roll for damage
		if critHit {
			dam = attack.Damage.CriticalRoll()
		} else {
			dam = attack.Damage.Roll()
		}
	}
	applyDamage(tgt, w, e, dam, DamCtx_Melee, attack.DamageType, attack.VerbSingular, attack.VerbPlural)
}

func applyDamage(tgt *Entity, w *World, from *Entity, dam int, damCtx DamageContext, damType DamageType, verbSingular string, verbPlural string) int {
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
	switch damCtx {
	case DamCtx_Melee:
		sendDamageMessages(dam, from, tgt, r, verbSingular, verbPlural)

	}

	// Send status messages
	sendStatusMessages(dam, tgt, r)

	// Handle kills
	if cnd == Cnd_Dead {
		// Distribute XP
		if from != nil {
			xp := tgt.cfg.Stats.XPValue
			xp = applyXp(from, xp)
			if xp > 0 {
				SendToPlayer(from, "You gain %d XP from defeating %s", xp, tgt.Name())
			}
		}

		// Create corpse
		createCorpse(tgt, w)
		w.RemoveEntity(tgt.id)
	}

	return dam
}

func createCorpse(from *Entity, w *World) {
	cfg := &ItemConfig{}
	cfg.Key = from.cfg.Key + "_corpse"
	cfg.Name = fmt.Sprintf("the corpse of %s", from.Name())
	cfg.Keywords = append([]string{"corpse"}, from.cfg.Keywords...)
	cfg.Flags = IFlag_Container | IFlag_Crumbles
	cfg.Init()
	corpse := NewItem(cfg)
	for _, i := range from.inventory {
		from.RemoveItem(i)
		corpse.AddItem(i)
	}
	w.AddItem(corpse, from.data.RoomId)
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
		toSrc = fmt.Sprintf("Your %s misses %s completely", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s's %s misses you completely", src.NameCapitalized(), atkVerbSingular)
		toRoom = fmt.Sprintf("%s tries to %s %s, but misses", src.NameCapitalized(), atkVerbSingular, dst.Name())
	} else if dam <= 2 {
		toSrc = fmt.Sprintf("Your %s knicks %s as it fails to fully connect", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s's %s knicks you as it fails to fully connect", src.NameCapitalized(), atkVerbSingular)
		toRoom = fmt.Sprintf("%s's %s knicks %s as it fails to fully connect", src.NameCapitalized(), atkVerbSingular, dst.Name())
	} else if dam <= 4 {
		toSrc = fmt.Sprintf("Your %s barely scratches %s", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s barely scratch you", src.NameCapitalized(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s barely scratch %s", src.NameCapitalized(), atkVerbPlural, dst.Name())
	} else if dam <= 6 {
		toSrc = fmt.Sprintf("You %s %s", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you", src.NameCapitalized(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s", src.NameCapitalized(), atkVerbPlural, dst.Name())
	} else if dam <= 8 {
		toSrc = fmt.Sprintf("You %s %s ferociously", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you ferociously", src.NameCapitalized(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s ferociously", src.NameCapitalized(), atkVerbPlural, dst.Name())
	} else if dam <= 10 {
		toSrc = fmt.Sprintf("You %s %s with all your might", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you with all your might", src.NameCapitalized(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s with all your might", src.NameCapitalized(), atkVerbPlural, dst.Name())
	} else {
		toSrc = fmt.Sprintf("You %s %s UNBELIEVABLY HARD", atkVerbSingular, dst.Name())
		toDst = fmt.Sprintf("%s %s you UNBELIEVABLY HARD", src.NameCapitalized(), atkVerbPlural)
		toRoom = fmt.Sprintf("%s %s %s UNBELIEVABLY HARD", src.NameCapitalized(), atkVerbPlural, dst.Name())
	}
	// TODO More here?
	SendToPlayer(src, toSrc+" <c yellow>(%d)</c>", dam)
	SendToPlayer(dst, toDst+" <c red>(%d)</c>", dam)
	BroadcastToRoomExcept2(r, src, dst, toRoom)
}

func sendStatusMessages(dam int, target *Entity, r *Room) {
	switch target.data.Stats.Condition() {
	case Cnd_Stunned:
		SendToPlayer(target, "You are dazed and disoriented, struggling to regain your footing")
		BroadcastToRoomExcept(r, target, "%s is dazed and disoriented, struggling to regain their footing", target.NameCapitalized())
	case Cnd_Incapacitated:
		SendToPlayer(target, "You are incapacitated and will die soon if not healed")
		BroadcastToRoomExcept(r, target, "%s is incapacitated and will die soon if not healed", target.NameCapitalized())
	case Cnd_MortallyWounded:
		SendToPlayer(target, "You are bleeding profusely and will die soon if not healed")
		BroadcastToRoomExcept(r, target, "%s is bleeding profusely and will die soon if not healed", target.NameCapitalized())
	case Cnd_Dead:
		SendToPlayer(target, "You feel your soul slip from your body. You are DEAD!")
		BroadcastToRoomExcept(r, target, "%s is DEAD. R.I.P.", target.NameCapitalized())
	default:
		if dam > target.data.Stats.MaxHP/4 {
			SendToPlayer(target, "<c red>Ouch, that one stung!</c>")
		}
		if target.data.Stats.HP < target.data.Stats.MaxHP/4 {
			SendToPlayer(target, "You sure are BLEEDING a lot!")
		}
	}
}
