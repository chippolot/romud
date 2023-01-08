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
		{DoAdvance, []string{"advance"}, "Advances up to the next experience level", "advance", false, Cnd_Healthy, Pos_Sitting},
		{DoAttack, []string{"kill", "hit", "attack", "fight"}, "Begin attacking a target", "attack rat / fight rat / kill rat / hit rat", true, Cnd_Healthy, Pos_Standing},
		{DoCommands, []string{"commands"}, "Lists available commands", "commands", true, 0, 0},
		{DoDrop, []string{"drop"}, "Drops an item", "drop sword", true, Cnd_Healthy, Pos_Sitting},
		{DoGet, []string{"get"}, "Picks up an item", "get sword / get all bag", true, Cnd_Healthy, Pos_Sitting},
		{DoInventory, []string{"inventory", "i"}, "Describes which items you are currently carrying", "inventory cat", true, 0, 0},
		{DoListen, []string{"listen"}, "Describes the sound of an object", "listen cat", false, Cnd_Healthy, Pos_Prone},
		{DoLook, []string{"look", "l"}, "Describes the current room or object in room", "look / look cat", true, Cnd_Healthy, Pos_Prone},
		{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north", false, Cnd_Healthy, Pos_Standing},
		{DoPut, []string{"put", "place"}, "Places an item in a container", "put sword in bag", true, Cnd_Healthy, Pos_Sitting},
		{DoQuit, []string{"quit"}, "Quits the game", "quit", false, 0, 0}, // TODO handle this here!
		{DoSave, []string{"save"}, "Saves the game", "save", false, Cnd_Healthy, 0},
		{DoSay, []string{"say"}, "Say something in the current room", "say hi", true, Cnd_Healthy, Pos_Prone},
		{DoSit, []string{"sit"}, "Sit down on the ground", "sit", false, Cnd_Healthy, Pos_Prone},
		{DoSleep, []string{"sleep"}, "Fall asleep to refresh yourself", "sleep", false, Cnd_Healthy, Pos_Sleeping},
		{DoSmell, []string{"smell"}, "Describes the smell of an object", "smell goo", false, Cnd_Healthy, Pos_Sitting},
		{DoStand, []string{"stand"}, "Stands up", "stand", true, Cnd_Healthy, Pos_Prone},
		{DoStatus, []string{"status"}, "Displays status for the current player", "status", true, 0, 0},
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

	r := w.rooms[e.data.RoomId]

	switch tokens[1] {
	case "pkill":
		dam := 9999
		SendToPlayer(e, "Admin: Damaging Player for %d", dam)
		applyDamage(e, w, nil, dam, DamCtx_Admin, Dam_Slashing, "hit", "hits")
	case "pheal":
		heal := 9999
		SendToPlayer(e, "Admin: Healing Player for %d", heal)
		e.data.Stats.AddHP(heal)
	case "pdam":
		dam, _ := strconv.Atoi(tokens[2])
		SendToPlayer(e, "Admin: Damaging Player for %d", dam)
		applyDamage(e, w, nil, dam, DamCtx_Admin, Dam_Slashing, "hit", "hits")
	case "pxp":
		xp, _ := strconv.Atoi(tokens[2])
		applyXp(e, xp)
		SendToPlayer(e, "Added XP %d", xp)
	case "spawne":
		key := tokens[2]
		if cfg, ok := w.TryGetEntityConfig(key); ok {
			ent := NewEntity(cfg)
			w.AddEntity(ent, r.cfg.Id)
			SendToPlayer(e, "Admin: Spawned Entity %s", key)
		} else {
			SendToPlayer(e, "Admin: Failed to load entity %s", key)
		}
	case "spawni":
		key := tokens[2]
		if cfg, ok := w.TryGetItemConfig(key); ok {
			itm := NewItem(cfg)
			w.AddItem(itm, r.cfg.Id)
			SendToPlayer(e, "Admin: Spawned Item %s", key)
		} else {
			SendToPlayer(e, "Admin: Failed to load item %s", key)
		}
	default:
		SendToPlayer(e, "Admin: Unrecognized command: %s", tokens[1])
	}
}

