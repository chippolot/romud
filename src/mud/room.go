package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"strings"

	"github.com/chippolot/go-mud/src/mud/utils"
)

type RoomId uint32

var roomIdCounter RoomId

type RoomExitConfig struct {
	RoomId RoomId
	Verb   Direction
}

type RoomExtraConfig struct {
	Sense    SenseType
	Keywords []string
	Desc     string
}

type RoomConfigList []RoomConfig

type RoomConfig struct {
	Id     RoomId
	Name   string
	Desc   string
	Exits  []RoomExitConfig
	Extras []RoomExtraConfig
}

type Room struct {
	id       RoomId
	name     string
	desc     string
	exits    map[Direction]RoomId
	extras   map[SenseType]map[string]string
	entities map[EntityId]*Entity
}

func NewRoom(name string, desc string) *Room {
	roomIdCounter++
	return &Room{roomIdCounter, name, desc, make(map[Direction]RoomId), make(map[SenseType]map[string]string), make(map[EntityId]*Entity)}
}

func ParseRoom(cfg *RoomConfig) (*Room, error) {
	r := NewRoom(cfg.Name, cfg.Desc)
	r.id = cfg.Id
	for _, e := range cfg.Exits {
		r.exits[e.Verb] = e.RoomId
	}
	for _, e := range cfg.Extras {
		extras, ok := r.extras[e.Sense]
		if !ok {
			extras = make(map[string]string)
			r.extras[e.Sense] = extras
		}
		for _, keyword := range e.Keywords {
			extras[strings.ToLower(keyword)] = e.Desc
		}
	}
	return r, nil
}

func (r *Room) ConnectsTo(room *Room, verb Direction) *Room {
	r.exits[verb] = room.id
	if returningVerb, err := verb.Reverse(); err != nil {
		room.exits[returningVerb] = r.id
	} else {
		log.Panicln("failed to connect rooms:", err)
	}
	return r
}

func (r *Room) AddEntity(e *Entity) {
	oldRoomId := e.data.RoomId
	e.data.RoomId = r.id
	r.entities[e.id] = e
	if oldRoomId != 0 && e.player != nil {
		r.SendAllExcept(e.player.id, "%s entered the room", e.player.data.Name)
	}
}

func (r *Room) RemoveEntity(e *Entity) {
	if e.player != nil {
		r.SendAllExcept(e.player.id, "%s left the room", e.player.data.Name)
	}
	delete(r.entities, e.id)
}

func (r *Room) SendAll(format string, a ...any) {
	for _, e := range r.entities {
		if e.player != nil {
			e.player.Send(format, a...)
		}
	}
}

func (r *Room) SendAllExcept(pid PlayerId, format string, a ...any) {
	for _, e := range r.entities {
		if e.player != nil && pid != e.player.id {
			e.player.Send(format, a...)
		}
	}
}

func (r *Room) Describe(subject *Entity) string {
	var sb utils.StringBuilder
	sb.WriteNewLine().
		WriteString("<c bright yellow>").
		WriteString(r.name).
		WriteLine("</c>").
		WriteLine(r.desc).
		WriteString(utils.HorizontalDivider)
	describeExits(r, &sb)
	describePlayers(r, &sb, subject)
	describeNonPlayerEntities(r, &sb)
	return sb.String()
}

func (r *Room) TryDescribeExtra(sense SenseType, target string) (string, bool) {
	extras, ok := r.extras[sense]
	if !ok {
		return "", false
	}
	desc, ok := extras[target]
	return desc, ok
}

func describeExits(r *Room, sb *utils.StringBuilder) {
	if len(r.exits) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteString("<c dim yellow>Obvious Exits: ")
	i := 0
	for verb := range r.exits {
		if i > 0 && i < len(r.exits)-1 {
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
		descs = append(descs, fmt.Sprintf("%s is here", e.player.data.Name))
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c cyan>%s</c>", strings.Join(descs, utils.NewLine))
}

func describeNonPlayerEntities(r *Room, sb *utils.StringBuilder) {
	if len(r.entities) == 0 {
		return
	}
	var descs = make([]string, 0)
	for _, e := range r.entities {
		if e.player != nil {
			continue
		}
		desc := e.cfg.FullDesc
		if desc == "" {
			desc = fmt.Sprintf("A %s is here", e.cfg.Name)
		}
		descs = append(descs, desc)
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c blue>%s</c>", strings.Join(descs, utils.NewLine))
}

type Direction int

const (
	DirectionEast Direction = iota
	DirectionWest
	DirectionNorth
	DirectionSouth
	DirectionUp
	DirectionDown
)

func ParseDirection(s string) (Direction, error) {
	s = strings.TrimSpace(strings.ToLower(s))
	switch s {
	case "e", "east":
		return DirectionEast, nil
	case "w", "west":
		return DirectionWest, nil
	case "n", "north":
		return DirectionNorth, nil
	case "s", "south":
		return DirectionSouth, nil
	case "u", "up":
		return DirectionUp, nil
	case "d", "down":
		return DirectionDown, nil
	default:
		return 0, fmt.Errorf("failed to parse Direction: %s", s)
	}
}

func (d *Direction) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *d, err = ParseDirection(str); err != nil {
		return err
	}
	return nil
}

func (d Direction) String() string {
	switch d {
	case DirectionEast:
		return "east"
	case DirectionWest:
		return "west"
	case DirectionNorth:
		return "north"
	case DirectionSouth:
		return "south"
	case DirectionUp:
		return "up"
	case DirectionDown:
		return "down"
	}
	return "unknown"
}

func (d Direction) Reverse() (Direction, error) {
	switch d {
	case DirectionEast:
		return DirectionWest, nil
	case DirectionWest:
		return DirectionEast, nil
	case DirectionNorth:
		return DirectionSouth, nil
	case DirectionSouth:
		return DirectionNorth, nil
	case DirectionUp:
		return DirectionDown, nil
	case DirectionDown:
		return DirectionUp, nil
	}
	return 0, fmt.Errorf("failed to reverse direction: %s", d)
}
