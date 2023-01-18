package mud

import (
	"sort"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

func DoInventory(e *Entity, _ *World, _ []string) {
	SendToPlayer(e, e.DescribeInventory())
}

func DoEquipment(e *Entity, _ *World, _ []string) {
	SendToPlayer(e, e.DescribeEquipment())
}

func DoStatus(e *Entity, _ *World, _ []string) {
	SendToPlayer(e, e.DescribeStatus())
}

func DoWho(e *Entity, w *World, _ []string) {
	var sb utils.StringBuilder
	sb.WriteLinef("Online Players: %d", len(w.players))
	sb.WriteHorizontalDivider()
	sb.WriteLinef("  (you) %s", e.Name())
	for _, e2 := range w.players {
		if e2 != e {
			sb.WriteLinef("  %s", e2.Name())
		}
	}
	SendToPlayer(e, sb.String())
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

func DoAlias(e *Entity, _ *World, tokens []string) {
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

func DoUnalias(e *Entity, _ *World, tokens []string) {
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

func DoSave(e *Entity, w *World, _ []string) {
	w.SavePlayerCharacter(e.player.id)
	SendToPlayer(e, "Saved game.")
}

func DoQuit(e *Entity, w *World, _ []string) {
	if e.player != nil {
		w.LogoutPlayer(e.player)
	}
}
