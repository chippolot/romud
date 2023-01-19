package mud

import (
	"encoding/json"
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

const (
	StatusEffectDuration_Permanent = 0
)

const (
	// TODO Implement
	StatusType_Poison StatusEffectMask = 1 << iota
	StatusType_Blind
	StatusType_Invisible
	StatusType_Blessed
)

var StatusEffectConfigs = map[StatusEffectMask]*StatusEffectConfig{
	StatusType_Poison: NewStatusEffectConfigBuilder().
		Build(),
	StatusType_Blind: NewStatusEffectConfigBuilder().
		WithEntityFlag(EFlag_Blind).
		Build(),
	StatusType_Invisible: NewStatusEffectConfigBuilder().
		WithEntityFlag(EFlag_Invisible).
		Build(),
	StatusType_Blessed: NewStatusEffectConfigBuilder().
		WithRollBonus(Roll_Hit, NewDice(1, 4, 0)).
		Build(),
}

type StatusEffectDuration int

type StatusEffectMask bits.Bits

func ParseStatusEffectType(str string) (StatusEffectMask, error) {
	switch str {
	case "poisoned":
		return StatusType_Poison, nil
	case "blind":
		return StatusType_Blind, nil
	case "invisible":
		return StatusType_Invisible, nil
	case "blessed":
		return StatusType_Blessed, nil
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
	case StatusType_Blessed:
		return "blessed"
	}
	return "unknown"
}

func (m *StatusEffectMask) MarshalJSON() ([]byte, error) {
	return json.Marshal(m.String())
}

func (m *StatusEffectMask) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *m, err = ParseStatusEffectType(str); err != nil {
		return err
	}
	return nil
}

type ApplyStatusEffectConfig struct {
	Type     StatusEffectMask
	Duration utils.Seconds      `json:",omitempty"`
	Save     *SavingThrowConfig `json:",omitempty"`
}

type StatusEffectConfig struct {
	EntityFlags EntityFlagMask
	Rolls       RollModConfigMap
}

func (cfg *StatusEffectConfig) getRollMod(roll RollType) *RollModConfig {
	if cfg.Rolls == nil {
		cfg.Rolls = make(RollModConfigMap)
	}
	mod := cfg.Rolls[roll]
	if mod == nil {
		mod = &RollModConfig{}
		cfg.Rolls[roll] = mod
	}
	return mod
}

type StatusEffectConfigBuilder struct {
	cfg *StatusEffectConfig
}

func NewStatusEffectConfigBuilder() *StatusEffectConfigBuilder {
	return &StatusEffectConfigBuilder{&StatusEffectConfig{}}
}

func (b *StatusEffectConfigBuilder) WithEntityFlag(f EntityFlagMask) *StatusEffectConfigBuilder {
	b.cfg.EntityFlags |= f
	return b
}

func (b *StatusEffectConfigBuilder) WithRollAdvantage(roll RollType) *StatusEffectConfigBuilder {
	mod := b.cfg.getRollMod(roll)
	mod.Advantage = true
	return b
}

func (b *StatusEffectConfigBuilder) WithRollDisadvantage(roll RollType) *StatusEffectConfigBuilder {
	mod := b.cfg.getRollMod(roll)
	mod.Disadvantage = true
	return b
}

func (b *StatusEffectConfigBuilder) WithRollBonus(roll RollType, bonus Dice) *StatusEffectConfigBuilder {
	mod := b.cfg.getRollMod(roll)
	mod.Bonus = &bonus
	return b
}

func (b *StatusEffectConfigBuilder) Build() *StatusEffectConfig {
	return b.cfg
}

type StatusDataMap map[StatusEffectMask]*StatusEffectData

func (m *StatusDataMap) MarshalJSON() ([]byte, error) {
	m2 := make(map[string]utils.Seconds)
	for statusType, data := range *m {
		m2[statusType.String()] = data.Duration
	}
	return json.Marshal(m2)
}

func (m *StatusDataMap) UnmarshalJSON(data []byte) (err error) {
	var m2 map[string]utils.Seconds
	if err := json.Unmarshal(data, &m2); err != nil {
		return err
	}
	*m = make(StatusDataMap)
	for statusTypeStr, duration := range m2 {
		if statusType, err := ParseStatusEffectType(statusTypeStr); err == nil {
			(*m)[statusType] = &StatusEffectData{duration}
		}
	}
	return nil
}

