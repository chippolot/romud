package mud

func DoGet(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to get?").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]

	// Trying to get something from a container?
	containerQuery, ok, tokens := parseSearchQuery(tokens, false)
	if ok {
		contianers := SearchItems(containerQuery, e, r)
		if len(contianers) == 0 {
			Write("You don't see '%s' here", containerQuery.Keyword).ToPlayer(e).Send()
			return
		}

		// Make sure it's a container
		containerItem := contianers[0]
		if !containerItem.cfg.Flags.Has(IFlag_Container) {
			Write("The %s is not a container", ObservableName(containerItem)).ToPlayer(e).Send()
			return
		}

		// Get the items
		items := containerItem.SearchItems(itemQuery)
		if len(items) == 0 {
			Write("The %s is empty", ObservableName(containerItem)).ToPlayer(e).Send()
		} else {
			performGet(e, w, containerItem, items...)
		}
	} else {
		// Find item in room
		items := r.SearchItems(itemQuery)
		if len(items) == 0 {
			Write("You don't see that here...").ToPlayer(e).Send()
			return
		}
		performGet(e, w, r, items...)
	}
}

func DoGive(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to give and to whom?").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]

	// Find the target
	targetQuery, ok, tokens := parseSearchQuery(tokens, false)
	if !ok {
		Write("Who do you want to give that to?").ToPlayer(e).Send()
		return
	}

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	targets := SearchEntities(targetQuery, e, r)
	if len(targets) == 0 {
		Write("They don't seem to be here").ToPlayer(e).Send()
		return
	}
	target := targets[0]

	// Find the item
	items := e.SearchItems(itemQuery)
	if len(items) == 0 {
		Write("You're not carrying '%s'", itemQuery.Keyword).ToPlayer(e).Send()
		return
	}
	for _, item := range items {
		performTransferItem(w, e, target, item)
	}
}

func DoPut(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to put and in where?").ToPlayer(e).Send()
		return
	}

	// Find the container
	containerQuery, ok, tokens := parseSearchQuery(tokens, false)
	if !ok {
		Write("What do you want to put that in?").ToPlayer(e).Send()
		return
	}
	containers := e.SearchItems(containerQuery)
	if len(containers) == 0 {
		Write("You don't seem to be holding '%s'", containerQuery.Keyword).ToPlayer(e).Send()
		return
	}
	container := containers[0]
	if container.cfg.Flags.Has(IFlag_NoStorage) {
		Write("You can't store things in that!").ToPlayer(e).Send()
		return
	}

	// Find the item
	items := e.SearchItems(itemQuery)
	if len(items) == 0 {
		Write("You're not carrying '%s'", itemQuery.Keyword).ToPlayer(e).Send()
		return
	} else if len(items) == 1 && items[0] == container {
		Write("You can't put that in itself!").ToPlayer(e).Send()
		return
	}
	for _, item := range items {
		if item == container {
			continue
		}
		performTransferItem(w, e, container, item)
	}
}

func DoDrop(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to drop?").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]

	if items := e.SearchItems(itemQuery); len(items) == 0 {
		if itemQuery.Keyword == "all" {
			Write("You have nothing to drop!").ToPlayer(e).Send()
		} else {
			Write("You're not carrying '%s'", itemQuery.Keyword).ToPlayer(e).Send()
		}
	} else {
		for _, item := range items {
			performTransferItem(w, e, r, item)
		}
	}
}

func DoEquip(e *Entity, w *World, tokens []string) {
	itemQuery, ok, tokens := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to equip?").ToPlayer(e).Send()
		return
	}

	if items := e.SearchItems(itemQuery); len(items) == 0 {
		if itemQuery.Keyword == "all" {
			Write("You don't have anything to equip").ToPlayer(e).Send()
		} else {
			Write("You're not carrying '%s'", itemQuery.Keyword).ToPlayer(e).Send()
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
		Write("What do you want to equip?").ToPlayer(e).Send()
		return
	}

	if items := SearchMap(itemQuery, e.equipped, nil); len(items) == 0 {
		if itemQuery.Keyword == "all" {
			Write("You don't have anything equipped").ToPlayer(e).Send()
		} else {
			Write("You don't have '%s' equipped", itemQuery.Keyword).ToPlayer(e).Send()
		}
	} else {
		for _, item := range items {
			performUnequip(e, w, item)
		}
	}
}

