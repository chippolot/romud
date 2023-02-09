package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/romud/src/bits"
	"github.com/chippolot/romud/src/utils"
)

type EntityFlagMask bits.Bits

const (
	EFlag_Stationary      EntityFlagMask = 1 << iota // Cannot move
	EFlag_Scavenger                                  // Pick up valuable items on the ground
	EFlag_TrashCollector                             // Pick up worthless items on the ground
	EFlag_UsesEquipment                              // Can use equipment
	EFlag_Blind                                      // Cannot see
	EFlag_Invisible                                  // Cannot be seen
	EFlag_Aggro                                      // Attacks enemies on sight
	EFlag_AssistAll                                  // Assist all mobs who are being fought by players
	EFlag_AssistSame                                 // Assist mobs of the same type who are being fought by players
	EFlag_CanLeaveZone                               // Will wander out of initial zone
	EFlag_Pacifist                                   // Won't attack
	EFlag_Uninterruptable                            // Skills can't be interrupted
	EFlag_Detector                                   // Can detect hidden entities	// TODO: EFlags: Implement
)

var entityFlagStringMapping = utils.NewStringMapping(map[EntityFlagMask]string{
	EFlag_Stationary:      "stationary",
	EFlag_Scavenger:       "scavenger",
	EFlag_TrashCollector:  "trashcollector",
	EFlag_UsesEquipment:   "usesequipment",
	EFlag_Blind:           "blind",
	EFlag_Invisible:       "invisible",
	EFlag_Aggro:           "aggro",
	EFlag_AssistAll:       "assistall",
	EFlag_AssistSame:      "assistsame",
	EFlag_CanLeaveZone:    "leaveszone",
	EFlag_Pacifist:        "pacifist",
	EFlag_Uninterruptable: "uninterruptable",
	EFlag_Detector:        "detector",
})

func ParseEntityFlag(str string) (EntityFlagMask, error) {
	if val, ok := entityFlagStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown entity flag: %s", str)
}

func (m *EntityFlagMask) String() string {
	if str, ok := entityFlagStringMapping.ToString[*m]; ok {
		return str
	}
	return "unknown"
}

func (m *EntityFlagMask) Strings() []string {
	strs := make([]string, 0)
	for i := 0; i < 64; i++ {
		f := EntityFlagMask(1 << i)
		if m.Has(f) {
			strs = append(strs, f.String())
		}
	}
	return strs
}

func (m *EntityFlagMask) Has(flag EntityFlagMask) bool {
	return *m&flag != 0
}

func (m *EntityFlagMask) MarshalJSON() ([]byte, error) {
	return json.Marshal(m.Strings())
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
