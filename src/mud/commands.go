package mud

import (
	"fmt"
	"log"
	"strconv"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

type ActionFunc func(e *Entity, world *World, tokens []string)

type CommandDesc struct {
	fn                ActionFunc
	aliases           []string
	desc              string
	usage             string
	allowDuringCombat bool
	minCondition      Condition
	minPosition       Position
}

type CommandMap map[string]*CommandDesc
type CommandList []*CommandDesc

var CommandsLookup CommandMap
var Commands CommandList

func init() {
	Commands = []*CommandDesc{
		{DoAdmin, []string{"admin"}, "Runs an admin command", "admin {command} {params}", true, 0, 0},
		{DoAttack, []string{"kill", "hit", "attack", "fight"}, "Begin attacking a target", "attack rat / fight rat / kill rat / hit rat", true, Cnd_Healthy, Pos_Standing},
		{DoCommands, []string{"commands"}, "Lists available commands", "commands", true, 0, 0},
		{DoListen, []string{"listen"}, "Describes the sound of an object", "hear cat", false, Cnd_Healthy, Pos_Prone},
		{DoLook, []string{"look", "l"}, "Describes the current room or object in room", "look / look cat", true, Cnd_Healthy, Pos_Prone},
		{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north", false, Cnd_Healthy, Pos_Standing},
		{DoQuit, []string{"quit"}, "Quits the game", "quit", false, 0, 0}, // TODO handle this here!
		{DoSave, []string{"save"}, "Saves the game", "save", false, Cnd_Healthy, 0},
		{DoSay, []string{"say"}, "Say something in the current room", "say hi", true, Cnd_Healthy, Pos_Prone},
		{DoSit, []string{"sit"}, "Sit down on the ground", "sit", false, Cnd_Healthy, Pos_Prone},
		{DoSleep, []string{"sleep"}, "Fall asleep to refresh yourself", "sleep", false, Cnd_Healthy, Pos_Sleeping},
		{DoSmell, []string{"smell"}, "Describes the smell of an object", "smell goo", false, Cnd_Healthy, Pos_Sitting},
		{DoStand, []string{"stand"}, "Stands up", "stand", true, Cnd_Healthy, Pos_Prone},
		{DoTaste, []string{"taste"}, "Describes the taste of an object", "taste goo", false, Cnd_Healthy, Pos_Sitting},
		{DoTouch, []string{"touch"}, "Describes the touch of an object", "touch goo", false, Cnd_Healthy, Pos_Sitting},
		{DoWake, []string{"wake", "awake"}, "Wakes up from sleeep", "wake / awake", false, Cnd_Healthy, Pos_Sleeping},
		{DoWhisper, []string{"whisper", "wh"}, "Whisper something to a specific player", "whisper lancelot Hi buddy!", true, Cnd_Healthy, Pos_Prone},
		{DoWho, []string{"who"}, "Lists all online players", "who", true, 0, 0},
		{DoYell, []string{"yell", "y"}, "Yell something to the whole world!", "yell hello everyone!", true, Cnd_Healthy, Pos_Prone},
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

func ProcessCommand(e *Entity, w *World, tokens []string) bool {
	cmd := strings.ToLower(tokens[0])

	tokens[0] = cmd
	if cmdDesc, ok := CommandsLookup[cmd]; ok {
		// TODO Check if command can be performed in current state
		if e.combat != nil && !cmdDesc.allowDuringCombat {
			SendToPlayer(e, "Things are a little too chaotic for that!")
			return false
		}
		if e.position < cmdDesc.minPosition {
			SendToPlayer(e, e.position.InactionString())
			return false
		}
		if e.data.Stats.Condition() < cmdDesc.minCondition {
			SendToPlayer(e, e.data.Stats.Condition().InactionString())
			return false
		}

		if cmdDesc.fn != nil {
			cmdDesc.fn(e, w, tokens)
			return true
		}
	}

	SendToPlayer(e, "Huh??")
	return false
}

func DoAdmin(e *Entity, w *World, tokens []string) {
	tokens = lowerTokens(tokens)

	if len(tokens) < 2 {
		SendToPlayer(e, "What command do you want to run?")
		return
	}

	switch tokens[1] {
	case "pkill":
		applyDamage(e, w, nil, 9999, Dam_Admin)
	case "pdam":
		dam, _ := strconv.Atoi(tokens[2])
		applyDamage(e, w, nil, dam, Dam_Admin)
	default:
		SendToPlayer(e, "Unrecognized admin command: %s", tokens[1])
	}
}

func DoAttack(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		SendToPlayer(e, "What do you want to attack?")
	default:
		r := w.rooms[e.data.RoomId]
		tgt, ok := TryGetEntityByKeywords(lowerTokens(tokens[1:]), r.entities, e)
		if !ok {
			SendToPlayer(e, "They don't seem to be here...")
			return
		}
		if tgt == e {
			SendToPlayer(e, "Stop hitting yourself!")
			BroadcastToRoomExcept(r, e, "%s hits %sself??", e.Name(), e.player.data.Gender.GetObjectPronoun())
			return
		}
		if e.data.Stats.Condition() <= Cnd_Stunned {
			SendToPlayer(e, "You're in no condition to fight!")
			return
		}
		performAttack(e, w, tgt)
	}
}

func DoSay(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to say?")
	}
	msg := strings.Join(tokens[1:], " ")

	SendToPlayer(e, "Ok.")

	r := w.rooms[e.data.RoomId]
	BroadcastToRoomExcept(r, e, "%s says, '%s'", e.Name(), msg)
}

func DoYell(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to yell?")
	}
	msg := strings.Join(tokens[1:], " ")

	SendToPlayer(e, "Ok.")
	BroadcastToWorldExcept(w, e, "%s yells, '%s'", e.Name(), msg)
}

func DoWhisper(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		SendToPlayer(e, "What do you want to whisper to who?")
	case 2:
		SendToPlayer(e, "What do you want to whisper to %s?", tokens[1])
	default:
		name := tokens[1]
		msg := strings.Join(tokens[2:], " ")
		if name == e.Name() {
			SendToPlayer(e, "You try whispering to yourself")
			return
		} else if te, ok := TryGetEntityByName(name, w.entities); ok {
			SendToPlayer(e, "Ok.")
			if te.player != nil {
				SendToPlayer(te, "%s whispers to you, %s", e.Name(), msg)
			}
		} else {
			SendToPlayer(e, "No player named %s is online", name)
		}
	}
}

