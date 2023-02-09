package mud

import (
	"fmt"
	"log"
	"strings"
	"time"

	"github.com/chippolot/go-mud/src/mud/server"
	"github.com/chippolot/go-mud/src/utils"
	"golang.org/x/crypto/bcrypt"
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

const (
	LSS_EnterName LoginSubState = iota
	LSS_NewUserConfName
	LSS_NewUserEnterPass
	LSS_NewUserConfPass
	LSS_RetUserEnterPass
	LSS_SelectInitialStats
	LSS_ConfirmInitialStats
)

type LoginSubState int

type LoginState struct {
	substate        LoginSubState
	player          *Player
	world           *World
	playerCharacter **Entity
	name            string
	pass            string
	prompt          *server.ManualPromptProvider
}

func (s *LoginState) StateId() StateId {
	return GameState_LoggingIn
}
func (s *LoginState) OnEnter() {
	s.prompt = &server.ManualPromptProvider{}
	s.player.session.SetPromptProvider(s.prompt)
	s.changeSubState(LSS_EnterName)
}
func (s *LoginState) ProcessInput(input string) StateId {
	switch s.substate {
	case LSS_EnterName:
		s.name = input
		if s.world.db.DoesPlayerExist(s.name) {
			s.changeSubState(LSS_RetUserEnterPass)
		} else {
			s.changeSubState(LSS_NewUserConfName)
		}
	case LSS_NewUserConfName:
		switch strings.ToLower(input) {
		case "y":
			s.player.Send("Ah, %s, a fine name indeed!", s.name)
			s.changeSubState(LSS_NewUserEnterPass)
		case "n":
			s.changeSubState(LSS_EnterName)
		default:
			s.player.Send("Huh? Please enter 'y' or 'n':")
		}
	case LSS_NewUserEnterPass:
		hash, err := bcrypt.GenerateFromPassword([]byte(input), 14)
		if err != nil {
			s.player.Send("%v", err)
			s.changeSubState(LSS_NewUserEnterPass)
			return 0
		}
		s.pass = string(hash)
		s.changeSubState(LSS_NewUserConfPass)
	case LSS_NewUserConfPass:
		if s.passMatch(input, s.pass) {
			log.Printf("creating new player: %s", s.name)
			e := s.world.CreatePlayerCharacter(s.name, s.pass, s.player)

			// Give player starting equipment
			// TODO: Make scripted
			cfg, _ := lua_W.TryGetItemConfig("knife")
			itm := NewItem(cfg)
			e.AddItem(itm)
			e.Equip(itm)
			cfg, _ = lua_W.TryGetItemConfig("cotton_shirt")
			itm = NewItem(cfg)
			e.AddItem(itm)
			e.Equip(itm)

			// Give player starting stat points
			e.stats.Add(Stat_StatPoints, 24)

			*s.playerCharacter = e

			s.player.SendRaw(server.TelNet_Command_EchoOn)
			s.changeSubState(LSS_SelectInitialStats)
			return 0
		} else {
			s.player.Send("Passwords don't match!")
			s.changeSubState(LSS_NewUserEnterPass)
		}
	case LSS_RetUserEnterPass:
		data, err := s.world.db.LoadPlayer(s.name)
		if err != nil {
			log.Printf("error encountered while loading player: %s -- %v", s.name, err)
			s.player.Send("Couldn't load data for player %s, please try another name.", s.name)
			s.changeSubState(LSS_EnterName)
			return 0
		}

		if !s.passMatch(input, data.Player.Pass) {
			s.player.Send("Incorrect password!")
			s.changeSubState(LSS_EnterName)
			return 0
		}

		*s.playerCharacter, err = s.world.TryLoadPlayerCharacter(s.name, s.player)
		if err != nil {
			log.Printf("error encountered while loading player: %s -- %v", s.name, err)
			s.player.Send("Couldn't load data for player %s, please try another name.", s.name)
			s.changeSubState(LSS_EnterName)
			return 0
		}
		s.player.Send("Welcome back, %s!", s.name)
		s.player.SendRaw(server.TelNet_Command_EchoOn)
		return GameState_Playing
	case LSS_SelectInitialStats:
		s.sendStatSelection()
	}
	return 0
}

func (s *LoginState) sendStatSelection() {
	e := (*s.playerCharacter)
	e.player.Send("Allocate Initial Stats")
	e.player.Send(utils.HorizontalDivider)
	e.player.Send("Remaining Pts: %d", e.stats.Get(Stat_StatPoints))
	e.player.Send("%-20s\t%-20s", fmt.Sprintf("<c yellow>[s]</c> Str %d", e.stats.Get(Stat_Str)), fmt.Sprintf("<c yellow>[i]</c> Int %d", e.stats.Get(Stat_Int)))
	e.player.Send("%-20s\t%-20s", fmt.Sprintf("<c yellow>[a]</c> Agi %d", e.stats.Get(Stat_Agi)), fmt.Sprintf("<c yellow>[d]</c> Dex %d", e.stats.Get(Stat_Dex)))
	e.player.Send("%-20s\t%-20s", fmt.Sprintf("<c yellow>[v]</c> Vit %d", e.stats.Get(Stat_Vit)), fmt.Sprintf("<c yellow>[l]</c> Luk %d", e.stats.Get(Stat_Luk)))
	e.player.Send("")
	/*
		Initial Stat Allocation
		Points Remaining: 24
		-----------------------
		[s] STR	1	[i] INT 1
		[a] AGI	1	[d] DEX	1
		[v] VIT	1	[l] LUK	1

		How do you want to allocate your points?
	*/
}

func (s *LoginState) passMatch(pass string, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(pass))
	return err == nil
}

func (s *LoginState) changeSubState(ss LoginSubState) {
	s.substate = ss
	switch s.substate {
	case LSS_EnterName:
		s.player.SendRaw(server.TelNet_Command_EchoOn)
		s.prompt.SetPrompt("What is your name? ")
	case LSS_RetUserEnterPass:
		s.prompt.SetPrompt("Password: ")
		s.player.SendRaw(server.TelNet_Command_EchoOff)
	case LSS_NewUserConfName:
		s.prompt.SetPrompt(fmt.Sprintf("Looks like you're new here. Do you want to be called '%s' (y/n)? ", s.name))
	case LSS_NewUserEnterPass:
		s.prompt.SetPrompt("Choose a password: ")
		s.player.SendRaw(server.TelNet_Command_EchoOff)
	case LSS_NewUserConfPass:
		s.prompt.SetPrompt("Confirm password: ")
		s.player.SendRaw(server.TelNet_Command_EchoOff)
	case LSS_SelectInitialStats:
		s.sendStatSelection()
		s.prompt.SetPrompt("Allocate your stat points (ex: str +2 / str -2): ")
		s.player.SendRaw(server.TelNet_Command_EchoOn)
	}
	s.player.Send("")
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
	s.playerCharacter.player.session.SetPromptProvider(&PlayerPromptProvider{s.playerCharacter, s.world})
	s.playerCharacter.player.Send("Welcome to GoMUD!")

	// Heal up
	if s.playerCharacter.stats.Get(Stat_HP) < 1 {
		s.playerCharacter.stats.Set(Stat_HP, 1)
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
