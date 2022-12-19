package main

import "fmt"

type PlayerId int

var playerIdCounter ConcurrentIdCounter[PlayerId]

type Player struct {
	id      PlayerId
	name    string
	roomId  RoomId
	session *Session
}

func NewPlayer(session *Session, roomId RoomId) *Player {
	pid := playerIdCounter.Next()
	name := fmt.Sprintf("Player %d", pid)
	return &Player{pid, name, roomId, session}
}

func (p *Player) Send(msg string) {
	msg += "\n\r"
	p.session.conn.Write([]byte(msg))
}
