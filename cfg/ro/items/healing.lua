require('cfg.ro.utils.go-api')

local function UseEdibleHealingItem(user, item, minHP, maxHP, minSP, maxSP) 

    local hpStr = ""
    local amtHP = Util.RandomRange(minHP, maxHP)
    if amtHP ~= 0 then
        Entity.HealHP(user, amtHP)
        hpStr = string.format(" <c green>(%dhp)</c>", amtHP)
    end

    local spStr = ""
    local amtSP = Util.RandomRange(minSP, maxSP)
    if amtSP ~= 0 then
        Entity.HealSP(user, amtSP)
        spStr = string.format(" <c green>(%dsp)</c>", amtSP)
    end

    Write.ToPlayer(user, string.format("You eat %s%s%s", Item.Name(item), hpStr,spStr))
    Write.ToRoom(Entity.Room(user), {user}, string.format("%s eats %s.", Entity.NameCap(user), Item.Name(item)))
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
            return UseEdibleHealingItem(user, item, 16, 22, 0, 0)
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
    FullDesc = "A weak medicinal herb which heals wounds. Recovers a little HP.",
	BuyPrice = 18,
    SellPrice = 9,
	Weight = 3,
    Flags = {
        "usable", "consumable"
    },
    Scripts = {
        Use = function(user, item) 
            return UseEdibleHealingItem(user, item, 18, 28, 0, 0)
        end
    }
})
Config.NewItem({
    Key = "honey",
	Keywords = {
        "honey", "pot"
	},
	Name = "a small pot of honey",
	NamePlural = "small pots of honey",
	RoomDesc = "A small pot of honey is here.",
    FullDesc = "A sweet product made by bees that is endowed with yummy flavor and medicinal uses.",
	BuyPrice = 500,
    SellPrice = 250,
	Weight = 10,
    Flags = {
        "usable", "consumable"
    },
    Scripts = {
        Use = function(user, item) 
            return UseEdibleHealingItem(user, item, 70, 100, 20, 40)
        end
    }
})