package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
)

type EntityFlagMask bits.Bits

const (
	EFlag_Stationary     EntityFlagMask = 1 << iota // Cannot move
	EFlag_Scavenger                                 // Pick up valuable items on the ground
	EFlag_TrashCollector                            // Pick up worthless items on the ground
	EFlag_UsesEquipment                             // Can use equipment
	EFlag_Blind                                     // Cannot see
	EFlag_Invisible                                 // Cannot be seen
	EFlag_Aggro                                     // Attacks enemies on sight
)

func ParseEntityFlag(str string) (EntityFlagMask, error) {
	switch str {
	case "stationary":
		return EFlag_Stationary, nil
	case "scavenger":
		return EFlag_Scavenger, nil
	case "trashcollector":
		return EFlag_TrashCollector, nil
	case "usesequipment":
		return EFlag_UsesEquipment, nil
	case "blind":
		return EFlag_Blind, nil
	case "invisible":
		return EFlag_Invisible, nil
	case "aggro":
		return EFlag_Aggro, nil
	default:
		return 0, fmt.Errorf("unknown entity flag: %s", str)
	}
}

func (m *EntityFlagMask) Has(flag EntityFlagMask) bool {
	return *m&flag != 0
}

func (m *EntityFlagMask) UnmarshalJSON(data []byte) (err error) {
	var strs []string
	if err := json.Unmarshal(data, &strs); err != nil {
		return err
	}
	for _, str := range strs {
		if flag, err := ParseEntityFlag(str); err == nil {
			*m |= flag
		} else {
			return err
		}
	}
	return nil
}
