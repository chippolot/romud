package mud

import (
	"fmt"
	"log"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	DamCtx_Melee DamageContext = iota
	DamCtx_Bleeding
	DamCtx_Poison
	DamCtx_Skill
	DamCtx_Admin DamageContext = 999
)

const (
	SkillAttackType_Physical SkillAttackType = iota
	SkillAttackType_Magic
)

type AdvantageType int
type DamageContext int
type SkillAttackType int

var skillAttackTypeStringMapping = utils.NewStringMapping(map[SkillAttackType]string{
	SkillAttackType_Physical: "physical",
	SkillAttackType_Magic:    "magic",
})

func ParseSkillAttackType(str string) (SkillAttackType, error) {
	if val, ok := skillAttackTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown SkillAttackType: %s", str)
}

func (dt *SkillAttackType) String() string {
	if str, ok := skillAttackTypeStringMapping.ToString[*dt]; ok {
		return str
	}
	return "unknown"
}

type AttackConfig struct {
	Power Range
	Noun  string
}

type SavingThrowConfig struct {
	Stat StatType
	DC   int
}

type SkillAttack struct {
	skill     *SkillConfig    // Skill to be used
	AtkType   SkillAttackType // Type of attack (weapon, mag)
	AtkBonus  float64         // Attack multiplier
	MAtkBonus float64         // Magic Attack multiplier
	HitBonus  float64         // Hit multiplier
	Element   Element         // Element of attack
	Delay     utils.Seconds   // Delay until attack triggers
}

