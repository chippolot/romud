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
	SenseListen
	SenseTaste
)

type SenseType int

type Perceivable interface {
	TryPerceive(sense SenseType, words []string) (string, bool)
}

type PerceptiblesConfig map[SenseType]map[string]*PerceptibleConfig

func (cfg *PerceptiblesConfig) TryPerceive(sense SenseType, words []string) (string, bool) {
	if cfg == nil {
		return "", false
	}
	lookup, ok := (*cfg)[sense]
	if !ok {
		return "", false
	}
	var joined = strings.Join(words, " ")
	if p, ok := lookup[joined]; ok {
		return p.Desc, true
	}
	for _, w := range words {
		if p, ok := lookup[w]; ok {
			return p.Desc, true
		}
	}
	return "", false
}

func (cfg *PerceptiblesConfig) UnmarshalJSON(data []byte) (err error) {
	var arr []PerceptibleConfig
	if err := json.Unmarshal(data, &arr); err != nil {
		return err
	}
	perceptibles := make(PerceptiblesConfig)
	for _, p := range arr {
		lookup, ok := perceptibles[p.Sense]
		if !ok {
			lookup = make(map[string]*PerceptibleConfig)
			perceptibles[p.Sense] = lookup
		}
		for _, keyword := range p.Keywords {
			lookup[strings.ToLower(keyword)] = &p
		}
	}
	*cfg = perceptibles
	return nil
}

type PerceptibleConfig struct {
	Sense    SenseType
	Keywords []string
	Desc     string
}

func ParseSenseType(s string) (SenseType, error) {
	s = strings.TrimSpace(strings.ToLower(s))
	switch s {
	case "look":
		return SenseLook, nil
	case "touch":
		return SenseTouch, nil
	case "smell":
		return SenseSmell, nil
	case "listen":
		return SenseListen, nil
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