func DoLook(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]
	switch len(tokens) {
	case 0, 1:
		SendToPlayer(e, r.Describe(e))
	default:
		if desc, ok := tryPerceive(SenseLook, lowerTokens(tokens[1:]), e, w); ok {
			SendToPlayer(e, desc)
		} else {
			SendToPlayer(e, "You don't see that here.")
		}
	}
}

func DoListen(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 0, 1:
		SendToPlayer(e, "What do you want to listen to?")
	default:
		if desc, ok := tryPerceive(SenseListen, lowerTokens(tokens[1:]), e, w); ok {
			SendToPlayer(e, desc)
		} else {
			SendToPlayer(e, "You don't hear that here.")
		}
	}
}

func DoTaste(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 0, 1:
		SendToPlayer(e, "What do you want to taste?")
	default:
		if desc, ok := tryPerceive(SenseTaste, lowerTokens(tokens[1:]), e, w); ok {
			SendToPlayer(e, desc)
		} else {
			SendToPlayer(e, "You don't want to taste that!")
		}
	}
}

func DoTouch(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 0, 1:
		SendToPlayer(e, "What do you want to touch?")
	default:
		if desc, ok := tryPerceive(SenseTouch, lowerTokens(tokens[1:]), e, w); ok {
			SendToPlayer(e, desc)
		} else {
			SendToPlayer(e, "You don't want to touch that!")
		}
	}
}

func DoSmell(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 0, 1:
		SendToPlayer(e, "What do you want to smell?")
	default:
		if desc, ok := tryPerceive(SenseSmell, lowerTokens(tokens[1:]), e, w); ok {
			SendToPlayer(e, desc)
		} else {
			SendToPlayer(e, "You don't want to smell that!")
		}
	}
}

func DoSit(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sitting {
		SendToPlayer(e, "But you're already sitting!")
		return
	}

	oldPos := e.position
	e.position = Pos_Sitting

	r := w.rooms[e.data.RoomId]
	if oldPos == Pos_Prone {
		SendToPlayer(e, "You sit up")
		BroadcastToRoomExcept(r, e, "%s sits up", e.Name())
	} else {
		SendToPlayer(e, "You sit down")
		BroadcastToRoomExcept(r, e, "%s sits down", e.Name())
	}
}

func DoSleep(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sleeping {
		SendToPlayer(e, "But you're already sleeping!")
		return
	}
	e.position = Pos_Sleeping
	SendToPlayer(e, "You lie down and doze off...")

	r := w.rooms[e.data.RoomId]
	BroadcastToRoomExcept(r, e, "%s lies down and falls asleep", e.Name())
}

