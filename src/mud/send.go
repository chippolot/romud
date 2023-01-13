package mud

import "fmt"

func SendToPlayer(e *Entity, format string, a ...any) {
	if e.player == nil {
		return
	}
	e.player.Send(format, a...)
}

func SendToPlayerColorized(e *Entity, color string, format string, a ...any) {
	if e.player == nil {
		return
	}
	e.player.Send(fmt.Sprintf("<c %s>%s</c>", color, fmt.Sprintf(format, a...)))
}

func BroadcastToWorld(w *World, format string, a ...any) {
	for _, e := range w.entities {
		if e.player != nil {
			e.player.Send(format, a...)
		}
	}
}

func BroadcastToWorldExcept(w *World, e *Entity, format string, a ...any) {
	for _, other := range w.entities {
		if other.player != nil && e.id != other.id {
			other.player.Send(format, a...)
		}
	}
}

func BroadcastToRoom(r *Room, format string, a ...any) {
	for _, e := range r.entities {
		if e.player != nil {
			e.player.Send(format, a...)
		}
	}
}

func BroadcastToRoomExcept(r *Room, e *Entity, format string, a ...any) {
	for _, other := range r.entities {
		if other.player != nil && e.id != other.id {
			other.player.Send(format, a...)
		}
	}
}

func BroadcastToRoomExcept2(r *Room, e1 *Entity, e2 *Entity, format string, a ...any) {
	for _, other := range r.entities {
		if other.player != nil && e1.id != other.id && e2.id != other.id {
			other.player.Send(format, a...)
		}
	}
}
