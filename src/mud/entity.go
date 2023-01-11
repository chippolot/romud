package mud

import (
	"fmt"
	"log"
	"math/rand"
	"strings"
	"unicode"

	"github.com/chippolot/go-mud/src/utils"
)

const PlayerEntityKey = "_player"

var entityIdCounter EntityId = InvalidId

type EntityId int32

type EntityConfigList []*EntityConfig

type EntityConfig struct {
	Key      string
	Name     string
	Gender   Gender
	Keywords []string
	RoomDesc string
	FullDesc string
	Stats    *StatsConfig
	Attacks  []*AttackConfig
	Flags    EntityFlags
	lookup   map[string]bool
}

func (cfg *EntityConfig) Init() {
	cfg.lookup = make(map[string]bool)
	for _, s := range cfg.Keywords {
		cfg.lookup[strings.ToLower(s)] = true
	}
	for _, a := range cfg.Attacks {
		if a.Weight == 0 {
			a.Weight = 1
		}
	}
}

type EntityData struct {
	Key       string
	RoomId    RoomId           `json:",omitempty"`
	Stats     StatMap          `json:",omitempty"`
	Inventory []*ItemData      `json:",omitempty"`
	Equipped  EquipmentDataMap `json:",omitempty"`
}

type EntityContainer interface {
	AddEntity(entity *Entity)
	SearchEntities(query SearchQuery) []*Entity
	AllEntities() []*Entity
	RemoveEntity(entity *Entity)
}

type EntityList []*Entity

type Entity struct {
	id        EntityId
	cfg       *EntityConfig
	data      *EntityData
	player    *Player
	stats     *Stats
	combat    *CombatData
	position  Position
	inventory ItemList
	equipped  map[EquipSlot]*Item
}

func NewEntity(cfg *EntityConfig) *Entity {
	entityIdCounter++
	eid := entityIdCounter
	data := newEntityData(cfg)
	return &Entity{eid, cfg, data, nil, newStats(cfg.Stats, data.Stats), nil, Pos_Standing, make(ItemList, 0), make(map[EquipSlot]*Item)}
}

func newEntityData(cfg *EntityConfig) *EntityData {
	return &EntityData{cfg.Key, InvalidId, newStatsData(cfg.Stats), make([]*ItemData, 0), make(map[EquipSlot]*ItemData)}
}

func (e *Entity) SetData(data *EntityData, w *World) {
	e.data = data

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
	}
}

func (e *Entity) Name() string {
	if e.player != nil {
		return e.player.data.Name
	}
	return e.cfg.Name
}

func (e *Entity) Gender() Gender {
	if e.player != nil {
		return e.player.data.Gender
	}
	return e.cfg.Gender
}

func (e *Entity) NameCapitalized() string {
	arr := []rune(e.Name())
	arr[0] = unicode.ToUpper(arr[0])
	return string(arr)
}

func (e *Entity) RandomAttack() *AttackConfig {
	// Calc total weight
	sum := float32(0)
	for _, a := range e.cfg.Attacks {
		sum += a.Weight
	}

	// Weighted selection
	rnd := rand.Float32() * sum
	for _, a := range e.cfg.Attacks {
		if rnd <= a.Weight {
			return a
		}
		rnd -= a.Weight
	}
	log.Panicf("failed to select random atttack for entity %s", e.Name())
	return nil
}

func (e *Entity) AddItem(item *Item) {
	e.inventory = append(e.inventory, item)
	e.data.Inventory = append(e.data.Inventory, item.data)
}

func (e *Entity) SearchItems(query SearchQuery) []*Item {
	return SearchList(query, e.inventory)
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
		SendToPlayer(e, "You can't equip %s", item.Name())
		return EqSlot_None, nil, false
	}
	if idx := utils.FindIndex(e.inventory, item); idx != -1 {
		slot := item.cfg.Equipment.Slot

		// Find open slot for slot categories
		switch slot {
		case EqSlot_Fingers:
			slot = e.openEquipSlot(EqSlot_FingerR, EqSlot_FingerL)
		case EqSlot_Wrists:
			slot = e.openEquipSlot(EqSlot_WristR, EqSlot_WristL)
		case EqSlot_Neck:
			slot = e.openEquipSlot(EqSlot_Neck1, EqSlot_Neck2)
		case EqSlot_Held1H:
			slot = e.openEquipSlot(EqSlot_HeldR, EqSlot_HeldL)
		}
		e.RemoveItem(item)
		unequipped := make([]*Item, 0)
		if slot == EqSlot_Held2H {
			if u := e.unequipFromSlot(item, EqSlot_HeldL); u != nil {
				unequipped = append(unequipped, u)
			}
			if u := e.equipToSlot(item, EqSlot_HeldR); u != nil {
				unequipped = append(unequipped, u)
			}
		} else {
			if u := e.equipToSlot(item, slot); u != nil {
				unequipped = append(unequipped, u)
			}
		}
		return slot, unequipped, true
	} else {
		SendToPlayer(e, "You aren't carrying %s", item.Name())
		return EqSlot_None, nil, false
	}
}

func (e *Entity) GetWeapon() (*WeaponConfig, bool) {
	if weaponItem, ok := e.equipped[EqSlot_HeldR]; ok && weaponItem.cfg.Equipment.Weapon != nil {
		return weaponItem.cfg.Equipment.Weapon, true
	}
	if weaponItem, ok := e.equipped[EqSlot_HeldL]; ok && weaponItem.cfg.Equipment.Weapon != nil {
		return weaponItem.cfg.Equipment.Weapon, true
	}
	return nil, false
}

