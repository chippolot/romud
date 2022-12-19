package main

import (
	"fmt"
	"log"
	"net"
)

type SessionId int

var idCounter ConcurrentIdCounter[SessionId]

type Session struct {
	id   SessionId
	conn net.Conn
}

func NewSession(conn net.Conn) *Session {
	return &Session{idCounter.Next(), conn}
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
			player := NewPlayer(sessionEvent.session, s.world.entryRoomId)
			s.players[sid] = player
			s.world.AddPlayer(player)
			s.world.SendAllExcept(player.id, fmt.Sprintf("%s Joins", player.name))
			DoLook(player, s.world)
			log.Printf("%s Joined", player.name)

		case *SessionEndedEvent:
			player := s.players[sid]
			delete(s.players, sid)
			s.world.RemovePlayer(player.id)
			s.world.SendAllExcept(player.id, fmt.Sprintf("%s Leaves", player.name))
			log.Printf("%s Left", player.name)

		case *ClientInputEvent:
			player := s.players[sid]
			player.Send(fmt.Sprintf("You said '%s'", evt.input))
			s.world.SendAllExcept(player.id, fmt.Sprintf("%s said '%s'", player.name, evt.input))

		default:
			log.Printf("Unexpected event type: %T", sessionEvent.event)
		}
	}
}
