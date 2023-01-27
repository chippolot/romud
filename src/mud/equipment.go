package mud

import (
	"encoding/json"
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

type EquipSlot bits.Bits

const (
	EqSlot_None EquipSlot = 1 << iota

	// Slot flags
	EqSlot_Head_High
	EqSlot_Head_Mid
	EqSlot_Head_Low
	EqSlot_Garment
	EqSlot_Armor
	EqSlot_Feet
	EqSlot_Accessory_1
	EqSlot_Accessory_2
	EqSlot_Held_L
	EqSlot_Held_R

	// Special flags
	EqSlot_Accessory
	EqSlot_Held_1H
	EqSlot_Held_2H = EqSlot_Held_L | EqSlot_Held_R
)

var equipSlotStringMapping = utils.NewStringMapping(map[EquipSlot]string{
	EqSlot_None:        "none",
	EqSlot_Head_High:   "head_high",
	EqSlot_Head_Mid:    "head_mid",
	EqSlot_Head_Low:    "head_low",
	EqSlot_Garment:     "garment",
	EqSlot_Armor:       "armor",
	EqSlot_Feet:        "feet",
	EqSlot_Accessory_1: "accessory_1",
	EqSlot_Accessory_2: "accessory_2",
	EqSlot_Accessory:   "accessory",
	EqSlot_Held_L:      "held_l",
	EqSlot_Held_R:      "held_r",
	EqSlot_Held_1H:     "held_1h",
	EqSlot_Held_2H:     "held_2h",
})

func ParseEquipSlot(str string) (EquipSlot, error) {
	if val, ok := equipSlotStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown equip slot: %s", str)
}

func (s *EquipSlot) Has(flag EquipSlot) bool {
	return *s&flag != 0
}

func (s *EquipSlot) String() string {
	if str, ok := equipSlotStringMapping.ToString[*s]; ok {
		return str
	}
	return "unknown"
}

func (s *EquipSlot) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

func (s *EquipSlot) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseEquipSlot(str); err != nil {
		return err
	}
	return nil
}

func GetEquipmentSlotDescription(slot EquipSlot) string {
	switch slot {
	case EqSlot_Head_High, EqSlot_Head_Mid, EqSlot_Head_Low:
		return "<head>"
	case EqSlot_Accessory_1, EqSlot_Accessory_2:
		return "<accessory>"
	case EqSlot_Garment:
		return "<garment>"
	case EqSlot_Armor:
		return "<armor>"
	case EqSlot_Feet:
		return "<feet>"
	case EqSlot_Held_L:
		return "<left hand>"
	case EqSlot_Held_R:
		return "<right hand>"
	}
	log.Printf("unknown slot %s", slot.String())
	return ""
}

func performEquip(e *Entity, w *World, item *Item) {
	r := w.rooms[e.data.RoomId]
	oldStatusEffectFlags := e.statusEffects.mask
	slot, unequipped, ok := e.Equip(item)
	if !ok {
		return
	}
	for _, u := range unequipped {
		sendUnequipMessages(e, r, u)
	}
	sendEquipMessages(e, r, slot, item)
	newStatusEffectFlags := e.statusEffects.mask
	describeStatusEffectChanges(e, w, oldStatusEffectFlags, newStatusEffectFlags)
}

func performUnequip(e *Entity, w *World, item *Item) {
	r := w.rooms[e.data.RoomId]
	oldStatusEffectFlags := e.statusEffects.mask
	if ok := e.Unequip(item); !ok {
		return
	}
	sendUnequipMessages(e, r, item)
	newStatusEffectFlags := e.statusEffects.mask
	describeStatusEffectChanges(e, w, oldStatusEffectFlags, newStatusEffectFlags)
}

