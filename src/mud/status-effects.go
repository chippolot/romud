package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	StatusEffectDuration_Permanent = -1

	StatusAddResult_Failed = iota
	StatusAddResult_Applied
	StatusAddResult_Prolonged

	// TODO Implement
	StatusType_Poison StatusEffectType = iota
	StatusType_Blind
	StatusType_Invisible
	StatusType_Cursed
	StatusType_Blessed
	StatusType_Charmed
	StatusType_NightVision
	StatusType_FaerieFire
)

type StatusAddResult byte

type StatusEffectType int

func ParseStatusEffectType(str string) (StatusEffectType, error) {
	switch str {
	case "poisoned":
		return StatusType_Poison, nil
	case "blind":
		return StatusType_Blind, nil
	case "invisible":
		return StatusType_Invisible, nil
	case "cursed":
		return StatusType_Cursed, nil
	case "blessed":
		return StatusType_Blessed, nil
	case "charmed":
		return StatusType_Charmed, nil
	case "night vision":
		return StatusType_NightVision, nil
	case "faerie fire":
		return StatusType_FaerieFire, nil
	default:
		return 0, fmt.Errorf("unknown status effect type: %s", str)
	}
}

func (s StatusEffectType) String() string {

	switch s {
	case StatusType_Poison:
		return "poisoned"
	case StatusType_Blind:
		return "blind"
	case StatusType_Invisible:
		return "invisible"
	case StatusType_Cursed:
		return "cursed"
	case StatusType_Blessed:
		return "blessed"
	case StatusType_Charmed:
		return "charmed"
	case StatusType_NightVision:
		return "night vision"
	case StatusType_FaerieFire:
		return "faerie fire"
	}
	return "unknown"
}

// TODO remove statuses on login
type StatusEffectData struct {
	Duration int // Seconds
}

type StatusDataMap map[StatusEffectType]*StatusEffectData

func (m *StatusDataMap) MarshalJSON() ([]byte, error) {
	m2 := make(map[string]*StatusEffectData)
	for statusType, data := range *m {
		m2[statusType.String()] = data
	}
	return json.Marshal(m2)
}

func (m *StatusDataMap) UnmarshalJSON(data []byte) (err error) {
	var m2 map[string]*StatusEffectData
	if err := json.Unmarshal(data, &m2); err != nil {
		return err
	}
	*m = make(StatusDataMap)
	for statusTypeStr, data := range m2 {
		if statusType, err := ParseStatusEffectType(statusTypeStr); err == nil {
			(*m)[statusType] = data
		}
	}
	return nil
}

func (s *StatusDataMap) Add(status StatusEffectType, duration int) StatusAddResult {
	if existing, ok := (*s)[status]; ok {
		existing.Duration = utils.MaxInts(duration, existing.Duration)
		return StatusAddResult_Prolonged
	}
	(*s)[status] = &StatusEffectData{Duration: duration}
	return StatusAddResult_Applied
}

func (s *StatusDataMap) Has(status StatusEffectType) bool {
	_, ok := (*s)[status]
	return ok
}

func (s *StatusDataMap) Remove(status StatusEffectType) bool {
	if !s.Has(status) {
		return false
	}
	delete(*s, status)
	return true
}
