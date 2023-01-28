package mud

import (
	"log"
	"math"
	"strings"
	"unicode"

	"github.com/chippolot/go-mud/src/utils"
)

const PlayerEntityKey = "_player"

var entityIdCounter EntityId = InvalidId

type EntityId int32

type EntityConfigList []*EntityConfig

type EntityConfig struct {
	Key       string
	Name      string
	Gender    Gender
	Keywords  []string
	RoomDesc  string
	FullDesc  string
	DropTable *utils.ChanceTable[string]
	Stats     *StatsConfig
	Attack    *AttackConfig
	Flags     EntityFlagMask

	scripts *EntityScripts
	lookup  map[string]bool
}

func (cfg *EntityConfig) Init() {
	cfg.lookup = make(map[string]bool)
	for _, s := range cfg.Keywords {
		cfg.lookup[strings.ToLower(s)] = true
	}
}

type EntityData struct {
	Key       string
	RoomId    RoomId           `json:",omitempty"`
	Stats     StatMap          `json:",omitempty"`
	Inventory []*ItemData      `json:",omitempty"`
	Equipped  EquipmentDataMap `json:",omitempty"`
	Statuses  StatusDataMap    `json:",omitempty"`
}

type EntityContainer interface {
	AddEntity(entity *Entity)
	SearchEntities(query SearchQuery) []*Entity
	AllEntities() []*Entity
	RemoveEntity(entity *Entity)
}

type EntityList []*Entity

type Entity struct {
	id            EntityId
	cfg           *EntityConfig
	data          *EntityData
	player        *Player
	stats         *Stats
	combat        *CombatData
	tookDamage    bool
	position      Position
	inventory     ItemList
	equipped      map[EquipSlot]*Item
	entityFlags   EntityFlagMask
	statusEffects *StatusEffects
}

func NewEntity(cfg *EntityConfig) *Entity {
	entityIdCounter++
	eid := entityIdCounter
	data := newEntityData(cfg)
	return &Entity{eid, cfg, data, nil, newStats(cfg.Stats, data.Stats), nil, false, Pos_Standing, make(ItemList, 0), make(map[EquipSlot]*Item), cfg.Flags, newStatusEffects()}
}

func newEntityData(cfg *EntityConfig) *EntityData {
	return &EntityData{cfg.Key, InvalidId, newStatsData(cfg.Stats), make([]*ItemData, 0), make(EquipmentDataMap), make(StatusDataMap)}
}

func (e *Entity) SetData(data *EntityData, w *World) {
	e.data = data
	e.stats.data = e.data.Stats

	// Prepare status effects
	if e.data.Statuses == nil {
		e.data.Statuses = make(StatusDataMap)
	}
	for statusType, sData := range e.data.Statuses {
		statusEffect := newStatusEffect(statusType, sData.Duration)
		e.statusEffects.statusEffects = append(e.statusEffects.statusEffects, statusEffect)
	}
	e.updateStatusEffectsMask()

	// Prepare inventory
	if e.data.Inventory == nil {
		e.data.Inventory = make([]*ItemData, 0)
	}
	for _, idata := range e.data.Inventory {
		cfg, ok := w.itemConfigs[idata.Key]
		if !ok {
			log.Fatalf("cannot create item. expected item config with key %s", cfg.Key)
		}
		item := NewItem(cfg)
		item.SetData(idata, w)
		e.inventory = append(e.inventory, item)
	}

	// Prepare equipment
	if e.data.Equipped == nil {
		e.data.Equipped = make(map[EquipSlot]*ItemData)
	}
	for slot, idata := range e.data.Equipped {
		cfg, ok := w.itemConfigs[idata.Key]
		if !ok {
			log.Fatalf("cannot create equipment. expected item config with key %s", cfg.Key)
		}
		item := NewItem(cfg)
		item.SetData(idata, w)
		e.equipped[slot] = item
		e.onEquipped(item)
	}
}

func (e *Entity) Name() string {
	if e.player != nil {
		return e.player.data.Name
	}
	return e.cfg.Name
}

func (e *Entity) NameCapitalized() string {
	arr := []rune(e.Name())
	arr[0] = unicode.ToUpper(arr[0])
	return string(arr)
}

