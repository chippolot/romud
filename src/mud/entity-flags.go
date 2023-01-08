package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
)

type EntityFlags bits.Bits

const (
	EFlag_Stationary     EntityFlags = 1 << iota // Entities that cannot move
	EFlag_Scavenger                              // Entities that pick up valuable items on the ground
	EFlag_TrashCollector                         // Entities that pick up worthless items on the ground
)

func ParseEntityFlag(str string) (EntityFlags, error) {
	switch str {
	case "stationary":
		return EFlag_Stationary, nil
	case "scavenger":
		return EFlag_Scavenger, nil
	case "trashcollector":
		return EFlag_TrashCollector, nil
	default:
		return 0, fmt.Errorf("unknown entity flag: %s", str)
	}
}

func (f *EntityFlags) Has(flag EntityFlags) bool {
	return *f&flag != 0
}

func (f *EntityFlags) UnmarshalJSON(data []byte) (err error) {
	var strs []string
	if err := json.Unmarshal(data, &strs); err != nil {
		return err
	}
	for _, str := range strs {
		if flag, err := ParseEntityFlag(str); err == nil {
			*f = EntityFlags(*f | flag)
		} else {
			return err
		}
	}
	return nil
}
