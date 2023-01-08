package mud

import (
	"log"
	"time"

	"github.com/chippolot/go-mud/src/mud/server"
)

type StateId int

const (
	GameState_None StateId = iota
	GameState_LoggedOut
	GameState_LoggingIn
	GameState_Playing
)

type ChangeStateEvent struct {
	newState StateId
}

type GameState interface {
	StateId() StateId

	OnEnter()
	ProcessInput(input string) StateId
	OnExit()
}

type LoginState struct {
	player          *Player
	world           *World
	playerCharacter **Entity
}

func (s *LoginState) StateId() StateId {
	return GameState_LoggingIn
}
func (s *LoginState) OnEnter() {
	s.player.session.SetPromptProvider(&server.DefaultPromptProvider{})
	s.player.Send("What is your name?")
}
func (s *LoginState) ProcessInput(input string) StateId {
	name := input
	if s.world.db.DoesPlayerExist(name) {
		log.Printf("loading player: %s", name)
		var err error
		*s.playerCharacter, err = s.world.TryLoadPlayerCharacter(name, s.player)
		if err != nil {
			log.Printf("error encountered while loading player: %s -- %v", name, err)
			s.player.Send("Couldn't load data for player %s, please try another name.", name)
			return 0
		}
		s.player.Send("Welcome back, %s!", name)
	} else {
		log.Printf("creating new player: %s", name)
		*s.playerCharacter = s.world.CreatePlayerCharacter(name, s.player)
		s.player.Send("Ah, %s, a fine name indeed!", name)
	}

	return GameState_Playing
}
func (s *LoginState) OnExit() {

}

type PlayingState struct {
	playerCharacter *Entity
	world           *World
}

func (s *PlayingState) StateId() StateId {
	return GameState_Playing
}
func (s *PlayingState) OnEnter() {
	s.playerCharacter.player.session.SetPromptProvider(&PlayerPromptProvider{s.playerCharacter})
	s.playerCharacter.player.Send("Welcome to GoMUD!")

	// Heal up
	if s.playerCharacter.data.Stats.HP < 1 {
		s.playerCharacter.data.Stats.HP = 1
	}

	roomId := s.world.entryRoomId
	if s.playerCharacter.data.RoomId != InvalidId {
		roomId = s.playerCharacter.data.RoomId
	}
	s.world.AddEntity(s.playerCharacter, roomId)
}
func (s *PlayingState) ProcessInput(input string) StateId {
	return s.world.OnPlayerInput(s.playerCharacter.player, input)
}
func (s *PlayingState) OnExit() {
	s.world.SavePlayerCharacter(s.playerCharacter.player.id)
	s.playerCharacter.player.Send("Goodbye!")
	s.world.RemoveEntity(s.playerCharacter.id)
}

type LoggedOutState struct {
	player *Player
}

func (s *LoggedOutState) StateId() StateId {
	return GameState_LoggedOut
}
func (s *LoggedOutState) OnEnter() {
	s.player.session.SetPromptProvider(&server.DefaultPromptProvider{})
	go func() {
		time.Sleep(time.Second / 2)
		_ = s.player.session.Close()
	}()
}
func (s *LoggedOutState) ProcessInput(_ string) StateId {
	return 0
}
func (s *LoggedOutState) OnExit() {
}