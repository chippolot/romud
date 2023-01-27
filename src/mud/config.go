package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	Death_Instant DeathMode = iota
	Death_Prolonged
)

var (
	Option_DeathMode     DeathMode
	Option_PlayerCorpses bool
	Option_AutoRegenHP   bool
	Option_AutoRegenSP   bool
)

type DeathMode int

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

type MudConfig struct {
	ConfigRoot    string
	PlayerCorpses bool
	DeathMode     DeathMode
	AutoRegenHP   bool
	AutoRegenSP   bool
}

func setGlobalOptions(cfg *MudConfig) {
	Option_DeathMode = cfg.DeathMode
	Option_PlayerCorpses = cfg.PlayerCorpses
	Option_AutoRegenHP = cfg.AutoRegenHP
	Option_AutoRegenSP = cfg.AutoRegenSP
}
