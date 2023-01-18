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
		{DoAlias, []string{"alias"}, "Creates a new alias which expands to the subsequent text. If run alone, lists current aliases.", "alias gac get all corpse", true, 0, 0},
		{DoAttack, []string{"kill", "hit", "attack", "fight"}, "Begin attacking a target", "attack rat / fight rat / kill rat / hit rat", true, Cnd_Healthy, Pos_Standing},
		{DoListCommands, []string{"commands"}, "Lists available commands", "commands", true, 0, 0},
		{DoDrop, []string{"drop"}, "Drops an item", "drop sword", true, Cnd_Healthy, Pos_Sitting},
		{DoEquip, []string{"equip", "wear"}, "Equips a carried item", "equip sword", false, Cnd_Healthy, Pos_Sitting},
		{DoEquipment, []string{"eq", "equipment"}, "Lists equipment you are using", "equipment", true, 0, 0},
		{DoGet, []string{"get"}, "Picks up an item", "get sword / get all bag", false, Cnd_Healthy, Pos_Sitting},
		{DoGive, []string{"give"}, "Gives an item to something else", "give sword soldier", false, Cnd_Healthy, Pos_Sitting},
		{DoInventory, []string{"inventory", "i"}, "Describes which items you are currently carrying", "inventory cat", true, 0, 0},
		{DoLook, []string{"look", "l"}, "Describes the current room or object in room", "look / look cat", true, Cnd_Healthy, Pos_Prone},
		{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north", false, Cnd_Healthy, Pos_Standing},
		{DoPut, []string{"put", "place"}, "Places an item in a container", "put sword in bag", true, Cnd_Healthy, Pos_Sitting},
		{DoQuit, []string{"quit"}, "Quits the game", "quit", false, 0, 0}, // TODO handle this here!
		{DoSave, []string{"save"}, "Saves the game", "save", false, Cnd_Healthy, 0},
		{DoSay, []string{"say"}, "Say something in the current room", "say hi", true, Cnd_Healthy, Pos_Prone},
		{DoShove, []string{"shove"}, "Attempts to shove an opponent during combat. If successful, opponent is knocked down.", "shove goblin", true, Cnd_Healthy, Pos_Standing},
		{DoSit, []string{"sit"}, "Sit down on the ground", "sit", false, Cnd_Healthy, Pos_Prone},
		{DoSleep, []string{"sleep"}, "Fall asleep to refresh yourself", "sleep", false, Cnd_Healthy, Pos_Sleeping},
		{DoStand, []string{"stand"}, "Stands up", "stand", true, Cnd_Healthy, Pos_Prone},
		{DoStatus, []string{"st", "status"}, "Displays status for the current player", "status", true, 0, 0},
		{DoUnalias, []string{"unalias"}, "Removes an existing alias", "unalias", true, 0, 0},
		{DoUnequip, []string{"unequip", "remove"}, "Unequips an equipped item", "unequip sword", false, Cnd_Healthy, Pos_Sitting},
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
			res := true
			aliasCommands := strings.Split(alias, ";")
			for _, aliasCommand := range aliasCommands {
				aliasCommand = strings.TrimSpace(aliasCommand)
				res = res && ProcessCommand(e, w, append(strings.Split(aliasCommand, " "), tokens[1:]...))
			}
			return res
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
		if e.stats.Condition() < cmdDesc.minCondition {
			SendToPlayer(e, e.stats.Condition().InactionString())
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

func DoAdvance(e *Entity, w *World, _ []string) {
	if !IsReadyForLevelUp(e) {
		SendToPlayer(e, "You need more experience to advance to the next level")
		return
	}

	e.stats.Add(Stat_Level, 1)

	// TODO Class hit die
	// TODO Handle stat increases
	hpGain := D8.Roll() + GetAbilityModifier(e.stats.Get(Stat_Con))
	e.stats.Add(Stat_MaxHP, utils.MaxInts(1, hpGain))

	SendToPlayer(e, "You advance to level %d!", e.stats.Get(Stat_Level))
	SendToPlayer(e, "  You gain %d hp", hpGain)
	BroadcastToWorldRe(w, e, SendRst_None, "Hooray! %s is now level %d", ObservableName(e), e.stats.Get(Stat_Level))

	if e.player != nil {
		w.SavePlayerCharacter(e.player.id)
	}
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
			SendToPlayer(e, "The %s is not a container", ObservableName(containerItem))
			return
		}

		// Get the items
		items := containerItem.SearchItems(itemQuery)
		if len(items) == 0 {
			SendToPlayer(e, "The %s is empty", ObservableName(containerItem))
		} else {
			// TODO FIX THESE OBSERVABLES
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
		// TODO FIX THESE OBSERVABLES
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

	if e.entityFlags.Has(EFlag_Blind) {
		SendToPlayer(e, "You can't see a thing!")
		return
	}

	targets := SearchEntities(targetQuery, e, r)
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

		SendToPlayer(e, "You give %s to %s", ObservableName(item), ObservableName(target))
		SendToPlayerRe(target, e, SendRst_CanSee, "%s give %s to you", ObservableNameCap(e), ObservableName(item))
		BroadcastToRoomRe2(w, e, target, SendRst_CanSee, "%s gives %s to %s", ObservableNameCap(e), ObservableName(item), ObservableName(target))
	}
}

func DoPut(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to put and in where?")
		return
	}

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
	if container.cfg.Flags.Has(IFlag_NoStorage) {
		SendToPlayer(e, "You can't store things in that!")
		return
	}

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

		SendToPlayer(e, "You put %s in %s", ObservableName(item), ObservableName(container))
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s puts %s in %s", ObservableNameCap(e), ObservableName(item), ObservableName(container))
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
		SendToPlayer(e, "You're not carrying '%s'", itemQuery.Keyword)
	} else {
		for _, item := range items {
			e.RemoveItem(item)
			r.AddItem(item)
			SendToPlayer(e, "You drop %s", ObservableName(item))
			BroadcastToRoomRe(w, e, SendRst_CanSee, "%s drops %s", ObservableNameCap(e), ObservableName(item))
		}
	}
}

