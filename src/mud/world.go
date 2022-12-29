package mud

import (
	"strings"
)

type World struct {
	db          Database
	players     map[PlayerId]*Player
	rooms       map[RoomId]*Room
	entryRoomId RoomId
}

func NewWorld(db Database) *World {
	return &World{db, make(map[PlayerId]*Player), make(map[RoomId]*Room), 0}
}

func (w *World) AddPlayer(p *Player, roomId RoomId) {
	w.players[p.id] = p
	r := w.rooms[roomId]
	r.AddPlayer(p)
}

func (w *World) GetPlayer(pid PlayerId) (p *Player, ok bool) {
	p, ok = w.players[pid]
	return
}

func (w *World) GetPlayerByName(name string) (p *Player, ok bool) {
	for _, p := range w.players {
		if p.data.Name == name {
			return p, true
		}
	}
	return nil, false
}

func (w *World) RemovePlayer(pid PlayerId) {
	if p, ok := w.players[pid]; ok {
		r := w.rooms[p.data.Character.RoomId]
		r.RemovePlayer(p)
		delete(w.players, pid)
	}
}

func (w *World) AddRoom(r *Room) *Room {
	w.rooms[r.id] = r
	if w.entryRoomId == 0 {
		w.entryRoomId = r.id
	}
	return r
}

func (w *World) SendAll(format string, a ...any) {
	for _, p := range w.players {
		p.Send(format, a...)
	}
}

func (w *World) SendAllExcept(pid PlayerId, format string, a ...any) {
	for pid2, p := range w.players {
		if pid != pid2 {
			p.Send(format, a...)
		}
	}
}

func (w *World) OnPlayerJoined(p *Player) {
	w.AddPlayer(p, w.entryRoomId)
	w.SendAllExcept(p.id, "%s Joins", p.data.Name)
	p.Enqueue(Preamble)
	DoLook(p, w, nil)
}

func (w *World) OnPlayerLeft(p *Player) {
	w.RemovePlayer(p.id)
	w.SendAllExcept(p.id, "%s Leaves", p.data.Name)
}

func (w *World) OnPlayerInput(p *Player, input string) StateId {
	tokens := strings.Split(input, " ")
	if len(tokens) == 0 {
		return 0
	}

	cmd := strings.ToLower(tokens[0])
	if cmd == "quit" {
		return LoggedOutStateId
	}

	tokens[0] = cmd
	if cmdDesc, ok := CommandsLookup[cmd]; ok {
		if cmdDesc.fn != nil {
			cmdDesc.fn(p, w, tokens[:])
			return 0
		}
	}

	p.Send("Huh??")
	return 0
}
