package mud

import (
	"fmt"
	"strings"
	"unicode"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	DirNorth Direction = iota
	DirEast
	DirSouth
	DirWest
	DirUp
	DirDown
)

type RoomId int32

type RoomPresence interface {
	RoomId() RoomId
}

type RoomExitsConfig map[Direction]RoomId

type RoomExitConfig struct {
	RoomId RoomId
	Verb   Direction
}

type RoomConfigList []*RoomConfig

type RoomConfig struct {
	Id    RoomId
	Name  string
	Desc  string
	Exits RoomExitsConfig
}

type Room struct {
	cfg      *RoomConfig
	zone     ZoneId
	entities map[EntityId]*Entity
	items    map[ItemId]*Item
}

func NewRoom(cfg *RoomConfig, zoneId ZoneId) (*Room, error) {
	r := &Room{cfg, zoneId, make(map[EntityId]*Entity), make(map[ItemId]*Item)}
	return r, nil
}

func (r *Room) Name() string {
	return r.cfg.Name
}

func (r *Room) NameCapitalized() string {
	arr := []rune(r.Name())
	arr[0] = unicode.ToUpper(arr[0])
	return string(arr)
}

func (r *Room) AddEntity(e *Entity) {
	e.data.RoomId = r.cfg.Id
	r.entities[e.id] = e
}

func (r *Room) SearchEntities(query SearchQuery) []*Entity {
	return SearchMap(query, r.entities, func(e *Entity) bool {
		return e.CanBeSeenBy(nil)
	})
}

func (r *Room) AllEntities() []*Entity {
	ents := make([]*Entity, 0, len(r.entities))
	for _, e := range r.entities {
		ents = append(ents, e)
	}
	return ents
}

func (r *Room) RemoveEntity(e *Entity) {
	e.data.RoomId = InvalidId
	delete(r.entities, e.id)
}

func (r *Room) AddItem(i *Item) {
	i.data.RoomId = r.cfg.Id
	r.items[i.id] = i
}

func (r *Room) SearchItems(query SearchQuery) []*Item {
	return SearchMap(query, r.items, nil)
}

func (r *Room) AllItems() []*Item {
	items := make([]*Item, 0, len(r.items))
	for _, i := range r.items {
		items = append(items, i)
	}
	return items
}

func (r *Room) ItemWeight() int {
	w := 0
	for _, i := range r.items {
		w += i.cfg.Weight
	}
	return w
}

func (r *Room) RemoveItem(i *Item) {
	i.data.RoomId = InvalidId
	delete(r.items, i.id)
}

func (r *Room) IsExitOpen(dir Direction) bool {
	_, ok := r.cfg.Exits[dir]
	return ok
}

func (r *Room) Describe(subject *Entity) string {
	var sb utils.StringBuilder
	sb.WriteStringf("<c %s>", Color_Header).
		WriteString(r.Name()).
		WriteLine("</c>").
		WriteLinef("   %s", r.cfg.Desc)
	describeExits(r, &sb)
	describePlayers(r, &sb, subject)
	describeNonPlayerEntities(r, &sb, subject)
	describeItems(r, &sb)
	return sb.String()
}

func describeExits(r *Room, sb *utils.StringBuilder) {
	if len(r.cfg.Exits) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c %s>Obvious Exits: ", Color_SubHeader)
	i := 0
	for verb := range r.cfg.Exits {
		if i > 0 && i < len(r.cfg.Exits) {
			sb.WriteString(", ")
		}
		sb.WriteString(verb.String())
		i++
	}
	sb.WriteString("</c>")
}

func describePlayers(r *Room, sb *utils.StringBuilder, subject *Entity) {
	if len(r.entities) == 0 {
		return
	}
	var descs = make([]string, 0)
	for _, e := range r.entities {
		if e.player == nil {
			continue
		}
		if subject == e {
			continue
		}
		if !e.CanBeSeenBy(subject) {
			continue
		}
		descs = append(descs, fmt.Sprintf("%s is here", e.Name()))
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf(Colorize(Color_Entities, strings.Join(descs, utils.NewLine)))
}

func describeNonPlayerEntities(r *Room, sb *utils.StringBuilder, subject *Entity) {
	if len(r.entities) == 0 {
		return
	}
	descs := GroupDescriptionsFromMap(
		r.entities,
		func(_ EntityId, e *Entity) bool {
			return e.CanBeSeenBy(subject)
		},
		func(_ EntityId, e *Entity) string {
			if e.player != nil {
				return ""
			}
			desc := e.cfg.RoomDesc
			if desc == "" {
				desc = fmt.Sprintf("%s is here", e.Name())
			}
			return desc
		})
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf(Colorize(Color_Entities, strings.Join(descs, utils.NewLine)))
}

func describeItems(r *Room, sb *utils.StringBuilder) {
	if len(r.items) == 0 {
		return
	}
	descs := GroupDescriptionsFromMap(r.items, nil, func(_ ItemId, i *Item) string {
		desc := i.cfg.RoomDesc
		if desc == "" {
			desc = fmt.Sprintf("%s is here", i.Name())
		}
		return desc
	})
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf(Colorize(Color_Items, strings.Join(descs, utils.NewLine)))
}

type Direction int

func ParseDirection(s string) (Direction, error) {
	s = strings.TrimSpace(strings.ToLower(s))
	switch s {
	case "e", "east":
		return DirEast, nil
	case "w", "west":
		return DirWest, nil
	case "n", "north":
		return DirNorth, nil
	case "s", "south":
		return DirSouth, nil
	case "u", "up":
		return DirUp, nil
	case "d", "down":
		return DirDown, nil
	default:
		return 0, fmt.Errorf("failed to parse Direction: %s", s)
	}
}

func (d *Direction) String() string {
	switch *d {
	case DirEast:
		return "east"
	case DirWest:
		return "west"
	case DirNorth:
		return "north"
	case DirSouth:
		return "south"
	case DirUp:
		return "up"
	case DirDown:
		return "down"
	}
	return "unknown"
}

func (d *Direction) Reverse() (Direction, error) {
	switch *d {
	case DirEast:
		return DirWest, nil
	case DirWest:
		return DirEast, nil
	case DirNorth:
		return DirSouth, nil
	case DirSouth:
		return DirNorth, nil
	case DirUp:
		return DirDown, nil
	case DirDown:
		return DirUp, nil
	}
	return 0, fmt.Errorf("failed to reverse direction: %s", d)
}
