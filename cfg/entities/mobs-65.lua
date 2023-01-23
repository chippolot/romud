Config.NewEntity({
	Key = "mob6400",
	Keywords = {
		"goat",
		"mountain"
	},
	Name = "the mountain goat",
	RoomDesc = "A mountain goat nibbles at a piece of grass here.",
	FullDesc = [[
This goat is acclimated to the rugged terrain of the 
mountains.  It looks at you and shies away a little.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "3d5+95",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 7,
				Damage = "2d5+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 4000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6401",
	Keywords = {
		"demon",
		"decay"
	},
	Name = "the Demon of Decay",
	RoomDesc = "A cloaked and clawed demon of decay comes at you viciously!",
	FullDesc = [[
This demon has pure malevolence for anything living.  
Oops!  You're living!  I guess that means you!
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "3d5+145",
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
		XPValue = 10000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6402",
	Keywords = {
		"book",
		"monster",
		"guardian"
	},
	Name = "the Book Monster",
	RoomDesc = "A mound of books rise up into a human shape and tries to hit you!",
	FullDesc = [[
Ironically enough, the book-monster's head is War and
Peace.  Hmm.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "1d1+199",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "2d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 18000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6403",
	Keywords = {
		"bad",
		"feeling"
	},
	Name = "a Bad Feeling",
	RoomDesc = "A bad feeling chokes your throat.",
	FullDesc = [[
It resembles a lot of other bad feelings you've had,
but a lot more tangible... magic?
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 18,
		AC = 19,
		HP = "1d1+249",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 17,
				Damage = "3d8+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 40000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6404",
	Keywords = {
		"nightmare"
	},
	Name = "Your Worst Nightmare",
	RoomDesc = "Your worst nightmare coalesces in front of you and attacks!",
	FullDesc = [[
It looks like you deepest, darkest fears personified.
Wait a minute!  It IS your deepest, darkest fears
personified!
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "1d1+299",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 18,
				Damage = "3d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 45000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6405",
	Keywords = {
		"guardian"
	},
	Name = "the Guardian",
	RoomDesc = "A guardian guards the door.  It looks at you and attacks!",
	FullDesc = [[
The guardian guards the door.  That's about all its
brain can handle: guarding.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 18,
		AC = 19,
		HP = "1d1+249",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 17,
				Damage = "3d6+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 35000
	},
	Gender = 0
})
