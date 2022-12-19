package main

type World struct {
	players     map[PlayerId]*Player
	rooms       map[RoomId]*Room
	entryRoomId RoomId
}

func NewWorld() *World {
	return &World{make(map[PlayerId]*Player), make(map[RoomId]*Room), 0}
}

func (w *World) AddPlayer(player *Player) {
	w.players[player.id] = player
}

func (w *World) RemovePlayer(pid PlayerId) {
	delete(w.players, pid)
}

func (w *World) AddRoom(room *Room) *Room {
	w.rooms[room.id] = room
	if w.entryRoomId == 0 {
		w.entryRoomId = room.id
	}
	return room
}

func (w *World) SendAll(pid *Player, msg string) {
	for _, p := range w.players {
		p.Send(msg)
	}
}

func (w *World) SendAllExcept(pid PlayerId, msg string) {
	for pid2, p := range w.players {
		if pid != pid2 {
			p.Send(msg)
		}
	}
}
