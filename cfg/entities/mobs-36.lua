Config.NewEntity({
	Key = "mob3500",
	Keywords = {
		"wyvern"
	},
	Name = "the wyvern",
	RoomDesc = "A monstrous wyvern slowly circles just above your head.",
	FullDesc = [[
This huge winged creature looks really menacing as it circles only inches
above your head, flapping its wings and squawking very loudly.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "2d10+90",
		XPValue = 3575,
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
	Key = "mob3501",
	Keywords = {
		"goblin",
		"mountain"
	},
	Name = "the goblin",
	RoomDesc = "A mountain goblin is wandering around mumbling to himself...",
	FullDesc = [[
You see before you a small and twisted creature with knotted muscles and
disgustingly green skin.  Doesn't look like the type you'd invite to dinner.
]],
	Flags = {
		"usesequipment",
		"aggro",
		"assistall",
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
		Level = 4,
		AC = 13,
		HP = "1d1+55",
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
	Key = "mob3502",
	Keywords = {
		"goblin",
		"lieutenant"
	},
	Name = "the goblin lieutenant",
	RoomDesc = "A goblin lieutenant stands here, attempting to get his men in order.",
	FullDesc = [[
The goblin lieutenant is rather angry, and looking for one of his men to
beat up upon, but maybe you will do just fine...
]],
	Flags = {
		"usesequipment",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "2d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 16,
		HP = "1d12+100",
		XPValue = 2000,
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
	Key = "mob3503",
	Keywords = {
		"goblin",
		"leader"
	},
	Name = "the goblin leader",
	RoomDesc = "The goblin leader surveys the room.",
	FullDesc = [[
The leader doesn't look too happy that you have found him here.  He grabs
for his shortsword and lunges for your neck.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d5+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 18,
		HP = "1d12+120",
		XPValue = 8000,
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
	Key = "mob3504",
	Keywords = {
		"boy",
		"small"
	},
	Name = "the small boy",
	RoomDesc = "A small boy sits here, licking his wounds.",
	FullDesc = [[
The poor boy has numerous cuts and scratches, but appears to be all right.
He is apparently the only survivor of the ambush.
]],
	Flags = {
		"stationary",
		"usesequipment"
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
		Level = 4,
		AC = 13,
		HP = "1d12+47",
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
	Key = "mob3505",
	Keywords = {
		"innkeeper"
	},
	Name = "the Innkeeper",
	RoomDesc = "The Innkeeper stands here, cleaning glasses.",
	FullDesc = [[
The Innkeeper now spends most of his days waiting for customers, while the
nights are spent watching out for goblins.  His inn is no longer the happy
place that is used to be in days past.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"assistall",
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
		Level = 10,
		AC = 18,
		HP = "1d12+200",
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
	Key = "mob3506",
	Keywords = {
		"bard"
	},
	Name = "the bard",
	RoomDesc = "A sullen bard is here, drinking away his problems.",
	FullDesc = [[
You can smell the alcohol on his breath from across the room.  This poor
bard has been sitting here quite a while, drinking himself into oblivion.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d6+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "1d12+110",
		XPValue = 3750,
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
	Key = "mob3507",
	Keywords = {
		"horseman",
		"dark"
	},
	Name = "the dark horseman",
	RoomDesc = "A dark horseman is here, mounted on his black steed.",
	FullDesc = [[
The man is obviously an outlaw, and has no qualms about slashing you into
little bits.
]],
	Flags = {
		"usesequipment",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "1d5+7",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 15,
		HP = "1d12+97",
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
