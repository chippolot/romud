package mud

import (
	"fmt"

	"github.com/chippolot/romud/src/utils"
)

type Race int

const (
	Race_DemiHuman Race = iota
	Race_Brute
	Race_Insect
	Race_Fish
	Race_Dragon
	Race_Plant
	Race_Formless
	Race_Angel
	Race_Demon
	Race_Undead
)

var raceStringMapping = utils.NewStringMapping(map[Race]string{
	Race_DemiHuman: "demihuman",
	Race_Brute:     "brute",
	Race_Insect:    "insect",
	Race_Fish:      "fish",
	Race_Dragon:    "dragon",
	Race_Plant:     "plant",
	Race_Formless:  "formless",
	Race_Angel:     "angel",
	Race_Demon:     "demon",
	Race_Undead:    "undead",
})

func ParseRace(str string) (Race, error) {
	if val, ok := raceStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown Race: %s", str)
}
