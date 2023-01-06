package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
)

type ItemFlags bits.Bits

const (
	IFlag_Container     ItemFlags = 1 << iota // Items that can contain other items
	IFlag_Light                               // Items that light the room that they're in
	IFlag_Environmental                       // Static items that can't be picked up
	IFlag_Crumbles                            // Items which crumble when soemthing tries to pick them up
)

func ParseItemFlag(str string) (ItemFlags, error) {
	switch str {
	case "container":
		return IFlag_Container, nil
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

func (f *ItemFlags) Has(flag ItemFlags) bool {
	return *f&flag != 0
}

func (f *ItemFlags) UnmarshalJSON(data []byte) (err error) {
	var strs []string
	if err := json.Unmarshal(data, &strs); err != nil {
		return err
	}
	for _, str := range strs {
		if flag, err := ParseItemFlag(str); err == nil {
			*f = ItemFlags(*f | flag)
		} else {
			return err
		}
	}
	return nil
}
