Config.NewEntity({
	Key = "mob3100",
	Keywords = {
		"maid"
	},
	Name = "the Maid",
	RoomDesc = "The Maid is waiting for your order.",
	FullDesc = [[
She is very beautiful with golden hair, and deep blue eyes.  A good reason
for coming here more often, you think to yourself.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "1d8+22",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 80000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob3101",
	Keywords = {
		"sexton"
	},
	Name = "the Sexton",
	RoomDesc = "A Sexton is sitting here, drinking hot tea.",
	FullDesc = "The Sexton looks like he is relaxing after another gravedigging job.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "2d6+35",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "1d7+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 300
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3102",
	Keywords = {
		"chief",
		"guard"
	},
	Name = "the Chief Guard",
	RoomDesc = "The Chief Guard is looking very upset.",
	FullDesc = "A very angry chief.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Stats = {
		Level = 17,
		AC = 18,
		HP = "1d12+210",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 17,
				Damage = "1d8+18",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 28000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3103",
	Keywords = {
		"cityguard",
		"guard"
	},
	Name = "the upset cityguard",
	RoomDesc = "A cityguard stands here, looking very upset.",
	FullDesc = "A big, strong, angry guard.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "1d12+123",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d8+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 9000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3104",
	Keywords = {
		"secretary"
	},
	Name = "the Secretary",
	RoomDesc = "A secretary is sitting at the desk, typing away on the typewriter.",
	FullDesc = [[
She looks very busy.

The Secretary says 'Sorry, but the Mayor is extremely busy today.'
The Secretary says 'Please sit down and have a seat in the meantime.'
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "1d12+148",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "2d7+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 13000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob3105",
	Keywords = {
		"mayor"
	},
	Name = "the Mayor",
	RoomDesc = "The Mayor is sitting in his huge chair, snoring loudly.",
	FullDesc = "He is a stocky, middle-aged man with thin, grey hair.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 24,
		AC = 23,
		HP = "6d10+790",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "1d8+18",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 130000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3106",
	Keywords = {
		"crier"
	},
	Name = "the Town Crier",
	RoomDesc = "The Town Crier is here, weeping quietly.",
	FullDesc = "He is very good at his job - completely dissolved in tears.",
	Flags = {
	},
	Stats = {
		Level = 1,
		AC = 10,
		HP = "2d6+10",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d5+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 100
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3120",
	Keywords = {
		"swan"
	},
	Name = "the swan",
	RoomDesc = "A swan is swimming around in the pond.",
	FullDesc = "The white swan is very elegant.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 1,
		AC = 10,
		HP = "2d6+10",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d5+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 100
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3121",
	Keywords = {
		"duckling"
	},
	Name = "the duckling",
	RoomDesc = "A duckling is swimming around in the pond.",
	FullDesc = "The duckling is adorable, it looks most of all like a tiny furball.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 0,
		AC = 9,
		HP = "1d1+0",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d1+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3122",
	Keywords = {
		"sparrow"
	},
	Name = "the sparrow",
	RoomDesc = "A sparrow is flapping around on the ground.",
	FullDesc = "The sparrow looks like it is enjoying life.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 0,
		AC = 9,
		HP = "2d6+0",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d3+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 25
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3123",
	Keywords = {
		"duck"
	},
	Name = "the duck",
	RoomDesc = "A duck is here, quacking happily.",
	FullDesc = "The duck is quite fat.  It looks like it is enjoying life.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 1,
		AC = 9,
		HP = "2d6+5",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d4+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 75
	},
	Gender = 0
})
