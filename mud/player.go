package mud

import (
	"fmt"
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
	p.session.Send(format, a...)
}