func DoWake(e *Entity, w *World, _ []string) {
	if e.position != Pos_Sleeping {
		SendToPlayer(e, "But you're not sleeping!")
		return
	}
	e.position = Pos_Prone
	SendToPlayer(e, "You open your eyes and wake up")

	r := w.rooms[e.data.RoomId]
	BroadcastToRoomExcept(r, e, "%s wakes up", e.Name())
}

func DoStand(e *Entity, w *World, _ []string) {
	if e.position == Pos_Standing {
		SendToPlayer(e, "But you're already standing!")
		return
	}
	e.position = Pos_Standing

	r := w.rooms[e.data.RoomId]
	if e.combat != nil {
		SendToPlayer(e, "You scramble back to your feet!")
		BroadcastToRoomExcept(r, e, "%s scrambles back to their feet", e.Name())
	} else {
		SendToPlayer(e, "You stand up")
		BroadcastToRoomExcept(r, e, "%s stands up", e.Name())
	}
}

func DoWho(e *Entity, w *World, _ []string) {
	lines := make([]string, 0)
	lines = append(lines, fmt.Sprintf("Online Players: %d", len(w.players)))
	lines = append(lines, utils.HorizontalDivider)
	lines = append(lines, fmt.Sprintf("(you)\t%s", e.Name()))
	for _, e2 := range w.players {
		if e2 != e {
			lines = append(lines, fmt.Sprintf("\t%s", e2.player.data.Name))
		}
	}
	SendToPlayer(e, strings.Join(lines, utils.NewLine))
}

func DoMove(e *Entity, w *World, tokens []string) {
	cmd := tokens[0]
	dir, err := ParseDirection(cmd)
	if err != nil {
		SendToPlayer(e, "%s isn't a direction!", cmd)
	}

	_ = performMove(e, w, dir)
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

	SendToPlayer(e, strings.Join(commands, utils.NewLine))
}

func DoSave(e *Entity, w *World, _ []string) {
	w.SavePlayerCharacter(e.player.id)
	SendToPlayer(e, "Saved game.")
}

func DoQuit(e *Entity, w *World, _ []string) {
	if e.player != nil {
		w.LogoutPlayer(e.player)
	}
}

func tryPerceive(sense SenseType, tokens []string, perceiver *Entity, w *World) (string, bool) {
	// First try and resolve entity in room
	r := w.rooms[perceiver.data.RoomId]
	tgt, ok := TryGetEntityByKeywords(tokens, r.entities, perceiver)
	if ok {
		if desc, ok := tgt.TryPerceive(sense, tokens); ok {
			return desc, true
		}
	}

	// Then try and resolve room element
	if desc, ok := r.TryPerceive(sense, tokens); ok {
		return desc, true
	}

	// Nothing found...
	return "", false
}

func lowerTokens(tokens []string) []string {
	for i, s := range tokens {
		tokens[i] = strings.ToLower(s)
	}
	return tokens
}

func performMove(e *Entity, w *World, dir Direction) bool {
	if e.data.Stats.Mov <= 0 {
		SendToPlayer(e, "You're way too tired...")
		return false
	}
	if e.combat != nil {
		SendToPlayer(e, "You can't do that while you're fighting!")
		return false
	}
	if e.data.Stats.Condition() < Cnd_Healthy {
		SendToPlayer(e, "You're not feeling up for that!")
		return false
	}

	curRoom := w.rooms[e.data.RoomId]

	nextRoomId, ok := curRoom.cfg.Exits[dir]
	if !ok {
		SendToPlayer(e, "Can't go that way!")
		return false
	}

	nextRoom := w.rooms[nextRoomId]
	curRoom.RemoveEntity(e)
	nextRoom.AddEntity(e)

	fromDirStr := ""
	fromDir, err := dir.Reverse()
	if err != nil {
		fromDirStr = "somewhere"
	} else {
		fromDirStr = fromDir.String()
	}

	if e.player != nil {
		BroadcastToRoomExcept(curRoom, e, "%s leaves %s", e.Name(), dir.String())
	} else {
		BroadcastToRoom(curRoom, "%s wanders %s", e.Name(), dir.String())
	}

	if e.player != nil {
		BroadcastToRoomExcept(nextRoom, e, "%s enters from the %s", e.Name(), fromDirStr)
	} else {
		BroadcastToRoom(nextRoom, "%s wanders in from the %s", e.Name(), fromDirStr)
	}

	e.data.Stats.AddMov(-1)

	if e.player != nil {
		DoLook(e, w, nil)
	}
	return true
}
