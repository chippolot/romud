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
            Level = 1,
			Range = 1
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
            Level = 1,
			Range = 1
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
    Key = "bow",
	Keywords = {
		"bow"
	},
	Name = "a common bow",
	NamePlural = "common bows",
	RoomDesc = "A common bow has been left here.",
	FullDesc = "A common bow.",
	Equipment = {
		Weapon = {
			Type = WeaponType.Bow,
			Atk = 15,
            Noun = "pierce",
            Level = 1,
			Range = 5
		},
		Slot = EquipSlot.Held_2H,
        RequiredLevel = 4,
        Upgradable = true
	},
	BuyPrice = 1000,
    SellPrice = 500,
	Weight = 50
})