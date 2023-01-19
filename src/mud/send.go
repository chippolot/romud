package mud

import (
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/bits"
)

//goland:noinspection GoSnakeCaseUsage
const (
	Color_Black   ANSIColor = "black"
	Color_Red     ANSIColor = "red"
	Color_Green   ANSIColor = "green"
	Color_Yellow  ANSIColor = "yellow"
	Color_Blue    ANSIColor = "blue"
	Color_Magenta ANSIColor = "magenta"
	Color_Cyan    ANSIColor = "cyan"
	Color_White   ANSIColor = "white"

	Color_DimBlack   ANSIColor = "dim black"
	Color_DimRed     ANSIColor = "dim red"
	Color_DimGreen   ANSIColor = "dim green"
	Color_DimYellow  ANSIColor = "dim yellow"
	Color_DimBlue    ANSIColor = "dim blue"
	Color_DimMagenta ANSIColor = "dim magenta"
	Color_DimCyan    ANSIColor = "dim cyan"
	Color_DimWhite   ANSIColor = "dim white"

	Color_BrightBlack   ANSIColor = "bright black"
	Color_BrightRed     ANSIColor = "bright red"
	Color_BrightGreen   ANSIColor = "bright green"
	Color_BrightYellow  ANSIColor = "bright yellow"
	Color_BrightBlue    ANSIColor = "bright blue"
	Color_BrightMagenta ANSIColor = "bright magenta"
	Color_BrightCyan    ANSIColor = "bright cyan"
	Color_BrightWhite   ANSIColor = "bright white"

	Color_Prompt        = Color_BrightGreen
	Color_Positive      = Color_Green
	Color_Negative      = Color_Red
	Color_NegativeBld   = Color_Red
	Color_Neutral       = Color_BrightWhite
	Color_PositiveBld   = Color_BrightGreen
	Color_Header        = Color_BrightCyan
	Color_SubHeader     = Color_Cyan
	Color_Entities      = Color_BrightWhite
	Color_Items         = Color_BrightWhite
	Color_Enum          = Color_BrightWhite
	Color_Stat          = Color_Cyan
	Color_PlayerDam     = Color_Green
	Color_EnemyDam      = Color_Red
	Color_StatusEffects = Color_Yellow
	Color_Cnd_Hurt      = Color_Red
	Color_Cnd_LightHurt = Color_Yellow
	Color_Cnd_Healthy   = Color_Green
)

const (
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
	if e == nil || e.player == nil {
		return
	}
	if subject != nil && subject != e && restrictions.Has(SendRst_CanSee) && !subject.CanBeSeenBy(e) {
		return
	}
	// Apply look descriptors
	for idx, tok := range a {
		if d, ok := tok.(ObservableDescriptor); ok {
			a[idx] = d.Desc(e)
		}
	}
	e.player.Send(format, a...)
}
