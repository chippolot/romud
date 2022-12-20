package main

import (
	"fmt"
	"strings"
)

type PlayerId int

var playerIdCounter ConcurrentIdCounter[PlayerId]

type Player struct {
	id      PlayerId
	name    string
	roomId  RoomId
	session *Session
}

func NewPlayer(session *Session) *Player {
	pid := playerIdCounter.Next()
	name := fmt.Sprintf("Player%d", pid)
	return &Player{pid, name, 0, session}
}

func (p *Player) Send(format string, a ...any) {
	var sb strings.Builder
	if len(a) == 0 {
		sb.WriteString(format)
	} else {
		sb.WriteString(fmt.Sprintf(format, a...))
	}
	sb.WriteString(NewLine)
	sb.WriteString(makePrompt(p))
	p.session.conn.Write([]byte(sb.String()))
}

func makePrompt(p *Player) string {
	return "> "
}
