package mud

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
}

func (s *LoginState) StateId() StateId {
	return LoginStateId
}
func (s *LoginState) OnEnter() {
	s.player.Send("What is your name?")
}
func (s *LoginState) ProcessInput(input string) StateId {
	s.player.name = input
	s.player.Enqueue("Ah, %s, a fine name indeed!", input)
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
	s.player.Send("Goodbye!")
	s.world.OnPlayerLeft(s.player)
}

type LoggedOutState struct {
	session *Session
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
