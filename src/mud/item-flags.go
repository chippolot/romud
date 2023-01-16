package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
)

type ItemFlagMask bits.Bits

const (
	IFlag_Container     ItemFlagMask = 1 << iota // Can contain other items
	IFlag_NoStorage                              // Cannot be used for storage (i.e. can't add contents to them)
	IFlag_Light                                  // Light the room that they're in
	IFlag_Environmental                          // Can't be picked up
	IFlag_Crumbles                               // Crumble when picked up
	IFlag_HeavyArmor                             // Heavy armor does not receive DEX bonus
)

func ParseItemFlag(str string) (ItemFlagMask, error) {
	switch str {
	case "container":
		return IFlag_Container, nil
	case "nostorage":
		return IFlag_NoStorage, nil
	case "scavenger":
		return IFlag_Light, nil
	case "environmental":
		return IFlag_Environmental, nil
	case "crumbles":
		return IFlag_Crumbles, nil
	default:
		return 0, fmt.Errorf("unknown item flag: %s", str)
	}
}

func (m *ItemFlagMask) Has(flag ItemFlagMask) bool {
	return *m&flag != 0
}

func (m *ItemFlagMask) UnmarshalJSON(data []byte) (err error) {
	var strs []string
	if err := json.Unmarshal(data, &strs); err != nil {
		return err
	}
	for _, str := range strs {
		if flag, err := ParseItemFlag(str); err == nil {
			*m |= flag
		} else {
			return err
		}
	}
	return nil
}
