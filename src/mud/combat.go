package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

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
const (
	DamCtx_Melee DamageContext = iota
	DamCtx_Bleeding
	DamCtx_Poison
	DamCtx_Admin DamageContext = 999
)

type AdvantageType int
type DamageType int

var damageTypeStringMapping = utils.NewStringMapping(map[DamageType]string{
	Dam_Acid:        "acid",
	Dam_Bludgeoning: "bludgeoning",
	Dam_Cold:        "cold",
	Dam_Fire:        "fire",
	Dam_Force:       "force",
	Dam_Lightning:   "lightning",
	Dam_Necrotic:    "necrotic",
	Dam_Piercing:    "piercing",
	Dam_Poison:      "poison",
	Dam_Psychic:     "psychic",
	Dam_Radiant:     "radiant",
	Dam_Slashing:    "slashing",
	Dam_Thunder:     "thunder",
})

func ParseDamageType(str string) (DamageType, error) {
	if val, ok := damageTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown damage type: %s", str)
}

func (dt *DamageType) String() string {
	if str, ok := damageTypeStringMapping.ToString[*dt]; ok {
		return str
	}
	return "unknown"
}

func (dt *DamageType) MarshalJSON() ([]byte, error) {
	return json.Marshal(dt.String())
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

type AttackConfig struct {
	Power Range
	Noun  string
}

type SavingThrowConfig struct {
	Stat StatType
	DC   int
}

type DamageContext int

type CombatData struct {
	target         *Entity
	nextAttackOpts *CustomAttackOptions
	speedCounter   float64
}

func (c *CombatData) Valid(e *Entity) bool {
	return c != nil &&
		c.target != nil &&
		e.data.RoomId == c.target.data.RoomId &&
		e.stats.Condition() > Cnd_Stunned &&
		c.target.stats.Condition() != Cnd_Dead
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
		e.combat = &CombatData{tgt, nil, 0}
		c.AddBack(e)
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

type CustomAttackMessages struct {
	ToAttacker string
	ToTarget   string
	ToRoom     string
}

type CustomAttackOptions struct {
	AtkMultiplier float64
	HitMultiplier float64
	HitMessages   *CustomAttackMessages
	MissMessages  *CustomAttackMessages
}

func validateAttack(e *Entity, tgt *Entity) bool {
	if e.data.RoomId != tgt.data.RoomId {
		log.Printf("trying to attack tgt %d in different room!", tgt.id)
		return false
	}
	if e.position < Pos_Standing {
		Write("You can't fight while you're knocked down!").ToPlayer(e).Send()
		return false
	}
	if e.stats.Condition() <= Cnd_Stunned {
		Write("You're in no condition for that!").ToPlayer(e).Send()
		return false
	}
	return true
}

func performAssist(e *Entity, w *World, ally *Entity) {
	if ally.combat == nil || ally.combat.target == nil {
		return
	}
	Write("%s leaps to your aid!").ToPlayer(e).Subject(ally).Restricted(SendRst_CanSee).Colorized(Color_PositiveBld).Send()
	Write("%s joins in the fight with %s", ObservableNameCap(e), ObservableName(ally)).ToEntityRoom(w, e).Subject(e).Ignore(ally).Restricted(SendRst_CanSee).Colorized(Color_Neutral).Send()
	performAttack(e, w, ally.combat.target)
}

func performAttack(e *Entity, w *World, tgt *Entity) {
	performCustomAttack(e, w, tgt, nil)
}

func performCustomAttack(e *Entity, w *World, tgt *Entity, opts *CustomAttackOptions) {
	if !validateAttack(e, tgt) {
		return
	}

	// Already in combat
	if e.combat != nil {
		e.combat.nextAttackOpts = opts

		// Trying to attack current tgt!
		if e.combat.target == tgt {
			Write("You're already fighting them!").ToPlayer(e).Send()
			// Trying to attack different tgt. Just update tgt and wait for next combat round.
		} else {
			Write("You turn to face %s", ObservableName(tgt)).ToPlayer(e).Subject(tgt).Send()
			e.combat.target = tgt
		}
		return
	} else {
		if w.inCombat.StartCombat(e, tgt) {
			e.combat.nextAttackOpts = opts
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
	if e.combat == nil {
		return
	}

	if e.position < Pos_Standing {
		e.position = Pos_Standing
		Write("You scramble to your feet").ToPlayer(e).Colorized(Color_Positive).Send()
		Write("%s scrambles to %s feet", ObservableNameCap(e), e.Gender().GetPossessivePronoun()).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Colorized(Color_Neutral).Send()
		return
	}

	numAttacks := calculateAttacksPerRound(e.stats) + e.combat.speedCounter
	numAttacksFull := int(numAttacks)
	e.combat.speedCounter = numAttacks - float64(numAttacksFull)

	for i := 0; i < numAttacksFull; i++ {
		combatLogicAttack(e, w, tgt)
	}
	e.combat.nextAttackOpts = nil
}

func combatLogicAttack(e *Entity, w *World, tgt *Entity) {
	attack := e.cfg.Attack
	noun := w.vocab.GetNoun(attack.Noun)
	weaponType := WeaponType_Bare_Handed

	// Use weapon's noun if applicable
	if e.player != nil || e.entityFlags.Has(EFlag_UsesEquipment) {
		if weap, _, ok := e.GetWeapon(); ok {
			noun = w.vocab.GetNoun(weap.Noun)
			weaponType = weap.Type
		}
	}

	if e.CanBeSeenBy(tgt) {
		// 1. Perfect Dodge Check
		//    Note: Only players perform perfect dodges
		perfectDodgeChance := 0
		if tgt.player != nil {
			perfectDodgeChance = calculatePerfectDodge(tgt.stats)
		}
		if utils.RandChance100() <= float64(perfectDodgeChance) {
			Write("%s You dodge the %s's %s perfectly!", ColorizeRainbow("LUCKY"), ObservableName(e), noun.Singular).ToPlayer(tgt).Subject(e).Send()
			Write("Your %s misses %s completely (0)", noun.Singular, ObservableName(tgt)).ToPlayer(e).Subject(tgt).Send()
			Write("%s tries to %s %s, but misses", ObservableNameCap(e), noun.Singular, ObservableName(tgt)).ToEntityRoom(w, e).Subject(e).Ignore(tgt).Send()
			return
		}
	}

	// 2. Critical Check
	//    Note: Only players perform automatic critical hits
	didCrit := false
	if tgt.CanBeSeenBy(e) {
		critChance := calculateeCriticalChance(e, tgt)
		if utils.RandChance100() < float64(critChance) {
			didCrit = true
		}
	}

	// 3. Standard Hit Check
	didHit := false
	if e.CanBeSeenBy(tgt) {
		if !didCrit {
			hitChance := calcuateHitChance(e, w, tgt)
			if utils.RandChance100() < float64(hitChance) {
				didHit = true
			}
		} else {
			didHit = true
		}
	}

	// 4. Calculate + Apply Damage
	if didHit {
		dam := calculateAttackDamage(e, tgt, weaponType, Neutral, didCrit)
		applyDamage(tgt, w, e, dam, DamCtx_Melee, Dam_Slashing, didCrit, noun.Singular, noun.Plural)
	} else {
		sendDamageMessages(0, e, tgt, w, false, noun.Singular, noun.Plural)
		return
	}
}

func applyDamage(tgt *Entity, w *World, from *Entity, dam int, damCtx DamageContext, damType DamageType, critical bool, nounSingular string, nounPlural string) int {
	cnd := tgt.stats.Condition()
	if cnd == Cnd_Dead {
		return 0
	}

	// Start fighting damage source
	startAttacking(tgt, w, from)

	tgt.stats.Add(Stat_HP, -dam)
	if dam > 0 {
		tgt.tookDamage = true
	}

	cnd = tgt.stats.Condition()

	// Send damage messages
	switch damCtx {
	case DamCtx_Poison:
		Write("You feel a wave of pain course through you. (%s)", Colorize(Color_Negative, dam)).ToPlayer(tgt).Send()
		Write("%s shudders in pain", ObservableNameCap(tgt)).ToEntityRoom(w, tgt).Subject(tgt).Restricted(SendRst_CanSee).Send()
	case DamCtx_Melee:
		sendDamageMessages(dam, from, tgt, w, critical, nounSingular, nounPlural)
	}

	// Handle kills
	if cnd == Cnd_Dead {
		die(tgt, w, from)
	} else {
		if dam > tgt.stats.Get(Stat_MaxHP)/4 {
			Write("Ouch, that one stung!").ToPlayer(tgt).Colorized(Color_NegativeBld).Send()
		}
	}

	return dam
}

func die(tgt *Entity, w *World, killer *Entity) {
	Write("You feel your soul slip from your body. You are DEAD!").ToPlayer(tgt).Colorized(Color_NegativeBld).Send()
	Write("%s is DEAD. R.I.P.", ObservableNameCap(tgt)).ToEntityRoom(w, tgt).Subject(tgt).Colorized(Color_NeutralBld).Send()

	// Distribute XP
	if killer != nil {
		xp := calculateExpValue(tgt.stats)
		xp = applyXp(killer, w, xp)
		if xp > 0 {
			Write("You gain %d XP from defeating %s", xp, ObservableName(tgt)).ToPlayer(killer).Subject(tgt).Colorized(Color_Header).Send()
		}
	}

	// Create corpse
	r := w.rooms[tgt.data.RoomId]
	var itemTarget ItemContainer = r
	onDeathConfig := mudConfig.Death.Monsters
	if tgt.player != nil {
		onDeathConfig = mudConfig.Death.Players
	}
	if onDeathConfig.Corpses {
		itemTarget = createCorpse(tgt, w)
	}

	// Collect items from eying entity
	items := make([]*Item, 0)
	switch onDeathConfig.Items {
	case ItemsOnDeath_Drop, ItemsOnDeath_Destroy:
		for _, eq := range tgt.equipped {
			tgt.onUnequipped(eq)
			items = append(items, eq)
		}
		for es := range tgt.equipped {
			delete(tgt.equipped, es)
			delete(tgt.data.Equipped, es)
		}
		for _, i := range tgt.inventory {
			items = append(items, i)
		}
		tgt.inventory = tgt.inventory[:0]
		tgt.data.Inventory = tgt.data.Inventory[:0]
	case ItemsOnDeath_Retain:
		// Do nothing -- items will not be removed
	}

	// Add items from optional drop table
	if tgt.cfg.DropTable != nil {
		for _, key := range tgt.cfg.DropTable.SelectMultiplied(mudConfig.ItemDropRateMultiplier) {
			if cfg, ok := lua_W.TryGetItemConfig(key); ok {
				items = append(items, NewItem(cfg))
			} else {
				log.Printf("invalid item key '%s'", key)
			}
		}
	}

	// Apply temporary ownership
	if killer != nil && mudConfig.LootOwnershipDurationSeconds > 0 {
		ownership := &Ownership{killer.id, time.Now().UTC().Add(time.Second * time.Duration(mudConfig.LootOwnershipDurationSeconds))}
		for _, item := range items {
			if item.ownedBy != nil && item.ownedBy.Valid() {
				continue
			}
			item.ownedBy = ownership
		}
	}

	// Deposit items in target (either room or corpse)
	if onDeathConfig.Items == ItemsOnDeath_Drop {
		for _, i := range items {
			itemTarget.AddItem(i)
			if itemTarget == r {
				onItemTransferred(w, tgt, r, i)
			}
		}
	}

	if tgt.player != nil {
		// Clear temp status effects
		tgt.data.Statuses = make(StatusDataMap)

		// Save player
		w.SavePlayerCharacter(tgt.player.id)
	}

	w.RemoveEntity(tgt.id)
}

func createCorpse(from *Entity, w *World) *Item {
	// Create new corpse
	cfg := &ItemConfig{}
	cfg.Key = from.cfg.Key + "_corpse"
	cfg.Name = fmt.Sprintf("the corpse of %s", from.GetName())
	cfg.Keywords = append([]string{"corpse"}, from.cfg.Keywords...)
	cfg.Flags = IFlag_Container | IFlag_Crumbles | IFlag_NoStorage
	cfg.Init()
	corpse := NewItem(cfg)

	// Place corpse in room
	w.AddItem(corpse, from.data.RoomId)

	return corpse
}

func sendDamageMessages(dam int, src *Entity, dst *Entity, w *World, critical bool, nounSingular string, nounPlural string) {
	srcDamStr := Colorize(Color_PlayerDam, dam)
	dstDamStr := Colorize(Color_EnemyDam, dam)
	if dam <= 0 {
		Write("Your %s misses %s completely (%s)", nounSingular, ObservableName(dst), srcDamStr).ToPlayer(src).Subject(dst).Send()
		Write("%s's %s misses you completely (%s)", ObservableNameCap(src), nounSingular, dstDamStr).ToPlayer(dst).Subject(src).Send()
		Write("%s tries to %s %s, but misses", ObservableNameCap(src), nounSingular, ObservableName(dst)).ToEntityRoom(w, src).Subject(src).Ignore(dst).Send()
	} else if dam <= 2 {
		Write("Your %s tickles %s (%s)", nounSingular, ObservableName(dst), srcDamStr).ToPlayer(src).Subject(dst).Send()
		Write("%s's %s tickles you (%s)", ObservableNameCap(src), nounSingular, dstDamStr).ToPlayer(dst).Subject(src).Send()
		Write("%s's %s tickles %s", ObservableNameCap(src), nounSingular, ObservableName(dst)).ToEntityRoom(w, src).Subject(src).Ignore(dst).Send()
	} else if !critical {
		Write("You %s %s (%s)", nounSingular, ObservableName(dst), srcDamStr).ToPlayer(src).Subject(dst).Send()
		Write("%s %s you (%s)", ObservableNameCap(src), nounPlural, dstDamStr).ToPlayer(dst).Subject(src).Send()
		Write("%s %s %s", ObservableNameCap(src), nounPlural, ObservableName(dst)).ToEntityRoom(w, src).Subject(src).Ignore(dst).Send()
	} else {
		Write("You %s %s %s (%s)", nounSingular, ObservableName(dst), ColorizeRainbow("HARD"), srcDamStr).ToPlayer(src).Subject(dst).Send()
		Write("%s %s you %s (%s)", ObservableNameCap(src), nounPlural, ColorizeRainbow("HARD"), dstDamStr).ToPlayer(dst).Subject(src).Send()
		Write("%s %s %s %s", ObservableNameCap(src), nounPlural, ObservableName(dst), ColorizeRainbow("HARD")).ToEntityRoom(w, src).Subject(src).Ignore(dst).Send()
	}
}

func sendStatusMessages(tgt *Entity, w *World) {
	switch tgt.stats.Condition() {
	case Cnd_Stunned:
		Write("You are dazed and disoriented, struggling to regain your footing").ToPlayer(tgt).Send()
		Write("%s is dazed and disoriented, struggling to regain their footing", ObservableNameCap(tgt)).ToEntityRoom(w, tgt).Subject(tgt).Restricted(SendRst_CanSee).Send()
	case Cnd_Incapacitated:
		Write("You are incapacitated and will die soon if not healed").ToPlayer(tgt).Send()
		Write("%s is incapacitated and will die soon if not healed", ObservableNameCap(tgt)).ToEntityRoom(w, tgt).Subject(tgt).Restricted(SendRst_CanSee).Send()
	case Cnd_MortallyWounded:
		Write("You are bleeding profusely and will die soon if not healed").ToPlayer(tgt).Send()
		Write("%s is bleeding profusely and will die soon if not healed", ObservableNameCap(tgt)).ToEntityRoom(w, tgt).Subject(tgt).Restricted(SendRst_CanSee).Send()
	case Cnd_Dead:
	default:
		if tgt.stats.Get(Stat_HP) < tgt.stats.Get(Stat_MaxHP)/4 {
			Write("You sure are BLEEDING a lot!").ToPlayer(tgt).Send()
		}
	}
}

func numAttackers(e *Entity, w *World) int {
	r := w.rooms[e.data.RoomId]
	num := 0
	for _, e2 := range r.entities {
		if e2.combat != nil && e2.combat.target == e {
			num++
		}
	}
	return num
}

func startAttacking(e *Entity, w *World, tgt *Entity) {
	if e.entityFlags.Has(EFlag_Pacifist) {
		return
	}
	if tgt != nil && tgt != e && e.combat == nil && tgt.stats.Condition() > Cnd_Stunned && e.stats.Condition() > Cnd_Stunned {
		w.inCombat.StartCombat(e, tgt)
	}
}
