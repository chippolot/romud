Config.NewEntity({
	Key = "mob4000",
	Keywords = {
		"snake",
		"large"
	},
	Name = "the snake",
	RoomDesc = "A large dreadful snake is at your feet, hissing at you.",
	FullDesc = "It looks hungry.",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "3d6+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 15,
		HP = "5d10+50",
		XPValue = 12000,
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
	Key = "mob4001",
	Keywords = {
		"snake",
		"green"
	},
	Name = "the green snake",
	RoomDesc = "A small green snake is here, and it doesn't look too friendly...",
	FullDesc = "It looks harmless.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "3d10+30",
		XPValue = 2500,
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
	Key = "mob4002",
	Keywords = {
		"centipede"
	},
	Name = "the centipede",
	RoomDesc = "A small centipede is here, making its way across the floor.",
	FullDesc = "It looks completely harmless.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d6+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 13,
		HP = "2d10+20",
		XPValue = 400,
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
	Key = "mob4003",
	Keywords = {
		"kobold"
	},
	Name = "the kobold",
	RoomDesc = "An ugly kobold is here, searching for dinner.",
	FullDesc = "It looks ugly.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "1d8+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 14,
		HP = "2d10+40",
		XPValue = 800,
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
	Key = "mob4004",
	Keywords = {
		"orc"
	},
	Name = "the orc",
	RoomDesc = "The orc walks around, looking for someone to kill.",
	FullDesc = "You notice an evil look in its eyes...",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "2d10+60",
		XPValue = 900,
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
	Key = "mob4005",
	Keywords = {
		"orc",
		"large"
	},
	Name = "the orc",
	RoomDesc = "A large orc is here, looking really mean.",
	FullDesc = "He looks dreadful.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 17,
		HP = "3d20+75",
		XPValue = 3000,
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
	Key = "mob4050",
	Keywords = {
		"warrior"
	},
	Name = "the warrior",
	RoomDesc = "A tall warrior is here.  He has more scars than anyone you have ever seen.",
	FullDesc = "He seems to be a strong, brainless fighter.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d8+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 15,
		HP = "10d10+50",
		XPValue = 12000,
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
	Key = "mob4051",
	Keywords = {
		"warrior"
	},
	Name = "the warrior",
	RoomDesc = "A tall warrior is here.",
	FullDesc = "He seems to know his way with weapons.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d5+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 14,
		HP = "3d10+80",
		XPValue = 2500,
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
	Key = "mob4052",
	Keywords = {
		"hobgoblin"
	},
	Name = "the hobgoblin",
	RoomDesc = "A small hobgoblin stands here.",
	FullDesc = "The hobgoblin looks quite lost.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 13,
		HP = "3d8+70",
		XPValue = 1500,
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
	Key = "mob4053",
	Keywords = {
		"snake"
	},
	Name = "the snake",
	RoomDesc = "A brown snake watches you.",
	FullDesc = "The snake looks quite mean.",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "3d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 15,
		HP = "4d10+60",
		XPValue = 12000,
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
	Key = "mob4054",
	Keywords = {
		"centipede"
	},
	Name = "the centipede",
	RoomDesc = "A white centipede is here.",
	FullDesc = "The centipede doesn't really seem to notice you.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d7+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d10+50",
		XPValue = 1000,
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
	Key = "mob4055",
	Keywords = {
		"hobgoblin"
	},
	Name = "the hobgoblin",
	RoomDesc = "A large hobgoblin is here.",
	FullDesc = "The hobgoblin looks quite dangerous.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d6+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "1d16+120",
		XPValue = 10000,
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
	Key = "mob4056",
	Keywords = {
		"orc"
	},
	Name = "the orc",
	RoomDesc = "An orc is here, looking for something (or perhaps someone?) to eat.",
	FullDesc = "Well, he doesn't seem to be friendly.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d5+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 17,
		HP = "3d10+100",
		XPValue = 4000,
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
	Key = "mob4057",
	Keywords = {
		"lion",
		"mountain"
	},
	Name = "the mountain lion",
	RoomDesc = "A mountain lion is here, growling at you viciously.",
	FullDesc = "The lion looks very nasty with huge claws and big teeth.",
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d10+60",
		XPValue = 900,
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
	Key = "mob4058",
	Keywords = {
		"giant",
		"hill"
	},
	Name = "the hill giant",
	RoomDesc = "A hill giant is here, tossing some rocks around.",
	FullDesc = [[
The hill giant looks like he's about 9 feet tall.  By his actions you 
quickly come to the conclusion that he isn't very intelligent.
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d10+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "1d10+160",
		XPValue = 16500,
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
	Key = "mob4100",
	Keywords = {
		"mage"
	},
	Name = "the mage",
	RoomDesc = "A small intelligent looking mage is standing here.",
	FullDesc = [[
His IQ makes almost any normal person look stupid...
It looks like he knows his way with magic. 
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "3d20+100",
		XPValue = 21000,
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
	Key = "mob4101",
	Keywords = {
		"troll"
	},
	Name = "the troll",
	RoomDesc = "A large mean-looking troll is here.",
	FullDesc = "Well, it looks dangerous!",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d7+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 18,
		HP = "2d10+100",
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
Config.NewEntity({
	Key = "mob4102",
	Keywords = {
		"snake"
	},
	Name = "the snake",
	RoomDesc = "A large green snake is here, looks like a guardian for an evil force.",
	FullDesc = "You see a evil creature.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "3d5+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 14,
		HP = "6d10+50",
		XPValue = 9000,
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
	Key = "mob4103",
	Keywords = {
		"thief"
	},
	Name = "the thief",
	RoomDesc = "A thief is here, all dressed in black.",
	FullDesc = [[
He seems to be counting a handful of coins.  Maybe you ought to count YOUR
gold too...
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
			ToHit = 7,
			Damage = "2d5+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "1d10+100",
		XPValue = 4000,
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
	Key = "mob4104",
	Keywords = {
		"orc",
		"ugly"
	},
	Name = "the orc",
	RoomDesc = "A ugly orc is standing here.",
	FullDesc = "It is quite disgusting to look at.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "2d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "1d5+90",
		XPValue = 2250,
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
	Key = "mob4105",
	Keywords = {
		"centipede"
	},
	Name = "the centipede",
	RoomDesc = "A small harmless centipede is here.",
	FullDesc = "Well it doesn't seem to pay any attention to you.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "1d8+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "3d10+50",
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
	Key = "mob4106",
	Keywords = {
		"warrior"
	},
	Name = "the warrior",
	RoomDesc = "A human warrior is here.  He has a evil grin in his face.",
	FullDesc = "He doesn't look friendly at all...",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 16,
		HP = "3d10+100",
		XPValue = 9000,
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
	Key = "mob4107",
	Keywords = {
		"kobold"
	},
	Name = "the kobold",
	RoomDesc = "A green kobold is here.",
	FullDesc = "It looks slimy..",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "1d9+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "4d10+25",
		XPValue = 3000,
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
