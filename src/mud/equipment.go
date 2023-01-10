package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
)

type EquipSlot bits.Bits

const (
	EqSlot_None EquipSlot = 1 << iota
	EqSlot_Waist
	EqSlot_Neck1
	EqSlot_Neck2
	EqSlot_Head
	EqSlot_Body
	EqSlot_Hands
	EqSlot_Arms
	EqSlot_Legs
	EqSlot_Feet
	EqSlot_FingerL
	EqSlot_FingerR
	EqSlot_WristL
	EqSlot_WristR
	EqSlot_Shoulders
	EqSlot_HeldL
	EqSlot_HeldR
	EqSlot_2H
	EqSlot_Fingers = EqSlot_FingerL | EqSlot_FingerR
	EqSlot_Wrists  = EqSlot_WristL | EqSlot_WristR
	EqSlot_Held1H  = EqSlot_HeldL | EqSlot_HeldR
	EqSlot_Held2H  = EqSlot_HeldL | EqSlot_HeldR | EqSlot_2H
	EqSlot_Neck    = EqSlot_Neck1 | EqSlot_Neck2
)

func ParseEquipmentSlot(str string) (EquipSlot, error) {
	switch str {
	case "none":
		return EqSlot_None, nil
	case "waist":
		return EqSlot_Waist, nil
	case "neck1":
		return EqSlot_Neck1, nil
	case "neck2":
		return EqSlot_Neck2, nil
	case "head":
		return EqSlot_Head, nil
	case "body":
		return EqSlot_Body, nil
	case "hands":
		return EqSlot_Hands, nil
	case "arms":
		return EqSlot_Arms, nil
	case "legs":
		return EqSlot_Legs, nil
	case "feet":
		return EqSlot_Feet, nil
	case "fingerl":
		return EqSlot_FingerL, nil
	case "fingerr":
		return EqSlot_FingerR, nil
	case "wristl":
		return EqSlot_WristL, nil
	case "wristr":
		return EqSlot_WristR, nil
	case "shoulders":
		return EqSlot_Shoulders, nil
	case "heldl":
		return EqSlot_HeldL, nil
	case "heldr":
		return EqSlot_HeldR, nil
	case "2h":
		return EqSlot_2H, nil
	case "fingers":
		return EqSlot_Fingers, nil
	case "wrists":
		return EqSlot_Wrists, nil
	case "held1h":
		return EqSlot_Held1H, nil
	case "held2h":
		return EqSlot_Held2H, nil
	case "neck":
		return EqSlot_Neck, nil
	default:
		return 0, fmt.Errorf("unknown equipment slot: %s", str)
	}
}

func (s *EquipSlot) Has(flag EquipSlot) bool {
	return *s&flag != 0
}

func (s *EquipSlot) String() string {
	switch *s {
	case EqSlot_None:
		return "none"
	case EqSlot_Waist:
		return "waist"
	case EqSlot_Neck1:
		return "neck1"
	case EqSlot_Neck2:
		return "neck2"
	case EqSlot_Head:
		return "head"
	case EqSlot_Body:
		return "body"
	case EqSlot_Hands:
		return "hands"
	case EqSlot_Arms:
		return "arms"
	case EqSlot_Legs:
		return "legs"
	case EqSlot_Feet:
		return "feet"
	case EqSlot_FingerL:
		return "fingerl"
	case EqSlot_FingerR:
		return "fingerr"
	case EqSlot_WristL:
		return "wristl"
	case EqSlot_WristR:
		return "wristr"
	case EqSlot_Shoulders:
		return "shoulders"
	case EqSlot_HeldL:
		return "heldl"
	case EqSlot_HeldR:
		return "heldr"
	case EqSlot_2H:
		return "2h"
	case EqSlot_Fingers:
		return "fingers"
	case EqSlot_Wrists:
		return "wrists"
	case EqSlot_Held1H:
		return "held1h"
	case EqSlot_Held2H:
		return "held2h"
	case EqSlot_Neck:
		return "neck"
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
	if flag, err := ParseEquipmentSlot(str); err == nil {
		*s = EquipSlot(*s | flag)
	}
	return err
}

func GetEquipmentSlotDescription(slot EquipSlot, item *Item) string {
	if item.cfg.Equipment.Slot.Has(EqSlot_2H) {
		switch slot {
		case EqSlot_FingerL, EqSlot_FingerR, EqSlot_Fingers:
			return "<fingers>"
		case EqSlot_WristL, EqSlot_WristR, EqSlot_Wrists:
			return "<wrists>"
		case EqSlot_HeldL, EqSlot_HeldR, EqSlot_Held1H, EqSlot_Held2H:
			return "<hands>"
		}
	}
	switch slot {
	case EqSlot_Waist:
		return "<waist>"
	case EqSlot_Neck1, EqSlot_Neck2, EqSlot_Neck:
		return "<neck>"
	case EqSlot_Head:
		return "<head>"
	case EqSlot_Body:
		return "<body>"
	case EqSlot_Hands:
		return "<hands>"
	case EqSlot_Arms:
		return "<arms>"
	case EqSlot_Legs:
		return "<legs>"
	case EqSlot_Feet:
		return "<feet>"
	case EqSlot_FingerL:
		return "<left finger>"
	case EqSlot_FingerR:
		return "<right finger>"
	case EqSlot_WristL:
		return "<left wrist>"
	case EqSlot_WristR:
		return "<right wrist>"
	case EqSlot_Shoulders:
		return "<shoulders>"
	case EqSlot_HeldL:
		return "<left hand>"
	case EqSlot_HeldR:
		return "<right hand>"
	}
	return ""
}

type EquipmentConfig struct {
	Slot   EquipSlot
	Armor  *ArmorConfig
	Weapon *WeaponConfig
}

type ArmorConfig struct {
	AC int
}

type WeaponConfig struct {
	Damage     Dice
	DamageType DamageType
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
		if slot, err := ParseEquipmentSlot(slotStr); err == nil {
			(*m)[slot] = data
		}
	}
	return nil
}