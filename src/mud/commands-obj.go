package mud

import (
	"fmt"

	"github.com/chippolot/go-mud/src/utils"
)

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
