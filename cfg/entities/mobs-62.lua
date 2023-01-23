Config.NewEntity({
	Key = "mob6100",
	Keywords = {
		"warg",
		"vicious"
	},
	Name = "the vicious warg",
	RoomDesc = "A vicious warg is here, snarling angrily at you.",
	FullDesc = [[
It is an exceptionally large wolf with thick, black fur.  Saliva is dripping
quickly from its long, white fangs.  It looks quite dangerous and very angry.
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
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d12+60",
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
	Key = "mob6101",
	Keywords = {
		"warg",
		"ferocious"
	},
	Name = "the ferocious warg",
	RoomDesc = "A ferocious warg is here, snarling angrily at you.",
	FullDesc = [[
It is an exceptionally large wolf with thick, black fur.  Saliva is dripping
quickly from its long, white fangs.  It looks quite dangerous and very angry.
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
			Damage = "2d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d12+80",
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
	Key = "mob6102",
	Keywords = {
		"wolf",
		"grey"
	},
	Name = "the large, grey wolf",
	RoomDesc = "A large, grey wolf is here, glaring hungrily at you.",
	FullDesc = "The large, grey wolf eyes you with interest while licking its lips.",
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "1d7+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "1d12+35",
		XPValue = 450,
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
	Key = "mob6103",
	Keywords = {
		"wolf",
		"black"
	},
	Name = "the large, black wolf",
	RoomDesc = "A large, black wolf is here, glaring hungrily at you.",
	FullDesc = "The large, black wolf eyes you with interest while licking its lips.",
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "1d7+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "1d12+45",
		XPValue = 450,
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
	Key = "mob6110",
	Keywords = {
		"tree",
		"ancient"
	},
	Name = "the ancient tree",
	RoomDesc = "A huge, ancient tree towers above you.",
	FullDesc = [[
Its roots are extremely big and large parts of them are above ground.
Something about it makes you think that this is not a normal oak tree.

The enormous grey trunk shivers slightly, as if sighing deeply.
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d4+22",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 30,
		AC = 29,
		HP = "1d1+1299",
		XPValue = 500000,
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
	Key = "mob6111",
	Keywords = {
		"tree",
		"ancient"
	},
	Name = "the ancient tree",
	RoomDesc = "A huge, ancient tree towers above you.",
	FullDesc = [[
Its roots are extremely big and large parts of them are above ground.
Something about it makes you think that this is not a normal oak tree.

The enormous grey trunk emits a deep, moaning sound.
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d4+18",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 30,
		AC = 29,
		HP = "1d1+999",
		XPValue = 400000,
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
	Key = "mob6112",
	Keywords = {
		"dragon",
		"green"
	},
	Name = "the green dragon",
	RoomDesc = "A huge green dragon is here, its narrow yellow eyes glowing with rage.",
	FullDesc = [[
This enormous winged serpent has dark green scales covering most of its
colossal body.  Numerous holes in its heavy wings tell of many fights as
does the nicks in the horns on its head.  It smells as disgusting as only
dragons do.
]],
	Flags = {
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "2d6+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 19,
		HP = "1d12+248",
		XPValue = 40000,
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
	Key = "mob6113",
	Keywords = {
		"spider",
		"poisonous"
	},
	Name = "the huge, poisonous spider",
	RoomDesc = "A huge, poisonous spider is here.",
	FullDesc = [[
This disgusting creature is at the size of a human crawling on all four.  It
has eight hairy legs that gives it a tremendous speed on almost any surface
and sharp poisonous fangs to paralyze or kill its prey.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 17,
		HP = "1d12+98",
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
	Key = "mob6114",
	Keywords = {
		"queen",
		"spider"
	},
	Name = "the Queen spider",
	RoomDesc = "The huge, bulky Queen spider is here.",
	FullDesc = [[
This disgusting creature is at the size of a small elephant.  It has eight
huge, hairy legs that would give it a tremendous speed on almost any surface
if it wasn't so immensely fat.  Its large, bulbous eyes stare back at you.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d8+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 18,
		HP = "1d12+185",
		XPValue = 31000,
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
	Key = "mob6115",
	Keywords = {
		"shargugh",
		"brownie"
	},
	Name = "Shargugh",
	RoomDesc = "Shargugh the Forest Brownie is here, grinning broadly at you.",
	FullDesc = [[
This little fellow is only three foot tall with wild matted brown hair and
long tangled brown beard.  He wears ragged brown and green clothing and looks
as if he is having great fun.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"invisible",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "1d8+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 29,
		HP = "1d12+47",
		XPValue = 11000,
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
	Key = "mob6116",
	Keywords = {
		"elder",
		"druid"
	},
	Name = "the Elder druid",
	RoomDesc = "The Elder druid is here.  He looks very upset about your presence in his home.",
	FullDesc = [[
The druid looks quite old.  You would think of him as venerable but yet you
know he would be a tough foe.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "3d6+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "1d12+236",
		XPValue = 45000,
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
	Key = "mob6117",
	Keywords = {
		"isha",
		"elf"
	},
	Name = "Isha the Dark Elf",
	RoomDesc = "Isha the Dark Elf is here, observing you silently.",
	FullDesc = [[
She is no less than beautiful, skin as dark as the night and hair
shining like silver in the moonlight.  Her slender body is adorned
with a sleeveless shirt and a short skirt made from black scales
joined with silver threads.  Her back is covered by a large, hooded
cloak as black as her skin and in her broad silver belt hangs a long,
slender sword in a silver scabbard.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
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
		HP = "1d12+245",
		XPValue = 40000,
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
