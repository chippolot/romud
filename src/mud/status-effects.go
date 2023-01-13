package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

const (
	StatusEffectDuration_Permanent = 0

	// TODO Implement
	StatusType_Poison StatusEffectMask = 1 << iota
	StatusType_Blind
	StatusType_Invisible
	StatusType_Cursed
	StatusType_Blessed
	StatusType_NightVision
	StatusType_FaerieFire
)

type StatusEffectMask bits.Bits

func ParseStatusEffectType(str string) (StatusEffectMask, error) {
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

func (m *StatusEffectMask) Has(status StatusEffectMask) bool {
	return *m&status != 0
}

func (m *StatusEffectMask) String() string {

	switch *m {
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

func (s *StatusEffectMask) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

func (s *StatusEffectMask) UnmarshalJSON(data []byte) (err error) {
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
	Type     StatusEffectMask
	Duration utils.Seconds      `json:",omitempty"`
	Save     *SavingThrowConfig `json:",omitempty"`
}

type StatusDataList []*StatusEffectData

type StatusEffectData struct {
	Type     StatusEffectMask
	Duration utils.Seconds
}

type StatusEffect struct {
	data        *StatusEffectData
	entityFlags EntityFlagMask
}

func newStatusEffect(data *StatusEffectData) *StatusEffect {
	var entityFlags EntityFlagMask
	switch data.Type {
	case StatusType_Blind:
		entityFlags = EFlag_Blind
	case StatusType_Invisible:
		entityFlags = EFlag_Invisible
	}
	return &StatusEffect{data, entityFlags}
}

type StatusEffects struct {
	statusEffects []*StatusEffect
	mask          StatusEffectMask
}

func newStatusEffects() *StatusEffects {
	return &StatusEffects{make([]*StatusEffect, 0), 0}
}

func rollForStatusEffect(e *Entity, w *World, src *Entity, cfg *StatusEffectConfig) {
	if cfg == nil || (cfg.Save != nil && SavingThrow(e, cfg.Save.Stat, cfg.Save.DC)) {
		return
	}
	performAddStatusEffect(e, w, src, cfg.Type, cfg.Duration)
}

func performAddStatusEffect(e *Entity, w *World, src *Entity, status StatusEffectMask, duration utils.Seconds) {
	oldStatusEffectFlags := e.statusEffects.mask
	if e.AddStatusEffect(status, duration) {
		newStatusEffectFlags := e.statusEffects.mask
		describeStatusEffectChanges(e, w, oldStatusEffectFlags, newStatusEffectFlags)
	}
}

func performRemoveStatusEffect(e *Entity, w *World, status StatusEffectMask) {
	oldStatusEffectFlags := e.statusEffects.mask
	if e.RemoveStatusEffect(status) {
		newStatusEffectFlags := e.statusEffects.mask
		describeStatusEffectChanges(e, w, oldStatusEffectFlags, newStatusEffectFlags)
	}
}

// TODO COLORIZE
func describeStatusEffectChanges(e *Entity, w *World, oldFlags StatusEffectMask, newFlags StatusEffectMask) {
	r := w.rooms[e.data.RoomId]
	for i := 0; i < 64; i++ {
		var f StatusEffectMask = 1 << i
		if !oldFlags.Has(f) && newFlags.Has(f) {
			switch f {
			case StatusType_Poison:
				SendToPlayerColorized(e, "red", "You suddenly don't feel very well...")
				BroadcastToRoomExcept(r, e, "%s looks a little sick.", e.NameCapitalized())
			case StatusType_Blind:
				SendToPlayerColorized(e, "red", "Your vision fades to black.")
				BroadcastToRoomExcept(r, e, "%s seems to have been blinded!", e.NameCapitalized())
			case StatusType_Invisible:
				SendToPlayerColorized(e, "blue", "You vanish.")
				BroadcastToRoomExcept(r, e, "%s seems to flicker out of existence.", e.NameCapitalized())
			case StatusType_Cursed:
				SendToPlayerColorized(e, "red", "You feel a wave of gloom descend on you.")
				BroadcastToRoomExcept(r, e, "%s glows red for a moment.", e.NameCapitalized())
			case StatusType_Blessed:
				SendToPlayerColorized(e, "blue", "You feel a tingle as you're bathed in a white light.")
				BroadcastToRoomExcept(r, e, "%s glows white for a moment.", e.NameCapitalized())
			case StatusType_NightVision:
				SendToPlayerColorized(e, "blue", "Everything looks a little brighter.")
				BroadcastToRoomExcept(r, e, "%s's eyes flash brightly.", e.NameCapitalized())
			case StatusType_FaerieFire:
				SendToPlayerColorized(e, "red", "You begin emanating a bright purple light.")
				BroadcastToRoomExcept(r, e, "%s beings emanating a bright purple light.", e.NameCapitalized())
			}
		} else if oldFlags.Has(f) && !newFlags.Has(f) {
			switch f {
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
}
