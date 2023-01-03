package mud

import (
	"github.com/chippolot/go-mud/src/mud/server"
)

type PlayerId uint32

var playerIdCounter PlayerId

type PlayerCharacterData struct {
	Player    *PlayerData
	Character *EntityData
}

type PlayerData struct {
	Name   string
	Gender Gender
}

type Player struct {
	id      PlayerId
	data    *PlayerData
	session *server.Session
}

func NewPlayer(session *server.Session) *Player {
	playerIdCounter++
	// TODO Set gender from prompt
	p := &Player{id: playerIdCounter, data: &PlayerData{Gender: Male}, session: session}
	return p
}

func (p *Player) Send(format string, a ...any) {
	p.session.Send(format, a...)
}
