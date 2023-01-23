Config.NewEntity({
	Key = "mob6200",
	Keywords = {
		"deer"
	},
	Name = "the deer",
	RoomDesc = "A deer looks at you with fear in its eyes.",
	FullDesc = "That is one nice looking deer!",
	Flags = {
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
		AC = 9,
		HP = "3d5+33",
		XPValue = 350
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6201",
	Keywords = {
		"rabbit"
	},
	Name = "the rabbit",
	RoomDesc = "A small rabbit nibbles at a leaf here.",
	FullDesc = "It is a small, furry rodent with big ears.",
	Flags = {
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d3+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 0,
		AC = -11,
		HP = "1d5+3",
		XPValue = 25
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6202",
	Keywords = {
		"squirrel"
	},
	Name = "the squirrel",
	RoomDesc = "A squirrel spots you and runs around a tree!",
	FullDesc = [[
It is a small, brown squirrel.  Kind of like a
fuzzy high-tension spring.
]],
	Flags = {
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d1+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 0,
		AC = 29,
		HP = "1d3+0",
		XPValue = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6203",
	Keywords = {
		"orc",
		"hunter"
	},
	Name = "the orc hunter",
	RoomDesc = "An orc hunter looks at you with hateful eyes.",
	FullDesc = [[
He looks angry, desperate, and maybe a little sick.
His green skin is definitely mottled, and he seems to
limp a little bit...
]],
	Flags = {
		"aggro",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "2d3+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = -31,
		HP = "3d5+83",
		XPValue = 2250
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6204",
	Keywords = {
		"orc",
		"chief"
	},
	Name = "the orc chief",
	RoomDesc = "An orc chief growls at you!",
	FullDesc = [[
He wears a crown of oak leaves to show he is a leader.  He
carries a club to show he is a warrior.  You wonder how good
he is at both.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d7+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = -1,
		HP = "3d5+120",
		XPValue = 9000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6205",
	Keywords = {
		"orc",
		"woman"
	},
	Name = "the orc woman",
	RoomDesc = "An orc woman stands here, frightened of you.",
	FullDesc = [[
As you stare her down, she raises her hands slowly, as if to
say, 'Don't kill me'.
]],
	Flags = {
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
		AC = -51,
		HP = "3d5+58",
		XPValue = 900
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6206",
	Keywords = {
		"orc",
		"child"
	},
	Name = "the orc child",
	RoomDesc = "An orc child frantically searches for her mother.",
	FullDesc = "She is raggedy, and seems to be covered with sores.",
	Flags = {
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
		AC = -71,
		HP = "3d5+30",
		XPValue = 350
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6207",
	Keywords = {
		"orc",
		"woman"
	},
	Name = "the orc woman",
	RoomDesc = "A pregnant orc woman tries to stand to flee from you.",
	FullDesc = [[
She is too far gone to move very quickly.  You could
kill her easily.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "1d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = -81,
		HP = "3d5+58",
		XPValue = 750
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6208",
	Keywords = {
		"orc",
		"mutant",
		"mutated"
	},
	Name = "the mutant orc",
	RoomDesc = "A mutant orc lies here, barely alive.",
	FullDesc = [[
Its body has been twisted beyond all hope.  It is dying, and
nothing will stop that.
]],
	Flags = {
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d1+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = -81,
		HP = "1d1+0",
		XPValue = 1
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6209",
	Keywords = {
		"orc",
		"mutant",
		"mutated"
	},
	Name = "the mutant orc",
	RoomDesc = "A horribly mutated orc stands here, gibbering.",
	FullDesc = [[
It doesn't even appear to have registered your arrival... it is
just talking to itself.  Its body is a twisted wreck of orc, man,
beast, and what-not.
]],
	Flags = {
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d1+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = -81,
		HP = "3d5+60",
		XPValue = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6210",
	Keywords = {
		"wizard",
		"elf",
		"elven",
		"Elstar"
	},
	Name = "Elstar",
	RoomDesc = "An elven wizard is here.  He looks angry.",
	FullDesc = [[
He looks at you archly as he wonders why you have
invaded his domain.  No matter... it shouldn't be
too hard for him to destroy you, no?
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d8+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 94,
		HP = "3d5+183",
		XPValue = 21000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6211",
	Keywords = {
		"child",
		"elf",
		"elven",
		"apprentice"
	},
	Name = "the elven child",
	RoomDesc = "An elven child casts his fishing pole into the river.",
	FullDesc = "He looks young and innocent.  You wonder what he is doing here.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = -41,
		HP = "3d5+35",
		XPValue = 400
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6212",
	Keywords = {
		"mutant",
		"thing"
	},
	Name = "the mutant thing",
	RoomDesc = "A mutant... thing rushes at you!",
	FullDesc = [[
It might've been an orc, once.  Now it is a living terror,
pushing everything out of its way to get at you.
]],
	Flags = {
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 39,
		HP = "3d5+170",
		XPValue = 15000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6213",
	Keywords = {
		"mutant",
		"thing"
	},
	Name = "the mutant thing",
	RoomDesc = "A mutant... thing tries to get you, but cannot move into range!",
	FullDesc = [[
It might have been an orc, once.  Now it is a living terror,
pushing everything out of its way to get at you.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 39,
		HP = "3d5+170",
		XPValue = 15000
	},
	Gender = 0
})
