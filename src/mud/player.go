package mud

import (
	"fmt"
	"time"

	"github.com/chippolot/go-mud/src/mud/server"
	"github.com/chippolot/go-mud/src/utils"
)

type PlayerId int32

var playerIdCounter PlayerId = InvalidId

type PlayerCharacterData struct {
	Player    *PlayerData
	Character *EntityData
}

type PlayerData struct {
	Name        string
	Gender      Gender
	LastSavedAt time.Time
	Aliases     map[string]string
}

type Player struct {
	id      PlayerId
	data    *PlayerData
	session *server.Session
}

func NewPlayer(session *server.Session) *Player {
	playerIdCounter++
	p := &Player{id: playerIdCounter, data: &PlayerData{Gender: Male, Aliases: make(map[string]string)}, session: session}
	return p
}

func (p *Player) SetData(data *PlayerData) {
	p.data = data
	if data.Aliases == nil {
		data.Aliases = make(map[string]string)
	}
}

func (p *Player) Send(format string, a ...any) {
	p.session.Send(format, a...)
}

type PlayerPromptProvider struct {
	character *Entity
}

func (pp *PlayerPromptProvider) Prompt() string {
	prompt := fmt.Sprintf("<%s> ", Colorize(Color_Prompt, fmt.Sprintf("%dhp %dmv", pp.character.stats.Get(Stat_HP), pp.character.stats.Get(Stat_Mov))))
	if pp.character.combat != nil {
		targetName := ObservableName(pp.character.combat.target).Desc(pp.character)
		prompt = fmt.Sprintf("%s%s<%s (%s)>:<%s (%s)> ", prompt, utils.NewLine, pp.character.Name(), pp.character.stats.ConditionShortString(), targetName, pp.character.combat.target.stats.ConditionShortString())
	} else {
		prompt = fmt.Sprintf("%s%s<>:<> ", prompt, utils.NewLine)
	}
	return prompt
}
