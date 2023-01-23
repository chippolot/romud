Config.NewEntity({
	Key = "mob1200",
	Keywords = {
		"innkeeper"
	},
	Name = "the Immortal Innkeeper",
	RoomDesc = "The Immortal Innkeeper is organizing her books here.",
	FullDesc = "She appears to be having no problem tallying things up.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 30,
		AC = 29,
		HP = "1d49+901",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob1201",
	Keywords = {
		"postmaster",
		"master",
		"post"
	},
	Name = "the Immortal Postmaster",
	RoomDesc = "The Immortal Postmaster is hard at work here.",
	FullDesc = "Scary... a postal worker... working?",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 30,
		AC = 29,
		HP = "1d49+901",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob1202",
	Keywords = {
		"being",
		"amorphous",
		"spirit",
		"wandering"
	},
	Name = "the wandering spirit",
	RoomDesc = "A strange amorphous being wanders these halls eternally cleaning.",
	FullDesc = [[
This spirit, having lived out its days in the mortal world, now
works off its final sins by doing menial labour in this realm's
purgatory.  In this case, those chores seem to be cleaning up
after the immortals of the land.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 30,
		AC = 29,
		HP = "1d49+901",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 0
})
