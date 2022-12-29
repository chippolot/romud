package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"strings"
)

type RoomId int

var roomIdCounter RoomId

type RoomExitData struct {
	RoomId RoomId
	Verb   Direction
}

type RoomExtraData struct {
	Sense    SenseType
	Keywords []string
	Desc     string
}

type RoomDataList []RoomData

type RoomData struct {
	Id     RoomId
	Name   string
	Desc   string
	Exits  []RoomExitData
	Extras []RoomExtraData
}

type Room struct {
	id      RoomId
	name    string
	desc    string
	exits   map[Direction]RoomId
	extras  map[SenseType]map[string]string
	players map[PlayerId]*Player
}

func NewRoom(name string, desc string) *Room {
	roomIdCounter++
	return &Room{roomIdCounter, name, desc, make(map[Direction]RoomId), make(map[SenseType]map[string]string), make(map[PlayerId]*Player)}
}

func ParseRoom(data *RoomData) (*Room, error) {
	r := NewRoom(data.Name, data.Desc)
	r.id = data.Id
	for _, e := range data.Exits {
		r.exits[e.Verb] = e.RoomId
	}
	for _, e := range data.Extras {
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

func (r *Room) AddPlayer(p *Player) {
	oldRoomId := p.data.Character.RoomId
	p.data.Character.RoomId = r.id
	r.players[p.id] = p
	if oldRoomId != 0 {
		r.SendAllExcept(p.id, "%s entered the room", p.data.Character.Name)
	}
}

func (r *Room) RemovePlayer(p *Player) {
	r.SendAllExcept(p.id, "%s left the room", p.data.Character.Name)
	delete(r.players, p.id)
}

func (r *Room) SendAll(format string, a ...any) {
	for _, p := range r.players {
		p.Send(format, a...)
	}
}

func (r *Room) SendAllExcept(pid PlayerId, format string, a ...any) {
	for pid2, p := range r.players {
		if pid != pid2 {
			p.Send(format, a...)
		}
	}
}

func (r *Room) Describe(forPlayer *Player) string {
	var sb strings.Builder
	sb.WriteString(NewLine)
	sb.WriteString("<c bright yellow>")
	sb.WriteString(r.name)
	sb.WriteString("</c>")
	sb.WriteString(NewLine)
	sb.WriteString(r.desc)
	sb.WriteString(NewLine)
	sb.WriteString(HorizontalDivider())
	sb.WriteString(NewLine)
	sb.WriteString(describeExits(r))
	playersStr := describePlayers(r, forPlayer)
	if playersStr != "" {
		sb.WriteString(NewLine)
		sb.WriteString(playersStr)
	}
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

func describeExits(r *Room) string {
	exits := make([]string, 0, len(r.exits))
	for verb := range r.exits {
		exits = append(exits, verb.String())
	}
	return "<c dim yellow>Obvious Exits: " + strings.Join(exits, ", ") + "</c>"
}

func describePlayers(r *Room, forPlayer *Player) string {
	players := make([]string, 0, len(r.players))
	for _, p := range r.players {
		if forPlayer == p {
			continue
		}
		players = append(players, fmt.Sprintf("%s is here", p.data.Character.Name))
	}
	if len(players) == 0 {
		return ""
	}
	return "<c cyan>" + strings.Join(players, NewLine) + "</c>"
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
