local function UseEdibleHealingItem(user, item, min, max) 
    local amt = Util.RandomRange(min, max)
    Entity.HealHP(user, amt)
    Write.ToPlayer(user, string.format("You eat %s <c green>(%d)</c>", Item.GetName(item), amt))
    Write.ToRoom(Entity.Room(user), {user}, string.format("%s eats %s.", Entity.NameCap(user), Item.GetName(item)))
    return true
end

Config.NewItem({
    Key = "apple",
	Keywords = {
        "red",
        "apple"
	},
	Name = "an apple",
	NamePlural = "apples",
	RoomDesc = "A shiny red apple is here.",
    FullDesc = "A round, edible fruit that, when eaten once a day, keeps the doctor away. Recovers a small amount of HP.",
	BuyPrice = 15,
    SellPrice = 7,
	Weight = 2,
    Flags = {
        "usable", "consumable"
    },
    Scripts = {
        Use = function(user, item) 
            return UseEdibleHealingItem(user, item, 16, 22)
        end
    }
})
Config.NewItem({
    Key = "red_herb",
	Keywords = {
        "red", "herb"
	},
	Name = "a red herb",
	NamePlural = "red herbs",
	RoomDesc = "Some sprigs of red herb are here.",
    FullDesc = "	A weak medicinal herb which heals wounds. Recovers a little HP.",
	BuyPrice = 18,
    SellPrice = 9,
	Weight = 3,
    Flags = {
        "usable", "consumable"
    },
    Scripts = {
        Use = function(user, item) 
            return UseEdibleHealingItem(user, item, 18, 28)
        end
    }
})