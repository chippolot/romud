package main

import (
	"fmt"
	"log"
	"net"
)

var idCounter ConcurrentIdCounter

type Session struct {
	id   int
	conn net.Conn
}

func NewSession(conn net.Conn) *Session {
	return &Session{idCounter.Next(), conn}
}

func (s *Session) SessionId() int {
	return s.id
}

type SessionHandler struct {
	world        *World
	eventChannel <-chan SessionEvent
	players      map[int]*Player
}

func NewSessionHandler(world *World, eventChannel <-chan SessionEvent) *SessionHandler {
	return &SessionHandler{world, eventChannel, make(map[int]*Player)}
}

func (s *SessionHandler) Run() {
	for sessionEvent := range s.eventChannel {
		sid := sessionEvent.session.SessionId()

		switch evt := sessionEvent.event.(type) {

		case *SessionStartedEvent:
			player := NewPlayer(sessionEvent.session)
			s.players[sid] = player
			s.world.AddPlayer(player)
			s.world.SendAllExcept(player.Id(), fmt.Sprintf("%s Joins", player.Name()))
			log.Printf("%s Joined", player.Name())

		case *SessionEndedEvent:
			player := s.players[sid]
			delete(s.players, sid)
			s.world.RemovePlayer(player.Id())
			s.world.SendAllExcept(player.Id(), fmt.Sprintf("%s Leaves", player.Name()))
			log.Printf("%s Left", player.Name())

		case *ClientInputEvent:
			player := s.players[sid]
			player.Send(fmt.Sprintf("You said '%s'", evt.input))
			s.world.SendAllExcept(player.Id(), fmt.Sprintf("%s said '%s'", player.Name(), evt.input))

		default:
			log.Printf("Unexpected event type: %T", sessionEvent.event)
		}
	}
}