type StatusEffectData struct {
	Duration utils.Seconds `json:",omitempty"`
}

type StatusEffect struct {
	statusType     StatusEffectMask
	cfg            *StatusEffectConfig
	data           *StatusEffectData
	permanentCount int
}

func newStatusEffect(statusType StatusEffectMask, duration utils.Seconds) *StatusEffect {
	cfg := StatusEffectConfigs[statusType]
	if cfg == nil {
		log.Printf("status effect `%v` is missing config", statusType.String())
		return nil
	}

	permanentCount := 1
	var data *StatusEffectData
	if duration != StatusEffectDuration_Permanent {
		data = &StatusEffectData{duration}
		permanentCount = 0
	}

	return &StatusEffect{statusType, cfg, data, permanentCount}
}

type StatusEffects struct {
	statusEffects []*StatusEffect
	mask          StatusEffectMask
}

func newStatusEffects() *StatusEffects {
	return &StatusEffects{make([]*StatusEffect, 0), 0}
}

func rollForStatusEffect(e *Entity, w *World, cfg *ApplyStatusEffectConfig) {
	if cfg == nil || (cfg.Save != nil && SavingThrow(e, cfg.Save.Stat, cfg.Save.DC)) {
		return
	}
	performAddStatusEffect(e, w, cfg.Type, cfg.Duration)
}

func performAddStatusEffect(e *Entity, w *World, statusType StatusEffectMask, duration utils.Seconds) {
	oldStatusEffectFlags := e.statusEffects.mask
	if e.AddStatusEffect(statusType, duration) {
		newStatusEffectFlags := e.statusEffects.mask
		describeStatusEffectChanges(e, w, oldStatusEffectFlags, newStatusEffectFlags)
	}
}

func performRemoveStatusEffect(e *Entity, w *World, statusType StatusEffectMask, permanent bool) {
	oldStatusEffectFlags := e.statusEffects.mask
	if e.RemoveStatusEffect(statusType, permanent) {
		newStatusEffectFlags := e.statusEffects.mask
		describeStatusEffectChanges(e, w, oldStatusEffectFlags, newStatusEffectFlags)
	}
}

func describeStatusEffectChanges(e *Entity, w *World, oldFlags StatusEffectMask, newFlags StatusEffectMask) {
	r := w.rooms[e.data.RoomId]
	for i := 0; i < 64; i++ {
		var f StatusEffectMask = 1 << i
		if !oldFlags.Has(f) && newFlags.Has(f) {
			switch f {
			case StatusType_Poison:
				Write("You suddenly don't feel very well...").ToPlayer(e).Colorized(Color_NegativeBld).Send()
				Write("%s looks a little sick.", ObservableNameCap(e)).ToRoom(r).Subject(e).Send()
			case StatusType_Blind:
				Write("Your vision fades to black.").ToPlayer(e).Colorized(Color_NegativeBld).Send()
				Write("%s seems to have been blinded!", ObservableNameCap(e)).ToRoom(r).Subject(e).Send()
			case StatusType_Invisible:
				Write("You vanish.").ToPlayer(e).Colorized(Color_Neutral).Send()
				Write("%s seems to flicker out of existence.", ObservableNameCap(e)).ToRoom(r).Subject(e).Send()
			case StatusType_Blessed:
				Write("You feel a tingle as you're bathed in a white light.").ToPlayer(e).Colorized(Color_Neutral).Send()
				Write("%s glows white for a moment.", ObservableNameCap(e)).ToRoom(r).Subject(e).Send()
			}
		} else if oldFlags.Has(f) && !newFlags.Has(f) {
			switch f {
			case StatusType_Poison:
				Write("You feel much better.").ToPlayer(e).Colorized(Color_PositiveBld).Send()
			case StatusType_Blind:
				Write("Your vision slowly returns").ToPlayer(e).Colorized(Color_PositiveBld).Send()
			case StatusType_Invisible:
				Write("You blink back into existence.").ToPlayer(e).Colorized(Color_Neutral).Send()
				Write("%s blinks back into existence.", ObservableNameCap(e)).ToRoom(r).Subject(e).Send()
			case StatusType_Blessed:
				Write("You feel the warm cozy feeling fade.").ToPlayer(e).Colorized(Color_Neutral).Send()
			}
		}
	}
}
