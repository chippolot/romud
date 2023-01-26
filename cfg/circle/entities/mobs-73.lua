Config.NewEntity({
	Key = "mob7200",
	Keywords = {
		"mindflayer",
		"master",
		"mind"
	},
	Name = "the master mindflayer",
	RoomDesc = "The master mindflayer is here, looking at you with an evil look.",
	FullDesc = [[
It is a seven foot tall humanoid dressed in a purple cloak, and swinging a
black and purple rod above its head as if it was going to attack you any
moment now.  In the middle of its head are four tentacles with sharp points.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "3d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 19,
		HP = "1d10+170",
		XPValue = 20000,
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
	Key = "mob7201",
	Keywords = {
		"mindflayer",
		"senior",
		"mind"
	},
	Name = "the senior mindflayer",
	RoomDesc = "The senior mindflayer walks around here, looking for something useful.",
	FullDesc = [[
This is a horrifying monster indeed, 6'6" high.  Dressed in purple and black,
and carrying a large mace in its hand.  In the center of its head are four
large tentacles with very sharp points.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d4+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 17,
		HP = "1d10+100",
		XPValue = 4500,
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
	Key = "mob7202",
	Keywords = {
		"mindflayer",
		"junior",
		"mind"
	},
	Name = "the junior mindflayer",
	RoomDesc = "The junior mindflayer is here, watching you carefully from the corner.",
	FullDesc = [[
This mindflayer is six feet high.  It has a small mace in its belt, and is
dressed in purple and black cloth.  It has four small tentacles in the center
of its head.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "1d4+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "1d10+75",
		XPValue = 1500,
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
	Key = "mob7203",
	Keywords = {
		"wererat",
		"rat"
	},
	Name = "the ugly wererat",
	RoomDesc = "An ugly wererat is here, looking at you with a strange flick in his eyes.",
	FullDesc = [[
The wererat is about four feet tall.  It looks very much like rat, except
that it is standing.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "2d4+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 16,
		HP = "4d6+69",
		XPValue = 1500,
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
	Key = "mob7204",
	Keywords = {
		"rat",
		"gigantic"
	},
	Name = "the gigantic rat",
	RoomDesc = "There is a gigantic rat here, looking at you with a hungry look.",
	FullDesc = [[
The gigantic rat is about ten feet long from head to tail and has claws the
size of your head, looking very nasty.
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
	Gender = 1
})