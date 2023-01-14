package mud

import (
	"fmt"
)

func SendToPlayer(e *Entity, format string, a ...any) {
	if e.player == nil {
		return
	}
	// Apply look descriptors
	for idx, tok := range a {
		if d, ok := tok.(LookDescriptor); ok {
			a[idx] = d.Desc(e)
		}
	}
	e.player.Send(format, a...)
}

func SendToPlayerColorized(e *Entity, color string, format string, a ...any) {
	if e.player == nil {
		return
	}
	format = fmt.Sprintf("<c %s>%s</c>", color, format)
	SendToPlayer(e, format, a...)
}

func BroadcastToWorld(w *World, format string, a ...any) {
	for _, e := range w.entities {
		SendToPlayer(e, format, a...)
	}
}

func BroadcastToWorldExcept(w *World, e *Entity, format string, a ...any) {
	for _, other := range w.entities {
		if e.id != other.id {
			SendToPlayer(e, format, a...)
		}
	}
}

func BroadcastToRoom(r *Room, format string, a ...any) {
	for _, e := range r.entities {
		SendToPlayer(e, format, a...)
	}
}

func BroadcastToRoomExcept(r *Room, e *Entity, format string, a ...any) {
	for _, other := range r.entities {
		if e.id != other.id {
			SendToPlayer(other, format, a...)
		}
	}
}

func BroadcastToRoomExcept2(r *Room, e1 *Entity, e2 *Entity, format string, a ...any) {
	for _, other := range r.entities {
		if e1.id != other.id && e2.id != other.id {
			SendToPlayer(other, format, a...)
		}
	}
}