func DoEquip(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to equip?")
		return
	}

	if items := e.SearchItems(itemQuery); len(items) == 0 {
		if itemQuery.Keyword == "all" {
			SendToPlayer(e, "You don't have anything to equip")
		} else {
			SendToPlayer(e, "You're not carrying '%s'", itemQuery.Keyword)
		}
	} else {
		for _, item := range items {
			performEquip(e, w, item)
		}
	}
}

func DoUnequip(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		SendToPlayer(e, "What do you want to equip?")
		return
	}

	if items := SearchMap(itemQuery, e.equipped, nil); len(items) == 0 {
		if itemQuery.Keyword == "all" {
			SendToPlayer(e, "You don't have anything equipped")
		} else {
			SendToPlayer(e, "You don't have '%s' equipped", itemQuery.Keyword)
		}
	} else {
		for _, item := range items {
			performUnequip(e, w, item)
		}
	}
}

func DoLook(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]

	if e.entityFlags.Has(EFlag_Blind) {
		SendToPlayer(e, "You can't see a thing!")
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		SendToPlayer(e, fmt.Sprintf("%s%s", r.Describe(e), utils.NewLine))
		return
	}

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

	// Looking at entity or item?
	query, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		SendToPlayer(e, "You don't see that here.")
		return
	}
	if ents := SearchEntities(query, e, r); len(ents) > 0 {
		SendToPlayer(e, ents[0].Describe())
	} else if itms := SearchItems(query, r, e); len(itms) > 0 {
		SendToPlayer(e, itms[0].Describe())
	} else {
		SendToPlayer(e, "You don't see that here.")
	}
}

func DoSit(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sitting {
		SendToPlayer(e, "But you're already sitting!")
		return
	}

	oldPos := e.position
	e.position = Pos_Sitting

	if oldPos == Pos_Prone {
		SendToPlayer(e, "You sit up")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s sits up", ObservableNameCap(e))
	} else {
		SendToPlayer(e, "You sit down")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s sits down", ObservableNameCap(e))
	}
}

