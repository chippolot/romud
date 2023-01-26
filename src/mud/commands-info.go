package mud

import (
	"fmt"
	"log"
	"sort"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

func DoConsider(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write("Who do you want to consider attacking?").ToPlayer(e).Send()
		return
	}

	query, ok, _ := parseSearchQuery(tokens[1:], false)
	if ok {
		if ents := SearchEntities(query, e, r); len(ents) > 0 {
			tgt := ents[0]
			if e == tgt {
				Write("You size yourself up.").ToPlayer(e).Send()
				return
			}

			eAtk := GetAttackData(e)
			eDPR := float64(eAtk.Damage.Average()+eAtk.DamageMod.Average()) * calculateAttacksPerRound(e.stats)
			eMaxHP := e.stats.Get(Stat_MaxHP)

			tgtAtk := GetAttackData(tgt)
			tgtDPR := float64(tgtAtk.Damage.Average()+tgtAtk.DamageMod.Average()) * calculateAttacksPerRound(tgt.stats)
			tgtMaxHP := tgt.stats.Get(Stat_MaxHP)

			eRoundsToKill := float64(eMaxHP) / tgtDPR
			tgtRoundsToKill := float64(tgtMaxHP) / eDPR
			diff := eRoundsToKill - tgtRoundsToKill

			log.Println(eDPR, tgtDPR, eMaxHP, tgtMaxHP, diff)

			if diff == 0 {
				Write("You feel evenly matched. It's anyone's game.").ToPlayer(e).Send()
			} else if diff > 10 {
				Write("You could take them with your hands tied behind your back!").ToPlayer(e).Send()
			} else if diff > 5 {
				Write("They look pretty weak to you.").ToPlayer(e).Send()
			} else if diff > 0 {
				Write("Looks farily easy.").ToPlayer(e).Send()
			} else if diff < -10 {
				Write("Never in a million years!").ToPlayer(e).Send()
			} else if diff < -5 {
				Write("They look stronger than you.").ToPlayer(e).Send()
			} else if diff < 0 {
				Write("Looks like it might be a bit of a challenge.").ToPlayer(e).Send()
			}
			return
		}
	} else {

	}
	Write("You don't see them here.").ToPlayer(e).Send()
}

func DoLook(e *Entity, w *World, tokens []string) {
	r := w.rooms[e.data.RoomId]

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	numtoks := len(tokens)
	if numtoks == 0 || numtoks == 1 {
		Write(fmt.Sprintf("%s%s", r.Describe(e), utils.NewLine)).ToPlayer(e).Send()
		return
	}

	// Is the player trying to look in something?
	if tokens[1] == "in" {
		containerQuery, ok, _ := parseSearchQuery(tokens[2:], false)
		if !ok {
			Write("What do you want to look in?").ToPlayer(e).Send()
			return
		}
		if containers := SearchItems(containerQuery, e, r); len(containers) > 0 {
			Write(containers[0].DescribeContents()).ToPlayer(e).Send()
			return
		}
		Write("You don't see that here.").ToPlayer(e).Send()
		return
	}

	// Looking at entity or item?
	query, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		Write("You don't see that here.").ToPlayer(e).Send()
		return
	}
	if ents := SearchEntities(query, e, r); len(ents) > 0 {
		Write(ents[0].Describe()).ToPlayer(e).Send()
	} else if itms := SearchItems(query, r, e); len(itms) > 0 {
		Write(itms[0].Describe()).ToPlayer(e).Send()
	} else {
		Write("You don't see that here.").ToPlayer(e).Send()
	}
}

func DoInventory(e *Entity, _ *World, _ []string) {
	Write(e.DescribeInventory()).ToPlayer(e).Send()
}

func DoEquipment(e *Entity, _ *World, _ []string) {
	Write(e.DescribeEquipment()).ToPlayer(e).Send()
}

func DoStatus(e *Entity, _ *World, _ []string) {
	Write(e.DescribeStatus()).ToPlayer(e).Send()
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
	Write(sb.String()).ToPlayer(e).Send()
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
	Write(sb.String()).ToPlayer(e).Send()
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
		Write(sb.String()).ToPlayer(e).Send()
	case 2:
		Write("What do you want %s to expand to?", tokens[1]).ToPlayer(e).Send()
	default:
		if _, ok := CommandsLookup[tokens[1]]; ok {
			Write("Cannot add alias %s -- command already exists", tokens[1]).ToPlayer(e).Send()
			return
		}
		e.player.data.Aliases[tokens[1]] = strings.Join(tokens[2:], " ")
		Write("Added alias for %s", tokens[1]).ToPlayer(e).Send()
	}
}

func DoUnalias(e *Entity, _ *World, tokens []string) {
	if e.player == nil {
		return
	}
	switch len(tokens) {
	case 0, 1:
		Write("What do you want to unalias?").ToPlayer(e).Send()
	default:
		aliasKey := tokens[1]
		if _, ok := e.player.data.Aliases[aliasKey]; !ok {
			Write("You don't have an alias for %s", tokens[1]).ToPlayer(e).Send()
		} else {
			delete(e.player.data.Aliases, aliasKey)
			Write("Removed alias for %s", tokens[1]).ToPlayer(e).Send()
		}
	}
}

func DoSave(e *Entity, w *World, _ []string) {
	w.SavePlayerCharacter(e.player.id)
	Write("Saved game.").ToPlayer(e).Send()
}

func DoQuit(e *Entity, w *World, _ []string) {
	if e.player != nil {
		w.LogoutPlayer(e.player)
	}
}
