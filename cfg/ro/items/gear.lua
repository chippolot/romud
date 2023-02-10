require('cfg.ro.utils.go-api')

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
		Slot = EquipSlot.Armor,
        RequiredLevel = 1,
        Upgradable = true
	},
	BuyPrice = 10,
    SellPrice = 5,
	Weight = 10
})
Config.NewItem({
    Key = "silk_robe",
	Keywords = {
		"silk",
        "robe"
	},
	Name = "a silk robe",
	NamePlural = "silk robes",
	RoomDesc = "A shiny silk robe has been left here.",
    FullDesc = "A finely woven, silk robe that has been enchanted with magic.  <c blue>MDEF + 10</c>",
	Equipment = {
		Armor = {
			Def = 3,
            MDef = 10
		},
		Slot = EquipSlot.Armor,
        RequiredLevel = 1,
        Upgradable = true
	},
	BuyPrice = 8000,
    SellPrice = 4000,
	Weight = 40
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
		Slot = EquipSlot.Head_Low,
        RequiredLevel = 0,
        Upgradable = false
	},
	BuyPrice = 20,
    SellPrice = 10,
	Weight = 10
})
Config.NewItem({
    Key = "fancy_flower",
	Keywords = {
		"fancy",
        "flower"
	},
	Name = "a fancy flower",
	NamePlural = "fancy flowers",
	RoomDesc = "A fancy flower is growing here. It looks like you could wear it if you wanted to.",
    FullDesc = "A floral decoration used to adorn the head.  <c blue>Reduces damage from Plant monster by 10%.</c>",
	Equipment = {
		Armor = {
			Def = 0,
            MDef = 0
		},
		Slot = EquipSlot.Head_High,
        RequiredLevel = 0,
        Upgradable = false
	},
	BuyPrice = 20,
    SellPrice = 10,
	Weight = 10
})
