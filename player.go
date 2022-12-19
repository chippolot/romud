package main

import "fmt"

var playerIdCounter ConcurrentIdCounter

type Player struct {
	id      int
	name    string
	session *Session
}

func NewPlayer(session *Session) *Player {
	pid := playerIdCounter.Next()
	name := fmt.Sprintf("Player %d", pid)
	return &Player{pid, name, session}
}

func (p *Player) Id() int {
	return p.id
}

func (p *Player) Name() string {
	return p.name
}

func (p *Player) Send(msg string) {
	msg += "\n\r"
	p.session.conn.Write([]byte(msg))
}