func (e *Entity) AC() int {
	sum := 0.0
	armCnt := 0
	hvyCnt := 0
	for _, eq := range e.equipped {
		if eq.cfg.Equipment.Armor == nil {
			continue
		}
		armCnt++
		if eq.cfg.Flags.Has(IFlag_HeavyArmor) {
			hvyCnt++
		}
		ac := float64(eq.cfg.Equipment.Armor.AC)
		slot := eq.cfg.Equipment.Slot
		if slot.Has(EqSlot_Body) {
			ac *= .34
		} else if slot.Has(EqSlot_Head) {
			ac *= .2
		} else if slot.Has(EqSlot_Arms) || slot.Has(EqSlot_Legs) {
			ac *= .15
		} else {
			ac *= .1
		}
		sum += ac
	}
	dexBonus := GetAbilityModifier(e.stats.Dex)
	if e.player == nil {
		dexBonus = 0
	}
	dexBonusRatio := 1.0
	if armCnt > 0 {
		dexBonusRatio = float64(armCnt-hvyCnt) / float64(armCnt)
	}
	return e.cfg.Stats.AC + int(sum+float64(dexBonus)*dexBonusRatio)
}

func (e *Entity) Unequip(item *Item) bool {
	if item.cfg.Equipment == nil {
		SendToPlayer(e, "%s isn't equipped", item.NameCapitalized())
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
		e.AddItem(item)
	} else {
		SendToPlayer(e, "%s isn't equipped", item.NameCapitalized())
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
	if e.cfg.Flags.Has(EFlag_UsesEquipment) {
		sb.WriteLine(e.DescribeEquipment())
	}
	return sb.String()
}

func (e *Entity) DescribeStatus() string {
	aData := GetAttackData(e)
	aDamage := aData.Damage.Add(aData.DamageMod)

	var sb utils.StringBuilder
	sb.WriteHorizontalDivider()
	sb.WriteLinef("%s", e.Name())
	sb.WriteNewLine()
	sb.WriteLinef("Level  : <c yellow>%d</c>", e.stats.Level)
	if !IsMaxLevel(e) {
		sb.WriteLinef("Next   : <c yellow>%d</c> XP", GetXpForNextLevel(e))
	}
	sb.WriteNewLine()
	sb.WriteLinef("HP     : <c yellow>%d</c>/<c yellow>%d</c>", e.stats.HP, e.stats.MaxHP)
	sb.WriteLinef("Mov    : <c yellow>%d</c>/<c yellow>%d</c>", e.stats.Mov, e.stats.MaxMov)
	sb.WriteNewLine()
	sb.WriteLinef("ToHit  : +<c yellow>%d</c>", aData.ToHit)
	sb.WriteLinef("Attack : %s", aDamage.StringColorized("yellow"))
	sb.WriteLinef("AC     : <c yellow>%d</c>", e.AC())
	sb.WriteNewLine()
	sb.WriteLinef("Str    : <c yellow>%d</c>", e.stats.Str)
	sb.WriteLinef("Dex    : <c yellow>%d</c>", e.stats.Dex)
	sb.WriteLinef("Con    : <c yellow>%d</c>", e.stats.Con)
	sb.WriteLinef("Int    : <c yellow>%d</c>", e.stats.Int)
	sb.WriteLinef("Wis    : <c yellow>%d</c>", e.stats.Wis)
	sb.WriteLinef("Cha    : <c yellow>%d</c>", e.stats.Cha)
	sb.WriteNewLine()
	sb.WriteLinef("Carry  : <c yellow>%d</c>/<c yellow>%d</c>", e.ItemWeight(), e.stats.CarryingCapacity())
	sb.WriteString(utils.HorizontalDivider)
	return sb.String()
}

func (e *Entity) DescribeInventory() string {
	var sb utils.StringBuilder
	sb.WriteLinef("%s is carrying:", e.NameCapitalized())
	if len(e.inventory) == 0 {
		sb.WriteLine("  Nothing.")
	} else {
		descs := GroupDescriptionsFromSlice(e.inventory, func(i *Item) string {
			return fmt.Sprintf("<c white>%s</c>", i.NameCapitalized())
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
	if len(e.equipped) == 0 {
		sb.WriteLine("  Nothing.")
	} else {
		for slot, eq := range e.equipped {
			slotDesc := GetEquipmentSlotDescription(slot, eq)
			if slotDesc == "" {
				continue
			}
			sb.WriteLinef("  %-15s%s", slotDesc, eq.Name())
		}
	}
	return strings.TrimSuffix(sb.String(), utils.NewLine)
}

func (e *Entity) MatchesKeyword(keyword string) bool {
	if strings.EqualFold(e.Name(), keyword) {
		return true
	}
	_, ok := e.cfg.lookup[keyword]
	return ok
}

func (e *Entity) equipToSlot(item *Item, slot EquipSlot) *Item {
	unequipped := e.unequipFromSlot(item, slot)
	e.equipped[slot] = item
	e.data.Equipped[slot] = item.data
	return unequipped
}

func (e *Entity) unequipFromSlot(item *Item, slot EquipSlot) *Item {
	var unequipped *Item
	if old, ok := e.equipped[slot]; ok {
		unequipped = old
		e.Unequip(old)
	}
	return unequipped
}

func (e *Entity) openEquipSlot(slots ...EquipSlot) EquipSlot {
	for _, slot := range slots {
		if _, ok := e.equipped[slot]; !ok {
			return slot
		}
	}
	return slots[0]
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
