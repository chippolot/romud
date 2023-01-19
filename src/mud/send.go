package mud

import (
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

//goland:noinspection GoSnakeCaseUsage
const (
	Color_None ANSIColor = ""

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
	Color_Neutral       = Color_Yellow
	Color_NeutralBld    = Color_BrightYellow
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

type SendDestination interface {
	Send(b *SendBuilder)
}

type SendDestinationPlayer struct {
	e *Entity
}

func (d SendDestinationPlayer) Send(b *SendBuilder) {
	sendToPlayer(d.e, b.subject, b.restrictions, b.format, b.args...)
}

type SendDestinationRoom struct {
	r *Room
}

func (d SendDestinationRoom) Send(b *SendBuilder) {
	for _, e := range d.r.entities {
		if e != b.subject && (b.ignored == nil || !utils.Contains(b.ignored, e)) {
			sendToPlayer(e, b.subject, b.restrictions, b.format, b.args...)
		}
	}
}

type SendDestinationWorld struct {
	w *World
}

func (d SendDestinationWorld) Send(b *SendBuilder) {
	for _, e := range d.w.entities {
		if e != b.subject && (b.ignored == nil || !utils.Contains(b.ignored, e)) {
			sendToPlayer(e, b.subject, b.restrictions, b.format, b.args...)
		}
	}
}

type SendBuilder struct {
	format       string
	args         []any
	color        ANSIColor
	dst          SendDestination
	subject      NamedObservable
	restrictions SendRestrictionsMask
	ignored      []*Entity
}

func (b *SendBuilder) ToPlayer(e *Entity) *SendBuilder {
	b.dst = SendDestinationPlayer{e}
	return b
}

func (b *SendBuilder) ToEntityRoom(w *World, e *Entity) *SendBuilder {
	r := w.rooms[e.data.RoomId]
	b.dst = SendDestinationRoom{r}
	return b
}

func (b *SendBuilder) ToRoom(r *Room) *SendBuilder {
	b.dst = SendDestinationRoom{r}
	return b
}

func (b *SendBuilder) ToWorld(w *World) *SendBuilder {
	b.dst = SendDestinationWorld{w}
	return b
}

func (b *SendBuilder) Subject(s NamedObservable) *SendBuilder {
	b.subject = s
	return b
}

func (b *SendBuilder) Ignore(e *Entity) *SendBuilder {
	if b.ignored == nil {
		b.ignored = []*Entity{e}
	}
	return b
}

func (b *SendBuilder) Restricted(r SendRestrictionsMask) *SendBuilder {
	b.restrictions = r
	return b
}

func (b *SendBuilder) Colorized(c ANSIColor) *SendBuilder {
	b.color = c
	return b
}

func (b *SendBuilder) Send() {
	if b.dst == nil {
		log.Println("Trying to send message without destination!")
		return
	}
	if b.color != Color_None {
		b.format = fmt.Sprintf("<c %s>%s</c>", b.color, b.format)
	}
	b.dst.Send(b)
}

func Write(format string, args ...any) *SendBuilder {
	return &SendBuilder{format, args, Color_None, nil, nil, SendRst_None, nil}
}

func Colorize(color ANSIColor, a any) string {
	return fmt.Sprintf("<c %s>%v</c>", color, a)
}

func sendToPlayer(e *Entity, subject NamedObservable, restrictions SendRestrictionsMask, format string, a ...any) {
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
