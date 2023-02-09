package mud

import (
	"log"

	"github.com/chippolot/ro-mud/src/mud/server"
)

type PlayerSessionData struct {
	player *Player
	char   *Entity
}

type SessionHandler struct {
	world   *World
	events  <-chan server.SessionEvent
	players map[server.SessionId]*PlayerSessionData
	states  map[server.SessionId]GameState
}

func NewSessionHandler(world *World, events <-chan server.SessionEvent) *SessionHandler {
	return &SessionHandler{world, events, make(map[server.SessionId]*PlayerSessionData), make(map[server.SessionId]GameState)}
}

func (s *SessionHandler) HandleEvent(sessionEvt server.SessionEvent) {
	sid := sessionEvt.Session.Id

	switch evt := sessionEvt.Event.(type) {
	case *server.SessionStartedEvent:
		s.world.AddSession(sessionEvt.Session)
		player := NewPlayer(sessionEvt.Session)
		s.players[sid] = &PlayerSessionData{player: player}
		log.Printf("session %d connected", sid)
		s.ChangeGameState(sid, GameState_LoggingIn)

	case *server.SessionEndedEvent:
		s.world.RemoveSession(sid)
		p := s.players[sid]
		if e, ok := s.world.TryGetEntityByPlayerId(p.player.id); ok {
			s.world.RemoveEntity(e.id)
		}
		delete(s.players, sid)
		log.Printf("session %d disconnected", sid)

	case *server.ClientInputEvent:
		if state, ok := s.states[sid]; ok {
			if newStateId := state.ProcessInput(evt.Input); newStateId != GameState_None {
				s.ChangeGameState(sid, newStateId)
			}
		}
	case *ChangeStateEvent:
		s.ChangeGameState(sid, evt.newState)
	default:
		log.Printf("unexpected event type: %T", sessionEvt.Event)
	}
}

func (s *SessionHandler) ChangeGameState(sid server.SessionId, id StateId) {
	if oldState, ok := s.states[sid]; ok {
		oldState.OnExit()
	}
	var newState GameState
	switch id {
	case GameState_LoggingIn:
		newState = &LoginState{LSS_EnterName, s.players[sid].player, s.world, &s.players[sid].char, "", "", nil}
	case GameState_Playing:
		newState = &PlayingState{s.players[sid].char, s.world}
	case GameState_LoggedOut:
		newState = &LoggedOutState{s.players[sid].player}
	default:
		log.Printf("unknown state id: %d", id)
	}
	s.states[sid] = newState
	if newState != nil {
		newState.OnEnter()
	}
}
