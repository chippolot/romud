package mud

import (
	"fmt"
	"log"
	"strings"

	"github.com/chippolot/go-mud/src/mud/utils"
)

type ActionFunc func(e *Entity, world *World, tokens []string)

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
		{DoSave, []string{"save"}, "Saves the game", "save"},
		{nil, []string{"quit"}, "Quits the game", "quit"},
	}

	CommandsLookup = make(CommandMap)
	for _, cmd := range Commands {
		for _, alias := range cmd.aliases {
			if _, ok := CommandsLookup[alias]; ok {
				log.Fatalf("multiple commands registered with alias: %s", alias)
			}
			CommandsLookup[alias] = cmd
		}
	}
}

func DoSay(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		e.player.Send("What do you want to say?")
	}
	msg := strings.Join(tokens[1:], " ")

	e.player.Send("Ok.")

	r := w.rooms[e.data.RoomId]
	r.SendAllExcept(e.player.id, "%s says, '%s'", e.player.data.Name, msg)
}

func DoYell(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		e.player.Send("What do you want to yell?")
	}
	msg := strings.Join(tokens[1:], " ")

	e.player.Send("Ok.")
	w.SendAllExcept(e.player.id, "%s yells, '%s'", e.player.data.Name, msg)
}

func DoWhisper(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		e.player.Send("What do you want to whisper to who?")
	case 2:
		e.player.Send("What do you want to whisper to %s?", tokens[1])
	default:
		toName := tokens[1]
		msg := strings.Join(tokens[2:], " ")
		if toName == e.player.data.Name {
			e.player.Send("You try whispering to yourself")
			return
		} else if te, ok := w.TryGetEntityByName(toName); ok {
			e.player.Send("Ok.")
			if te.player != nil {
				te.player.Send("%s whispers to you, %s", e.player.data.Name, msg)
			}
		} else {
			e.player.Send("No player named %s is online", toName)
		}
	}
}

func DoLook(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]
	switch len(tokens) {
	case 0, 1:
		e.player.Send(r.Describe(e))
	default:
		if desc, ok := trySense(SenseLook, r, tokens[1]); ok {
			e.player.Send(desc)
		} else {
			e.player.Send("You don't see that here.")
		}
	}
}

func DoListen(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]
	switch len(tokens) {
	case 0, 1:
		e.player.Send("What do you want to listen to?")
	default:
		if desc, ok := trySense(SenseListen, r, tokens[1]); ok {
			e.player.Send(desc)
		} else {
			e.player.Send("You don't hear that here.")
		}
	}
}

func DoTaste(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]
	switch len(tokens) {
	case 0, 1:
		e.player.Send("What do you want to taste?")
	default:
		if desc, ok := trySense(SenseTaste, r, tokens[1]); ok {
			e.player.Send(desc)
		} else {
			e.player.Send("You don't want to taste that!")
		}
	}
}

func DoTouch(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]
	switch len(tokens) {
	case 0, 1:
		e.player.Send("What do you want to touch?")
	default:
		if desc, ok := trySense(SenseTouch, r, tokens[1]); ok {
			e.player.Send(desc)
		} else {
			e.player.Send("You don't want to touch that!")
		}
	}
}

func DoSmell(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]
	switch len(tokens) {
	case 0, 1:
		e.player.Send("What do you want to smell?")
	default:
		if desc, ok := trySense(SenseSmell, r, tokens[1]); ok {
			e.player.Send(desc)
		} else {
			e.player.Send("You don't want to smell that!")
		}
	}
}

func DoWho(e *Entity, w *World, _ []string) {
	lines := make([]string, 0)
	lines = append(lines, fmt.Sprintf("Online Players: %d", len(w.players)))
	lines = append(lines, utils.HorizontalDivider)
	lines = append(lines, fmt.Sprintf("(you)\t%s", e.player.data.Name))
	for _, e2 := range w.players {
		if e2 != e {
			lines = append(lines, fmt.Sprintf("\t%s", e2.player.data.Name))
		}
	}
	e.player.Send(strings.Join(lines, utils.NewLine))
}

func DoMove(e *Entity, w *World, tokens []string) {
	if e.data.Stats.Mov <= 0 {
		e.player.Send("You're way too tired...")
		return
	}

	cmd := tokens[0]
	dir, err := ParseDirection(cmd)
	if err != nil {
		e.player.Send("%s isn't a direction!", cmd)
	}
	curRoom := w.rooms[e.data.RoomId]

	nextRoomId, ok := curRoom.exits[dir]
	if !ok {
		e.player.Send("Can't go that way!")
		return
	}

	nextRoom := w.rooms[nextRoomId]
	curRoom.RemoveEntity(e)
	nextRoom.AddEntity(e)

	e.data.Stats.Mov--

	DoLook(e, w, nil)
}

func DoCommands(e *Entity, _ *World, _ []string) {
	commands := make([]string, 0)

	commands = append(commands, "Available Commands:")
	commands = append(commands, utils.HorizontalDivider)
	for _, cmd := range Commands {
		if len(cmd.aliases) == 1 {
			commands = append(commands, fmt.Sprintf("%s:", cmd.aliases[0]))
		} else {
			commands = append(commands, fmt.Sprintf("[%s]:", strings.Join(cmd.aliases, ",")))
		}
		commands = append(commands, fmt.Sprintf("\t%s", cmd.desc))
		commands = append(commands, fmt.Sprintf("\tUsage: %s", cmd.usage))
	}

	e.player.Send(strings.Join(commands, utils.NewLine))
}

func DoSave(e *Entity, w *World, _ []string) {
	w.SavePlayerCharacter(e.player.id)
	e.player.Send("Saved game.")
}

func trySense(sense SenseType, r *Room, target string) (string, bool) {
	target = strings.ToLower(target)
	if desc, ok := r.TryDescribeExtra(sense, target); ok {
		return desc, true
	}
	return "", false
}
