Config.NewEntity({
	Key = "mob900",
	Keywords = {
		"homba"
	},
	Name = "the homba",
	RoomDesc = "The homba flits about.",
	FullDesc = "Part kestrel, part bear, part wolf.  Parts is parts, and makes an ugly whole.",
	Flags = {
		"stationary",
		"invisible",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 4,
		AC = 14,
		HP = "2d10+40",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "1d8+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob901",
	Keywords = {
		"swordsman"
	},
	Name = "the swordsman",
	RoomDesc = "The greatest swordsman in the land is standing here with a sneer on his face.",
	FullDesc = "This is the ultimate swordsman.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 7,
		AC = 16,
		HP = "3d10+80",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d5+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 3000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob902",
	Keywords = {
		"mummy",
		"rabscuttle"
	},
	Name = "the Mummy of Rabscuttle",
	RoomDesc = "The Mummy of Rabscuttle wanders here, hands aloft, walking towards you.",
	FullDesc = "All bandages, no personality.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 11,
		AC = 18,
		HP = "6d3+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "2d6+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob903",
	Keywords = {
		"lizard",
		"giant"
	},
	Name = "the giant lizard",
	RoomDesc = "A giant lizard is here.",
	FullDesc = [[
This scaly creature looks like it is well adapted to its underground
habitat.  He looks very powerful.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 16,
		AC = 17,
		HP = "10d2+220",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 14,
				Damage = "3d4+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 26000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob904",
	Keywords = {
		"woundwort",
		"general",
		"demon"
	},
	Name = "General Woundwort",
	RoomDesc = "General Woundwort, the dark demon of Minos, awaits to maul you to shreds.",
	FullDesc = "He looks vaguely like a rabbit, but sure doesn't act like one.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 25,
		AC = 20,
		HP = "10d8+520",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d5+12",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 120000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob905",
	Keywords = {
		"franz",
		"henchman"
	},
	Name = "Franz the Henchman",
	RoomDesc = "Franz, Minos' henchman, is here ready to pump you up.",
	FullDesc = [[
Franz is no girlie man.  He is very muscular and looks as if he could
squeeze your head like a grapefruit.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 12,
		AC = 15,
		HP = "5d10+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "2d8+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 14000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob906",
	Keywords = {
		"hanz",
		"henchman"
	},
	Name = "Hanz the Henchman",
	RoomDesc = "Hanz is here flexing his muscles and squeezing grapefruits.",
	FullDesc = [[
Hanz is no girlie man.  He is very muscular and looks as if he could
lift a large dragon.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 12,
		AC = 15,
		HP = "5d10+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "2d8+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 14000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob907",
	Keywords = {
		"minos",
		"king",
		"minotaur"
	},
	Name = "King Minos the Minotaur",
	RoomDesc = "King Minos the Minotaur is ready and waiting to gore you to death.",
	FullDesc = "He smells something awful.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 26,
		AC = 21,
		HP = "12d8+590",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d6+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 160000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob908",
	Keywords = {
		"turtle",
		"dragon"
	},
	Name = "the dragon turtle",
	RoomDesc = "A large dragon turtle breaks the surface churning the water into huge waves.",
	FullDesc = "The turtle's shell is the size of a small house and looks as hard as rock.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 22,
		AC = 24,
		HP = "12d6+350",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "1d20+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 80000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob909",
	Keywords = {
		"hag",
		"sea"
	},
	Name = "the sea hag",
	RoomDesc = "You notice the face of an ugly hag in the sea weeds.",
	FullDesc = "The sea hag is terribly fightful and has razor sharp teeth.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 4,
		AC = 13,
		HP = "4d4+35",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "2d5+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 750
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob910",
	Keywords = {
		"merman"
	},
	Name = "the merman",
	RoomDesc = "There is a merman swimming here brandishing his trident at you!",
	FullDesc = "The merman has a powerful tail fin instead of legs.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "5d5+65",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 6,
				Damage = "2d4+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob911",
	Keywords = {
		"crab",
		"crusty"
	},
	Name = "the crusty crab",
	RoomDesc = "A crusty looking crab is crawling around here searching for food.",
	FullDesc = "It looks like a crab... what more can be said?",
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 2,
		AC = 15,
		HP = "5d2+25",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "1d5+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 150
	},
	Gender = 0
})
