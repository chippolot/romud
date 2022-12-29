package mud

type PlayerId int

var playerIdCounter PlayerId

type PlayerData struct {
	Name      string
	Password  string
	Character *EntityData
}

type Player struct {
	id      PlayerId
	session *Session
	data    *PlayerData
	char    *Entity
}

func NewPlayer(session *Session) *Player {
	p := &Player{id: playerIdCounter, session: session}
	playerIdCounter++
	return p
}

func (p *Player) Enqueue(format string, a ...any) {
	p.session.Enqueue(format, a...)
}

func (p *Player) Send(format string, a ...any) {
	p.session.Send(format, a...)
}
