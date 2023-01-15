package mud

import (
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/bits"
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

	SendRst_None   SendRestrictionsMask = 0
	SendRst_CanSee SendRestrictionsMask = 1 << iota
)

type ANSIColor string
type SendRestrictionsMask bits.Bits

func (m *SendRestrictionsMask) Has(flag SendRestrictionsMask) bool {
	return *m&flag != 0
}

func SendToPlayer(e *Entity, format string, a ...any) {
	sendToPlayer(e, nil, SendRst_None, format, a...)
}

func SendToPlayerRe(e *Entity, subject *Entity, restrictions SendRestrictionsMask, format string, a ...any) {
	sendToPlayer(e, subject, restrictions, format, a...)
}

func BroadcastToWorld(w *World, format string, a ...any) {
	for _, e := range w.entities {
		sendToPlayer(e, nil, SendRst_None, format, a...)
	}
}

func BroadcastToWorldRe(w *World, e *Entity, restrictions SendRestrictionsMask, format string, a ...any) {
	for _, other := range w.entities {
		if e.id != other.id {
			sendToPlayer(other, e, restrictions, format, a...)
		}
	}
}

func BroadcastToRoom(r *Room, format string, a ...any) {
	for _, e := range r.entities {
		sendToPlayer(e, nil, SendRst_None, format, a...)
	}
}

func BroadcastToRoomRe(w *World, subject *Entity, restrictions SendRestrictionsMask, format string, a ...any) {
	if subject.data.RoomId == InvalidId {
		log.Println("trying to broadcast to invalid room")
		return
	}
	r := w.rooms[subject.data.RoomId]
	for _, other := range r.entities {
		if subject.id == other.id {
			continue
		}
		sendToPlayer(other, subject, restrictions, format, a...)
	}
}

func BroadcastToRoomRe2(w *World, subject *Entity, other *Entity, restrictions SendRestrictionsMask, format string, a ...any) {
	if subject.data.RoomId == InvalidId {
		log.Println("trying to broadcast to invalid room")
		return
	}
	r := w.rooms[subject.data.RoomId]
	for _, e := range r.entities {
		if subject.id == e.id || other.id == e.id {
			continue
		}
		sendToPlayer(e, subject, restrictions, format, a...)
	}
}

func Colorize(color ANSIColor, a any) string {
	return fmt.Sprintf("<c %s>%v</c>", color, a)
}

func sendToPlayer(e *Entity, subject *Entity, restrictions SendRestrictionsMask, format string, a ...any) {
	if e.player == nil {
		return
	}
	if subject != nil && subject != e && restrictions.Has(SendRst_CanSee) && !subject.CanBeSeenBy(e) {
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
