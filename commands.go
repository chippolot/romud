package main

import (
	"fmt"
	"strings"
)

type CommandDesc struct {
	fn    ActionFunc
	desc  string
	usage string
}

type CommandMap map[string]*CommandDesc

var Commands CommandMap

func GetCommands() *CommandMap {
	if Commands == nil {
		Commands = map[string]*CommandDesc{
			"say":      {DoSay, "Say something in the current room", "say hi"},
			"yell":     {DoYell, "Yell something to the whole world!", "yell hello everyone!"},
			"whisper":  {DoWhisper, "Whisper something to a specific player", "whisper redbeard Hi buddy!"},
			"look":     {DoLook, "Describes the current room", "look"},
			"commands": {DoCommands, "Lists available commands", "commands"},
		}
	}
	return &Commands
}

type ActionFunc func(player *Player, world *World, tokens []string)

func DoWhisper(p *Player, w *World, tokens []string) {
	switch len(tokens) {
	case 0:
		p.Send("What do you want to whisper to who?")
	case 1:
		p.Send("What do you want to whisper to %s?", tokens[0])
	default:
		toName := tokens[0]
		msg := strings.Join(tokens[2:], " ")
		if tp, found := w.GetPlayerByName(toName); found {
			p.Send("You whispered to %s '%s'", toName, msg)
			tp.Send("%s whispered to you '%s'", p.name, msg)
		} else {
			p.Send("No player named %s is online", toName)
		}
	}
}

func DoSay(p *Player, w *World, tokens []string) {
	msg := strings.Join(tokens, " ")

	p.Send("You say '%s'", msg)

	r := w.rooms[p.roomId]
	r.SendAllExcept(p.id, "%s said '%s'", p.name, msg)
}

func DoYell(p *Player, w *World, tokens []string) {
	msg := strings.Join(tokens, " ")

	p.Send("You yell '%s'", msg)
	w.SendAllExcept(p.id, "%s yelled '%s'", p.name, msg)
}

func DoLook(p *Player, w *World, tokens []string) {
	r := w.rooms[p.roomId]
	p.Send(r.Describe())
}

func DoCommands(p *Player, w *World, tokens []string) {
	commands := make([]string, 0)

	commands = append(commands, "Available Commands:")
	commands = append(commands, HorizontalDivider())
	for cmd, cmddesc := range *GetCommands() {
		commands = append(commands, fmt.Sprintf("%s:", cmd))
		commands = append(commands, fmt.Sprintf("\t%s", cmddesc.desc))
		commands = append(commands, fmt.Sprintf("\tUsage: %s", cmddesc.usage))
	}

	p.Send(strings.Join(commands, NewLine))
}
