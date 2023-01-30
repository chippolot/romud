Config.NewItem({
    Key = "apple",
	Keywords = {
        "apple"
	},
	Name = "an apple",
	RoomDesc = "A shiny red apple is here",
    FullDesc = "A round, edible fruit that, when eaten once a day, keeps the doctor away. Recovers a small amount of HP.",
	BuyPrice = 15,
    SellPrice = 7,
	Weight = 2,
    Flags = {
        "usable", "consumable"
    },
    Scripts = {
        Use = function(user, item) 
            Entity.HealHP(user, Util.RandomRange(16, 22))
            return true
        end
    }
})