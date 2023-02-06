require('cfg.ro.utils.go-api')

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
			Type = WeaponType.Dagger,
			Atk = 17,
            Noun = "stab",
            Level = 1
		},
		Slot = EquipSlot.Held_1H,
        RequiredLevel = 1,
        Upgradable = true
	},
	BuyPrice = 50,
    SellPrice = 25,
	Weight = 40
})
Config.NewItem({
    Key = "rod",
	Keywords = {
		"rod",
		"wooden"
	},
	Name = "a rod",
	NamePlural = "rods",
	RoomDesc = "A simple wooden rod has been left here.",
	FullDesc = "A simple wooden rod.",
	Equipment = {
		Weapon = {
			Type = WeaponType.Rod,
			Atk = 15,
			MAtkBonus = 0.15,
            Noun = "bludgeon",
            Level = 1
		},
		Slot = EquipSlot.Held_1H,
        RequiredLevel = 1,
        Upgradable = true
	},
	BuyPrice = 50,
    SellPrice = 25,
	Weight = 40
})