package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
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

var itemFlagStringMapping = utils.NewStringMapping(map[ItemFlagMask]string{
	IFlag_Container:     "container",
	IFlag_NoStorage:     "nostorage",
	IFlag_Light:         "light",
	IFlag_Environmental: "environmental",
	IFlag_Crumbles:      "crumbles",
	IFlag_HeavyArmor:    "heavyarmor",
})

func ParseItemFlag(str string) (ItemFlagMask, error) {
	if val, ok := itemFlagStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown item flag: %s", str)
}

func (m *ItemFlagMask) String() string {
	if str, ok := itemFlagStringMapping.ToString[*m]; ok {
		return str
	}
	return "unknown"
}

func (m *ItemFlagMask) Has(flag ItemFlagMask) bool {
	return *m&flag != 0
}

func (m *ItemFlagMask) MarshalJSON() ([]byte, error) {
	strs := make([]string, 0)
	for i := 0; i < 64; i++ {
		f := ItemFlagMask(1 << i)
		if m.Has(f) {
			strs = append(strs, f.String())
		}
	}
	return json.Marshal(strs)
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
