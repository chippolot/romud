Config.NewEntity({
	Key = "mob6301",
	Keywords = {
		"spider",
		"young"
	},
	Name = "the young spider",
	RoomDesc = "The young spider is ballooning by you.",
	FullDesc = [[
He looks freshly hatched and sprightly.  His young fangs are just
growing in as of late.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "1d12+40",
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
		XPValue = 350
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6302",
	Keywords = {
		"yevaud",
		"dragon",
		"usurper"
	},
	Name = "Yevaud",
	RoomDesc = "Yevaud, the Usurper of Midgaard is here, grinning evilly at you.",
	FullDesc = "Old, scaly, but still with a lot of bite in him left.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 24,
		AC = 22,
		HP = "5d4+450",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d7+7",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 120000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6303",
	Keywords = {
		"spider",
		"wolf"
	},
	Name = "the wolf spider",
	RoomDesc = "The wolf spider is here, licking its bloody fangs.",
	FullDesc = "The wolf spider is hairy, very hairy.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 6,
		AC = 13,
		HP = "3d8+70",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d5+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 6000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6304",
	Keywords = {
		"orc"
	},
	Name = "the orc",
	RoomDesc = "The orc is stuck in the web and he can't get out.",
	FullDesc = [[
You notice an evil look in his eyes, but he seems quite drained of life,
and all he can do is glare at you while he's stuck in this web.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 2,
		AC = 11,
		HP = "2d10+10",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "2d3+0",
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
	Key = "mob6305",
	Keywords = {
		"wasp",
		"queen"
	},
	Name = "the queen wasp",
	RoomDesc = "The queen wasp is here, thinking how tasty you look.",
	FullDesc = "You notice a glazed look in her eyes.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "1d12+172",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "2d8+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 18000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6306",
	Keywords = {
		"spider",
		"drone"
	},
	Name = "the drone spider",
	RoomDesc = "A drone spider walks around doing its master's bidding.",
	FullDesc = "An ordinary drone spider.",
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "3d8+70",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 6,
				Damage = "2d4+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1600
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6307",
	Keywords = {
		"spider",
		"ethereal"
	},
	Name = "the ethereal spider",
	RoomDesc = "An ethereal spider strides here, traveling to different worlds.",
	FullDesc = [[
She winks in and out of reality.  It looks like it'd be difficult to hit her
without a magical weapon.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"invisible",
		"stayzone"
	},
	Stats = {
		Level = 13,
		AC = 21,
		HP = "1d12+163",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "2d4+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 16000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6308",
	Keywords = {
		"slave",
		"human"
	},
	Name = "the slave",
	RoomDesc = "A human slave of Arachnos works here relentlessly.",
	FullDesc = [[
The slave does not mind you, but will fight like a warrior if attacked.
He serves the spider Empress, Arachnos, though whether it is by choice
or because he was beguiled, you are not fully certain.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 15,
		HP = "1d12+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 12,
				Damage = "2d7+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 13500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6309",
	Keywords = {
		"quasit"
	},
	Name = "the quasit",
	RoomDesc = "A quasit blinks in and out, grinning at you.",
	FullDesc = [[
Demoniac in nature, but more mischievous.  He twiddles his thumbs
and creates a magical treasure!
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"invisible",
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 29,
		HP = "1d12+47",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 19,
				Damage = "1d8+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 11000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6310",
	Keywords = {
		"spider",
		"bird"
	},
	Name = "the bird spider",
	RoomDesc = "The bird spider snaps its powerful jaws.",
	FullDesc = "The Bird Spider has very powerful jaws.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "1d8+100",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "2d9+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 18000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6311",
	Keywords = {
		"hermit"
	},
	Name = "the hermit",
	RoomDesc = "The hermit sits here and warns, 'Go back before it is too late!'",
	FullDesc = [[
A dishevelled veteran warrior in disguise is what he is, but he
means well.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "3d10+90",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 7,
				Damage = "2d5+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6312",
	Keywords = {
		"donjonkeeper",
		"keeper"
	},
	Name = "the Donjonkeeper",
	RoomDesc = "The Donjonkeeper eyes you and wonders how pure your soul is.",
	FullDesc = [[
He delves deeper into you as you stare at him.  Only those free of taint
will be allowed to remain here safely.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 25,
		AC = 20,
		HP = "1d12+600",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d8+8",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 125000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6313",
	Keywords = {
		"guardian"
	},
	Name = "the guardian",
	RoomDesc = "The guardian is obviously not doing his job.",
	FullDesc = "He looks like a lazy bum who sleeps half the time.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 17,
		AC = 18,
		HP = "1d12+200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "2d8+8",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 24000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6314",
	Keywords = {
		"arachnos",
		"spider",
		"empress"
	},
	Name = "Arachnos",
	RoomDesc = "Arachnos the Empress of Spiders welcomes you with an evil smile.",
	FullDesc = [[
She is a very attractive spider with an ornate gown.  She tempts you
into being one of her many slaves.  She does not possess the venomous
fangs of normal spiders, but then, as you realize, she does not need
them.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 26,
		AC = 21,
		HP = "6d10+650",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "1d8+25",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 155000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6315",
	Keywords = {
		"ki-rin"
	},
	Name = "the Ki-Rin",
	RoomDesc = "The Ki-Rin smiles good-naturedly to you.",
	FullDesc = [[
She is the last bastion of good in this realm.  Her mission is to
someday free the slaves of the Empress.  She has been trapped here for
time eternal, and now the evil power of Arachnos feeds upon her intense
magical energies.  She will never give up here fight against evil,
though, and will continue her work in whatever manner presents itself.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 26,
		AC = 23,
		HP = "10d8+2500",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d4+22",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 170000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6316",
	Keywords = {
		"dragon",
		"wormkin",
		"young"
	},
	Name = "the young wormkin",
	RoomDesc = "A wormkin with no teeth plays here.",
	FullDesc = "It is a rather small dragon, and you almost feel sad about killing it.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 9,
		AC = 16,
		HP = "5d4+110",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d5+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 6500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6317",
	Keywords = {
		"dragon",
		"wormkin",
		"elder"
	},
	Name = "the elder wormkin",
	RoomDesc = "A wormkin that has grown a bit stares at you inquisitively.",
	FullDesc = [[
A medium-sized dragon -- seems it hasn't killed anything yet by itself, 
though there is a first time for everything...
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 16,
		AC = 18,
		HP = "5d4+210",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "2d6+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 24000
	},
	Gender = 1
})