type CombatData struct {
	target              *Entity // Current attack target
	numAttacksRemainder float64 // Fractional number of attacks left over from previous combat round
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
		e.combat = &CombatData{tgt, 0}
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

func validateAttack(e *Entity, tgt *Entity) bool {
	if tgt == nil {
		log.Printf("trying to attack nil target!")
		return false
	}
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
	prepareAttack(e, w, tgt, nil)
}

func performSkillAttack(e *Entity, w *World, targets []*Entity, attack *SkillAttack) {
	for _, tgt := range targets {
		combatLogicAttack(e, w, tgt, attack)
	}
}

func performSkill(e *Entity, w *World, target *Entity, skill *SkillConfig, level int) {
	// TODO: Skill: Confirm player knows skill

	// Cooldown check
	if w.time.time < e.skillCooldownExpiry {
		Write("You can't use another skill yet!").ToPlayer(e).Send()
		return
	}

	// Already casting something
	if e.casting != nil {
		Write("You're kind of busy casting something else!").ToPlayer(e).Send()
		return
	}

	// Can't afford
	spCost := skill.SPCost(level)
	if spCost > 0 && e.stats.Get(Stat_SP) < spCost {
		Write("You don't have enough SP!").ToPlayer(e).Send()
		return
	}

	// Subtract SP
	e.stats.Add(Stat_SP, -spCost)

	// Trigger skill script
	triggerSkillActivatedScript(skill, e)

	// If skill is instant, cast it!
	if skill.CastTime(level) <= 0 {
		castSkill(skill, e, w, target, level)
	} else { // Otherwise, add to casting list
		w.casting.StartCasting(e, w.time, target, skill, level)
	}
}

func castSkill(skill *SkillConfig, e *Entity, w *World, target *Entity, level int) {
	// Collect targets for AOE skills
	targets := []*Entity{target}
	switch skill.TargetType {
	case SkillTargetType_AllEnemies:
		targets = make([]*Entity, 0)
		r := w.rooms[e.data.RoomId]
		for _, e2 := range r.entities {
			if e.IsEnemyOf(e2) {
				targets = append(targets, e2)
			}
		}
	}

	triggerSkillCastScript(skill, e, targets, level)
}

func interruptSkill(e *Entity, w *World) {
	if e.casting == nil {
		return
	}
	w.casting.EndCasting(e)

	Write("You lose your concentration!").ToPlayer(e).Send()
	Write("%s loses their concentration!", ObservableNameCap(e)).ToEntityRoom(w, e).Ignore(e).Send()
}

func prepareAttack(e *Entity, w *World, tgt *Entity, preAttackFn func()) {
	if !validateAttack(e, tgt) {
		return
	}

	if e.combat != nil {
		// Already in combat
		if preAttackFn != nil {
			preAttackFn()
		}

		if e.combat.target != tgt {
			// Trying to attack different tgt. Just update tgt and wait for next combat round.
			Write("You turn to face %s", ObservableName(tgt)).ToPlayer(e).Subject(tgt).Send()
			e.combat.target = tgt
		} else {
			// Force a new prompt
			Write("").ToPlayer(e).Send()
		}
		return
	} else if w.inCombat.StartCombat(e, tgt) {
		// Enter combat
		if preAttackFn != nil {
			preAttackFn()
		}
		runCombatLogic(e, w, tgt)
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

	// Determine number of attacks per round based on Aspd
	numAttacks := calculateAttacksPerRound(e.stats) + e.combat.numAttacksRemainder
	numAttacksFull := int(numAttacks)
	e.combat.numAttacksRemainder = numAttacks - float64(numAttacksFull)

	// Perform attacks
	for i := 0; i < numAttacksFull; i++ {
		if !tryTriggerCombatSkill(e, w, tgt) {
			combatLogicAttack(e, w, tgt, nil)
		}
	}
}

func combatLogicAttack(e *Entity, w *World, tgt *Entity, skillAttack *SkillAttack) {
	if skillAttack != nil && skillAttack.AtkType == SkillAttackType_Magic {
		combatLogicAttackMagic(e, w, tgt, skillAttack)
	} else {
		combatLogicAttackPhysical(e, w, tgt, skillAttack)
	}
}

func combatLogicAttackPhysical(e *Entity, w *World, tgt *Entity, skillAttack *SkillAttack) {
	attack := e.cfg.Attack
	noun := w.vocab.GetNoun(attack.Noun)
	atkBonus := 0.0
	atkElem := Neutral
	hitBonus := 0.0
	weaponType := WeaponType_Bare_Handed

	// Pull attack data from weapon (where applicable)
	if e.player != nil || e.entityFlags.Has(EFlag_UsesEquipment) {
		if weap, _, ok := e.GetWeapon(); ok {
			noun = w.vocab.GetNoun(weap.Noun)
			weaponType = weap.Type
		}
	}

	// Special Melee Attack
	if skillAttack != nil {
		atkElem = skillAttack.Element
		atkBonus += skillAttack.AtkBonus
		hitBonus += skillAttack.HitBonus
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
			hitChance := calcuateHitChance(e, w, tgt, hitBonus)
			if utils.RandChance100() < float64(hitChance) {
				didHit = true
			}
		} else {
			didHit = true
		}
	}

	// 4. Calculate + Apply Damage
	if didHit {
		ctx := DamCtx_Melee
		if skillAttack != nil && skillAttack.skill != nil {
			ctx = DamCtx_Skill
		}
		dam := calculatePhysicalAttackDamage(e, tgt, weaponType, atkElem, atkBonus, didCrit)
		applyDamage(tgt, w, e, dam, ctx, didCrit, noun.Singular, noun.Plural)
		if skillAttack != nil && skillAttack.skill != nil {
			triggerSkillHitScript(skillAttack.skill, e, tgt, dam)
		}
	} else {
		if skillAttack != nil && skillAttack.skill != nil {
			triggerSkillMissedScript(skillAttack.skill, e, tgt)
		} else {
			sendDamageMessages(0, e, tgt, w, false, noun.Singular, noun.Plural)
		}
		return
	}
}

func combatLogicAttackMagic(e *Entity, w *World, tgt *Entity, skillAttack *SkillAttack) {
	if skillAttack == nil {
		log.Printf("cannot execute magic attack with nil skillAttack!")
		return
	}

	// Magic attacks always hit!
	dam := calculateMagicAttackDamage(e, tgt, skillAttack.Element, skillAttack.MAtkBonus)
	applyDamage(tgt, w, e, dam, DamCtx_Skill, false, "", "")
	if dam > 0 {
		triggerSkillHitScript(skillAttack.skill, e, tgt, dam)
	} else {
		triggerSkillMissedScript(skillAttack.skill, e, tgt)
	}

}

func applyDamage(tgt *Entity, w *World, from *Entity, dam int, damCtx DamageContext, critical bool, nounSingular string, nounPlural string) int {
	cnd := tgt.stats.Condition()
	if cnd == Cnd_Dead {
		return 0
	}

	// Start fighting damage source
	startAttacking(tgt, w, from)

	tgt.stats.Add(Stat_HP, -dam)
	if dam > 0 {
		tgt.tookDamage = true
		if tgt.casting != nil {
			interruptSkill(tgt, w)
		}
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

func tryTriggerCombatSkill(e *Entity, w *World, tgt *Entity) bool {
	if tgt == nil {
		return false
	}

	// No skill triggers
	triggers := e.SkillTriggers(EState_Combat)
	if len(triggers) == 0 {
		return false
	}

	// On skill cooldown
	if w.time.time < e.skillCooldownExpiry {
		return false
	}

	// Check all skill triggers
	chance := utils.RandChance100()
	for _, trigger := range triggers {
		chance -= trigger.Chance
		if chance <= 0 {
			if skill, ok := w.skillConfigs[trigger.Key]; ok {
				performSkill(e, w, tgt, skill, trigger.Level)
				return true
			} else {
				log.Printf("invalid skill key '%s' used in skill trigger by enitty '%s'", trigger.Key, e.cfg.Key)
				break
			}
		}
	}
	return false
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
