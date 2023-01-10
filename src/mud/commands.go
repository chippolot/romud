package mud

import (
	"fmt"
	"log"
	"sort"
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
		{DoAlias, []string{"alias"}, "Creates a new alias which expands to the subsequent text. If run alone, lists current aliases.", "alias gac get all corpse", true, 0, 0},
		{DoAttack, []string{"kill", "hit", "attack", "fight"}, "Begin attacking a target", "attack rat / fight rat / kill rat / hit rat", true, Cnd_Healthy, Pos_Standing},
		{DoListCommands, []string{"commands"}, "Lists available commands", "commands", true, 0, 0},
		{DoDrop, []string{"drop"}, "Drops an item", "drop sword", true, Cnd_Healthy, Pos_Sitting},
		{DoGet, []string{"get"}, "Picks up an item", "get sword / get all bag", true, Cnd_Healthy, Pos_Sitting},
		{DoGive, []string{"give"}, "Gives an item to something else", "give sword soldier", true, Cnd_Healthy, Pos_Sitting},
		{DoInventory, []string{"inventory", "i"}, "Describes which items you are currently carrying", "inventory cat", true, 0, 0},
		{DoListen, []string{"listen"}, "Describes the sound of an object", "listen cat", false, Cnd_Healthy, Pos_Prone},
		{DoLook, []string{"look", "l"}, "Describes the current room or object in room", "look / look cat", true, Cnd_Healthy, Pos_Prone},
		{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north", false, Cnd_Healthy, Pos_Standing},
		{DoPut, []string{"put", "place"}, "Places an item in a container", "put sword in bag", true, Cnd_Healthy, Pos_Sitting},
		{DoQuit, []string{"quit"}, "Quits the game", "quit", false, 0, 0}, // TODO handle this here!
		{DoSave, []string{"save"}, "Saves the game", "save", false, Cnd_Healthy, 0},
		{DoSay, []string{"say"}, "Say something in the current room", "say hi", true, Cnd_Healthy, Pos_Prone},
		{DoShove, []string{"shove"}, "Attempts to shove an opponent during combat. If successful, opponent is knocked down.", "shove goblin", true, Cnd_Healthy, Pos_Standing},
		{DoSit, []string{"sit"}, "Sit down on the ground", "sit", false, Cnd_Healthy, Pos_Prone},
		{DoSleep, []string{"sleep"}, "Fall asleep to refresh yourself", "sleep", false, Cnd_Healthy, Pos_Sleeping},
		{DoSmell, []string{"smell"}, "Describes the smell of an object", "smell goo", false, Cnd_Healthy, Pos_Sitting},
		{DoStand, []string{"stand"}, "Stands up", "stand", true, Cnd_Healthy, Pos_Prone},
		{DoStatus, []string{"st", "status"}, "Displays status for the current player", "status", true, 0, 0},
		{DoTaste, []string{"taste"}, "Describes the taste of an object", "taste goo", false, Cnd_Healthy, Pos_Sitting},
		{DoTouch, []string{"touch"}, "Describes the touch of an object", "touch goo", false, Cnd_Healthy, Pos_Sitting},
		{DoUnalias, []string{"unalias"}, "Removes an existing alias", "unalias", true, 0, 0},
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

	if e.player != nil {
		if alias, ok := e.player.data.Aliases[cmd]; ok {
			return ProcessCommand(e, w, append(strings.Split(alias, " "), tokens[1:]...))
		}
	}

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
	q, ok, tokens := parseSearchQuery(tokens[1:], false)
	if !ok {
		SendToPlayer(e, "What do you want to attack?")
		return
	}

	r := w.rooms[e.data.RoomId]
	tgts := r.SearchEntities(q)
	if len(tgts) == 0 {
		SendToPlayer(e, "They don't seem to be here...")
		return
	}
	tgt := tgts[0]
	if tgt == e {
		SendToPlayer(e, "Stop hitting yourself!")
		BroadcastToRoomExcept(r, e, "%s hits %sself??", e.Name(), e.Gender().GetObjectPronoun())
		return
	}
	performAttack(e, w, tgt)
}

func DoShove(e *Entity, w *World, tokens []string) {
	q, ok, tokens := parseSearchQuery(tokens[1:], false)
	if !ok {
		SendToPlayer(e, "What do you want to shove?")
		return
	}

	r := w.rooms[e.data.RoomId]
	tgts := r.SearchEntities(q)
	if len(tgts) == 0 {
		SendToPlayer(e, "They don't seem to be here...")
		return
	}

	tgt := tgts[0]
	if tgt == e {
		SendToPlayer(e, "Good luck with that!")
		BroadcastToRoomExcept(r, e, "%s tries to showve %sself but just ends up looking ridiculous", e.Name(), e.Gender().GetObjectPronoun())
		return
	}

	performShove(e, w, tgt)
}

func DoGet(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to get?")
		return
	}

	r := w.rooms[e.data.RoomId]

	// Trying to get something from a container?
	containerQuery, ok, tokens := parseSearchQuery(tokens, false)
	if ok {
		contianers := SearchItems(containerQuery, e, r)
		if len(contianers) == 0 {
			SendToPlayer(e, "You don't see '%s' here", containerQuery.Keyword)
			return
		}

		// Make sure it's a container
		containerItem := contianers[0]
		if !containerItem.cfg.Flags.Has(IFlag_Container) {
			SendToPlayer(e, "The %s is not a container", containerItem.Name())
			return
		}

		// Get the items
		items := containerItem.SearchItems(itemQuery)
		if len(items) == 0 {
			SendToPlayer(e, "The %s is empty", containerItem.Name())
		} else {
			performGet(e, w,
				func(i *Item) string { return fmt.Sprintf("You get %s from %s", i.Name(), containerItem.Name()) },
				func(i *Item) string {
					return fmt.Sprintf("%s gets %s from %s", e.NameCapitalized(), i.Name(), containerItem.Name())
				},
				containerItem, items...)
		}
	} else {
		// Find item in room
		items := r.SearchItems(itemQuery)
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

func DoGive(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to give and to whom?")
		return
	}

	r := w.rooms[e.data.RoomId]

	// Find the target
	targetQuery, ok, tokens := parseSearchQuery(tokens, false)
	if !ok {
		SendToPlayer(e, "Who do you want to give that to?")
		return
	}
	targets := r.SearchEntities(targetQuery)
	if len(targets) == 0 {
		SendToPlayer(e, "They don't seem to be here")
		return
	}
	target := targets[0]

	// Find the item
	items := e.SearchItems(itemQuery)
	if len(items) == 0 {
		SendToPlayer(e, "You're not carrying '%s'", itemQuery.Keyword)
		return
	}
	for _, item := range items {
		// Perform transfer and notify
		e.RemoveItem(item)
		target.AddItem(item)

		SendToPlayer(e, "You give %s to %s", item.Name(), target.Name())
		BroadcastToRoomExcept(r, e, "%s gives %s to %s", e.NameCapitalized(), item.Name(), target.Name())
	}
}

func DoPut(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to put and in where?")
		return
	}

	r := w.rooms[e.data.RoomId]

	// Find the container
	containerQuery, ok, tokens := parseSearchQuery(tokens, false)
	if !ok {
		SendToPlayer(e, "What do you want to put that in?")
		return
	}
	containers := e.SearchItems(containerQuery)
	if len(containers) == 0 {
		SendToPlayer(e, "You don't seem to be holding '%s'", containerQuery.Keyword)
		return
	}
	container := containers[0]

	// Find the item
	items := e.SearchItems(itemQuery)
	if len(items) == 0 {
		SendToPlayer(e, "You're not carrying '%s'", itemQuery.Keyword)
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
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to drop?")
		return
	}

	r := w.rooms[e.data.RoomId]

	if items := e.SearchItems(itemQuery); len(items) == 0 {
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
		containerQuery, ok, _ := parseSearchQuery(tokens[2:], false)
		if !ok {
			SendToPlayer(e, "What do you want to look in?")
			return
		}
		if containers := SearchItems(containerQuery, e, r); len(containers) > 0 {
			SendToPlayer(e, containers[0].DescribeContents())
			return
		}
		SendToPlayer(e, "You don't see that here.")
		return
	}

	// Try to resolve item
	// TODO THIS

	// Try to resolve entity
	// TODO THIS

	// Try to resolve perceptible or get rid of this system
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

func DoAlias(e *Entity, w *World, tokens []string) {
	if e.player == nil {
		return
	}
	switch len(tokens) {
	case 0, 1:
		var sb utils.StringBuilder
		sb.WriteLine("Current Aliases")
		sb.WriteHorizontalDivider()
		aliasKeys := utils.Keys(e.player.data.Aliases)
		sort.Strings(aliasKeys)
		for _, aKey := range aliasKeys {
			sb.WriteLinef("  %s -> %s", aKey, e.player.data.Aliases[aKey])
		}
		SendToPlayer(e, sb.String())
	case 2:
		SendToPlayer(e, "What do you want %s to expand to?", tokens[1])
	default:
		if _, ok := CommandsLookup[tokens[1]]; ok {
			SendToPlayer(e, "Cannot add alias %s -- command already exists", tokens[1])
			return
		}
		e.player.data.Aliases[tokens[1]] = strings.Join(tokens[2:], " ")
		SendToPlayer(e, "Added alias for %s", tokens[1])
	}
}

func DoUnalias(e *Entity, w *World, tokens []string) {
	if e.player == nil {
		return
	}
	switch len(tokens) {
	case 0, 1:
		SendToPlayer(e, "What do you want to unalias?")
	default:
		aliasKey := tokens[1]
		if _, ok := e.player.data.Aliases[aliasKey]; !ok {
			SendToPlayer(e, "You don't have an alias for %s", tokens[1])
		} else {
			delete(e.player.data.Aliases, aliasKey)
			SendToPlayer(e, "Removed alias for %s", tokens[1])
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
	sb.WriteLinef("Attack : %s", attack.Damage.StringColorized("yellow"))
	sb.WriteLinef("AC     : <c yellow>%d</c>", e.data.Stats.AC)
	sb.WriteNewLine()
	sb.WriteLinef("Str    : <c yellow>%d</c>", e.data.Stats.Str)
	sb.WriteLinef("Dex    : <c yellow>%d</c>", e.data.Stats.Dex)
	sb.WriteLinef("Con    : <c yellow>%d</c>", e.data.Stats.Con)
	sb.WriteLinef("Int    : <c yellow>%d</c>", e.data.Stats.Int)
	sb.WriteLinef("Wis    : <c yellow>%d</c>", e.data.Stats.Wis)
	sb.WriteLinef("Cha    : <c yellow>%d</c>", e.data.Stats.Cha)
	sb.WriteNewLine()
	sb.WriteLinef("Carry  : <c yellow>%d</c>/<c yellow>%d</c>", e.ItemWeight(), e.data.Stats.CarryingCapacity())
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

func DoListCommands(e *Entity, _ *World, _ []string) {
	var sb utils.StringBuilder
	sb.WriteLine("Available Commands:")
	sb.WriteHorizontalDivider()
	for _, cmd := range Commands {
		if len(cmd.aliases) == 1 {
			sb.WriteLinef("%-20s: %s", cmd.aliases[0], cmd.desc)
		} else {
			lines := utils.LineBreak(strings.Join(cmd.aliases, ","), 15, ",")
			sb.WriteLinef("%-20s: %s", lines[0], cmd.desc)
			for i := 1; i < len(lines); i++ {
				sb.WriteLinef("  %s", lines[i])
			}
		}
	}
	SendToPlayer(e, sb.String())
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
	q, _, tokens := parseSearchQuery(tokens, false)
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

		if e.ItemWeight()+item.ItemWeight() > e.data.Stats.CarryingCapacity() {
			SendToPlayer(e, "You can't hold the weight of %s", item.Name())
			continue
		}

		// Start transfer
		from.RemoveItem(item)

		// Some items crumble!
		if item.cfg.Flags.Has(IFlag_Crumbles) {
			SendToPlayer(e, "%s crumbles to dust as you touch it", item.NameCapitalized())
			BroadcastToRoomExcept(r, e, "%s crumbles to dust as %s touches it", item.NameCapitalized(), e.Name())

			// Drop all items in parent container
			if item.cfg.Flags.Has(IFlag_Container) {
				for _, i2 := range item.RemoveAllFromContainer() {
					from.AddItem(i2)
					BroadcastToRoom(r, "%s falls to the floor", i2.Name())
				}
			}
			continue
		} else {
			// Finish transfer and notify
			e.AddItem(item)
			SendToPlayer(e, playerMsgFn(item))
			BroadcastToRoomExcept(r, e, roomMsgFn(item))
		}
	}
}

func parseSearchQuery(tokens []string, allowCount bool) (SearchQuery, bool, []string) {
	numToks := len(tokens)
	if numToks == 0 {
		return SearchQuery{}, false, tokens
	}
	if num, err := strconv.Atoi(tokens[0]); err == nil {
		if numToks == 1 {
			return SearchQuery{}, false, tokens
		}
		return NewSearchQuery(tokens[1], num), true, tokens[2:]
	}
	return NewSearchQuery(tokens[0], 1), true, tokens[1:]
}