func DoAdvance(e *Entity, w *World, _ []string) {
	if !IsReadyForLevelUp(e) {
		SendToPlayer(e, "You need more experience to advance to the next level")
		return
	}

	e.data.Stats.Level += 1

	// TODO Class hit die
	// TODO Handle stat increases
	hpGain := D8.Roll() + GetAbilityModifier(e.data.Stats.Con)
	e.data.Stats.MaxHP += utils.MaxInts(1, hpGain)

	SendToPlayer(e, "You advance to level %d!", e.data.Stats.Level)
	SendToPlayer(e, "  You gain %d hp", hpGain)
	BroadcastToWorldExcept(w, e, "Hooray! %s is now level %d", e.Name(), e.data.Stats.Level)

	if e.player != nil {
		w.SavePlayerCharacter(e.player.id)
	}
}

func DoAttack(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		SendToPlayer(e, "What do you want to attack?")
	default:
		r := w.rooms[e.data.RoomId]
		q := NewSearchQuery(lowerTokens(tokens[1:])...)
		tgts := r.SearchEntities(q)
		if len(tgts) == 0 {
			SendToPlayer(e, "They don't seem to be here...")
			return
		}
		tgt := tgts[0]
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

func DoGet(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to get?")
		return
	}

	r := w.rooms[e.data.RoomId]

	// Trying to get something from a container?
	// TODO do not require 'from' here!
	if idx := utils.FindIndex(tokens, "from"); idx != -1 {
		if len(tokens) == idx+1 {
			SendToPlayer(e, "What do you want to get something out of?")
			return
		}
		if idx == 1 {
			SendToPlayer(e, "What do you want to get from that?")
		}

		// Find the container and item
		containerQuery := NewSearchQuery(lowerTokens(tokens[idx+1:])...)
		contianers := SearchItems(containerQuery, e, r)
		if len(contianers) == 0 {
			SendToPlayer(e, "You see %s here", containerQuery.Joined)
			return
		}

		// Make sure it's a container
		containerItem := contianers[0]
		if !containerItem.cfg.Flags.Has(IFlag_Container) {
			SendToPlayer(e, "The %s is not a container", containerItem.Name())
			return
		}

		// Get the items
		items := containerItem.SearchItems(NewSearchQuery(lowerTokens(tokens[1:idx])...))
		if len(items) == 0 {
			SendToPlayer(e, "The %s is empty", containerItem.Name())
		} else {
			performGet(e, w,
				func(i *Item) string { return fmt.Sprintf("You take out %s from %s", i.Name(), containerItem.Name()) },
				func(i *Item) string {
					return fmt.Sprintf("%s takes out %s from %s", e.NameCapitalized(), i.Name(), containerItem.Name())
				},
				containerItem, items...)
		}

	} else {
		// Find item in room
		q := NewSearchQuery(lowerTokens(tokens[1:])...)
		items := r.SearchItems(q)
		if len(items) == 0 {
			SendToPlayer(e, "You don't see that here...")
			return
		}
		performGet(e, w,
			func(i *Item) string { return fmt.Sprintf("You pick up %s", i.Name()) },
			func(i *Item) string { return fmt.Sprintf("%s picks up %s", e.NameCapitalized(), i.Name()) },
			r, items...)
	}
}

func DoPut(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to put and in what?")
		return
	}

	r := w.rooms[e.data.RoomId]

	// Trying to put something from a container?
	// TODO do not require 'in' here!
	idx := utils.FindIndex(tokens, "in")
	if idx == -1 || len(tokens) == idx+1 {
		SendToPlayer(e, "What do you want to put that in?")
		return
	}
	if idx == 1 {
		SendToPlayer(e, "What do you want to put in that?")
	}

	// Find the container
	containerQuery := NewSearchQuery(lowerTokens(tokens[idx+1:])...)
	containers := e.SearchItems(containerQuery)
	if len(containers) == 0 {
		SendToPlayer(e, "You don't seem to be holding '%s'", containerQuery.Joined)
		return
	}
	container := containers[0]

	// Find the item
	itemQuery := NewSearchQuery(lowerTokens(tokens[1:idx])...)
	items := e.SearchItems(itemQuery)
	if len(items) == 0 {
		SendToPlayer(e, "You don't see %s here", itemQuery.Joined)
		return
	} else if len(items) == 1 && items[0] == container {
		SendToPlayer(e, "You can't put that in itself!")
		return
	}
	for _, item := range items {
		if item == container {
			continue
		}

		// Perform transfer and notify
		e.RemoveItem(item)
		container.AddItem(item)

		SendToPlayer(e, "You put %s in %s", item.Name(), container.Name())
		BroadcastToRoomExcept(r, e, "%s puts %s in %s", e.NameCapitalized(), item.Name(), container.Name())
	}
}

