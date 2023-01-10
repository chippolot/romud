package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
)

type EquipSlot bits.Bits

const (
	EqSlot_Waist EquipSlot = 1 << iota
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

func (f *EquipSlot) Has(flag EquipSlot) bool {
	return *f&flag != 0
}

func (f *EquipSlot) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if flag, err := ParseEquipmentSlot(str); err == nil {
		*f = EquipSlot(*f | flag)
	}
	return err
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

type EquipmentData struct {
	Equipped EquipSlot
}