func (e *Entity) Gender() Gender {
	if e.player != nil {
		return e.player.data.Gender
	}
	return e.cfg.Gender
}

func (e *Entity) AddItem(item *Item) {
	e.inventory = append(e.inventory, item)
	e.data.Inventory = append(e.data.Inventory, item.data)
}

func (e *Entity) SearchItems(query SearchQuery) []*Item {
	return SearchList(query, e.inventory, nil)
}

func (e *Entity) AllItems() []*Item {
	return e.inventory
}

func (e *Entity) ItemWeight() int {
	w := 0
	for _, i := range e.inventory {
		w += i.ItemWeight()
	}
	for _, i := range e.equipped {
		w += i.ItemWeight()
	}
	return w
}

func (e *Entity) RemoveItem(item *Item) {
	if idx := utils.FindIndex(e.inventory, item); idx != -1 {
		e.inventory = utils.SwapDelete(e.inventory, idx)
		e.data.Inventory = utils.SwapDelete(e.data.Inventory, idx)
	}
}
func (e *Entity) Equip(item *Item) (EquipSlot, []*Item, bool) {
	if item.cfg.Equipment == nil {
		Write("You can't equip %s", item.Name()).ToPlayer(e).Send()
		return EqSlot_None, nil, false
	}
	if idx := utils.FindIndex(e.inventory, item); idx != -1 {
		slot := item.cfg.Equipment.Slot

		// Find best slot for slot categories
		switch slot {
		case EqSlot_Held_1H:
			slot = e.bestEquipSlot(EqSlot_Held_R, EqSlot_Held_L)
		}
		e.RemoveItem(item)
		unequipped := make([]*Item, 0)
		if slot == EqSlot_Held_2H {
			if u := e.equipToSlot(item, EqSlot_Held_R); u != nil {
				unequipped = append(unequipped, u)
			}
			if u := e.unequipFromSlot(EqSlot_Held_L); u != nil {
				unequipped = append(unequipped, u)
			}
		} else {
			if u := e.equipToSlot(item, slot); u != nil {
				unequipped = append(unequipped, u)
			}
		}
		e.onEquipped(item)
		return slot, unequipped, true
	} else {
		Write("You aren't carrying %s", item.Name()).ToPlayer(e).Send()
		return EqSlot_None, nil, false
	}
}

func (e *Entity) Unequip(item *Item) bool {
	if item.cfg.Equipment == nil {
		Write("%s isn't equipped", item.NameCapitalized()).ToPlayer(e).Send()
		return false
	}
	var found bool
	for slot, item2 := range e.equipped {
		if item2 == item {
			delete(e.equipped, slot)
			delete(e.data.Equipped, slot)
			found = true
		}
	}
	if found {
		e.onUnequipped(item)
		e.AddItem(item)
	} else {
		Write("%s isn't equipped", item.NameCapitalized()).ToPlayer(e).Send()
		return false
	}
	return true
}

func (e *Entity) GetWeapon() (*WeaponConfig, *EquipmentConfig, bool) {
	if weaponItem, ok := e.equipped[EqSlot_Held_R]; ok && weaponItem.cfg.Equipment.Weapon != nil {
		return weaponItem.cfg.Equipment.Weapon, weaponItem.cfg.Equipment, true
	}
	if weaponItem, ok := e.equipped[EqSlot_Held_L]; ok && weaponItem.cfg.Equipment.Weapon != nil {
		return weaponItem.cfg.Equipment.Weapon, weaponItem.cfg.Equipment, true
	}
	return nil, nil, false
}

func (e *Entity) AddStatusEffect(statusType StatusEffectMask, duration utils.Seconds) bool {
	for _, s := range e.statusEffects.statusEffects {
		if s.statusType == statusType {
			if duration == StatusEffectDuration_Permanent {
				s.permanentCount++
			} else {
				if s.data == nil {
					s.data = &StatusEffectData{duration}
					e.data.Statuses[statusType] = s.data
				} else {
					s.data.Duration = utils.Seconds(math.Max(float64(s.data.Duration), float64(duration)))
				}
			}
			return false
		}
	}
	statusEffect := newStatusEffect(statusType, duration)
	if duration == StatusEffectDuration_Permanent {
		statusEffect.permanentCount = 1
	} else {
		e.data.Statuses[statusType] = statusEffect.data
	}
	e.statusEffects.statusEffects = append(e.statusEffects.statusEffects, statusEffect)
	for r, m := range statusEffect.cfg.Rolls {
		e.stats.AddRollMod(r, m, statusEffect)
	}
	if statusEffect.cfg.EntityFlags != 0 {
		e.updateEntityFlagsMask()
	}
	e.updateStatusEffectsMask()
	return true
}