func DoDrop(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to drop?")
		return
	}

	r := w.rooms[e.data.RoomId]

	q := NewSearchQuery(lowerTokens(tokens[1:])...)
	if items := e.SearchItems(q); len(items) == 0 {
		SendToPlayer(e, "You don't have one of those...")
	} else {
		for _, item := range items {
			e.RemoveItem(item)
			r.AddItem(item)
			SendToPlayer(e, "You drop %s", item.Name())
			BroadcastToRoomExcept(r, e, "%s drops %s", e.NameCapitalized(), item.Name())
		}
	}
}

func DoInventory(e *Entity, _ *World, _ []string) {
	SendToPlayer(e, "You are carrying:")
	if len(e.inventory) == 0 {
		SendToPlayer(e, "  Nothing.")
		return
	}
	for _, i := range e.inventory {
		SendToPlayer(e, "  <c white>%s</c>", i.NameCapitalized())
	}
}

func DoSay(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to say?")
	}
	msg := strings.Join(tokens[1:], " ")

	SendToPlayer(e, "Ok.")

	r := w.rooms[e.data.RoomId]
	BroadcastToRoomExcept(r, e, "%s says, '%s'", e.NameCapitalized(), msg)
}

func DoYell(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to yell?")
	}
	msg := strings.Join(tokens[1:], " ")

	SendToPlayer(e, "Ok.")
	BroadcastToWorldExcept(w, e, "%s yells, '%s'", e.NameCapitalized(), msg)
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
				SendToPlayer(te, "%s whispers to you, %s", e.NameCapitalized(), msg)
			}
		} else {
			SendToPlayer(e, "No player named %s is online", name)
		}
	}
}

func DoLook(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		SendToPlayer(e, r.Describe(e))
		return
	}

	// TODO further generify searching

	// Is the player trying to look in something?
	if tokens[1] == "in" {
		if numtoks <= 2 {
			SendToPlayer(e, "What do you want to look in?")
			return
		}
		q := NewSearchQuery(lowerTokens(tokens[2:])...)
		if items := SearchItems(q, e, r); len(items) > 0 {
			SendToPlayer(e, items[0].DescribeContents())
			return
		}
		SendToPlayer(e, "You don't see that here.")
		return
	}

	// Try to resolve item
	// TODO THIS

	// Try to resolve entity
	// TODO THIS

	// Try to resolve perceptible
	// TODO THIS

	if desc, ok := tryPerceive(SenseLook, lowerTokens(tokens[1:]), e, w); ok {
		SendToPlayer(e, desc)
	} else {
		SendToPlayer(e, "You don't see that here.")
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
		BroadcastToRoomExcept(r, e, "%s sits up", e.NameCapitalized())
	} else {
		SendToPlayer(e, "You sit down")
		BroadcastToRoomExcept(r, e, "%s sits down", e.NameCapitalized())
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
	BroadcastToRoomExcept(r, e, "%s lies down and falls asleep", e.NameCapitalized())
}

func DoWake(e *Entity, w *World, _ []string) {
	if e.position != Pos_Sleeping {
		SendToPlayer(e, "But you're not sleeping!")
		return
	}
	e.position = Pos_Prone
	SendToPlayer(e, "You open your eyes and wake up")

	r := w.rooms[e.data.RoomId]
	BroadcastToRoomExcept(r, e, "%s wakes up", e.NameCapitalized())
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
		BroadcastToRoomExcept(r, e, "%s scrambles back to their feet", e.NameCapitalized())
	} else {
		SendToPlayer(e, "You stand up")
		BroadcastToRoomExcept(r, e, "%s stands up", e.NameCapitalized())
	}
}

