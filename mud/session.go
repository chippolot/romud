package mud

import (
	"fmt"
	"log"
	"net"
	"strings"
)

type SessionEvent struct {
	session *Session
	event   interface{}
}

type SessionStartedEvent struct{}

type SessionEndedEvent struct{}

type ClientInputEvent struct {
	input string
}

type SessionId int

type Session struct {
	id   SessionId
	conn net.Conn
}

func (s *Session) Send(format string, a ...any) {
	var sb strings.Builder
	sb.WriteString(NewLine)
	if len(a) == 0 {
		sb.WriteString(format)
	} else {
		sb.WriteString(fmt.Sprintf(format, a...))
	}
	sb.WriteString(NewLine)
	sb.WriteString(NewLine)
	sb.WriteString(makePrompt())
	str := processANSIColorCodes(sb.String())
	s.conn.Write([]byte(str))
}

func makePrompt() string {
	return "> "
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
	states       map[SessionId]GameState
}

func NewSessionHandler(world *World, eventChannel <-chan SessionEvent) *SessionHandler {
	return &SessionHandler{world, eventChannel, make(map[SessionId]*Player), make(map[SessionId]GameState)}
}

func (s *SessionHandler) Run() {
	for sessionEvent := range s.eventChannel {
		sid := sessionEvent.session.id

		switch evt := sessionEvent.event.(type) {

		case *SessionStartedEvent:
			player := NewPlayer(sessionEvent.session)
			s.players[sid] = player
			log.Printf("Session %d connected", sid)
			s.ChangeGameState(sid, LoginStateId)

		case *SessionEndedEvent:
			delete(s.players, sid)
			log.Printf("Session %d disconnected", sid)

		case *ClientInputEvent:
			if state, ok := s.states[sid]; ok {
				if newStateId := state.ProcessInput(evt.input); newStateId != NoneStateId {
					s.ChangeGameState(sid, newStateId)
				}
			}

		default:
			log.Printf("Unexpected event type: %T", sessionEvent.event)
		}
	}
}

func (s *SessionHandler) ChangeGameState(sid SessionId, id StateId) {
	if oldstate, ok := s.states[sid]; ok {
		oldstate.OnExit()
	}
	var newstate GameState
	switch id {
	case LoginStateId:
		newstate = &LoginState{s.players[sid]}
	case PlayingStateId:
		newstate = &PlayingState{s.players[sid], s.world}
	case LoggedOutStateId:
		newstate = &LoggedOutState{s.players[sid].session}
	default:
		log.Printf("Unknown state id: %d", id)
	}
	s.states[sid] = newstate
	if newstate != nil {
		newstate.OnEnter()
	}
}
