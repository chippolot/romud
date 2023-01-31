Config.NewItem({
    Key = "cotton_shirt",
	Keywords = {
		"cotton",
        "shirt"
	},
	Name = "a cotton shirt",
	NamePlural = "cotton shirts",
	RoomDesc = "A simple cotton shirt has been left here.",
    FullDesc = "A simple, sturdily made shirt of cotton.",
	Equipment = {
		Armor = {
			Def = 10,
            MDef = 0
		},
		Slot = "armor",
        RequiredLevel = 1,
        Upgradable = true
	},
	BuyPrice = 10,
    SellPrice = 5,
	Weight = 10
})
Config.NewItem({
    Key = "clown_nose",
	Keywords = {
		"clown",
        "nose"
	},
	Name = "a clown nose",
	NamePlural = "clown noses",
	RoomDesc = "A simple clown nose has been poignantly discarded here.",
    FullDesc = "A fashion accessory used in clown or town drunk disguises.",
	Equipment = {
		Armor = {
			Def = 0,
            MDef = 0
		},
		Slot = "head_low",
        RequiredLevel = 0,
        Upgradable = false
	},
	BuyPrice = 20,
    SellPrice = 10,
	Weight = 10
})
