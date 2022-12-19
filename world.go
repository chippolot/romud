package main

import (
	"fmt"
	"strings"
)

type World struct {
	players     map[PlayerId]*Player
	rooms       map[RoomId]*Room
	entryRoomId RoomId
}

func NewWorld() *World {
	return &World{make(map[PlayerId]*Player), make(map[RoomId]*Room), 0}
}

func (w *World) AddPlayer(p *Player) {
	w.players[p.id] = p
}

func (w *World) GetPlayer(pid PlayerId) (p *Player, ok bool) {
	p, ok = w.players[pid]
	return
}

func (w *World) GetPlayerByName(name string) (p *Player, ok bool) {
	for _, p := range w.players {
		if p.name == name {
			return p, true
		}
	}
	return nil, false
}

func (w *World) RemovePlayer(pid PlayerId) {
	delete(w.players, pid)
}

func (w *World) AddRoom(r *Room) *Room {
	w.rooms[r.id] = r
	if w.entryRoomId == 0 {
		w.entryRoomId = r.id
	}
	return r
}

func (w *World) SendAll(pid *Player, format string, a ...any) {
	for _, p := range w.players {
		p.Send(format, a)
	}
}

func (w *World) SendAllExcept(pid PlayerId, format string, a ...any) {
	for pid2, p := range w.players {
		if pid != pid2 {
			p.Send(format, a)
		}
	}
}

func (w *World) OnPlayerJoined(p *Player) {
	w.AddPlayer(p)
	w.SendAllExcept(p.id, fmt.Sprintf("%s Joins", p.name))
	DoLook(p, w)
}

func (w *World) OnPlayerLeft(p *Player) {
	w.RemovePlayer(p.id)
	w.SendAllExcept(p.id, fmt.Sprintf("%s Leaves", p.name))
}

func (w *World) OnPlayerInput(p *Player, input string) {
	tokens := strings.Split(input, " ")
	if len(tokens) == 0 {
		return
	}

	cmd := strings.ToLower(tokens[0])
	switch cmd {
	case "whisper":
		DoWhisper(p, w, tokens[1:])
	case "say":
		DoSay(p, w, input[len(cmd)+1:])
	case "yell":
		DoYell(p, w, input[len(cmd)+1:])
	}
}
