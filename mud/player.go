package mud

import (
	"fmt"
	"strings"
)

type PlayerId int

var playerIdCounter PlayerId

type Player struct {
	id      PlayerId
	name    string
	roomId  RoomId
	session *Session
}

func NewPlayer(session *Session) *Player {
	playerIdCounter++
	name := fmt.Sprintf("Player%d", playerIdCounter)
	return &Player{playerIdCounter, name, 0, session}
}

func (p *Player) Send(format string, a ...any) {
	var sb strings.Builder
	sb.WriteString(NewLine)
	if len(a) == 0 {
		sb.WriteString(format)
	} else {
		sb.WriteString(fmt.Sprintf(format, a...))
	}
	sb.WriteString(NewLine)
	sb.WriteString(NewLine)
	sb.WriteString(makePrompt(p))
	p.session.conn.Write([]byte(sb.String()))
}

func makePrompt(p *Player) string {
	return "> "
}
