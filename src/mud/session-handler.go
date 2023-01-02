package mud

import (
	"log"

	"github.com/chippolot/go-mud/src/mud/server"
)

type PlayerSessionData struct {
	player          *Player
	playerCharacter *Entity
}

type SessionHandler struct {
	world        *World
	eventChannel <-chan server.SessionEvent
	players      map[server.SessionId]*PlayerSessionData
	states       map[server.SessionId]GameState
}

func NewSessionHandler(world *World, eventChannel <-chan server.SessionEvent) *SessionHandler {
	return &SessionHandler{world, eventChannel, make(map[server.SessionId]*PlayerSessionData), make(map[server.SessionId]GameState)}
}

func (s *SessionHandler) Run() {
	for sessionEvent := range s.eventChannel {
		sid := sessionEvent.Session.Id

		switch evt := sessionEvent.Event.(type) {

		case *server.SessionStartedEvent:
			player := NewPlayer(sessionEvent.Session)
			s.players[sid] = &PlayerSessionData{player: player}
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
	if oldState, ok := s.states[sid]; ok {
		oldState.OnExit()
	}
	var newState GameState
	switch id {
	case LoginStateId:
		newState = &LoginState{s.players[sid].player, s.world, &s.players[sid].playerCharacter}
	case PlayingStateId:
		newState = &PlayingState{s.players[sid].playerCharacter, s.world}
	case LoggedOutStateId:
		newState = &LoggedOutState{s.players[sid].player.session}
	default:
		log.Printf("unknown state id: %d", id)
	}
	s.states[sid] = newState
	if newState != nil {
		newState.OnEnter()
	}
}
