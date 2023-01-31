package mud

import (
	"github.com/chippolot/go-mud/src/utils"
)

func DoList(e *Entity, w *World, tokens []string) {
	shop, ok := w.shops[e.data.RoomId]
	if !ok {
		Write("You're not in a shop!").ToPlayer(e).Send()
		return
	}

	var sb utils.StringBuilder
	sb.WriteLinef("%-20s%-10s", "Item Name", "Price")
	sb.WriteHorizontalDivider()
	for _, itemCfg := range shop.stock {
		sb.WriteLinef("%-20s%dz", itemCfg.Name, itemCfg.BuyPrice)
	}
	Write(sb.String()).ToPlayer(e).Send()
}

func DoBuy(e *Entity, w *World, tokens []string) {
	shop, ok := w.shops[e.data.RoomId]
	if !ok {
		Write("You're not in a shop!").ToPlayer(e).Send()
		return
	}

	query, ok, _ := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to buy?").ToPlayer(e).Send()
		return
	}
	if query.Count < 1 {
		Write("How many do you want to buy?").ToPlayer(e).Send()
		return
	}

	items := SearchList(query, shop.stock, nil)
	if len(items) == 0 {
		Write("That doesn't seem to be sold here.").ToPlayer(e).Send()
		return
	}

	totalPrice := 0
	totalWeight := 0
	groups := make(map[*ItemConfig]int)
	for _, item := range items {
		totalPrice += item.BuyPrice * query.Count
		totalWeight += item.Weight * query.Count
		groups[item] += query.Count
	}

	wealth := e.stats.Get(Stat_Gold)
	if wealth < totalPrice {
		Write("You'd need %dz but you only have %dz", totalPrice, wealth).ToPlayer(e).Send()
		return
	}
	if totalWeight+e.ItemWeight() > calculateCarryingCapacity(e.stats) {
		Write("You can't carry that much!").ToPlayer(e).Send()
		return
	}

	e.stats.Add(Stat_Gold, -totalPrice)
	for _, item := range items {
		for i := 0; i < query.Count; i++ {
			spawnItemByKey(item.Key, e)
		}
	}
	for item, amt := range groups {
		Write("You buy %s for %dz", item.GetNamePluralized(amt, true), item.BuyPrice*amt).ToPlayer(e).Send()
		Write("%s buys %s", ObservableNameCap(e), item.GetNamePluralized(amt, true)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
	}
}

func DoSell(e *Entity, w *World, tokens []string) {
	_, ok := w.shops[e.data.RoomId]
	if !ok {
		Write("You're not in a shop!").ToPlayer(e).Send()
		return
	}

	query, ok, _ := parseSearchQuery(tokens[1:], true)
	if !ok {
		Write("What do you want to sell?").ToPlayer(e).Send()
		return
	}

	items := e.SearchItems(query)
	if len(items) == 0 {
		if query.Keyword == "all" {
			Write("You have nothing to sell!").ToPlayer(e).Send()
		} else {
			Write("You're not carrying '%s'", query.Keyword).ToPlayer(e).Send()
		}
		return
	}

	groups := make(map[*ItemConfig]int)
	for _, item := range items {
		if item.cfg.SellPrice <= 0 {
			Write("This shop doesn't buy %s", item.GetName()).ToPlayer(e).Send()
			return
		}
		groups[item.cfg] += 1
	}

	for _, item := range items {
		e.RemoveItem(item)
		e.stats.Add(Stat_Gold, item.cfg.SellPrice)
	}
	for item, amt := range groups {
		Write("You sell %s for %dz", item.GetNamePluralized(amt, true), item.SellPrice*amt).ToPlayer(e).Send()
		Write("%s sells %s", ObservableNameCap(e), item.GetNamePluralized(amt, true)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
	}
}
