package mud

import (
	"fmt"
	"log"
	"strconv"
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
		return s.yesNo(input, func() StateId {
			s.player.Send("Ah, %s, a fine name indeed!", s.name)
			s.changeSubState(LSS_NewUserEnterPass)
			return 0
		}, func() StateId {
			s.changeSubState(LSS_EnterName)
			return 0
		})
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
		toks := strings.Split(input, " ")
		numtoks := len(toks)
		if numtoks == 0 {
			s.player.Send("Which stat do you want to allocate points to?")
			return 0
		}

		statStr := strings.ToLower(toks[0])
		stat, err := ParseStatType(statStr)
		if err != nil ||
			!(stat == Stat_Str || stat == Stat_Agi || stat == Stat_Vit || stat == Stat_Int || stat == Stat_Dex || stat == Stat_Luk) {
			s.player.Send("That's not a valid stat type!")
			return 0
		}

		amt := 1
		if numtoks > 1 {
			if amt, err = strconv.Atoi(toks[1]); err != nil {
				s.player.Send("%s is not a valid amount to modify %s by", toks[1], stat.String())
				return 0
			}
		}

		// Apply amount and clamp stat between 1-9
		e := (*s.playerCharacter)
		curStat := e.stats.Get(stat)
		newStat := utils.ClampInt(curStat+amt, 1, 9)
		amt = utils.MinInt(newStat-curStat, e.stats.Get(Stat_StatPoints))
		e.stats.Add(stat, amt)
		e.stats.Add(Stat_StatPoints, -amt)

		if e.stats.Get(Stat_StatPoints) == 0 {
			s.changeSubState(LSS_ConfirmInitialStats)
			return 0
		} else {
			s.sendStatSelection()
		}
	case LSS_ConfirmInitialStats:
		return s.yesNo(input, func() StateId {
			return GameState_Playing
		}, func() StateId {
			s.changeSubState(LSS_SelectInitialStats)
			return 0
		})
	}
	return 0
}

func (s *LoginState) sendStatSelection() {
	e := (*s.playerCharacter)
	e.player.Send("Allocate Initial Stats")
	e.player.Send(utils.HorizontalDivider)
	e.player.Send("Remaining Pts: %d", e.stats.Get(Stat_StatPoints))
	s.sendCurrentStats()
}

func (s *LoginState) sendCurrentStats() {
	e := (*s.playerCharacter)
	e.player.Send("%-20s\t%-20s", fmt.Sprintf("<c yellow>Str</c> %d", e.stats.Get(Stat_Str)), fmt.Sprintf("<c yellow>Int</c> %d", e.stats.Get(Stat_Int)))
	e.player.Send("%-20s\t%-20s", fmt.Sprintf("<c yellow>Agi</c> %d", e.stats.Get(Stat_Agi)), fmt.Sprintf("<c yellow>Dex</c> %d", e.stats.Get(Stat_Dex)))
	e.player.Send("%-20s\t%-20s", fmt.Sprintf("<c yellow>Vit</c> %d", e.stats.Get(Stat_Vit)), fmt.Sprintf("<c yellow>Luk</c> %d", e.stats.Get(Stat_Luk)))
	e.player.Send("")
}

func (s *LoginState) yesNo(input string, yesFn func() StateId, noFn func() StateId) StateId {
	switch strings.ToLower(input) {
	case "y":
		return yesFn()
	case "n":
		return noFn()
	default:
		s.player.Send("Huh? Please enter 'y' or 'n':")
		return 0
	}
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
		s.prompt.SetPrompt("Allocate your stat points (ex: str 2 / str -2): ")
		s.player.SendRaw(server.TelNet_Command_EchoOn)
	case LSS_ConfirmInitialStats:
		s.sendCurrentStats()
		s.prompt.SetPrompt("Are you satisfied with these initial stats (y/n)?: ")
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

	roomId := s.world.EntryRoomId()
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