func sendEquipMessages(e *Entity, r *Room, slot EquipSlot, item *Item) {
	if item.cfg.Equipment.Slot.Has(EqSlot_Held_2H) {
		Write("You grasp %s in both hands", ObservableName(item)).ToPlayer(e).Send()
		Write("%s grasps %s in both of %s hands", ObservableNameCap(e), ObservableName(item), e.Gender().GetPossessivePronoun()).ToRoom(r).Subject(e).Send()
		return
	}
	switch slot {
	case EqSlot_Head_High, EqSlot_Head_Mid, EqSlot_Head_Low:
		Write("You wear %s on your head", ObservableName(item)).ToPlayer(e).Send()
		Write("%s wears %s on %s head", ObservableNameCap(e), ObservableName(item), e.Gender().GetPossessivePronoun()).ToRoom(r).Subject(e).Send()
		return
	case EqSlot_Accessory_1, EqSlot_Accessory_2, EqSlot_Armor:
		Write("You wear %s", ObservableName(item)).ToPlayer(e).Send()
		Write("%s wears %s", ObservableNameCap(e), ObservableName(item)).ToRoom(r).Subject(e).Send()
		return
	case EqSlot_Feet:
		Write("You wear %s on your feet", ObservableName(item)).ToPlayer(e).Send()
		Write("%s wears %s on %s feet", ObservableNameCap(e), ObservableName(item), e.Gender().GetPossessivePronoun()).ToRoom(r).Subject(e).Send()
		return
	case EqSlot_Garment:
		Write("You throw on %s", ObservableName(item)).ToPlayer(e).Send()
		Write("%s throws on %s", ObservableNameCap(e), ObservableName(item)).ToRoom(r).Subject(e).Send()
		return
	case EqSlot_Held_L:
		Write("You grasp %s in your left hand", ObservableName(item)).ToPlayer(e).Send()
		Write("%s grasps %s in %s left hand", ObservableNameCap(e), ObservableName(item), e.Gender().GetPossessivePronoun()).ToRoom(r).Subject(e).Send()
		return
	case EqSlot_Held_R:
		Write("You grasp %s in your right hand", ObservableName(item)).ToPlayer(e).Send()
		Write("%s grasps %s in %s right hand", ObservableNameCap(e), ObservableName(item), e.Gender().GetPossessivePronoun()).ToRoom(r).Subject(e).Send()
		return
	}
}

func sendUnequipMessages(e *Entity, r *Room, item *Item) {
	Write("You unequip %s", ObservableName(item)).ToPlayer(e).Send()
	Write("%s unequip %s", ObservableNameCap(e), ObservableName(item)).ToRoom(r).Subject(e).Send()
}

type EquipmentConfig struct {
	Slot          EquipSlot
	Stats         StatMap
	StatusEffect  StatusEffectMask
	Rolls         RollModConfigMap
	Armor         *ArmorConfig
	Weapon        *WeaponConfig
	RequiredLevel int
	Upgradable    bool
}

func (cfg *EquipmentConfig) GetRollBonus(roll RollType) Dice {
	if cfg.Rolls == nil {
		return Dice{}
	}
	mod := cfg.Rolls[roll]
	if mod == nil || mod.Bonus == nil {
		return Dice{}
	}
	return *mod.Bonus
}

type ArmorConfig struct {
	Def  int
	MDef int
}

type WeaponConfig struct {
	Atk     int
	Element Element
	Level   int
	Noun    string
}

type EquipmentDataMap map[EquipSlot]*ItemData

func (m *EquipmentDataMap) MarshalJSON() ([]byte, error) {
	m2 := make(map[string]*ItemData)
	for slot, data := range *m {
		m2[slot.String()] = data
	}
	return json.Marshal(m2)
}

func (m *EquipmentDataMap) UnmarshalJSON(data []byte) (err error) {
	var m2 map[string]*ItemData
	if err := json.Unmarshal(data, &m2); err != nil {
		return err
	}
	*m = make(EquipmentDataMap)
	for slotStr, data := range m2 {
		if slot, err := ParseEquipSlot(slotStr); err == nil {
			(*m)[slot] = data
		}
	}
	return nil
}
