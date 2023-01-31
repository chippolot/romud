Config.NewItem({
    Key = "knife",
	Keywords = {
		"knife"
	},
	Name = "a knife",
	NamePlural = "knives",
	RoomDesc = "A simple knife has been left here.",
	FullDesc = "A simple knife.",
	Equipment = {
		Weapon = {
			Type = "dagger",
			Atk = 17,
            Noun = "stab",
            Level = 1
		},
		Slot = "held_1h",
        RequiredLevel = 1,
        Upgradable = true
	},
	BuyPrice = 50,
    SellPrice = 25,
	Weight = 40
})