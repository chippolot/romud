package mud

import (
	"log"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

const PlayerEntityKey = "_player"

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
	Flags        EntityFlags
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

type EntityContainer interface {
	AddEntity(entity *Entity)
	SearchEntities(query SearchQuery) []*Entity
	AllEntities() []*Entity
	RemoveEntity(entity *Entity)
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

func (e *Entity) SetData(data *EntityData, w *World) {
	e.data = data

	// Prepare inventory
	for _, idata := range e.data.Inventory {
		cfg, ok := w.itemConfigs[idata.Key]
		if !ok {
			log.Fatalf("cannot create item. expected item config with key %s", cfg.Key)
		}
		item := NewItem(cfg)
		item.SetData(idata, w)
		e.inventory = append(e.inventory, item)
	}
}

func (e *Entity) Name() string {
	if e.player != nil {
		return e.player.data.Name
	}
	return e.cfg.Name
}

func (e *Entity) AddItem(item *Item) {
	e.inventory = append(e.inventory, item)
	e.data.Inventory = append(e.data.Inventory, item.data)
}

func (e *Entity) SearchItems(query SearchQuery) []*Item {
	return SearchList(query, e.inventory)
}

func (e *Entity) AllItems() []*Item {
	return e.inventory
}

func (e *Entity) RemoveItem(item *Item) {
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
		if strings.EqualFold(e.Name(), name) {
			return e, true
		}
	}
	return nil, false
}

func SearchEntities(query SearchQuery, containers ...EntityContainer) []*Entity {
	// TODO dot notation for specifying container type
	for _, c := range containers {
		if ents := c.SearchEntities(query); len(ents) != 0 {
			return ents
		}
	}
	return nil
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
