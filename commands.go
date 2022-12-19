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
			"who":      {DoWho, "Lists all online players", "who"},
			"commands": {DoCommands, "Lists available commands", "commands"},
		}
	}
	return &Commands
}

type ActionFunc func(player *Player, world *World, tokens []string)

func DoSay(p *Player, w *World, tokens []string) {
	if len(tokens) == 0 {
		p.Send("What do you want to say?")
	}
	msg := strings.Join(tokens, " ")

	p.Send("Ok.")

	r := w.rooms[p.roomId]
	r.SendAllExcept(p.id, "%s says, '%s'", p.name, msg)
}

func DoYell(p *Player, w *World, tokens []string) {
	if len(tokens) == 0 {
		p.Send("What do you want to yell?")
	}
	msg := strings.Join(tokens, " ")

	p.Send("Ok.")
	w.SendAllExcept(p.id, "%s yells, '%s'", p.name, msg)
}

func DoWhisper(p *Player, w *World, tokens []string) {
	switch len(tokens) {
	case 0:
		p.Send("What do you want to whisper to who?")
	case 1:
		p.Send("What do you want to whisper to %s?", tokens[0])
	default:
		toName := tokens[0]
		msg := strings.Join(tokens[1:], " ")
		if toName == p.name {
			p.Send("You try whispering to yourself")
			return
		} else if tp, found := w.GetPlayerByName(toName); found {
			p.Send("Ok.")
			tp.Send("%s whispers to you, %s", p.name, msg)
		} else {
			p.Send("No player named %s is online", toName)
		}
	}
}

func DoLook(p *Player, w *World, tokens []string) {
	r := w.rooms[p.roomId]
	p.Send(r.Describe())
}

func DoWho(p *Player, w *World, tokens []string) {
	lines := make([]string, 0)
	lines = append(lines, fmt.Sprintf("Online Players: %d", len(w.players)))
	lines = append(lines, HorizontalDivider())
	lines = append(lines, fmt.Sprintf("(you)\t%s", p.name))
	for _, player := range w.players {
		if player != p {
			lines = append(lines, fmt.Sprintf("\t%s", player.name))
		}
	}
	p.Send(strings.Join(lines, NewLine))
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
