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
	id            PlayerId
	data          *PlayerData
	session       *server.Session
	saveRequested bool
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
	world     *World
}

func (pp *PlayerPromptProvider) Prompt() string {
	var sb utils.StringBuilder

	// Status prompt
	stats := pp.character.stats
	sb.WriteLinef("<%s> ", Colorize(Color_Prompt, fmt.Sprintf("%dhp %dsp %dmv | %d%%xp %d%%jp %dz", stats.Get(Stat_HP), stats.Get(Stat_SP), stats.Get(Stat_Mov), GetPercentProgressToNextLevel(pp.character), GetPercentProgressToNextJobLevel(pp.character), stats.Get(Stat_Gold))))

	// Combat prompt
	combat := pp.character.combat
	if combat == nil {
		targetingPlayer := pp.world.inCombat.FindFirst(func(e *Entity) bool {
			return e.combat != nil && e.combat.target == pp.character
		})
		if targetingPlayer != nil {
			combat = targetingPlayer.combat
		}
	}
	if combat != nil {
		target := combat.target
		dist := combat.distance
		if target.combat != nil && target.combat.target == pp.character {
			dist = target.combat.distance
		}
		targetName := ObservableName(target).Desc(pp.character)
		sb.WriteStringf("<%s (%s)>", pp.character.GetName(), stats.ConditionShortString())
		if dist < 1 {
			sb.WriteString(":")
		} else {
			numdots := int(dist)/2 + 1
			for i := 0; i < numdots; i++ {
				sb.WriteString(".")
			}
			sb.WriteStringf("%d ft", int(dist)*5)
			for i := 0; i < numdots; i++ {
				sb.WriteString(".")
			}
		}
		sb.WriteStringf("<%s (%s)>", targetName, target.stats.ConditionShortString())
	} else {
		sb.WriteLine("<>:<> ")
	}
	return sb.String()
}