func performGet(e *Entity, w *World, from ItemContainer, items ...*Item) {
	if len(items) == 0 {
		containerName := "something"
		if named, ok := from.(Named); ok {
			containerName = named.Name()
		}
		Write("The %s is empty", containerName).ToPlayer(e).Send()
		return
	}

	for _, item := range items {
		performTransferItem(w, from, e, item)
	}
}

func performTransferItem(w *World, src ItemContainer, dst ItemContainer, item *Item) {
	dstE, _ := dst.(*Entity)

	// Can't transfer environmental items
	if item.cfg.Flags.Has(IFlag_Environmental) {
		Write("You can't pick that up!").ToPlayer(dstE).Send()
		return
	}

	// Check destination's item capacity
	if dstE != nil && dst.ItemWeight()+item.ItemWeight() > calculateCarryingCapacity(dstE.stats) {
		Write("You can't hold the weight of %s", ObservableName(item)).ToPlayer(dstE).Send()
		return
	}

	// Start transfer
	src.RemoveItem(item)

	// Some items crumble!
	if item.cfg.Flags.Has(IFlag_Crumbles) {
		if dstE != nil {
			Write("%s crumbles to dust as you touch it", ObservableNameCap(item)).ToPlayer(dstE).Send()
			Write("%s crumbles to dust as %s touches it", ObservableNameCap(item), ObservableName(dstE)).ToEntityRoom(w, dstE).Subject(dstE).Send()
		}

		// Drop all items in parent container
		if item.cfg.Flags.Has(IFlag_Container) {
			for _, i2 := range item.RemoveAllFromContainer() {
				src.AddItem(i2)
				onItemTransferred(w, src, dst, item)
			}
		}
		return
	}

	// Finish transfer and notify
	dst.AddItem(item)
	onItemTransferred(w, src, dst, item)
}

func onItemTransferred(w *World, src ItemContainer, dst ItemContainer, item *Item) {
	// Transferring to entity
	if dstE, ok := dst.(*Entity); ok {
		switch fromObj := src.(type) {
		// Item picked up
		case *Room:
			Write("You pick up %s", ObservableName(item)).ToPlayer(dstE).Send()
			Write("%s picks up %s", ObservableNameCap(dstE), ObservableName(item)).ToRoom(fromObj).Subject(dstE).Restricted(SendRst_CanSee).Send()
		// Item given
		case *Entity:
			Write("You give %s to %s", ObservableName(item), ObservableName(dstE)).ToPlayer(fromObj).Send()
			Write("%s give %s to you", ObservableNameCap(fromObj), ObservableName(item)).ToPlayer(dstE).Subject(fromObj).Restricted(SendRst_CanSee).Send()
			Write("%s gives %s to %s", ObservableNameCap(fromObj), ObservableName(item), ObservableName(dstE)).ToEntityRoom(w, dstE).Subject(fromObj).Ignore(dstE).Restricted(SendRst_CanSee).Send()
			triggerGivenItemScript(dstE, fromObj, item)
		// Item otherwise received
		case NamedObservable:
			Write("You get %s from %s", ObservableName(item), ObservableName(fromObj)).ToPlayer(dstE).Send()
			Write("%s gets %s from %s", ObservableNameCap(dstE), ObservableName(item), ObservableName(fromObj)).ToEntityRoom(w, dstE).Subject(dstE).Restricted(SendRst_CanSee).Send()
		}
		triggerReceivedItemScript(dstE, item)
		return
	}

	// Transferring to room
	if dstR, ok := dst.(*Room); ok {
		switch fromObj := src.(type) {
		// Item dropped
		case *Entity:
			Write("You drop %s", ObservableName(item)).ToPlayer(fromObj).Send()
			Write("%s drops %s", ObservableNameCap(fromObj), ObservableName(item)).ToRoom(dstR).Subject(fromObj).Restricted(SendRst_CanSee).Send()
			triggerItemDroppedScript(item, dstR)
		// Item fell
		default:
			Write("%s falls to the floor", ObservableName(item)).ToRoom(dstR).Send()
		}
	}
}
