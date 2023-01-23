Config.NewEntity({
	Key = "mob2500",
	Keywords = {
		"shadow",
		"guardian"
	},
	Name = "the shadow guardian",
	RoomDesc = "A shadow guardian screams a challenge and attacks.",
	FullDesc = "It seems to be made of nothing more than darkness...",
	Flags = {
		"scavenger",
		"trashcollector",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 18,
		HP = "9d9+90",
		XPValue = 4000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2501",
	Keywords = {
		"adventurer"
	},
	Name = "the lost adventurer",
	RoomDesc = "An emaciated adventurer is here looking lost and hopeless.",
	FullDesc = "He looks haggard and sickly; no doubt he's been lost here for quite some time.",
	Flags = {
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 13,
		HP = "10d10+10",
		XPValue = 1500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2502",
	Keywords = {
		"edgar"
	},
	Name = "Edgar",
	RoomDesc = "Edgar the Human Swordpupil is standing here, looking quite lost.",
	FullDesc = [[
Edgar says 'pardon me, can you tell me where to buy cups?'

You see before you, one of Midgaard's finest fighting elite, the mighty
bunny slayer himself, Edgar the Horrible!
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d8+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 9,
		HP = "3d9+10",
		XPValue = 100
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2503",
	Keywords = {
		"diamond",
		"golem"
	},
	Name = "the diamond golem",
	RoomDesc = "A huge diamond golem is standing guard here.",
	FullDesc = "It looks quite strong.",
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d6+15",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 29,
		HP = "23d23+230",
		XPValue = 15000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2504",
	Keywords = {
		"mage",
		"young"
	},
	Name = "the mage",
	RoomDesc = "A young mage wanders about, oblivious to all.",
	FullDesc = [[
He seems to be contemplating life, love and the mysteries of the universe.
Then again, he may just have a headache.
]],
	Flags = {
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "1d8+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 20,
		HP = "10d10+100",
		XPValue = 3500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2505",
	Keywords = {
		"strick",
		"bartender"
	},
	Name = "Strick the bartender",
	RoomDesc = "Strick is here levitating drinks to his customers.",
	FullDesc = "He looks rather harmless, but then again so does a sleeping dragon.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d7+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 25,
		HP = "1d1+30000",
		XPValue = 20000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2506",
	Keywords = {
		"tatorious",
		"wizard"
	},
	Name = "Tatorious",
	RoomDesc = "Tatorious the wizard is here counting his earnings.",
	FullDesc = "Tatorious winks at you mischievously.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d7+21",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 27,
		HP = "1d1+30000",
		XPValue = 24000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2507",
	Keywords = {
		"ezmerelda",
		"cook"
	},
	Name = "Ezmerelda",
	RoomDesc = "Ezmerelda the cook is here stirring a large pot of something.",
	FullDesc = [[
She does not look like the typical cook you would find in a kitchen,
but she certainly fits what you would expect in a tower fulls of
mages.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "3d4+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 20,
		HP = "20d20+200",
		XPValue = 31300
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2508",
	Keywords = {
		"assistant",
		"mage",
		"cook"
	},
	Name = "the cook's assistant",
	RoomDesc = "The cook's assistant is here assisting the cook.",
	FullDesc = "This young man is busy adding strange ingredients to the large pot.",
	Flags = {
		"stationary",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "3d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 18,
		HP = "11d11+110",
		XPValue = 4600
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2509",
	Keywords = {
		"prisoner"
	},
	Name = "the prisoner",
	RoomDesc = "A prisoner is chained to the wall here.",
	FullDesc = [[
Though his clothes are all in rags, you can see that at one time they
must have been fine garments.  A metal muzzle has been fitted over the
poor wretch's mouth, whether to keep him from screaming, or to silence
his spell casting you cannot tell.

He looks quite mad, no doubt he has been mistreated horribly.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d4+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 17,
		HP = "3d30+30",
		XPValue = 1800
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2510",
	Keywords = {
		"jailor",
		"mage"
	},
	Name = "the Jailor",
	RoomDesc = "The Jailor is here enjoying a comfortable nap.",
	FullDesc = "He looks rather dirty.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d5+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 17,
		AC = 22,
		HP = "17d17+170",
		XPValue = 12000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2511",
	Keywords = {
		"broom"
	},
	Name = "the broom",
	RoomDesc = "A straw broom is here leaning against the wall.",
	FullDesc = "The broom screams 'Take that you lout!'",
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 17,
		HP = "7d7+70",
		XPValue = 1600
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2512",
	Keywords = {
		"lesser",
		"guardian",
		"hands"
	},
	Name = "the pair of disembodied hands",
	RoomDesc = "A pair of disembodied hands floats in the air here.",
	FullDesc = "The hands twitch with anticipation of strangling someone.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d4+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 24,
		HP = "9d9+90",
		XPValue = 3100
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2513",
	Keywords = {
		"guardian",
		"greater",
		"eyes"
	},
	Name = "the pair of disembodied eyes",
	RoomDesc = "A pair of disembodied eyes floats here glaring at you.",
	FullDesc = "The eyes smoulder with hatred.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d4+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 28,
		HP = "15d15+150",
		XPValue = 9100
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2514",
	Keywords = {
		"mage",
		"visitor"
	},
	Name = "the mage",
	RoomDesc = "A visiting mage is here snoring away in peaceful slumber.",
	FullDesc = "He looks quite sleepy.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d4+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 21,
		HP = "12d12+120",
		XPValue = 6200
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2515",
	Keywords = {
		"apprentice",
		"young"
	},
	Name = "the young apprentice magic user",
	RoomDesc = "A young apprentice magic user is here doing magical studies.",
	FullDesc = "She looks quite intent on her studies.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d4+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 17,
		HP = "7d6+25",
		XPValue = 2950
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2516",
	Keywords = {
		"apprentice",
		"young"
	},
	Name = "the young apprentice",
	RoomDesc = "A young apprentice is here mumbling words of magic to himself.",
	FullDesc = "He looks to be oblivious to all but the spell he is memorizing.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d4+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 17,
		HP = "7d6+25",
		XPValue = 2750
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2517",
	Keywords = {
		"apprentice",
		"young"
	},
	Name = "the young apprentice",
	RoomDesc = "A young apprentice is sleeping here.",
	FullDesc = "He seems to be dreaming.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 17,
		HP = "7d6+25",
		XPValue = 2650
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2518",
	Keywords = {
		"apprentice",
		"young"
	},
	Name = "the young apprentice",
	RoomDesc = "A young apprentice is here teasing a cornered kitten.",
	FullDesc = "He looks like a mischievous youth.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d4+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 18,
		HP = "7d6+25",
		XPValue = 2300
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2519",
	Keywords = {
		"kitten"
	},
	Name = "the small kitten",
	RoomDesc = "A small kitten is here meowing in terror.",
	FullDesc = [[
The little ball of fur looks very unhappy.  Singed fur and a few minor
burns mark its mottled coat.
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
			ToHit = 0,
			Damage = "1d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 18,
		HP = "1d1+10",
		XPValue = 11
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2520",
	Keywords = {
		"student"
	},
	Name = "the student",
	RoomDesc = "A student of spells is here looking quite bored.",
	FullDesc = "The student yawns.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d4+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 18,
		HP = "8d8+80",
		XPValue = 3000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2521",
	Keywords = {
		"instructor",
		"teacher",
		"mage"
	},
	Name = "the instructor of magic",
	RoomDesc = "The instructor screams at your interruption and attacks you.",
	FullDesc = "He looks quite angry at your interruption.",
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "3d4+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 21,
		HP = "14d14+140",
		XPValue = 18500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2522",
	Keywords = {
		"student"
	},
	Name = "the student of spells",
	RoomDesc = "A student of spells is here trying to master invisibility.",
	FullDesc = "He blinks in and out of existence, trying to master the spell.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"invisible",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d4+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 21,
		HP = "8d8+80",
		XPValue = 2200
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2523",
	Keywords = {
		"teacher",
		"mage"
	},
	Name = "the spell teacher",
	RoomDesc = "A spell teacher screams at your interruption and attacks.",
	FullDesc = "The teacher is quite fierce and rather frightening.",
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d4+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 23,
		HP = "15d15+150",
		XPValue = 20500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2524",
	Keywords = {
		"student"
	},
	Name = "the student of spells",
	RoomDesc = "A student of spells has fallen asleep at her desk here.",
	FullDesc = "She looks to have collapsed from sheer boredom.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d4+7",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 21,
		HP = "9d9+90",
		XPValue = 3800
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2525",
	Keywords = {
		"wizard",
		"speaker",
		"mage"
	},
	Name = "the wizard",
	RoomDesc = "An old wizard is here making a speech here.",
	FullDesc = [[
This wizzened old man looks like he could easily pass for the oldest
living man.  Of course, having heard stories about some of the magic
available to the people living here, and what toll the magic draws...
this man might be as young as you.
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
			ToHit = 16,
			Damage = "3d4+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 18,
		AC = 24,
		HP = "18d18+180",
		XPValue = 31000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2526",
	Keywords = {
		"mage",
		"young"
	},
	Name = "the young mage",
	RoomDesc = "A young mage is here learning hand to hand combat.",
	FullDesc = [[
This young fellow looks quite confident in his abilities to defend
himself.
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
			ToHit = 9,
			Damage = "2d4+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 20,
		HP = "9d9+90",
		XPValue = 3800
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2527",
	Keywords = {
		"mistress",
		"battle"
	},
	Name = "the battle mistress",
	RoomDesc = "The battle mistress is here teaching the fine uses of a dagger.",
	FullDesc = [[
She looks quite rugged. In fact, she more resembles a warrior than a magic
user.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "3d5+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 17,
		AC = 21,
		HP = "17d17+170",
		XPValue = 23050
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2528",
	Keywords = {
		"mage",
		"teacher"
	},
	Name = "the spell teacher",
	RoomDesc = "A spell teacher is here relaxing.",
	FullDesc = [[
The teacher looks to be worn out by a long day of magic working, difficult
spells, and inattentive students.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 18,
		HP = "15d15+150",
		XPValue = 15800
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2529",
	Keywords = {
		"wizard"
	},
	Name = "the aged wizard",
	RoomDesc = "An aged wizard is sleeping here.",
	FullDesc = [[
Dreams of magic and power are probably flowing through his head right
now, better not wake him up.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d4+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 24,
		HP = "20d20+200",
		XPValue = 37500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2530",
	Keywords = {
		"scribe",
		"mage"
	},
	Name = "the scribe",
	RoomDesc = "A scribe is here working on some manuscripts.",
	FullDesc = [[
He appears to be copying out some spell ingredients or components right
now.
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
			ToHit = 14,
			Damage = "3d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 20,
		HP = "14d14+140",
		XPValue = 14850
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2531",
	Keywords = {
		"scribe",
		"mage"
	},
	Name = "the scribe",
	RoomDesc = "A scribe is here working diligently on some translations.",
	FullDesc = [[
She is quite cute.  Too bad her only interest seems to be the words of
lore she is translating.
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
			ToHit = 14,
			Damage = "2d4+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 20,
		HP = "15d15+150",
		XPValue = 16550
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2532",
	Keywords = {
		"master",
		"scribe"
	},
	Name = "the Master Scribe",
	RoomDesc = "The Master Scribe is here looking a little upset",
	FullDesc = [[
He seems to be so old, his skin has become nothing but a giant wrinkle.
The master scribe screams 'How dare you interrupt my important work???'
]],
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "3d5+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 22,
		AC = 24,
		HP = "22d22+220",
		XPValue = 29500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2533",
	Keywords = {
		"assistant",
		"scribe"
	},
	Name = "the scribe's assistant",
	RoomDesc = "The scribe's assistant is here folding parchments.",
	FullDesc = [[
You can tell that he isn't trusted with the more important documents,
since those ones are rolled and sealed with wax.
]],
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "3d4+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 21,
		HP = "16d16+160",
		XPValue = 21300
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2534",
	Keywords = {
		"master",
		"enchanter",
		"mage"
	},
	Name = "the Enchanter",
	RoomDesc = "The Enchanter is here placing a dweomer upon well made sword.",
	FullDesc = [[
The Enchanter is hard at work, concentrating on a spell which could
either destroy the weapon or make it many times more powerful than
it already is.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "3d5+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 24,
		HP = "23d23+230",
		XPValue = 30500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2535",
	Keywords = {
		"sword",
		"dancing"
	},
	Name = "the dancing sword",
	RoomDesc = "A well crafted sword lies on the work table here.",
	FullDesc = "It looks quite sharp.",
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 29,
		HP = "10d10+100",
		XPValue = 4000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2536",
	Keywords = {
		"alchemist"
	},
	Name = "the Mad Alchemist",
	RoomDesc = "The Mad Alchemist babbles something incomprehensible and attacks.",
	FullDesc = [[
He looks like he has been quaffing too many potions.  His eyes dart
around wildly, and he starts to drool.

The Mad Alchemist throws back his head and cackles with insane glee!
]],
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "3d5+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 23,
		HP = "24d24+240",
		XPValue = 31500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2537",
	Keywords = {
		"master",
		"summoner"
	},
	Name = "the Master Summoner",
	RoomDesc = "The Master Summoner is here holding gateways open to other planes.",
	FullDesc = [[
The Summoner looks to be hard at work, concentrating on keeping control
over the gateway before he loses his soul to the creatures on the other
side of it.
]],
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d5+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 22,
		AC = 21,
		HP = "22d22+220",
		XPValue = 27050
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2538",
	Keywords = {
		"master",
		"charmer"
	},
	Name = "the Master Charmer",
	RoomDesc = "The Master Charmer utters the words, 'uuuzzldctz'.",
	FullDesc = "The Master Charmer sizes you up, always looking for a new pet.",
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "3d5+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 23,
		HP = "23d23+230",
		XPValue = 31050
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2539",
	Keywords = {
		"golem",
		"wooden"
	},
	Name = "the wooden golem",
	RoomDesc = "A wooden golem stands a silent vigil here, guarding the stairs.",
	FullDesc = "He looks flammable.",
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "1d10+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 24,
		HP = "16d16+160",
		XPValue = 17500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2540",
	Keywords = {
		"master",
		"spellbinder"
	},
	Name = "the Master Spellbinder",
	RoomDesc = "The Master Spellbinder is here re-charging a blackened wand.",
	FullDesc = "The Master Spellbinder snarls at you and attacks.",
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d5+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 23,
		HP = "23d23+230",
		XPValue = 30500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2541",
	Keywords = {
		"master",
		"maker"
	},
	Name = "the Golem Maker",
	RoomDesc = "The Golem Maker is here chiseling some stone.",
	FullDesc = [[
The Golem Master appears to be very meticulous about his work, to
the point of fussing over it.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "3d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 21,
		AC = 21,
		HP = "21d21+210",
		XPValue = 26850
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2542",
	Keywords = {
		"golem",
		"granite"
	},
	Name = "the granite golem",
	RoomDesc = "A granite golem stands here waiting to do its master's bidding.",
	FullDesc = "It looks like a statue, until you see it shamble towards you.",
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "4d5+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 25,
		HP = "20d20+200",
		XPValue = 25600
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2543",
	Keywords = {
		"golem",
		"bronze"
	},
	Name = "the bronze golem",
	RoomDesc = "A bronze golem stands here shining in the light.",
	FullDesc = "He looks rather dim witted.",
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "4d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 18,
		AC = 22,
		HP = "18d18+180",
		XPValue = 22350
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2544",
	Keywords = {
		"golem",
		"flesh"
	},
	Name = "the flesh golem",
	RoomDesc = "A flesh golem stands guard here",
	FullDesc = [[
It looks to be made of a potpourri of different body parts; some don't
even resemble anything human.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "4d4+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 20,
		HP = "12d12+120",
		XPValue = 8520
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2545",
	Keywords = {
		"golem",
		"cloth"
	},
	Name = "the cloth golem",
	RoomDesc = "A cloth golem wanders around here.",
	FullDesc = "It looks like a bunch of old rags, quite surprising it can actually walk.",
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "3d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 18,
		HP = "8d8+80",
		XPValue = 2100
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2546",
	Keywords = {
		"golem",
		"adamantite"
	},
	Name = "the adamantite golem",
	RoomDesc = "An adamantite golem stands here looking very dangerous.",
	FullDesc = [[
It seems to be forged of dark metal.  It looks strong and durable,
but somewhat un-intelligent.
]],
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d7+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 29,
		HP = "25d25+250",
		XPValue = 35650
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2547",
	Keywords = {
		"golem",
		"clay"
	},
	Name = "the clay golem",
	RoomDesc = "A clay golem stands guard here.",
	FullDesc = "This large golem almost looks like it is made of dirt.",
	Flags = {
		"stationary",
		"aggro",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "4d5+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 20,
		HP = "15d15+150",
		XPValue = 18320
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2548",
	Keywords = {
		"master",
		"illusionist",
		"mage",
		"dragon"
	},
	Name = "the Master of Illusions",
	RoomDesc = "An enormous multi-colored three-headed dragon growls at you.",
	FullDesc = [[
The image of an ugly dragon flickers slightly, and where the dragon
was now stands a small harmless looking old man.
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
			ToHit = 14,
			Damage = "3d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 21,
		AC = 23,
		HP = "21d21+210",
		XPValue = 26450
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2549",
	Keywords = {
		"necromancer",
		"master"
	},
	Name = "the Necromancer",
	RoomDesc = "The Necromancer is here raising undead servants.",
	FullDesc = [[
Attired all in black, the Necromancer is tall and gangly, but still quite
an imposing figure.  A dark cowl shrouds most of his face, but two blazing
embers which serve as eyes can be seen through the shadow.
The Necromancer shrieks some obscenities and orders his minions to attack.
]],
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d7+7",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 27,
		HP = "25d25+250",
		XPValue = 35250
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2550",
	Keywords = {
		"skeleton",
		"undead"
	},
	Name = "the animated skeleton",
	RoomDesc = "An animated skeleton screams silently and attacks.",
	FullDesc = "It feels no pain, and hacks at you ruthlessly.",
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d4+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 21,
		HP = "15d15+150",
		XPValue = 16500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2551",
	Keywords = {
		"undead",
		"giant"
	},
	Name = "the undead giant",
	RoomDesc = "An undead giant lumbers towards you.",
	FullDesc = [[
This thing seems to be the reanimated corpse of a giant, creating an
enormous zombie.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d5+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 18,
		AC = 23,
		HP = "18d18+180",
		XPValue = 22000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2552",
	Keywords = {
		"witch",
		"hag"
	},
	Name = "the ugly witch",
	RoomDesc = "An ugly witch is here scrying out secrets.",
	FullDesc = [[
She has no face at all, just blank skin, rather disturbing.  From about
where her mouth should be, comes a disgusting giggling sound that makes
your skin crawl with revulsion.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d6+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 21,
		HP = "20d20+200",
		XPValue = 26850
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2553",
	Keywords = {
		"librarian",
		"mage"
	},
	Name = "the Librarian",
	RoomDesc = "The Librarian has fallen asleep at his desk here.",
	FullDesc = "He looks like a rather peaceful old man.",
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 17,
			Damage = "3d6+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 25,
		HP = "23d23+230",
		XPValue = 29500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2554",
	Keywords = {
		"apprentice"
	},
	Name = "the Master's apprentice",
	RoomDesc = "The Master's apprentice leaps to halt your passage.",
	FullDesc = [[
A powerful wizard in his own right, the apprentice of the master of balance
has given up his station in the mage guild hierarchy in order to serve the
Great Master in hopes of gleaning secrets one could never hope to uncover
alone.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 23,
			Damage = "3d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 31,
		HP = "24d24+240",
		XPValue = 30750
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2555",
	Keywords = {
		"cat",
		"grey",
		"familiar"
	},
	Name = "the grey cat",
	RoomDesc = "A grey cat is lounging lazily here.",
	FullDesc = [[
The grey cat cocks an ear towards you, sensing your scrutiny, then purrs
contentedly.  It looks rather harmless, until you notice its very large
claws.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "5d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 24,
		HP = "15d15+150",
		XPValue = 18750
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2556",
	Keywords = {
		"master",
		"guildmaster",
		"grey"
	},
	Name = "the Master of Neutrality",
	RoomDesc = "The Master of Neutrality is here contemplating the balance of the Universe.",
	FullDesc = "He looks quite peaceful.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 30,
			Damage = "2d5+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 30,
		AC = 39,
		HP = "30d30+300",
		XPValue = 150000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2557",
	Keywords = {
		"apprentice",
		"black"
	},
	Name = "the black robed apprentice",
	RoomDesc = "A black robed apprentice jumps from the shadows and attacks.",
	FullDesc = [[
She bears a wicked looking scar down the side of her face, though once
she must have been beautiful, now the scar combined with what seems to
be a permanent scowl make her looks quite fearsome.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "3d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 25,
		HP = "20d20+200",
		XPValue = 27800
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob2558",
	Keywords = {
		"cat",
		"black",
		"familiar"
	},
	Name = "the black cat",
	RoomDesc = "A black cat with its fur up hisses at you.",
	FullDesc = [[
It looks both mean and dangerous.  Petting seems to be completely out of
the question.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "3d7+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 23,
		HP = "16d16+160",
		XPValue = 19950
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2559",
	Keywords = {
		"master",
		"guildmaster",
		"black"
	},
	Name = "the Master of the Black Robes",
	RoomDesc = "The Master of the Black Robes is here plotting vile deeds.",
	FullDesc = "The Master glares at you.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 30,
			Damage = "2d5+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 30,
		AC = 39,
		HP = "30d30+300",
		XPValue = 150000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2560",
	Keywords = {
		"apprentice",
		"white"
	},
	Name = "the white robed apprentice",
	RoomDesc = "A white robed apprentice screams at your desecration of goodness.",
	FullDesc = [[
He looks like a fanatic.
The white robed apprentice screams 'Thou art unworthy of this honour!'
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
			ToHit = 18,
			Damage = "3d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 25,
		HP = "20d20+200",
		XPValue = 27850
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2561",
	Keywords = {
		"cat",
		"white",
		"familiar"
	},
	Name = "the white cat",
	RoomDesc = "A white cat is here preening its fur.",
	FullDesc = "It seems to be nothing more than a large ball of fluff with claws.",
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "3d7+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 23,
		HP = "15d8+10",
		XPValue = 7950
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2562",
	Keywords = {
		"master",
		"guildmaster",
		"white"
	},
	Name = "the Master of Goodness",
	RoomDesc = "The Master of Goodness is here frowning at your intrusion.",
	FullDesc = "He looks like a self-righteous bastard.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 30,
			Damage = "2d5+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 30,
		AC = 39,
		HP = "30d30+300",
		XPValue = 150000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob2563",
	Keywords = {
		"cat",
		"calico",
		"familiar"
	},
	Name = "the calico cat",
	RoomDesc = "A large calico cat is lounging about here.",
	FullDesc = [[
It looks incredibly large for a cat, no doubt a giant of its species.
A beautiful jewel encrusted collar about its neck is its only adornment.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "5d5+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 28,
		HP = "25d25+250",
		XPValue = 30000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob2564",
	Keywords = {
		"guildmaster",
		"grand",
		"mistress"
	},
	Name = "the Grand Mistress",
	RoomDesc = "The Grand Mistress of Magic is sitting here.",
	FullDesc = [[
She looks quite comfortable on her emerald throne. Amazingly young and
pretty for one of such stature in the guild, no doubt she has kept her
youthful appearance through the use of strong magics.
The Grand Mistress pets her familiar and smiles at you in confidence.
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
			ToHit = 40,
			Damage = "3d4+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 50,
		AC = 49,
		HP = "50d50+500",
		XPValue = 500000
	},
	Gender = 2
})
