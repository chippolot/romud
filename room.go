package main

import (
	"strings"
)

type RoomId int

var roomIdCounter ConcurrentIdCounter[RoomId]

type Room struct {
	id      RoomId
	desc    string
	exits   []*RoomExit
	players map[PlayerId]*Player
}

func NewRoom(desc string) *Room {
	return &Room{roomIdCounter.Next(), desc, make([]*RoomExit, 0), make(map[PlayerId]*Player)}
}

func (r *Room) ConnectsTo(room *Room, verb RoomExitVerb) *Room {
	r.exits = append(r.exits, &RoomExit{verb, room.id})
	if returningVerb := verb.Reverse(); returningVerb != Undefined {
		room.exits = append(room.exits, &RoomExit{returningVerb, r.id})
	}
	return r
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
	for i, exit := range r.exits {
		exits[i] = exit.verb.String()
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
)

func (rev RoomExitVerb) Matches(cmd string) bool {
	cmd = strings.ToLower(cmd)
	revStr := rev.String()
	return revStr == cmd || revStr[0] == cmd[0]
}

func (rev RoomExitVerb) String() string {
	switch rev {
	case East:
		return "west"
	case West:
		return "east"
	case North:
		return "south"
	case South:
		return "north"
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
	}
	return Undefined
}

type RoomExit struct {
	verb   RoomExitVerb
	roomId RoomId
}