func (e *Entity) HasStatusEffect(status StatusEffectMask) bool {
	return e.statusEffects.mask.Has(status)
}

func (e *Entity) RemoveStatusEffect(statusType StatusEffectMask, permanent bool) bool {
	for idx, s := range e.statusEffects.statusEffects {
		if s.statusType == statusType {
			if permanent {
				// If the removal is of a permanent counter, mark it down
				s.permanentCount--
			} else {
				// Otherwise, the status effect's duration has elapsed, remove duration data
				s.data = nil
				delete(e.data.Statuses, statusType)
			}

			// If the permanent counters have all been removed and the temporary duration has elapsed,
			// remove the effect
			if s.permanentCount == 0 && s.data == nil {
				e.statusEffects.statusEffects = utils.SwapDelete(e.statusEffects.statusEffects, idx)

				for r, m := range s.cfg.Rolls {
					e.stats.RemoveRollMod(r, m, s)
				}
				if s.cfg.EntityFlags != 0 {
					e.updateEntityFlagsMask()
				}
				e.updateStatusEffectsMask()
				return true
			} else {
				return false
			}
		}
	}
	return false
}

func (e *Entity) CanSee() bool {
	return !e.entityFlags.Has(EFlag_Blind)
}

func (e *Entity) CanBeSeenBy(viewer *Entity) bool {
	if e == viewer {
		return true
	}
	if viewer != nil && !viewer.CanSee() {
		return false
	}
	if e.entityFlags.Has(EFlag_Invisible) {
		return false
	}
	return true
}

func (e *Entity) Describe() string {
	var sb utils.StringBuilder
	if e.cfg.FullDesc != "" {
		sb.WriteLine(e.cfg.FullDesc)
	}
	sb.WriteLine(e.stats.ConditionLongString(e))
	statuses := e.DescribeStatusEffects()
	if statuses != "" {
		sb.WriteLinef("%s is %s", e.NameCapitalized(), statuses)
	}
	if e.player != nil || e.entityFlags.Has(EFlag_UsesEquipment) {
		sb.WriteLine(e.DescribeEquipment())
	}
	return sb.String()
}

