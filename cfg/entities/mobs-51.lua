Config.NewEntity({
	Key = "mob5000",
	Keywords = {
		"dervish",
		"raggity"
	},
	Name = "the dervish",
	RoomDesc = "A raggity dervish walks on aimlessly.",
	FullDesc = "Dressed in loose fitting rags, this man looks like he could use some rest.",
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
		XPValue = 1000,
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
	Key = "mob5001",
	Keywords = {
		"dervish",
		"large"
	},
	Name = "the dervish",
	RoomDesc = "A large dervish watches for signs of trouble.",
	FullDesc = [[
Dressed in loose fitting rags, this man looks like he could use LOTS of
rest.
]],
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
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
		Level = 8,
		AC = 16,
		HP = "2d6+100",
		XPValue = 7000,
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
	Key = "mob5002",
	Keywords = {
		"snake",
		"coral"
	},
	Name = "the coral snake",
	RoomDesc = "A brightly colored snake slithers along the sands.",
	FullDesc = [[
This relatively harmless snake has bright alternating bands of red, yellow
and black.
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d9+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 15,
		HP = "1d6+40",
		XPValue = 600,
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
	Key = "mob5003",
	Keywords = {
		"scorpion",
		"small"
	},
	Name = "the small scorpion",
	RoomDesc = "A small, red scorpion scuttles away at your approach.",
	FullDesc = "The little tail is mighty dangerous for such a small creature.",
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d8+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 18,
		HP = "1d6+40",
		XPValue = 500,
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
	Key = "mob5004",
	Keywords = {
		"worm",
		"giant",
		"purple"
	},
	Name = "the sand worm",
	RoomDesc = "A giant, purple sand worm thrusts up out of the sand and attacks!",
	FullDesc = "He's big, mean, and purple.  Watch out!",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d7+14",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 21,
		AC = 16,
		HP = "2d10+320",
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
Config.NewEntity({
	Key = "mob5005",
	Keywords = {
		"dragon",
		"brass"
	},
	Name = "the brass dragon",
	RoomDesc = "A very large brass dragon steps out of the darkness and says 'Hello.'",
	FullDesc = "Then adds to it, 'Prepare to die, have a nice day!'",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d6+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 19,
		HP = "2d6+500",
		XPValue = 45000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5006",
	Keywords = {
		"nomad",
		"leader"
	},
	Name = "the nomad leader",
	RoomDesc = "The nomad leader sits silently in prayer.",
	FullDesc = [[
He is clad in silk robes lined with gold thread. At his side is a large,
engraved cutlass.  He has an especially haughty air about him.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d8+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 19,
		HP = "2d6+170",
		XPValue = 18000,
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
	Key = "mob5007",
	Keywords = {
		"nomad",
		"commander"
	},
	Name = "the nomad commander",
	RoomDesc = "The nomad commander stands here staring at you suspiciously.",
	FullDesc = [[
This is the nomad leader's second in command.  His clothes are richly woven
of silk and gold thread.  A nasty cutlass hangs at his side.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d5+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 18,
		HP = "2d6+135",
		XPValue = 14000,
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
	Key = "mob5008",
	Keywords = {
		"nomad",
		"warrior"
	},
	Name = "the nomad warrior",
	RoomDesc = "A proud nomad warrior stands here.",
	FullDesc = "This warrior is dressed in typical nomad clothing and looks quite mean.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "1d6+105",
		XPValue = 7000,
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
	Key = "mob5009",
	Keywords = {
		"slave",
		"young"
	},
	Name = "the slave",
	RoomDesc = "A young slave sits here staring at you with pleading eyes.",
	FullDesc = "She looks quite thin and weak.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "1d5+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 10,
		HP = "1d4+25",
		XPValue = 300,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5010",
	Keywords = {
		"dracolich",
		"lich"
	},
	Name = "the dracolich",
	RoomDesc = "A pile of bones rises up to form a skeletal dracolich.",
	FullDesc = [[
The dracolich is now only bone with pieces of flesh hanging from it.
Obviously it no longer fears death.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"invisible",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d5+35",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 25,
		HP = "1d12+520",
		XPValue = 125000,
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
	Key = "mob5011",
	Keywords = {
		"drider"
	},
	Name = "the drider",
	RoomDesc = "The drider looks at you viciously while it draws its sword.",
	FullDesc = "This half-spider, half-drow creature is a formidable opponent.",
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 17,
		HP = "1d6+95",
		XPValue = 4000,
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
	Key = "mob5012",
	Keywords = {
		"duergar",
		"dark",
		"dwarf"
	},
	Name = "the dark dwarf",
	RoomDesc = "A duergar is here mining precious stones with his pick.",
	FullDesc = [[
The duergar could probably crush your head as easily as he does those
rocks.
]],
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "2d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 16,
		HP = "1d11+60",
		XPValue = 1250,
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
	Key = "mob5013",
	Keywords = {
		"myconoid"
	},
	Name = "the myconoid",
	RoomDesc = "A myconoid lumbers along peacefully.",
	FullDesc = [[
The myconoid looks something like a giant mushroom (and probably has the
same effect).
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "2d7+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "1d12+68",
		XPValue = 600,
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
	Key = "mob5014",
	Keywords = {
		"myconoid",
		"shaman"
	},
	Name = "the myconoid shaman",
	RoomDesc = "A rather large myconoid stands here chanting in a strange tongue.",
	FullDesc = "The shaman shoots spores into the air.",
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d7+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "1d12+173",
		XPValue = 18000,
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
	Key = "mob5015",
	Keywords = {
		"dustdigger",
		"oasis"
	},
	Name = "the dustdigger",
	RoomDesc = "A small oasis invites you to dive in.",
	FullDesc = [[
Looking a little closer at this oasis, you begin to wonder why
it seems to be moving about...
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
			Damage = "3d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 18,
		HP = "1d6+85",
		XPValue = 2250,
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
	Key = "mob5017",
	Keywords = {
		"camel"
	},
	Name = "the camel",
	RoomDesc = "A very dangerous creature, a camel, snorts at you.",
	FullDesc = [[
It is advisable not to mess with this creature.  After all, you
have heard many a horror story about experiences with camels.
Bad experiences.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d4+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 13,
		HP = "1d6+60",
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
