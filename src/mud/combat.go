package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	Advantage_None AdvantageType = iota
	Advantage_Advantage
	Advantage_Disadvantage

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

	DamCtx_Melee DamageContext = iota
	DamCtx_Bleeding
	DamCtx_Poison
	DamCtx_Admin = 999

	CombatSkill_None CombatSkill = iota
	CombatSkill_Shove
)

type AdvantageType int
type DamageType int

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

type AttackData struct {
	ToHit                    int
	Damage                   Dice
	DamageMod                int
	DamageType               DamageType
	Effect                   *StatusEffectConfig
	VerbSingular, VerbPlural string
}

// TODO Support multi-attack
type AttackConfig struct {
	Name         string
	ToHit        int
	Damage       Dice
	DamageType   DamageType
	Effect       *StatusEffectConfig `json:",omitempty"`
	VerbSingular string
	VerbPlural   string
	Weight       float32
}

type SavingThrowConfig struct {
	Stat StatType
	DC   int
}

type DamageContext int

type CombatSkill int

type CombatData struct {
	target         *Entity
	nextAttack     time.Time
	requestedSkill CombatSkill
}

func (c *CombatData) Valid(e *Entity) bool {
	return c != nil &&
		c.target != nil &&
		e.data.RoomId == c.target.data.RoomId &&
		e.stats.Condition() > Cnd_Stunned &&
		c.target.stats.Condition() != Cnd_Dead
}

func (c *CombatData) AttackCooldown() time.Duration {
	return time.Second * 2
}

type CombatList struct {
	utils.List[*Entity]
}

func (c *CombatList) StartCombat(e *Entity, tgt *Entity) bool {
	// Already fighting!
	if e.combat != nil && e.combat.target == tgt {
		return false
	}
	// Can't fight when you're dead!
	if e.stats.Condition() <= Cnd_Stunned || tgt.stats.Condition() == Cnd_Dead {
		return false
	}

	if e.combat != nil {
		e.combat.target = tgt
	} else if !c.Contains(e) {
		e.combat = &CombatData{tgt, time.Now().UTC(), CombatSkill_None}
		c.Add(e)
	}
	return true
}

func (c *CombatList) EndCombat(e *Entity) {
	if e.combat == nil {
		return
	}
	c.Remove(e)
	e.combat = nil
}

func GetAttackData(e *Entity) AttackData {
	aData := AttackData{}
	if weapon, ok := e.GetWeapon(); ok {
		aData.ToHit = GetAbilityModifier(e.stats.Get(Stat_Str)) + ProficiencyChart[e.stats.Get(Stat_Level)]
		aData.Damage = weapon.Damage
		aData.DamageMod = GetAbilityModifier(e.stats.Get(Stat_Str))
		aData.DamageType = weapon.DamageType
		aData.VerbSingular = weapon.VerbSingular
		aData.VerbPlural = weapon.VerbPlural
	} else {
		attack := e.RandomAttack()
		aData.ToHit = attack.ToHit
		aData.Damage = attack.Damage
		if e.player != nil {
			aData.DamageMod = GetAbilityModifier(e.stats.Get(Stat_Str))
		}
		aData.Effect = attack.Effect
		aData.DamageType = attack.DamageType
		aData.VerbSingular = attack.VerbSingular
		aData.VerbPlural = attack.VerbPlural
	}
	if e.player != nil {
		aData.ToHit = GetAbilityModifier(e.stats.Get(Stat_Str)) + ProficiencyChart[e.stats.Get(Stat_Level)]
	}
	return aData
}

func validateAttack(e *Entity, tgt *Entity) bool {
	if e.data.RoomId != tgt.data.RoomId {
		log.Printf("trying to attack tgt %d in different room!", tgt.id)
		return false
	}
	if e.position < Pos_Standing {
		SendToPlayer(e, "You can't fight while you're knocked down!")
		return false
	}
	if e.stats.Condition() <= Cnd_Stunned {
		SendToPlayer(e, "You're in no condition for that!")
		return false
	}
	return true
}

