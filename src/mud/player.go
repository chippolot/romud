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
	Pass        string
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

func (p *Player) SendRaw(bytes []byte) {
	p.session.Conn.Write(bytes)
}

type PlayerPromptProvider struct {
	character *Entity
}

func (pp *PlayerPromptProvider) Prompt() string {
	var sb utils.StringBuilder
	toNextLvlPct := 0
	lvl := pp.character.stats.Get(Stat_Level)
	if !IsMaxLevel(pp.character) {
		curLvlXp := float64(XPLookup[lvl])
		nxtLvlXp := float64(XPLookup[lvl+1])
		toNextLvlPct = int(((pp.character.stats.GetFloat(Stat_XP) - curLvlXp) / nxtLvlXp) * 100)
	}
	sb.WriteLinef("<%s> ", Colorize(Color_Prompt, fmt.Sprintf("%dhp %dsp %dmv %d%%xp", pp.character.stats.Get(Stat_HP), pp.character.stats.Get(Stat_SP), pp.character.stats.Get(Stat_Mov), toNextLvlPct)))
	if pp.character.combat != nil {
		targetName := ObservableName(pp.character.combat.target).Desc(pp.character)
		sb.WriteLinef("<%s (%s)>:<%s (%s)> ", pp.character.Name(), pp.character.stats.ConditionShortString(), targetName, pp.character.combat.target.stats.ConditionShortString())
	} else {
		sb.WriteLine("<>:<> ")
	}
	return sb.String()
}
