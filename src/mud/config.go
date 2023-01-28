package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/utils"
)

var (
	Option_Death       *DeathConfig
	Option_AutoRegenHP bool
	Option_AutoRegenSP bool
)

const (
	Death_Instant DeathMode = iota
	Death_Prolonged
)

const (
	ItemsOnDeath_Drop ItemsOnDeath = iota
	ItemsOnDeath_Destroy
	ItemsOnDeath_Retain
)

type DeathMode int
type ItemsOnDeath int

type EntityTypeDeathConfig struct {
	Corpses bool
	Items   ItemsOnDeath
}

type DeathConfig struct {
	Mode     DeathMode
	Players  *EntityTypeDeathConfig
	Monsters *EntityTypeDeathConfig
}

var deathModeStringMapping = utils.NewStringMapping(map[DeathMode]string{
	Death_Instant:   "instant",
	Death_Prolonged: "prolonged",
})

func ParseDeathMode(str string) (DeathMode, error) {
	if val, ok := deathModeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown death mode: %s", str)
}

func (d *DeathMode) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *d, err = ParseDeathMode(str); err != nil {
		return nil
	} else {
		return err
	}
}

var itemsOnDeathStringMapping = utils.NewStringMapping(map[ItemsOnDeath]string{
	ItemsOnDeath_Drop:    "drop",
	ItemsOnDeath_Destroy: "destroy",
	ItemsOnDeath_Retain:  "retain",
})

func ParseItemsOnDeath(str string) (ItemsOnDeath, error) {
	if val, ok := itemsOnDeathStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown items on death option: %s", str)
}

func (d *ItemsOnDeath) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *d, err = ParseItemsOnDeath(str); err != nil {
		return nil
	} else {
		return err
	}
}

type MudConfig struct {
	ConfigRoot  string
	Death       *DeathConfig
	AutoRegenHP bool
	AutoRegenSP bool
}

func setGlobalOptions(cfg *MudConfig) {
	Option_Death = cfg.Death
	Option_AutoRegenHP = cfg.AutoRegenHP
	Option_AutoRegenSP = cfg.AutoRegenSP
}