func (e *Entity) DescribeStatus() string {
	statuses := e.DescribeStatusEffects()

	var sb utils.StringBuilder
	sb.WriteHorizontalDivider()
	sb.WriteLinef("%s", e.Name())
	sb.WriteNewLine()
	sb.WriteLinef("Level  : %s", Colorize(Color_Stat, e.stats.Get(Stat_Level)))
	if !IsMaxLevel(e) {
		sb.WriteLinef("Next   : %s XP", Colorize(Color_Stat, GetXpForNextLevel(e)))
	}
	sb.WriteNewLine()
	sb.WriteLinef("HP     : %s/%s", Colorize(Color_Stat, e.stats.Get(Stat_HP)), Colorize(Color_Stat, e.stats.Get(Stat_MaxHP)))
	sb.WriteLinef("SP     : %s/%s", Colorize(Color_Stat, e.stats.Get(Stat_SP)), Colorize(Color_Stat, e.stats.Get(Stat_MaxSP)))
	sb.WriteLinef("Mov    : %s/%s", Colorize(Color_Stat, e.stats.Get(Stat_Mov)), Colorize(Color_Stat, e.stats.Get(Stat_MaxMov)))
	sb.WriteNewLine()
	if e.player != nil {
		sb.WriteLinef("Atk    : %s + %s", Colorize(Color_Stat, calculateBaseAttackPower(e)), Colorize(Color_Stat, calculateWeaponAttackPower(e, true)))
	} else {
		sb.WriteLinef("Atk    : %s-%s", Colorize(Color_Stat, e.cfg.Attack.Power.Min), Colorize(Color_Stat, e.cfg.Attack.Power.Max))
	}
	sb.WriteLinef("Def    : %s + %s", Colorize(Color_Stat, calculateHardDef(e)), Colorize(Color_Stat, calculateSoftDef(e)))
	sb.WriteNewLine()
	if e.player != nil {
		sb.WriteLinef("Hit    : %s", Colorize(Color_Stat, calculateHit(e.stats)))
		sb.WriteLinef("Flee   : %s + %s", Colorize(Color_Stat, calculateStatusFlee(e.stats)), Colorize(Color_Stat, calculatePerfectDodge(e.stats)))
	} else {
		sb.WriteLinef("Hit100 : %s", Colorize(Color_Stat, e.stats.cfg.Hit100))
		sb.WriteLinef("Flee95 : %s", Colorize(Color_Stat, e.stats.cfg.Flee95))
	}
	sb.WriteNewLine()
	sb.WriteLinef("Aspd   : %s", Colorize(Color_Stat, calculateAttackSpeed(e.stats)))
	sb.WriteLinef("Crit   : %s", Colorize(Color_Stat, calculateStatusCritical(e.stats)))
	sb.WriteNewLine()
	sb.WriteLinef("Str    : %s", Colorize(Color_Stat, e.stats.Get(Stat_Str)))
	sb.WriteLinef("Agi    : %s", Colorize(Color_Stat, e.stats.Get(Stat_Agi)))
	sb.WriteLinef("Vit    : %s", Colorize(Color_Stat, e.stats.Get(Stat_Vit)))
	sb.WriteLinef("Int    : %s", Colorize(Color_Stat, e.stats.Get(Stat_Int)))
	sb.WriteLinef("Dex    : %s", Colorize(Color_Stat, e.stats.Get(Stat_Dex)))
	sb.WriteLinef("Luk    : %s", Colorize(Color_Stat, e.stats.Get(Stat_Luk)))
	sb.WriteLinef("Points : %s", Colorize(Color_Stat, e.stats.Get(Stat_StatPoints)))
	sb.WriteNewLine()
	sb.WriteLinef("Carry  : %s/%s", Colorize(Color_Stat, e.ItemWeight()), Colorize(Color_Stat, calculateCarryingCapacity(e.stats)))
	if statuses != "" {
		sb.WriteNewLine()
		sb.WriteLinef("Status : %s", statuses)
	}
	sb.WriteString(utils.HorizontalDivider)
	return sb.String()
}

func (e *Entity) DescribeStatusEffects() string {
	strs := make([]string, 0)
	for i := 0; i < 64; i++ {
		status := StatusEffectMask(1 << i)
		if e.HasStatusEffect(status) {
			strs = append(strs, Colorize(Color_StatusEffects, strings.Title(status.String())))
		}
	}
	return strings.Join(strs, ",")
}

func (e *Entity) DescribeInventory() string {
	var sb utils.StringBuilder
	sb.WriteLinef("%s is carrying:", e.NameCapitalized())
	if len(e.inventory) == 0 {
		sb.WriteLine("  Nothing.")
	} else {
		descs := GroupDescriptionsFromSlice(e.inventory, nil, func(i *Item) string {
			return Colorize(Color_Enum, i.NameCapitalized())
		})
		for idx, desc := range descs {
			descs[idx] = "  " + desc
		}
		sb.WriteLine(strings.Join(descs, utils.NewLine))
	}
	return strings.TrimSuffix(sb.String(), utils.NewLine)
}

func (e *Entity) DescribeEquipment() string {
	var sb utils.StringBuilder
	sb.WriteLinef("%s is using:", e.NameCapitalized())
	sb.WriteHorizontalDivider()
	e.describeEquipmeentSlot(EqSlot_Head_High, &sb)
	e.describeEquipmeentSlot(EqSlot_Head_Mid, &sb)
	e.describeEquipmeentSlot(EqSlot_Head_Low, &sb)
	e.describeEquipmeentSlot(EqSlot_Armor, &sb)
	e.describeEquipmeentSlot(EqSlot_Held_L, &sb)
	e.describeEquipmeentSlot(EqSlot_Held_R, &sb)
	e.describeEquipmeentSlot(EqSlot_Garment, &sb)
	e.describeEquipmeentSlot(EqSlot_Feet, &sb)
	e.describeEquipmeentSlot(EqSlot_Accessory_1, &sb)
	e.describeEquipmeentSlot(EqSlot_Accessory_2, &sb)
	return strings.TrimSuffix(sb.String(), utils.NewLine)
}

