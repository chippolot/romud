package main

import (
	"fmt"
	"strings"
)

type CommandDesc struct {
	fn      ActionFunc
	aliases []string
	desc    string
	usage   string
}

type CommandMap map[string]*CommandDesc
type CommandList []*CommandDesc

var CommandsLookup CommandMap
var Commands CommandList

func GetCommands() *CommandList {
	if Commands == nil {
		Commands = []*CommandDesc{
			{DoSay, []string{"say"}, "Say something in the current room", "say hi"},
			{DoYell, []string{"yell", "y"}, "Yell something to the whole world!", "yell hello everyone!"},
			{DoWhisper, []string{"whisper", "wh"}, "Whisper something to a specific player", "whisper redbeard Hi buddy!"},
			{DoLook, []string{"look", "l"}, "Describes the current room", "look"},
			{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north"},
			{DoWho, []string{"who"}, "Lists all online players", "who"},
			{DoCommands, []string{"commands"}, "Lists available commands", "commands"},
		}
	}
	return &Commands
}

func GetCommandLookup() *CommandMap {
	if CommandsLookup == nil {
		CommandsLookup = make(CommandMap)
		for _, cmd := range *GetCommands() {
			for _, alias := range cmd.aliases {
				if _, ok := CommandsLookup[alias]; ok {
					panic(fmt.Sprintf("Multiple commands registered with alias: %s", alias))
				}
				CommandsLookup[alias] = cmd
			}
		}
	}
	return &CommandsLookup
}

type ActionFunc func(player *Player, world *World, tokens []string)

func DoSay(p *Player, w *World, tokens []string) {
	if len(tokens) == 1 {
		p.Send("What do you want to say?")
	}
	msg := strings.Join(tokens[1:], " ")

	p.Send("Ok.")

	r := w.rooms[p.roomId]
	r.SendAllExcept(p.id, "%s says, '%s'", p.name, msg)
}

func DoYell(p *Player, w *World, tokens []string) {
	if len(tokens) == 1 {
		p.Send("What do you want to yell?")
	}
	msg := strings.Join(tokens[1:], " ")

	p.Send("Ok.")
	w.SendAllExcept(p.id, "%s yells, '%s'", p.name, msg)
}

func DoWhisper(p *Player, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		p.Send("What do you want to whisper to who?")
	case 2:
		p.Send("What do you want to whisper to %s?", tokens[1])
	default:
		toName := tokens[1]
		msg := strings.Join(tokens[2:], " ")
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
	p.Send(r.Describe(p))
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

func DoMove(p *Player, w *World, tokens []string) {
	cmd := tokens[0]
	verb := NewRoomExitVerb(cmd)
	roomcur := w.rooms[p.roomId]

	exit, ok := roomcur.exits[verb]
	if !ok {
		p.Send("Can't go that way!")
		return
	}

	roomnext := w.rooms[exit.roomId]
	roomcur.RemovePlayer(p)
	roomnext.AddPlayer(p)
	DoLook(p, w, nil)
}

func DoCommands(p *Player, w *World, tokens []string) {
	commands := make([]string, 0)

	commands = append(commands, "Available Commands:")
	commands = append(commands, HorizontalDivider())
	for _, cmd := range Commands {
		if len(cmd.aliases) == 1 {
			commands = append(commands, fmt.Sprintf("%s:", cmd.aliases[0]))
		} else {
			commands = append(commands, fmt.Sprintf("[%s]:", strings.Join(cmd.aliases, ",")))
		}
		commands = append(commands, fmt.Sprintf("\t%s", cmd.desc))
		commands = append(commands, fmt.Sprintf("\tUsage: %s", cmd.usage))
	}

	p.Send(strings.Join(commands, NewLine))
}