func performAttack(e *Entity, w *World, tgt *Entity) {
	if !validateAttack(e, tgt) {
		return
	}

	// Already in combat
	if e.combat != nil {
		// Trying to attack current tgt!
		if e.combat.target == tgt {
			SendToPlayer(e, "You're already fighting them!")
			// Trying to attack different tgt. Just update tgt and wait for next combat round.
		} else {
			SendToPlayerRe(e, tgt, SendRst_None, "You turn to face %s", LookName(tgt))
			e.combat.target = tgt
		}
		return
	} else {
		if w.inCombat.StartCombat(e, tgt) {
			runCombatLogic(e, w, tgt)
		}
	}
}

func performShove(e *Entity, w *World, tgt *Entity) {
	if !validateAttack(e, tgt) {
		return
	}

	if tgt.position != Pos_Standing {
		SendToPlayerRe(e, tgt, SendRst_None, "You can't shove something that isn't standing!")
	}

	if e.combat != nil {
		SendToPlayerRe(e, tgt, SendRst_None, "You prepare to shove %s", LookName(tgt))
		e.combat.requestedSkill = CombatSkill_Shove
		if e.combat.target != tgt {
			SendToPlayerRe(e, tgt, SendRst_None, "You turn to face %s", LookName(tgt))
			e.combat.target = tgt
		}
	} else {
		if w.inCombat.StartCombat(e, tgt) {
			e.combat.requestedSkill = CombatSkill_Shove
			runCombatLogic(e, w, tgt)
		}
	}
}

func runCombatLogic(e *Entity, w *World, tgt *Entity) {
	if e == tgt {
		log.Panic("trying to run combat against self?")
		return
	}

	// Not ready to attack
	if e.combat == nil || e.combat.nextAttack.After(time.Now().UTC()) {
		return
	}

	if e.position < Pos_Standing {
		e.position = Pos_Standing
		SendToPlayer(e, "You scramble to your feet")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s scrambles to %s feet", LookName(e), e.Gender().GetPossessivePronoun())
		return
	}

	switch e.combat.requestedSkill {
	case CombatSkill_Shove:
		// STR or DEX contest
		if ContestAbility(e, tgt, tgt.stats.MaxStatType(Stat_Str, Stat_Dex)) {
			tgt.position = Pos_Prone
			SendToPlayerRe(e, tgt, SendRst_None, "You shove %s, knocking %s to the ground", LookName(tgt), tgt.Gender().GetObjectPronoun())
			SendToPlayerRe(tgt, e, SendRst_None, "%s shoves you, knocking you to the ground", LookNameCap(e))
			BroadcastToRoomRe2(w, e, tgt, SendRst_CanSee, "%s shoves %s, knocking %s to the ground", LookNameCap(e), LookName(tgt), tgt.Gender().GetObjectPronoun())
		} else {
			SendToPlayerRe(e, tgt, SendRst_None, "You try to shove %s but fail miserably", LookName(tgt))
			SendToPlayerRe(tgt, e, SendRst_None, "%s tries to shove you but fails miserably", LookNameCap(e))
			BroadcastToRoomRe2(w, e, tgt, SendRst_CanSee, "%s tries to shove %s but fails miserably", LookNameCap(e), LookName(tgt))
		}
	default:
		var dam int

		// Pick random attack or use weapon
		aData := GetAttackData(e)

		// Determine advantage / disadvantage
		var advantageType AdvantageType
		if tgt.position < Pos_Standing {
			advantageType = Advantage_Advantage
		}

		// Roll to hit
		hitBase := D20.Roll()
		if advantageType == Advantage_Advantage {
			hitBase2 := D20.Roll()
			hitBase = utils.MaxInts(hitBase, hitBase2)
		} else if advantageType == Advantage_Disadvantage {
			hitBase2 := D20.Roll()
			hitBase = utils.MinInts(hitBase, hitBase2)
		}
		critMiss := hitBase == 1
		critHit := hitBase == 20
		hit := hitBase + aData.ToHit

		didHit := false
		if (critMiss || hit < tgt.AC()) && !critHit {
			dam = 0
		} else {
			didHit = true
			// Roll for damage
			if critHit {
				dam = aData.Damage.CriticalRoll()
			} else {
				dam = aData.Damage.Roll()
			}
			dam += aData.DamageMod
			dam = utils.MaxInts(1, dam)
		}
		applyDamage(tgt, w, e, dam, DamCtx_Melee, aData.DamageType, aData.VerbSingular, aData.VerbPlural)
		if didHit {
			rollForStatusEffect(tgt, w, e, aData.Effect)
		}
	}
	e.combat.requestedSkill = CombatSkill_None
}