func (e *Entity) describeEquipmeentSlot(slot EquipSlot, sb *utils.StringBuilder) {
	eqName := "--"
	if eq, ok := e.equipped[slot]; ok {
		eqName = eq.NameCapitalized()
	}
	slotDesc := GetEquipmentSlotDescription(slot)
	if slotDesc == "" {
		return
	}
	sb.WriteLinef("  %-15s%s", slotDesc, eqName)
}

func (e *Entity) MatchesKeyword(keyword string) bool {
	if strings.EqualFold(e.Name(), keyword) {
		return true
	}
	_, ok := e.cfg.lookup[keyword]
	return ok
}

func (e *Entity) equipToSlot(item *Item, slot EquipSlot) *Item {
	unequipped := e.unequipFromSlot(slot)
	e.equipped[slot] = item
	e.data.Equipped[slot] = item.data
	return unequipped
}

func (e *Entity) unequipFromSlot(slot EquipSlot) *Item {
	var unequipped *Item
	if old, ok := e.equipped[slot]; ok {
		unequipped = old
		e.Unequip(old)
	}
	return unequipped
}

func (e *Entity) onEquipped(item *Item) {
	for s, m := range item.cfg.Equipment.Stats {
		e.stats.AddMod(s, m)
	}
	for r, m := range item.cfg.Equipment.Rolls {
		e.stats.AddRollMod(r, m, item)
	}
	if item.cfg.Equipment.StatusEffect != 0 {
		e.AddStatusEffect(item.cfg.Equipment.StatusEffect, StatusEffectDuration_Permanent)
	}
}

func (e *Entity) onUnequipped(item *Item) {
	for s, m := range item.cfg.Equipment.Stats {
		e.stats.RemoveMod(s, m)
	}
	for r, m := range item.cfg.Equipment.Rolls {
		e.stats.RemoveRollMod(r, m, item)
	}
	if item.cfg.Equipment.StatusEffect != 0 {
		e.RemoveStatusEffect(item.cfg.Equipment.StatusEffect, true)
	}
}

func (e *Entity) bestEquipSlot(slots ...EquipSlot) EquipSlot {
	for _, slot := range slots {
		if _, ok := e.equipped[slot]; !ok {
			return slot
		}
	}
	return slots[0]
}

func (e *Entity) updateStatusEffectsMask() {
	e.statusEffects.mask = 0
	for _, s := range e.statusEffects.statusEffects {
		e.statusEffects.mask |= s.statusType
	}
	e.updateEntityFlagsMask()
}

func (e *Entity) updateEntityFlagsMask() {
	e.entityFlags = 0
	e.entityFlags |= e.cfg.Flags
	for _, s := range e.statusEffects.statusEffects {
		e.entityFlags |= s.cfg.EntityFlags
	}
}

func TryGetEntityByName(name string, ents map[EntityId]*Entity) (*Entity, bool) {
	for _, e := range ents {
		if strings.EqualFold(e.Name(), name) {
			return e, true
		}
	}
	return nil, false
}

func SearchEntities(query SearchQuery, self *Entity, containers ...EntityContainer) []*Entity {
	if query.Keyword == "me" || query.Keyword == "self" || query.Keyword == "myself" {
		return []*Entity{self}
	}
	for _, c := range containers {
		if ents := c.SearchEntities(query); len(ents) != 0 {
			return ents
		}
	}
	return nil
}

type Position int

const (
	Pos_Sleeping Position = iota
	Pos_Prone
	Pos_Sitting
	Pos_Standing
)

func (p Position) InactionString() string {
	switch p {
	case Pos_Sleeping:
		return "You're too busy dreaming"
	case Pos_Prone, Pos_Sitting:
		return "You'll have to get up first!"
	}
	return ""
}
