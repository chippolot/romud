Config.NewEntity({
	Key = "mob7900",
	Keywords = {
		"paladin",
		"grand",
		"knight"
	},
	Name = "the Grand Knight of Paladins",
	RoomDesc = "The Grand Knight is standing here, waiting for someone to help.",
	FullDesc = [[
The Knight is standing here, smiling at you.  He is dressed all in white,
blue and silver.  He looks VERY strong, as he stands here, ready to help
the innocent.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "2d6+16",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 26,
		AC = 21,
		HP = "10d8+550",
		XPValue = 170000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob7901",
	Keywords = {
		"rat",
		"large"
	},
	Name = "the large rat",
	RoomDesc = "There is a large rat here, poking through the foodstuffs lying around.",
	FullDesc = [[
The large rat is about two feet long from head to tail and has claws the
size of your fingers, looking very nasty.  It seems to be quite occupied
with all the chewed open foodstuffs lying about the room.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "1d10+150",
		XPValue = 13000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7902",
	Keywords = {
		"cleaver"
	},
	Name = "the Cleaver",
	RoomDesc = "The Cleaver is here eyeing you hungrily in anticipation of its next meal.",
	FullDesc = [[
The Cleaver is a huge spidery chittinous creature with four large
spindly arms ending in cleaverlike talons that will surely cut you
to ribbons.
]],
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 17,
			Damage = "8d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 20,
		HP = "5d8+340",
		XPValue = 65000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
