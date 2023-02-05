package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	Neutral Element = iota
	Water
	Earth
	Fire
	Wind
	Poison
	Holy
	Shadow
	Ghost
	Undead
)

type Element int

var elementStringMapping = utils.NewStringMapping(map[Element]string{
	Neutral: "neutral",
	Water:   "water",
	Earth:   "earth",
	Fire:    "fire",
	Wind:    "wind",
	Poison:  "poison",
	Holy:    "holy",
	Shadow:  "shadow",
	Ghost:   "ghost",
	Undead:  "undead",
})

func ParseElement(str string) (Element, error) {
	if val, ok := elementStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown element: %s", str)
}

func (e *Element) String() string {
	if str, ok := elementStringMapping.ToString[*e]; ok {
		return str
	}
	return "unknown"
}

func (e *Element) MarshalJSON() ([]byte, error) {
	return json.Marshal(e.String())
}
