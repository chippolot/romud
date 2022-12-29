package mud

import (
	"encoding/json"
	"fmt"
	"strings"
)

const (
	SenseLook SenseType = iota
	SenseTouch
	SenseSmell
	SenseHear
	SenseTaste
)

type SenseType int

func ParseSenseType(s string) (SenseType, error) {
	s = strings.TrimSpace(strings.ToLower(s))
	switch s {
	case "look":
		return SenseLook, nil
	case "touch":
		return SenseTouch, nil
	case "smell":
		return SenseSmell, nil
	case "hear":
		return SenseHear, nil
	case "taste":
		return SenseTaste, nil
	default:
		return 0, fmt.Errorf("failed to parse SenseType: %s", s)
	}
}

func (s *SenseType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseSenseType(str); err != nil {
		return err
	}
	return nil
}
