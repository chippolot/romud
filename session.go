package main

import (
	"log"
	"net"
)

type SessionId int

type Session struct {
	id   SessionId
	conn net.Conn
}

func (s *Session) Close() {
	if tcpconn, ok := s.conn.(*net.TCPConn); ok {
		tcpconn.CloseWrite()
		tcpconn.SetLinger(0)
	} else {
		s.conn.Close()
	}
}

type SessionHandler struct {
	world        *World
	eventChannel <-chan SessionEvent
	players      map[SessionId]*Player
}

func NewSessionHandler(world *World, eventChannel <-chan SessionEvent) *SessionHandler {
	return &SessionHandler{world, eventChannel, make(map[SessionId]*Player)}
}

func (s *SessionHandler) Run() {
	for sessionEvent := range s.eventChannel {
		sid := sessionEvent.session.id

		switch evt := sessionEvent.event.(type) {

		case *SessionStartedEvent:
			player := NewPlayer(sessionEvent.session)
			s.players[sid] = player
			s.world.OnPlayerJoined(player)
			log.Printf("%s Joined", player.name)

		case *SessionEndedEvent:
			player := s.players[sid]
			delete(s.players, sid)
			s.world.OnPlayerLeft(player)
			log.Printf("%s Left", player.name)

		case *ClientInputEvent:
			player := s.players[sid]
			s.world.OnPlayerInput(player, evt.input)

		default:
			log.Printf("Unexpected event type: %T", sessionEvent.event)
		}
	}
}
