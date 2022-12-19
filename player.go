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

func (p *Player) Send(format string, a ...any) {
	var msg string
	if len(a) == 0 {
		msg = format
	} else {
		msg = fmt.Sprint(format, a)
	}
	msg = msg + NewLine
	p.session.conn.Write([]byte(msg))
}
