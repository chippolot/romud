Config.NewEntity({
	Key = "mob3600",
	Keywords = {
		"black",
		"pawn"
	},
	Name = "the Pawn of the Black Court",
	RoomDesc = "You see a pawn standing here waiting for orders.",
	FullDesc = [[
The Black Pawn looks quite like a small knight without his powerful steed.
His armor is shiny and black.  He stands ready to give his life for the
Crown.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "2d4+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 14,
		HP = "5d4+50",
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3601",
	Keywords = {
		"white",
		"pawn"
	},
	Name = "the Pawn of the White Court",
	RoomDesc = "You see a pawn standing here waiting for orders.",
	FullDesc = [[
The White Pawn looks quite like a small knight without his powerful steed.
His armor is spotless and white.  He stands ready to give his life for the
Crown.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "2d4+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 14,
		HP = "5d4+50",
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob3602",
	Keywords = {
		"black",
		"rook",
		"castle"
	},
	Name = "the Black Rook",
	RoomDesc = "In the corner you see a large, black, stone castle on wheels.",
	FullDesc = [[
The Black Rook is a very large man-made tomb on wheels.  Just
from the looks of it, it will probably be YOUR tomb.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "3d8+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 27,
		AC = 18,
		HP = "2d6+500",
		XPValue = 85000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3603",
	Keywords = {
		"white",
		"rook",
		"castle"
	},
	Name = "the White Rook",
	RoomDesc = "In the corner you see a large, white, stone castle on wheels.",
	FullDesc = [[
The White Rook is a very large man-made tomb on wheels.  Just
from the looks of it, it will probably be YOUR tomb.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "3d8+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 27,
		AC = 18,
		HP = "2d6+500",
		XPValue = 85000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3604",
	Keywords = {
		"black",
		"knight"
	},
	Name = "the Black Knight",
	RoomDesc = "Here stands a magnificent knight of the dark realm.",
	FullDesc = [[
The Black Knight is here, riding his ebony black war horse.  His eyes
flash behind his visor in vengence.
]],
	Flags = {
		"stationary",
		"aggro"
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
		Level = 18,
		AC = 19,
		HP = "4d8+350",
		XPValue = 22500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3605",
	Keywords = {
		"white",
		"knight"
	},
	Name = "the White Knight",
	RoomDesc = "Here stands a magnificent knight of the light realm.",
	FullDesc = [[
The White Knight is here, riding his ivory white war horse.  His eyes
gleam behind his visor in joy.
]],
	Flags = {
		"stationary",
		"aggro"
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
		Level = 18,
		AC = 19,
		HP = "4d8+350",
		XPValue = 22500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3606",
	Keywords = {
		"black",
		"bishop",
		"priest"
	},
	Name = "the Black Bishop",
	RoomDesc = "A dark priest stands here.",
	FullDesc = [[
The Black Bishop seems willing to help you straight into your grave so
he can bless you properly.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "3d6+13",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 18,
		HP = "2d5+350",
		XPValue = 43500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3607",
	Keywords = {
		"white",
		"bishop",
		"priest"
	},
	Name = "the White Bishop",
	RoomDesc = "A light priest stands here.",
	FullDesc = [[
The White Bishop seems willing to help you in any possible so that he can
attain a higher spirituality.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "3d6+13",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 18,
		HP = "2d5+350",
		XPValue = 43500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3608",
	Keywords = {
		"black",
		"queen"
	},
	Name = "the Black Queen",
	RoomDesc = "The Black Queen stands here.",
	FullDesc = [[
The Black Queen is a strikingly beautiful woman with pale skin and a
mass of dark hair that crowns her head like a black cloud.  If looks
could kill, you would already be dead.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "4d6+13",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 32,
		AC = 22,
		HP = "5d10+900",
		XPValue = 200000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3609",
	Keywords = {
		"white",
		"queen"
	},
	Name = "the White Queen",
	RoomDesc = "The White Queen stands here.",
	FullDesc = [[
The White Queen is a stunningly beautiful woman with dark skin and a mass
of light hair that frames her head like the sun.  This is surely love at
first sight for you.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "4d6+13",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 32,
		AC = 22,
		HP = "5d10+900",
		XPValue = 200000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3610",
	Keywords = {
		"black",
		"king"
	},
	Name = "the Black King",
	RoomDesc = "The Black King stands here.",
	FullDesc = [[
The Black King is a menacing figure.  You can easily understand why he
is the king and you are not.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "5d8+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 36,
		AC = 25,
		HP = "10d10+2000",
		XPValue = 300000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob3611",
	Keywords = {
		"white",
		"king"
	},
	Name = "the White King",
	RoomDesc = "The White King stands here.",
	FullDesc = [[
The White King is a stately figure.  You can easily understand why he
is the king and you are not.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "5d8+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 36,
		AC = 25,
		HP = "10d10+2000",
		XPValue = 300000
	},
	Gender = 0
})
