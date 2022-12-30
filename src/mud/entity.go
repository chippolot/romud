package mud

import (
	"fmt"

	"github.com/chippolot/go-mud/src/mud/bits"
)

const PlayerEntityKey = "_player"

var entityIdCounter EntityId

type EntityId uint32

type EntityConfigList []EntityConfig

type EntityConfig struct {
	Key   string
	Name  string
	Desc  string
	Stats *StatsConfig
	Flags bits.Bits
}

type EntityData struct {
	Key    string
	RoomId RoomId
	Stats  *StatsData
}

type Entity struct {
	id     EntityId
	cfg    *EntityConfig
	data   *EntityData
	player *Player
}

func NewEntity(cfg *EntityConfig) *Entity {
	entityIdCounter++
	eid := entityIdCounter
	return &Entity{eid, cfg, newEntityData(cfg), nil}
}

func newEntityData(cfg *EntityConfig) *EntityData {
	return &EntityData{cfg.Key, InvalidId, newStatsData(cfg.Stats)}
}

type EntityPromptProvider struct {
	character *Entity
}

func (pp *EntityPromptProvider) Prompt() string {
	return fmt.Sprintf("<<c green>%dh(%dH):%dv(%dMV)</c>> ", pp.character.data.Stats.HP, pp.character.data.Stats.MaxHP, pp.character.data.Stats.Mov, pp.character.data.Stats.MaxMov)
}
