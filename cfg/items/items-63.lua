Config.NewItem({
	Key = "item6200",
	Keywords = {
		"key"
	},
	Name = "a key",
	RoomDesc = "A key sits here.",
	Value = 20,
	Weight = 1
})
Config.NewItem({
	Key = "item6201",
	Keywords = {
		"manacles"
	},
	Name = "a set of manacles",
	RoomDesc = "A set of iron manacles lie here.",
	Equipment = {
		Armor = {
			Stats = {
				AC = "0"
			}
		},
		Slot = "hands"
	},
	Value = 100,
	Weight = 20
})
Config.NewItem({
	Key = "item6202",
	Keywords = {
		"shackles"
	},
	Name = "a set of shackles",
	RoomDesc = "A set of shackles sit here, discarded.",
	Equipment = {
		Armor = {
			Stats = {
				AC = "0"
			}
		},
		Slot = "feet"
	},
	Value = 100,
	Weight = 20
})
Config.NewItem({
	Key = "item6203",
	Keywords = {
		"Runestone",
		"rune",
		"stone"
	},
	Name = "the Runestone",
	RoomDesc = "A small stone with an inscription sits here.",
	Value = 10000,
	Weight = 1
})
Config.NewItem({
	Key = "item6204",
	Keywords = {
		"club"
	},
	Name = "a club",
	RoomDesc = "A crude wooden club sits here.",
	Equipment = {
		Weapon = {
			Damage = "2d2+0",
			DamageType = "slashing",
			VerbSingular = "slash",
			VerbPlural = "slashes"
		},
		Slot = "held1h"
	},
	Value = 10,
	Weight = 12
})
Config.NewItem({
	Key = "item6205",
	Keywords = {
		"Starkblade",
		"knife",
		"dagger",
		"blade"
	},
	Name = "Starkblade",
	RoomDesc = "A knife hums with eternal energy here.",
	Equipment = {
		Weapon = {
			Damage = "3d7+0",
			DamageType = "slashing",
			VerbSingular = "slash",
			VerbPlural = "slashes"
		},
		Slot = "held1h"
	},
	Value = 100000,
	Weight = 1
})
