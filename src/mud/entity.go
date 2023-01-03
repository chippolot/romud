package mud

import (
	"fmt"
	"strings"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

const PlayerEntityKey = "_player"

const (
	EFlag_Stationary bits.Bits = iota << 1
)

var entityIdCounter EntityId

type EntityId uint32

type EntityConfigList []*EntityConfig

type EntityConfig struct {
	Key          string
	Name         string
	Keywords     []string
	RoomDesc     string
	FullDesc     string
	Perceptibles *PerceptiblesConfig
	Stats        *StatsConfig
	Flags        bits.Bits
	lookup       map[string]bool
}

func (cfg *EntityConfig) Init() {
	cfg.lookup = make(map[string]bool)
	for _, s := range cfg.Keywords {
		cfg.lookup[strings.ToLower(s)] = true
	}
}

type EntityData struct {
	Key    string
	RoomId RoomId
	Stats  *StatsData
}

type EntityList []*Entity

type Entity struct {
	id     EntityId
	cfg    *EntityConfig
	data   *EntityData
	player *Player
	combat *CombatData
}

func NewEntity(cfg *EntityConfig) *Entity {
	entityIdCounter++
	eid := entityIdCounter
	return &Entity{eid, cfg, newEntityData(cfg), nil, nil}
}

func newEntityData(cfg *EntityConfig) *EntityData {
	return &EntityData{cfg.Key, InvalidId, newStatsData(cfg.Stats)}
}

func (e *Entity) Name() string {
	if e.player != nil {
		return e.player.data.Name
	}
	return e.cfg.Name
}

func (e *Entity) ConditionString() string {
	pct := float32(e.data.Stats.HP) / float32(e.data.Stats.MaxHP)
	if pct >= 0.95 {
		return "<c green>excellent</c>"
	} else if pct >= 0.85 {
		return "<c green>a few scratches</c>"
	} else if pct >= 0.70 {
		return "<c yellow>small wounds</c>"
	} else if pct >= 0.50 {
		return "<c yellow>bleeding</c>"
	} else if pct >= 0.30 {
		return "<c magenta>wounded</c>"
	} else if pct >= 0.15 {
		return "<c magenta>heavy wounds</c>"
	} else if pct > 0 {
		return "<c red>awful condition</c>"
	} else {
		return "<c red>dead</c>"
	}
}

func (e *Entity) Dead() bool {
	return e.data.Stats.HP <= 0
}

func (e *Entity) Matches(s string) bool {
	if strings.EqualFold(e.Name(), s) {
		return true
	}
	_, ok := e.cfg.lookup[s]
	return ok
}

func (e *Entity) TryPerceive(sense SenseType, words []string) (string, bool) {
	desc, ok := e.cfg.Perceptibles.TryPerceive(sense, words)
	if ok {
		return desc, ok
	}
	if sense == SenseLook && e.cfg.FullDesc != "" {
		return e.cfg.FullDesc, true
	}
	return "", false
}

func TryGetEntityByName(name string, ents map[EntityId]*Entity) (*Entity, bool) {
	for _, e := range ents {
		if strings.EqualFold(e.cfg.Name, name) {
			return e, true
		}
	}
	return nil, false
}

func TryGetEntityByKeywords(words []string, ents map[EntityId]*Entity, self *Entity) (*Entity, bool) {
	switch len(words) {
	case 0:
		return nil, false
	case 1:
		word := words[0]
		// TODO Generify this
		if word == "self" || word == "me" || word == "myself" {
			return self, true
		}
	}

	var joined = strings.Join(words, " ")
	for _, e := range ents {
		if e.Matches(joined) {
			return e, true
		}
		for _, w := range words {
			if e.Matches(w) {
				return e, true
			}
		}
	}
	return nil, false
}

type EntityPromptProvider struct {
	character *Entity
}

func (pp *EntityPromptProvider) Prompt() string {
	prompt := fmt.Sprintf("<<c green>%dh(%dH):%dv(%dMV)</c>> ", pp.character.data.Stats.HP, pp.character.data.Stats.MaxHP, pp.character.data.Stats.Mov, pp.character.data.Stats.MaxMov)
	if pp.character.combat != nil {
		prompt = fmt.Sprintf("%s%s<%s (%s)>:<%s (%s)> ", prompt, utils.NewLine, pp.character.Name(), pp.character.ConditionString(), pp.character.combat.target.Name(), pp.character.combat.target.ConditionString())
	}
	return prompt
}