func applyDamage(tgt *Entity, w *World, from *Entity, dam int, damCtx DamageContext, damType DamageType, verbSingular string, verbPlural string) int {
	cnd := tgt.stats.Condition()
	if cnd == Cnd_Dead {
		return 0
	}

	// Start fighting damage source
	if from != nil && from != tgt && tgt.combat == nil && from.stats.Condition() > Cnd_Stunned {
		w.inCombat.StartCombat(tgt, from)
	}

	tgt.stats.Add(Stat_HP, -dam)
	cnd = tgt.stats.Condition()

	// Send damage messages
	switch damCtx {
	case DamCtx_Poison:
		SendToPlayer(tgt, "You feel a wave of pain course through you. (%s)", Colorize(Color_BrightRed, dam))
		BroadcastToRoomRe(w, tgt, SendRst_CanSee, "%s shudders in pain", LookNameCap(tgt))
	case DamCtx_Melee:
		sendDamageMessages(dam, from, tgt, w, verbSingular, verbPlural)
	}

	// Send status messages
	sendStatusMessages(dam, tgt, w)

	// Handle kills
	if cnd == Cnd_Dead {
		// Distribute XP
		if from != nil {
			xp := tgt.cfg.Stats.XPValue
			xp = applyXp(from, xp)
			if xp > 0 {
				SendToPlayerRe(from, tgt, SendRst_None, "You gain %d XP from defeating %s", xp, LookName(tgt))
			}
		}

		// Create corpse
		createCorpse(tgt, w)

		// If player died, save
		if tgt.player != nil {
			w.SavePlayerCharacter(tgt.player.id)
		}

		w.RemoveEntity(tgt.id)
	}

	return dam
}

func createCorpse(from *Entity, w *World) {
	// Create new corpse
	cfg := &ItemConfig{}
	cfg.Key = from.cfg.Key + "_corpse"
	cfg.Name = fmt.Sprintf("the corpse of %s", from.Name())
	cfg.Keywords = append([]string{"corpse"}, from.cfg.Keywords...)
	cfg.Flags = IFlag_Container | IFlag_Crumbles | IFlag_NoStorage
	cfg.Init()
	corpse := NewItem(cfg)

	// Unequip everything
	for _, eq := range from.equipped {
		from.onUnequipped(eq)
		corpse.AddItem(eq)
	}
	for es := range from.equipped {
		delete(from.equipped, es)
		delete(from.data.Equipped, es)
	}

	// Transfer items from dead entity to corpse
	for _, i := range from.inventory {
		corpse.AddItem(i)
	}
	from.inventory = from.inventory[:0]
	from.data.Inventory = from.data.Inventory[:0]

	// Place corpse in room
	w.AddItem(corpse, from.data.RoomId)
}

func applyXp(e *Entity, xp int) int {
	if !IsMaxLevel(e) {
		e.stats.Add(Stat_XP, xp)
		if IsReadyForLevelUp(e) {
			SendToPlayer(e, "You're ready for level %d!", e.stats.Get(Stat_Level)+1)
		}
		return xp
	}
	return 0
}

