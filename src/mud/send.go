package mud

import (
	"fmt"
	"log"
)

const (
	ColorBlack   ANSIColor = "black"
	ColorRed     ANSIColor = "red"
	ColorGreen   ANSIColor = "green"
	ColorYellow  ANSIColor = "yellow"
	ColorBlue    ANSIColor = "blue"
	ColorMagenta ANSIColor = "magenta"
	ColorCyan    ANSIColor = "cyan"
	ColorWhite   ANSIColor = "white"

	ColorDimBlack   ANSIColor = "dim black"
	ColorDimRed     ANSIColor = "dim red"
	ColorDimGreen   ANSIColor = "dim green"
	ColorDimYellow  ANSIColor = "dim yellow"
	ColorDimBlue    ANSIColor = "dim blue"
	ColorDimMagenta ANSIColor = "dim magenta"
	ColorDimCyan    ANSIColor = "dim cyan"
	ColorDimWhite   ANSIColor = "dim white"

	ColorBrightBlack   ANSIColor = "bright black"
	ColorBrightRed     ANSIColor = "bright red"
	ColorBrightGreen   ANSIColor = "bright green"
	ColorBrightYellow  ANSIColor = "bright yellow"
	ColorBrightBlue    ANSIColor = "bright blue"
	ColorBrightMagenta ANSIColor = "bright magenta"
	ColorBrightCyan    ANSIColor = "bright cyan"
	ColorBrightWhite   ANSIColor = "bright white"
)

type ANSIColor string

func SendToPlayer(e *Entity, subject *Entity, format string, a ...any) {
	if e.player == nil {
		return
	}
	if subject != nil && !subject.CanBeSeenBy(e) {
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

func BroadcastToWorld(w *World, format string, a ...any) {
	for _, e := range w.entities {
		SendToPlayer(e, nil, format, a...)
	}
}

func BroadcastToWorldExcept(w *World, e *Entity, format string, a ...any) {
	for _, other := range w.entities {
		if e.id != other.id {
			SendToPlayer(e, nil, format, a...)
		}
	}
}

func BroadcastToRoom(w *World, subject *Entity, format string, a ...any) {
	if subject.data.RoomId == InvalidId {
		log.Println("trying to broadcast to invalid room")
		return
	}
	r := w.rooms[subject.data.RoomId]
	for _, e := range r.entities {
		SendToPlayer(e, subject, format, a...)
	}
}

func BroadcastToRoomExcept(w *World, subject *Entity, e *Entity, format string, a ...any) {
	if subject.data.RoomId == InvalidId {
		log.Println("trying to broadcast to invalid room")
		return
	}
	r := w.rooms[subject.data.RoomId]
	for _, other := range r.entities {
		if e.id == other.id {
			continue
		}
		SendToPlayer(other, subject, format, a...)
	}
}

func BroadcastToRoomExcept2(w *World, subject *Entity, e1 *Entity, e2 *Entity, format string, a ...any) {
	if subject.data.RoomId == InvalidId {
		log.Println("trying to broadcast to invalid room")
		return
	}
	r := w.rooms[subject.data.RoomId]
	for _, other := range r.entities {
		if e1.id == other.id || e2.id == other.id {
			continue
		}
		SendToPlayer(other, subject, format, a...)
	}
}

func Colorize(color ANSIColor, str string) string {
	return fmt.Sprintf("<c %s>%s</c>", color, str)
}
