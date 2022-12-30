package mud

import (
	"log"

	"github.com/chippolot/go-mud/src/mud/server"
)

type SessionHandler struct {
	world        *World
	eventChannel <-chan server.SessionEvent
	players      map[server.SessionId]*Player
	states       map[server.SessionId]GameState
}

func NewSessionHandler(world *World, eventChannel <-chan server.SessionEvent) *SessionHandler {
	return &SessionHandler{world, eventChannel, make(map[server.SessionId]*Player), make(map[server.SessionId]GameState)}
}

func (s *SessionHandler) Run() {
	for sessionEvent := range s.eventChannel {
		sid := sessionEvent.Session.Id

		switch evt := sessionEvent.Event.(type) {

		case *server.SessionStartedEvent:
			player := NewPlayer(sessionEvent.Session)
			s.players[sid] = player
			log.Printf("session %d connected", sid)
			s.ChangeGameState(sid, LoginStateId)

		case *server.SessionEndedEvent:
			delete(s.players, sid)
			log.Printf("session %d disconnected", sid)

		case *server.ClientInputEvent:
			if state, ok := s.states[sid]; ok {
				if newStateId := state.ProcessInput(evt.Input); newStateId != NoneStateId {
					s.ChangeGameState(sid, newStateId)
				}
			}

		default:
			log.Printf("unexpected event type: %T", sessionEvent.Event)
		}
	}
}

func (s *SessionHandler) ChangeGameState(sid server.SessionId, id StateId) {
	if oldstate, ok := s.states[sid]; ok {
		oldstate.OnExit()
	}
	var newstate GameState
	switch id {
	case LoginStateId:
		newstate = &LoginState{s.players[sid], s.world}
	case PlayingStateId:
		newstate = &PlayingState{s.players[sid], s.world}
	case LoggedOutStateId:
		newstate = &LoggedOutState{s.players[sid].session}
	default:
		log.Printf("unknown state id: %d", id)
	}
	s.states[sid] = newstate
	if newstate != nil {
		newstate.OnEnter()
	}
}