func sendDamageMessages(dam int, src *Entity, dst *Entity, w *World, atkVerbSingular string, atkVerbPlural string) {
	srcDamStr := Colorize(Color_Yellow, dam)
	dstDamStr := Colorize(Color_Red, dam)
	if dam <= 0 {
		SendToPlayerRe(src, dst, SendRst_None, "Your %s misses %s completely (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s's %s misses you completely (%s)", LookNameCap(src), atkVerbSingular, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s tries to %s %s, but misses", LookNameCap(src), atkVerbSingular, LookName(dst))
	} else if dam <= 2 {
		SendToPlayerRe(src, dst, SendRst_None, "Your %s knicks %s as it fails to fully connect (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s's %s knicks you as it fails to fully connect (%s)", LookNameCap(src), atkVerbSingular, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s's %s knicks %s as it fails to fully connect", LookNameCap(src), atkVerbSingular, LookName(dst))
	} else if dam <= 4 {
		SendToPlayerRe(src, dst, SendRst_None, "Your %s barely scratches %s (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s's %s barely scratch you (%s)", LookNameCap(src), atkVerbPlural, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s's %s barely scratches %s", LookNameCap(src), atkVerbSingular, LookName(dst))
	} else if dam <= 6 {
		SendToPlayerRe(src, dst, SendRst_None, "You %s %s (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s %s you (%s)", LookNameCap(src), atkVerbSingular, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s %s %s", LookNameCap(src), atkVerbPlural, LookName(dst))
	} else if dam <= 8 {
		SendToPlayerRe(src, dst, SendRst_None, "You %s %s ferociously (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s %s you ferociously (%s)", LookNameCap(src), atkVerbPlural, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s %s %s ferociously", LookNameCap(src), atkVerbPlural, LookName(dst))
	} else if dam <= 10 {
		SendToPlayerRe(src, dst, SendRst_None, "You %s %s with all your might (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s %s you with all your might (%s)", LookNameCap(src), atkVerbPlural, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s %s %s with all your might", LookNameCap(src), atkVerbPlural, LookName(dst))
	} else {
		SendToPlayerRe(src, dst, SendRst_None, "You %s %s UNBELIEVABLY HARD (%s)", atkVerbSingular, LookName(dst), srcDamStr)
		SendToPlayerRe(dst, src, SendRst_None, "%s %s you UNBELIEVABLY HARD (%s)", LookNameCap(src), atkVerbPlural, dstDamStr)
		BroadcastToRoomRe2(w, src, dst, SendRst_None, "%s %s %s UNBELIEVABLY HARD", LookNameCap(src), atkVerbPlural, LookName(dst))
	}
}

func sendStatusMessages(dam int, tgt *Entity, w *World) {
	switch tgt.stats.Condition() {
	case Cnd_Stunned:
		SendToPlayer(tgt, "You are dazed and disoriented, struggling to regain your footing")
		BroadcastToRoomRe(w, tgt, SendRst_CanSee, "%s is dazed and disoriented, struggling to regain their footing", LookNameCap(tgt))
	case Cnd_Incapacitated:
		SendToPlayer(tgt, "You are incapacitated and will die soon if not healed")
		BroadcastToRoomRe(w, tgt, SendRst_CanSee, "%s is incapacitated and will die soon if not healed", LookNameCap(tgt))
	case Cnd_MortallyWounded:
		SendToPlayer(tgt, "You are bleeding profusely and will die soon if not healed")
		BroadcastToRoomRe(w, tgt, SendRst_CanSee, "%s is bleeding profusely and will die soon if not healed", LookNameCap(tgt))
	case Cnd_Dead:
		SendToPlayer(tgt, "You feel your soul slip from your body. You are DEAD!")
		BroadcastToRoomRe(w, tgt, SendRst_None, "%s is DEAD. R.I.P.", LookNameCap(tgt))
	default:
		if dam > tgt.stats.Get(Stat_MaxHP)/4 {
			SendToPlayer(tgt, Colorize(Color_Red, "Ouch, that one stung!"))
		}
		if tgt.stats.Get(Stat_HP) < tgt.stats.Get(Stat_MaxHP)/4 {
			SendToPlayer(tgt, "You sure are BLEEDING a lot!")
		}
	}
}
