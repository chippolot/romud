package mud

import (
	"fmt"
	"strings"
)

type RoomId int

var roomIdCounter RoomId

type RoomExitData struct {
	RoomId RoomId
	Verb   string
}

// TODO TODOBEN THIS
type SenseType int

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
	exits   map[RoomExitVerb]RoomId
	players map[PlayerId]*Player
}

func NewRoom(name string, desc string) *Room {
	roomIdCounter++
	return &Room{roomIdCounter, name, desc, make(map[RoomExitVerb]RoomId), make(map[PlayerId]*Player)}
}

func NewRoomFromData(data *RoomData) (*Room, error) {
	r := NewRoom(data.Name, data.Desc)
	r.id = data.Id
	for _, e := range data.Exits {
		v := NewRoomExitVerb(e.Verb)
		if v == Undefined {
			return nil, fmt.Errorf("failed to parse room exit verb %s", e.Verb)
		}
		r.exits[v] = e.RoomId
	}
	return r, nil
}

func (r *Room) ConnectsTo(room *Room, verb RoomExitVerb) *Room {
	r.exits[verb] = room.id
	if returningVerb := verb.Reverse(); returningVerb != Undefined {
		room.exits[returningVerb] = r.id
	}
	return r
}

func (r *Room) AddPlayer(p *Player) {
	oldRoomId := p.roomId
	p.roomId = r.id
	r.players[p.id] = p
	if oldRoomId != 0 {
		r.SendAllExcept(p.id, "%s entered the room", p.name)
	}
}

func (r *Room) RemovePlayer(p *Player) {
	r.SendAllExcept(p.id, "%s left the room", p.name)
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
		players = append(players, fmt.Sprintf("%s is here", p.name))
	}
	if len(players) == 0 {
		return ""
	}
	return "<c cyan>" + strings.Join(players, NewLine) + "</c>"
}

type RoomExitVerb int

const (
	Undefined RoomExitVerb = iota
	East
	West
	North
	South
	Up
	Down
)

func NewRoomExitVerb(verb string) RoomExitVerb {
	switch verb {
	case "e", "east":
		return East
	case "w", "west":
		return West
	case "n", "north":
		return North
	case "s", "south":
		return South
	case "u", "up":
		return Up
	case "d", "down":
		return Down
	default:
		return Undefined
	}
}

func (rev RoomExitVerb) String() string {
	switch rev {
	case East:
		return "east"
	case West:
		return "west"
	case North:
		return "north"
	case South:
		return "south"
	case Up:
		return "up"
	case Down:
		return "down"
	}
	return "unknown"
}

func (rev RoomExitVerb) Reverse() RoomExitVerb {
	switch rev {
	case East:
		return West
	case West:
		return East
	case North:
		return South
	case South:
		return North
	case Up:
		return Down
	case Down:
		return Up
	}
	return Undefined
}
