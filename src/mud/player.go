package mud

import (
	"log"

	"github.com/chippolot/go-mud/src/mud/server"
)

type PlayerId int

var playerIdCounter PlayerId

type PlayerData struct {
	Name      string
	Password  string
	Character *EntityData
}

type Player struct {
	id      PlayerId
	session *server.Session
	data    *PlayerData
}

func NewPlayer(session *server.Session) *Player {
	p := &Player{id: playerIdCounter, session: session, data: &PlayerData{}}
	playerIdCounter++
	return p
}

func (p *Player) Enqueue(format string, a ...any) {
	p.session.Enqueue(format, a...)
}

func (p *Player) Send(format string, a ...any) {
	p.session.Send(format, a...)
}

func (p *Player) Save(db Database) {
	go func() {
		err := db.SavePlayer(p.data.Name, p.data)
		if err != nil {
			log.Panicf("failed to save data for player: %s", p.data.Name)
		} else {
			log.Printf("saved data for player: %s", p.data.Name)
		}
	}()
}
