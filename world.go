package main

type World struct {
	players map[int]*Player
}

func NewWorld() *World {
	return &World{make(map[int]*Player)}
}

func (w *World) AddPlayer(player *Player) {
	w.players[player.Id()] = player
}

func (w *World) RemovePlayer(pid int) {
	delete(w.players, pid)
}

func (w *World) SendAll(pid *Player, msg string) {
	for _, p := range w.players {
		p.Send(msg)
	}
}

func (w *World) SendAllExcept(pid int, msg string) {
	for pid2, p := range w.players {
		if pid != pid2 {
			p.Send(msg)
		}
	}
}