func DoSleep(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sleeping {
		SendToPlayer(e, "But you're already sleeping!")
		return
	}
	e.position = Pos_Sleeping
	SendToPlayer(e, "You lie down and doze off...")
	BroadcastToRoomRe(w, e, SendRst_CanSee, "%s lies down and falls asleep", ObservableNameCap(e))
}

func DoWake(e *Entity, w *World, _ []string) {
	if e.position != Pos_Sleeping {
		SendToPlayer(e, "But you're not sleeping!")
		return
	}
	e.position = Pos_Prone
	SendToPlayer(e, "You open your eyes and wake up")
	BroadcastToRoomRe(w, e, SendRst_CanSee, "%s wakes up", ObservableNameCap(e))
}

func DoStand(e *Entity, w *World, _ []string) {
	if e.position == Pos_Standing {
		SendToPlayer(e, "But you're already standing!")
		return
	}
	e.position = Pos_Standing

	if e.combat != nil {
		SendToPlayer(e, "You scramble back to your feet!")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s scrambles back to their feet", ObservableNameCap(e))
	} else {
		SendToPlayer(e, "You stand up")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s stands up", ObservableNameCap(e))
	}
}

func DoMove(e *Entity, w *World, tokens []string) {
	cmd := tokens[0]
	dir, err := ParseDirection(cmd)
	if err != nil {
		SendToPlayer(e, "%s isn't a direction!", cmd)
	}

	_ = performMove(e, w, dir)
}

func lowerTokens(tokens []string) []string {
	for i, s := range tokens {
		tokens[i] = strings.ToLower(s)
	}
	return tokens
}

func performMove(e *Entity, w *World, dir Direction) bool {
	if e.stats.Get(Stat_Mov) <= 0 {
		SendToPlayer(e, "You're way too tired...")
		return false
	}
	if e.combat != nil {
		SendToPlayer(e, "You can't do that while you're fighting!")
		return false
	}
	if e.stats.Condition() < Cnd_Healthy {
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

	if e.player != nil {
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s leaves %s", ObservableNameCap(e), dir.String())
	} else {
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s wanders %s", ObservableNameCap(e), dir.String())
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
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s enters from the %s", ObservableNameCap(e), fromDirStr)
	} else {
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s wanders in from the %s", ObservableNameCap(e), fromDirStr)
	}

	e.stats.Add(Stat_Mov, -1)

	if e.player != nil {
		DoLook(e, w, nil)
	} else {
		triggerEnterRoomScript(e, nextRoom)
	}
	triggerEntityEnteredRoomScript(e, nextRoom)
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

		if e.ItemWeight()+item.ItemWeight() > e.stats.CarryingCapacity() {
			SendToPlayer(e, "You can't hold the weight of %s", ObservableName(item))
			continue
		}

		// Start transfer
		from.RemoveItem(item)

		// Some items crumble!
		if item.cfg.Flags.Has(IFlag_Crumbles) {
			SendToPlayer(e, "%s crumbles to dust as you touch it", ObservableNameCap(item))
			BroadcastToRoomRe(w, e, SendRst_None, "%s crumbles to dust as %s touches it", ObservableNameCap(item), ObservableName(e))

			// Drop all items in parent container
			if item.cfg.Flags.Has(IFlag_Container) {
				for _, i2 := range item.RemoveAllFromContainer() {
					from.AddItem(i2)
					BroadcastToRoom(r, "%s falls to the floor", ObservableName(i2))
				}
			}
			continue
		} else {
			// Finish transfer and notify
			e.AddItem(item)
			SendToPlayer(e, playerMsgFn(item))
			BroadcastToRoomRe(w, e, SendRst_CanSee, roomMsgFn(item))
		}
	}
}

func parseSearchQuery(tokens []string, allowCount bool) (SearchQuery, bool, []string) {
	numToks := len(tokens)
	if numToks == 0 {
		return SearchQuery{}, false, tokens
	}
	if allowCount {
		if num, err := strconv.Atoi(tokens[0]); err == nil {
			if numToks == 1 {
				return SearchQuery{}, false, tokens
			}
			return NewSearchQuery(tokens[1], num), true, tokens[2:]
		}
	}
	return NewSearchQuery(tokens[0], 1), true, tokens[1:]
}