func DoStatus(e *Entity, w *World, _ []string) {
	attack := e.cfg.Attacks[0]

	var sb utils.StringBuilder
	sb.WriteHorizontalDivider()
	sb.WriteLinef("%s", e.Name())
	sb.WriteNewLine()
	sb.WriteLinef("Level  : <c yellow>%d</c>", e.data.Stats.Level)
	if !IsMaxLevel(e) {
		sb.WriteLinef("Next   : <c yellow>%d</c> XP", GetXpForNextLevel(e))
	}
	sb.WriteNewLine()
	sb.WriteLinef("HP     : <c yellow>%d</c>/<c yellow>%d</c>", e.data.Stats.HP, e.data.Stats.MaxHP)
	sb.WriteLinef("Mov    : <c yellow>%d</c>/<c yellow>%d</c>", e.data.Stats.Mov, e.data.Stats.MaxMov)
	sb.WriteNewLine()
	sb.WriteLinef("ToHit  : +<c yellow>%d</c>", GetAbilityModifier(e.data.Stats.Str)+ProficiencyChart[e.data.Stats.Level])
	sb.WriteLinef("Attack : <c yellow>%v</c>", attack.Damage)
	sb.WriteLinef("AC     : <c yellow>%d</c>", e.data.Stats.AC)
	sb.WriteNewLine()
	sb.WriteLinef("Str    : <c yellow>%d</c>", e.data.Stats.Str)
	sb.WriteLinef("Dex    : <c yellow>%d</c>", e.data.Stats.Dex)
	sb.WriteLinef("Con    : <c yellow>%d</c>", e.data.Stats.Con)
	sb.WriteLinef("Int    : <c yellow>%d</c>", e.data.Stats.Int)
	sb.WriteLinef("Wis    : <c yellow>%d</c>", e.data.Stats.Wis)
	sb.WriteLinef("Cha    : <c yellow>%d</c>", e.data.Stats.Cha)
	sb.WriteString(utils.HorizontalDivider)
	SendToPlayer(e, sb.String())
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
	q := NewSearchQuery(tokens...)
	tgts := SearchEntities(q, perceiver, r)
	if len(tgts) > 0 {
		if desc, ok := tgts[0].TryPerceive(sense, tokens); ok {
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

	nextRoom, ok := w.rooms[nextRoomId]
	if !ok {
		log.Printf("Tried to move to invalid room id: %d", nextRoomId)
		SendToPlayer(e, "An unseen force blocks you from going there!")
		return false
	}
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
		BroadcastToRoomExcept(curRoom, e, "%s leaves %s", e.NameCapitalized(), dir.String())
	} else {
		BroadcastToRoom(curRoom, "%s wanders %s", e.NameCapitalized(), dir.String())
	}

	if e.player != nil {
		BroadcastToRoomExcept(nextRoom, e, "%s enters from the %s", e.NameCapitalized(), fromDirStr)
	} else {
		BroadcastToRoom(nextRoom, "%s wanders in from the %s", e.NameCapitalized(), fromDirStr)
	}

	e.data.Stats.AddMov(-1)

	if e.player != nil {
		DoLook(e, w, nil)
	}
	return true
}

func performGet(e *Entity, w *World, playerMsgFn func(*Item) string, roomMsgFn func(*Item) string, from ItemContainer, items ...*Item) {
	if len(items) == 0 {
		containerName := "something"
		if named, ok := from.(Named); ok {
			containerName = named.Name()
		}
		SendToPlayer(e, "The %s is empty", containerName)
		return
	}

	r := w.rooms[e.data.RoomId]

	for _, item := range items {

		// Can't pick up environmental items
		if item.cfg.Flags.Has(IFlag_Environmental) {
			SendToPlayer(e, "You can't pick that up!")
			continue
		}

		// Start transfer
		from.RemoveItem(item)

		// Some items crumble!
		if item.cfg.Flags.Has(IFlag_Crumbles) {
			// Drop all items in parent container
			if item.cfg.Flags.Has(IFlag_Container) {
				for _, i2 := range item.RemoveAllFromContainer() {
					from.AddItem(i2)
				}
			}
			SendToPlayer(e, "%s crumbles to dust as you touch it", item.NameCapitalized())
			BroadcastToRoomExcept(r, e, "%s crumbles to dust as %s touches it", item.NameCapitalized(), e.Name())
			continue
		} else {
			// Finish transfer and notify
			e.AddItem(item)
			SendToPlayer(e, playerMsgFn(item))
			BroadcastToRoomExcept(r, e, roomMsgFn(item))
		}
	}
}
