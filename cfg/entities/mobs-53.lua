Config.NewEntity({
	Key = "mob5200",
	Keywords = {
		"beholder"
	},
	Name = "the mighty beholder",
	RoomDesc = "You meet a beholder's deadly gaze!",
	FullDesc = [[
It has a large central eye that projects an anti-magic ray and ten
eyestalks atop the round body which can do anything from charm you
to disintegrate you.  Beholders are not known for their personality.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "6d9+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 19,
		HP = "1d14+450",
		XPValue = 134000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5201",
	Keywords = {
		"lamia",
		"beast"
	},
	Name = "the lamia",
	RoomDesc = "A strange lamia stands here waiting for her next meal. ",
	FullDesc = [[
This is a creature with the upper torso of a beautiful woman, but the lower
body of a four-legged beast.  She licks her lips as she looks at you greedily.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 16,
		HP = "1d10+120",
		XPValue = 10500
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5202",
	Keywords = {
		"mimic",
		"chest"
	},
	Name = "the mimic",
	RoomDesc = "A strong chest lies in one corner of the room.",
	FullDesc = [[
A strong, wooden chest bound with iron straps and a heavy padlock on the
front.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d7+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 18,
		HP = "1d20+130",
		XPValue = 13000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5203",
	Keywords = {
		"mimic",
		"boulder",
		"skeleton",
		"skeletons"
	},
	Name = "the mimic",
	RoomDesc = "Two skeletons lie crushed under a large boulder.",
	FullDesc = [[
This large boulder seems to have been dropped here at some point, since
there aren't any boulders native to this area.  The two skeletons beneath
it are simply that, bones... no rags or anything else appears to be
attached to them.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "3d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "3d15+150",
		XPValue = 20000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5204",
	Keywords = {
		"mimic",
		"floor"
	},
	Name = "the mimic",
	RoomDesc = "The stone floor of this house has been ripped apart.",
	FullDesc = [[
What a mess, you wonder to yourself what could have caused this rampant
destruction.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d6+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 16,
		HP = "2d6+110",
		XPValue = 10500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5205",
	Keywords = {
		"mimic",
		"pottery",
		"shards"
	},
	Name = "the mimic",
	RoomDesc = "Some broken shards of pottery lie strewn about the floor.",
	FullDesc = [[
The pottery shards appear to have been part of a large vase at one point,
probably before the city fell.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "2d5+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 19,
		HP = "1d8+100",
		XPValue = 9800
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5206",
	Keywords = {
		"mimic",
		"planks",
		"wooden"
	},
	Name = "the mimic",
	RoomDesc = "A few wooden planks lie stacked on a low shelf.",
	FullDesc = [[
The fact that these planks still rest on this shelf leads you to believe
that someone has been here before you...
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "4d3+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 19,
		HP = "1d12+110",
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5207",
	Keywords = {
		"lizard",
		"horned"
	},
	Name = "the horned lizard",
	RoomDesc = "A small horned lizard flicks his tongue and slithers away.",
	FullDesc = "A cute little lizard -- that is, if you like reptiles!",
	Flags = {
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 15,
		HP = "1d14+30",
		XPValue = 500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5208",
	Keywords = {
		"golem",
		"stone"
	},
	Name = "the stone golem",
	RoomDesc = "In the corner you see a large, stone golem faithfully standing watch.",
	FullDesc = [[
It is a big chunk of rock that has been magically formed into a giant stone
creature.  He stands here still guarding the city.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d7+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 24,
		HP = "6d6+500",
		XPValue = 145000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5209",
	Keywords = {
		"lamia",
		"beast"
	},
	Name = "the lamia",
	RoomDesc = "A strange lamia stands here waiting for her next meal. ",
	FullDesc = [[
This is a creature with the upper torso of a beautiful woman, but the lower
body of a four-legged beast.  She licks her lips as she looks at you greedily.
]],
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "1d4+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 16,
		HP = "1d12+120",
		XPValue = 7000
	},
	Gender = 2
})
