package main

import (
	"strings"
)

type RoomId int

var roomIdCounter ConcurrentIdCounter[RoomId]

type Room struct {
	id      RoomId
	desc    string
	exits   map[RoomExitVerb]*RoomExit
	players map[PlayerId]*Player
}

func NewRoom(desc string) *Room {
	return &Room{roomIdCounter.Next(), desc, make(map[RoomExitVerb]*RoomExit), make(map[PlayerId]*Player)}
}

func (r *Room) ConnectsTo(room *Room, verb RoomExitVerb) *Room {
	r.exits[verb] = &RoomExit{verb, room.id}
	if returningVerb := verb.Reverse(); returningVerb != Undefined {
		room.exits[returningVerb] = &RoomExit{returningVerb, r.id}
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

func (r *Room) SendAll(pid *Player, format string, a ...any) {
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

func (r *Room) Describe() string {
	return strings.Join([]string{
		r.desc,
		HorizontalDivider(),
		"Exits:",
		describeExits(r),
	}, NewLine)
}

func describeExits(r *Room) string {
	exits := make([]string, len(r.exits))
	i := 0
	for _, exit := range r.exits {
		exits[i] = exit.verb.String()
		i++
	}
	return strings.Join(exits, ", ")
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

type RoomExit struct {
	verb   RoomExitVerb
	roomId RoomId
}
