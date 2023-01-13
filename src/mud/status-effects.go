package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

const (
	StatusEffectDuration_Permanent = -1

	// TODO Implement
	StatusType_Poison StatusEffectType = 1 << iota
	StatusType_Blind
	StatusType_Invisible
	StatusType_Cursed
	StatusType_Blessed
	StatusType_NightVision
	StatusType_FaerieFire
)

type StatusEffectType bits.Bits

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
	case "night vision":
		return StatusType_NightVision, nil
	case "faerie fire":
		return StatusType_FaerieFire, nil
	default:
		return 0, fmt.Errorf("unknown status effect type: %s", str)
	}
}

func (s StatusEffectType) Has(status StatusEffectType) bool {
	return s&status != 0
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
	case StatusType_NightVision:
		return "night vision"
	case StatusType_FaerieFire:
		return "faerie fire"
	}
	return "unknown"
}

func (s *StatusEffectType) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

func (s *StatusEffectType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseStatusEffectType(str); err != nil {
		return err
	}
	return nil
}

type StatusEffectConfig struct {
	Type     StatusEffectType
	Duration utils.Seconds
	Save     *SavingThrowConfig
}

type StatusEffectData struct {
	Type     StatusEffectType
	Duration utils.Seconds
}

type StatusDataList []*StatusEffectData

func performAddStatusEffect(e *Entity, w *World, src *Entity, status StatusEffectType, duration utils.Seconds) {
	r := w.rooms[e.data.RoomId]
	if e.AddStatusEffect(status, duration) {
		switch status {
		case StatusType_Poison:
			SendToPlayer(e, "You suddenly don't feel very well...")
			BroadcastToRoomExcept(r, e, "%s looks a little sick.", e.NameCapitalized())
		case StatusType_Blind:
			SendToPlayer(e, "Your vision fades to black.")
			BroadcastToRoomExcept(r, e, "%s seems to have been blinded!", e.NameCapitalized())
		case StatusType_Invisible:
			SendToPlayer(e, "You vanish.")
			BroadcastToRoomExcept(r, e, "%s seems to flicker out of existence.", e.NameCapitalized())
		case StatusType_Cursed:
			SendToPlayer(e, "You feel a wave of gloom descend on you.")
			BroadcastToRoomExcept(r, e, "%s glows red for a moment.", e.NameCapitalized())
		case StatusType_Blessed:
			SendToPlayer(e, "You feel a tingle as you're bathed in a white light.")
			BroadcastToRoomExcept(r, e, "%s glows white for a moment.", e.NameCapitalized())
		case StatusType_NightVision:
			SendToPlayer(e, "Everything looks a little brighter.")
			BroadcastToRoomExcept(r, e, "%s's eyes flash brightly.", e.NameCapitalized())
		case StatusType_FaerieFire:
			SendToPlayer(e, "You begin emanating a bright purple light.")
			BroadcastToRoomExcept(r, e, "%s beings emanating a bright purple light.", e.NameCapitalized())
		}
	}
}

func performRemoveStatusEffect(e *Entity, w *World, status StatusEffectType) {
	r := w.rooms[e.data.RoomId]
	if e.RemoveStatusEffect(status) {
		switch status {
		case StatusType_Poison:
			SendToPlayer(e, "You feel much better.")
		case StatusType_Blind:
			SendToPlayer(e, "Your vision slowly returns")
		case StatusType_Invisible:
			SendToPlayer(e, "You blink back into existence.")
			BroadcastToRoomExcept(r, e, "%s blinks back into existence.", e.NameCapitalized())
		case StatusType_Cursed:
			SendToPlayer(e, "It feels like a weight has been lifted from you.")
		case StatusType_Blessed:
			SendToPlayer(e, "You feel the warm cozy feeling fade.")
		case StatusType_NightVision:
			SendToPlayer(e, "Your vision returns to normal.")
		case StatusType_FaerieFire:
			SendToPlayer(e, "The light emanating from you fades.")
		}
	}
}
