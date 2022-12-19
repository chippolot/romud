package main

import (
	"fmt"
	"strings"
)

type ActionFunc func(player *Player, world *World)

func DoWhisper(p *Player, w *World, toks []string) {
	switch len(toks) {
	case 0:
		p.Send("What do you want to whisper to who?")
	case 1:
		p.Send("What do you want to whisper to %s?", toks[0])
	default:
		toName := toks[0]
		msg := strings.Join(toks[1:], " ")
		if tp, found := w.GetPlayerByName(toName); found {
			p.Send(fmt.Sprintf("You whispered to %s '%s'", toName, msg))
			tp.Send(fmt.Sprintf("%s whispered to you '%s'", p.name, msg))
		} else {
			p.Send("No player named %s is online", toName)
		}
	}

}

func DoSay(p *Player, w *World, msg string) {
	p.Send(fmt.Sprintf("You say '%s'", msg))

	r := w.rooms[p.roomId]
	r.SendAllExcept(p.id, fmt.Sprintf("%s said '%s'", p.name, msg))
}

func DoYell(p *Player, w *World, msg string) {
	p.Send(fmt.Sprintf("You yell '%s'", msg))
	w.SendAllExcept(p.id, fmt.Sprintf("%s yelled '%s'", p.name, msg))
}

func DoLook(p *Player, w *World) {
	r := w.rooms[p.roomId]
	p.Send(r.Describe())
}
