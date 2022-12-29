package mud

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

func init() {
	Commands = []*CommandDesc{
		{DoSay, []string{"say"}, "Say something in the current room", "say hi"},
		{DoYell, []string{"yell", "y"}, "Yell something to the whole world!", "yell hello everyone!"},
		{DoWhisper, []string{"whisper", "wh"}, "Whisper something to a specific player", "whisper redbeard Hi buddy!"},
		{DoLook, []string{"look", "l"}, "Describes the current room or object in room", "look / look cat"},
		{DoListen, []string{"listen"}, "Describes the sound of an object", "hear cat"},
		{DoTaste, []string{"taste"}, "Describes the taste of an object", "taste goo"},
		{DoTouch, []string{"touch"}, "Describes the touch of an object", "touch goo"},
		{DoSmell, []string{"smell"}, "Describes the smell of an object", "smell goo"},
		{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north"},
		{DoWho, []string{"who"}, "Lists all online players", "who"},
		{DoCommands, []string{"commands"}, "Lists available commands", "commands"},
		{nil, []string{"quit"}, "Quits the game", "quit"},
	}

	CommandsLookup = make(CommandMap)
	for _, cmd := range Commands {
		for _, alias := range cmd.aliases {
			if _, ok := CommandsLookup[alias]; ok {
				panic(fmt.Sprintf("Multiple commands registered with alias: %s", alias))
			}
			CommandsLookup[alias] = cmd
		}
	}
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
	switch len(tokens) {
	case 0, 1:
		p.Send(r.Describe(p))
	default:
		if desc, ok := trySense(SenseLook, r, tokens[1]); ok {
			p.Send(desc)
		} else {
			p.Send("You don't see that here.")
		}
	}
}

func DoListen(p *Player, w *World, tokens []string) {
	r := w.rooms[p.roomId]
	switch len(tokens) {
	case 0, 1:
		p.Send("What do you want to listen to?")
	default:
		if desc, ok := trySense(SenseListen, r, tokens[1]); ok {
			p.Send(desc)
		} else {
			p.Send("You don't hear that here.")
		}
	}
}

func DoTaste(p *Player, w *World, tokens []string) {
	r := w.rooms[p.roomId]
	switch len(tokens) {
	case 0, 1:
		p.Send("What do you want to taste?")
	default:
		if desc, ok := trySense(SenseTaste, r, tokens[1]); ok {
			p.Send(desc)
		} else {
			p.Send("You don't want to taste that!")
		}
	}
}

func DoTouch(p *Player, w *World, tokens []string) {
	r := w.rooms[p.roomId]
	switch len(tokens) {
	case 0, 1:
		p.Send("What do you want to touch?")
	default:
		if desc, ok := trySense(SenseTouch, r, tokens[1]); ok {
			p.Send(desc)
		} else {
			p.Send("You don't want to touch that!")
		}
	}
}

func DoSmell(p *Player, w *World, tokens []string) {
	r := w.rooms[p.roomId]
	switch len(tokens) {
	case 0, 1:
		p.Send("What do you want to smell?")
	default:
		if desc, ok := trySense(SenseSmell, r, tokens[1]); ok {
			p.Send(desc)
		} else {
			p.Send("You don't want to smell that!")
		}
	}
}

func DoWho(p *Player, w *World, _ []string) {
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
	dir, err := ParseDirection(cmd)
	if err != nil {
		p.Send("%s isn't a direction!", cmd)
	}
	curRoom := w.rooms[p.roomId]

	nextRoomId, ok := curRoom.exits[dir]
	if !ok {
		p.Send("Can't go that way!")
		return
	}

	nextRoom := w.rooms[nextRoomId]
	curRoom.RemovePlayer(p)
	nextRoom.AddPlayer(p)
	DoLook(p, w, nil)
}

func DoCommands(p *Player, _ *World, _ []string) {
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

func trySense(sense SenseType, r *Room, target string) (string, bool) {
	target = strings.ToLower(target)
	if desc, ok := r.TryDescribeExtra(sense, target); ok {
		return desc, true
	}
	return "", false
}
