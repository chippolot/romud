package mud

import (
	"log"

	"github.com/chippolot/go-mud/src/mud/server"
)

type StateId int

const (
	NoneStateId StateId = iota
	LoggedOutStateId
	LoginStateId
	PlayingStateId
)

type GameState interface {
	StateId() StateId

	OnEnter()
	ProcessInput(input string) StateId
	OnExit()
}

type LoginState struct {
	player *Player
	world  *World
}

func (s *LoginState) StateId() StateId {
	return LoginStateId
}
func (s *LoginState) OnEnter() {
	s.player.Send("What is your name?")
}
func (s *LoginState) ProcessInput(input string) StateId {
	if s.world.db.DoesPlayerExist(input) {
		data, err := s.world.db.LoadPlayer(input)
		if err != nil {
			s.player.Send("Couldn't load data for player %s, please try another name.", input)
			return 0
		}
		log.Printf("loading player: %s", input)
		s.player.Enqueue("Welcome back, %s!", input)
		s.player.data = data
	} else {
		log.Printf("creating new player: %s", input)
		s.player.Enqueue("Ah, %s, a fine name indeed!", input)
		s.player.data.Character = NewEntityData(s.player.data.Name)
		s.player.data.Name = input
	}
	return PlayingStateId
}
func (s *LoginState) OnExit() {

}

type PlayingState struct {
	player *Player
	world  *World
}

func (s *PlayingState) StateId() StateId {
	return PlayingStateId
}
func (s *PlayingState) OnEnter() {
	s.player.Enqueue("Welcome to GoMUD!")
	s.world.OnPlayerJoined(s.player)
}
func (s *PlayingState) ProcessInput(input string) StateId {
	return s.world.OnPlayerInput(s.player, input)
}
func (s *PlayingState) OnExit() {
	s.player.Save(s.world.db)
	s.player.Send("Goodbye!")
	s.world.OnPlayerLeft(s.player)
}

type LoggedOutState struct {
	session *server.Session
}

func (s *LoggedOutState) StateId() StateId {
	return LoggedOutStateId
}
func (s *LoggedOutState) OnEnter() {
	s.session.Close()
}
func (s *LoggedOutState) ProcessInput(_ string) StateId {
	return 0
}
func (s *LoggedOutState) OnExit() {
}
