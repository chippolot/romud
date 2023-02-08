package mud

import (
	"log"
	"strconv"
	"strings"
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
		{DoAlias, []string{"alias"}, "Creates a new alias which expands to the subsequent text. If run alone, lists current aliases.", "alias gac get all corpse", true, 0, 0},
		{DoAttack, []string{"kill", "hit", "attack", "fight"}, "Begin attacking a target", "attack rat / fight rat / kill rat / hit rat", true, Cnd_Healthy, Pos_Standing},
		{DoBuy, []string{"buy"}, "(When in a shop) Buys a specified item", "buy potion", false, Cnd_Healthy, Pos_Sitting},
		{DoChangeJob, []string{"changejob"}, "Changes to a new job class. Must meet requirements.", "changejob swordman", false, Cnd_Healthy, Pos_Sitting},
		{DoConsider, []string{"con"}, "Considers how difficult it might be to kill a target", "con goblin", true, Cnd_Healthy, Pos_Prone},
		{DoDrop, []string{"drop"}, "Drops an item", "drop sword", true, Cnd_Healthy, Pos_Sitting},
		{DoEquip, []string{"equip", "wear"}, "Equips a carried item", "equip sword", false, Cnd_Healthy, Pos_Sitting},
		{DoEquipment, []string{"eq", "equipment"}, "Lists equipment you are using", "equipment", true, 0, 0},
		{DoGet, []string{"get"}, "Picks up an item", "get sword / get all bag", false, Cnd_Healthy, Pos_Sitting},
		{DoGive, []string{"give"}, "Gives an item to something else", "give sword soldier", false, Cnd_Healthy, Pos_Sitting},
		{DoInventory, []string{"inventory", "i"}, "Describes which items you are currently carrying", "inventory cat", true, 0, 0},
		{DoPracticeSkill, []string{"practice"}, "Practices (levels up) a learned skill.", "practice first_aid", false, Cnd_Healthy, Pos_Sitting},
		{DoLearnSkill, []string{"learn"}, "Learns a new skill if the prerequisites are met.", "learn first_aid", false, Cnd_Healthy, Pos_Sitting},
		{DoList, []string{"list"}, "(When in a shop) Lists items for sale", "list", false, Cnd_Healthy, Pos_Sitting},
		{DoListJobs, []string{"jobs"}, "Lists all jobs that the player can advance into in the future.", "jobs", true, 0, 0},
		{DoListCommands, []string{"commands"}, "Lists available commands", "commands", true, 0, 0},
		{DoListSkills, []string{"skills"}, "Lists all skills that the player currently has learned or can learn.", "skills", true, 0, 0},
		{DoLook, []string{"look", "l"}, "Describes the current room or object in room", "look / look cat", true, Cnd_Healthy, Pos_Prone},
		{DoMove, []string{"east", "west", "north", "south", "up", "down", "e", "w", "n", "s", "u", "d"}, "Moves player between rooms", "north", false, Cnd_Healthy, Pos_Standing},
		{DoPut, []string{"put", "place"}, "Places an item in a container", "put sword in bag", true, Cnd_Healthy, Pos_Sitting},
		{DoQuit, []string{"quit"}, "Quits the game", "quit", false, 0, 0},
		{DoRaiseStat, []string{"raise"}, "Raises a stat point", "raise str", false, Cnd_Healthy, Pos_Sitting},
		{DoSave, []string{"save"}, "Saves the game", "save", false, Cnd_Healthy, 0},
		{DoSay, []string{"say"}, "Say something in the current room", "say hi", true, Cnd_Healthy, Pos_Prone},
		{DoSell, []string{"sell"}, "(When in a shop) Sells a specified item", "sell potion", false, Cnd_Healthy, Pos_Sitting},
		{DoSit, []string{"sit"}, "Sit down on the ground", "sit", false, Cnd_Healthy, Pos_Prone},
		{DoSkill, []string{"skill"}, "Use a skill", "skill bash goblin", true, Cnd_Healthy, Pos_Sitting},
		{DoSleep, []string{"sleep"}, "Fall asleep to refresh yourself", "sleep", false, Cnd_Healthy, Pos_Sleeping},
		{DoStand, []string{"stand"}, "Stands up", "stand", true, Cnd_Healthy, Pos_Prone},
		{DoStatus, []string{"st", "status"}, "Displays status for the current player", "status", true, 0, 0},
		{DoUnalias, []string{"unalias"}, "Removes an existing alias", "unalias", true, 0, 0},
		{DoUnequip, []string{"unequip", "remove"}, "Unequips an equipped item", "unequip sword", false, Cnd_Healthy, Pos_Sitting},
		{DoUse, []string{"use"}, "Uses an item", "use potion", false, Cnd_Healthy, Pos_Sitting},
		{DoWake, []string{"wake", "awake"}, "Wakes up from sleeep", "wake / awake", false, Cnd_Healthy, Pos_Sleeping},
		{DoTell, []string{"tell"}, "Say something to a specific player", "tell lancelot Hi buddy!", true, Cnd_Healthy, Pos_Prone},
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
			Write("Things are a little too chaotic for that!").ToPlayer(e).Send()
			return false
		}
		if e.position < cmdDesc.minPosition {
			Write(e.position.InactionString()).ToPlayer(e).Send()
			return false
		}
		if e.stats.Condition() < cmdDesc.minCondition {
			Write(e.stats.Condition().InactionString()).ToPlayer(e).Send()
			return false
		}

		if cmdDesc.fn != nil {
			cmdDesc.fn(e, w, tokens)
			return true
		}
	}

	Write("Huh??").ToPlayer(e).Send()
	return false
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
