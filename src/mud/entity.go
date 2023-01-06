package mud

import (
	"strings"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

const PlayerEntityKey = "_player"

const (
	EFlag_Stationary bits.Bits = 1 << iota
)

var entityIdCounter EntityId = InvalidId

type EntityId int32

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
	Key       string
	RoomId    RoomId
	Stats     *StatsData
	Inventory []*ItemData
}

type EntityList []*Entity

type Entity struct {
	id        EntityId
	cfg       *EntityConfig
	data      *EntityData
	player    *Player
	combat    *CombatData
	position  Position
	inventory ItemList
}

func NewEntity(cfg *EntityConfig) *Entity {
	entityIdCounter++
	eid := entityIdCounter
	return &Entity{eid, cfg, newEntityData(cfg), nil, nil, Pos_Standing, make(ItemList, 0)}
}

func newEntityData(cfg *EntityConfig) *EntityData {
	return &EntityData{cfg.Key, InvalidId, newStatsData(cfg.Stats), make([]*ItemData, 0)}
}

func (e *Entity) Name() string {
	if e.player != nil {
		return e.player.data.Name
	}
	return e.cfg.Name
}

func (e *Entity) AddToInventory(item *Item) {
	e.inventory = append(e.inventory, item)
	e.data.Inventory = append(e.data.Inventory, item.data)
}

func (e *Entity) SearchInventory(query SearchQuery) (*Item, bool) {
	return SearchList(query, e.inventory)
}

func (e *Entity) RemoveFromInventory(item *Item) {
	if idx := utils.FindIndex(e.inventory, item); idx != -1 {
		e.inventory = utils.SwapDelete(e.inventory, idx)
		e.data.Inventory = utils.SwapDelete(e.data.Inventory, idx)
	}
}

func (e *Entity) MatchesKeyword(keyword string) bool {
	if strings.EqualFold(e.Name(), keyword) {
		return true
	}
	_, ok := e.cfg.lookup[keyword]
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

func SearchEntityMap(query SearchQuery, entities map[EntityId]*Entity, self *Entity) (*Entity, bool) {
	if query.Joined == "self" || query.Joined == "me" || query.Joined == "myself" {
		return self, true
	}
	return SearchMap(query, entities)
}

type Position int

const (
	Pos_Sleeping Position = iota
	Pos_Prone
	Pos_Sitting
	Pos_Standing
)

func (p Position) InactionString() string {
	switch p {
	case Pos_Sleeping:
		return "You're too busy dreaming"
	case Pos_Prone, Pos_Sitting:
		return "You'll have to get up first!"
	}
	return ""
}
