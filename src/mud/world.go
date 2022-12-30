package mud

import (
	"log"
	"strings"
)

type World struct {
	db          Database
	players     map[PlayerId]*Entity
	entities    map[EntityId]*Entity
	rooms       map[RoomId]*Room
	entryRoomId RoomId
}

func NewWorld(db Database) *World {
	return &World{db, make(map[PlayerId]*Entity), make(map[EntityId]*Entity), make(map[RoomId]*Room), 0}
}

func (w *World) AddEntity(e *Entity, roomId RoomId) {
	w.entities[e.id] = e
	if e.player != nil {
		w.players[e.player.id] = e
	}
	r := w.rooms[roomId]
	r.AddEntity(e)
}

func (w *World) TryGetEntityByName(name string) (*Entity, bool) {
	for _, e := range w.entities {
		if strings.EqualFold(e.data.Name, name) {
			return e, true
		}
	}
	return nil, false
}

func (w *World) RemoveEntity(eid EntityId) {
	if e, ok := w.entities[eid]; ok {
		r := w.rooms[e.data.RoomId]
		r.RemoveEntity(e)
		delete(w.entities, eid)
		if e.player != nil {
			delete(w.players, e.player.id)
		}
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
	for _, e := range w.players {
		e.player.Send(format, a...)
	}
}

func (w *World) SendAllExcept(pid PlayerId, format string, a ...any) {
	for pid2, e := range w.players {
		if pid != pid2 {
			e.player.Send(format, a...)
		}
	}
}

func (w *World) OnPlayerJoined(e *Entity) {
	p := e.player
	roomId := w.entryRoomId
	if e.data.RoomId != InvalidId {
		roomId = e.data.RoomId
	}
	w.AddEntity(e, roomId)
	w.SendAllExcept(p.id, "%s Joins", p.data.Name)
	p.Enqueue(Preamble)
	DoLook(e, w, nil)
}

func (w *World) OnPlayerLeft(e *Entity) {
	w.RemoveEntity(e.id)
	w.SendAllExcept(e.player.id, "%s Leaves", e.player.data.Name)
}

func (w *World) OnPlayerInput(p *Player, input string) StateId {
	e, ok := w.players[p.id]
	if !ok {
		log.Printf("failed to resolve entity for player %v", p.id)
		return 0
	}

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
			cmdDesc.fn(e, w, tokens[:])
			return 0
		}
	}

	p.Send("Huh??")
	return 0
}
