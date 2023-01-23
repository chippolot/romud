Config.NewEntity({
	Key = "mob5400",
	Keywords = {
		"mage",
		"guildmaster"
	},
	Name = "the guildmaster",
	RoomDesc = "Your guildmaster stands here.",
	FullDesc = "An old man peering through ancient tomes rests here.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 16,
		AC = 29,
		HP = "1d1+10000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "5d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5401",
	Keywords = {
		"cleric",
		"guildmaster"
	},
	Name = "the guildmaster",
	RoomDesc = "Your guildmaster stands here.",
	FullDesc = "An older man wrapped in purple, long-flowing robes meditates here.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 16,
		AC = 29,
		HP = "1d1+10000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "5d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5402",
	Keywords = {
		"warrior",
		"guildmaster"
	},
	Name = "the guildmaster",
	RoomDesc = "Your guildmaster stands here.",
	FullDesc = "A smaller man dressed in black robes stands here waiting to train you.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 16,
		AC = 29,
		HP = "1d1+10000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "5d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5403",
	Keywords = {
		"thief",
		"guildmaster"
	},
	Name = "the guildmaster",
	RoomDesc = "Your guildmaster stands here.",
	FullDesc = [[
A small human dressed in black rests in the corner.  As you enter he grabs
a knife and throws it at you.  It lands in the wall next to your left ear.
'We will now begin', is all he says.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 16,
		AC = 29,
		HP = "1d1+10000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "5d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5404",
	Keywords = {
		"receptionist",
		"woman"
	},
	Name = "the receptionist",
	RoomDesc = "A dark skinned, veiled woman greets you from behind the desk.",
	FullDesc = [[
This Arabian beauty is obviously the daughter of some high ranking
official.  As you attempt to sneak a peek under her veil you notice
a small moon-shaped birthmark on her left cheek.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 29,
		HP = "1d1+1871",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "10d20+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 5000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5405",
	Keywords = {
		"bartender",
		"man",
		"mage",
		"old"
	},
	Name = "the old withered man",
	RoomDesc = "An old withered man leans against the bar.",
	FullDesc = "He looks distracted as he pours five drinks at once without error.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 20,
		HP = "1d1+12000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d5+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5406",
	Keywords = {
		"john",
		"brother",
		"singer",
		"lead"
	},
	Name = "Brother John",
	RoomDesc = "Brother John, lead singer for the Lokettes stands on stage.",
	FullDesc = [[
You see the lead singer of the Lokettes lip synching to an old Zochan
tune.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 19,
		HP = "3d5+150",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "2d5+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1350
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5407",
	Keywords = {
		"panhandler"
	},
	Name = "the panhandler",
	RoomDesc = "A panhandler rests here.",
	FullDesc = "A small skinny man rests here hoping to find a warm heart.",
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 2,
		AC = 9,
		HP = "10d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d4+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 5
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5408",
	Keywords = {
		"panhandler"
	},
	Name = "the panhandler",
	RoomDesc = "A panhandler rests here.",
	FullDesc = "A small skinny man rests here staring at your clothes.",
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 3,
		AC = 9,
		HP = "10d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d3+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 5
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5409",
	Keywords = {
		"beggar"
	},
	Name = "the beggar",
	RoomDesc = "A grubby beggar sits here in the filth.",
	FullDesc = "This poor soul seems down on his luck, perhaps you might spare a dime?",
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 1,
		AC = 9,
		HP = "10d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d2+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5410",
	Keywords = {
		"baker"
	},
	Name = "the baker",
	RoomDesc = "The baker stands here playing solitaire.",
	FullDesc = "You see a large man in a white apron covered in flour from head to toe.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d10+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5411",
	Keywords = {
		"shopkeeper"
	},
	Name = "the shopkeeper",
	RoomDesc = "The shopkeeper stands here.",
	FullDesc = "You see a half-elf sitting on a stool behind his counter.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d10+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5412",
	Keywords = {
		"banker"
	},
	Name = "the banker",
	RoomDesc = "A banker stands here waiting to help you.",
	FullDesc = "This small halfling seems adept at counting money.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 19,
				Damage = "3d6+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5413",
	Keywords = {
		"ahkeem",
		"tailor"
	},
	Name = "Ahkeem the tailor",
	RoomDesc = "Ahkeem the tailor welcomes you to his store.",
	FullDesc = [[
This middle-aged man looks over you with disdain and quickly suggests a
new wardrobe.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 14,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 200
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5414",
	Keywords = {
		"vera",
		"lady"
	},
	Name = "Vera the veggie lady",
	RoomDesc = "Vera the veggie lady beems as you look over her stand.",
	FullDesc = "A tall slender woman stands before you smiling broadly.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 14,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5415",
	Keywords = {
		"butch"
	},
	Name = "Butch the meatcutter",
	RoomDesc = "Butch the meatcutter stands here in his bloodied apron.",
	FullDesc = [[
This stocky dwarf has a mad glint in his eye as he twirls his clever
carelessly into the air.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 14,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5416",
	Keywords = {
		"abdul",
		"armorer"
	},
	Name = "Abdul the armorer",
	RoomDesc = "Abdul stands here, waiting to help you.",
	FullDesc = [[
Abdul returns your gaze with a steady eye.  You quickly glance away
under his cold stare and place your order.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 14,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5417",
	Keywords = {
		"igor",
		"weaponsmith"
	},
	Name = "Igor the weaponsmith",
	RoomDesc = "Igor stands here doing... something.",
	FullDesc = "You see a small dwarf with a large hump on his left shoulder.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 14,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5418",
	Keywords = {
		"cassandra"
	},
	Name = "Cassandra",
	RoomDesc = "Cassandra stands proudly over her selection.",
	FullDesc = [[
You see a happy weather-worn face whose lines suggest many years on
the open sea.  It is only through years of fishing that she is able
to withstand the smell that permeates the air.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "1d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5419",
	Keywords = {
		"foreman",
		"man"
	},
	Name = "the foreman",
	RoomDesc = "The foreman stands here screaming at the workers.",
	FullDesc = [[
A worried working dwarf stands here constantly making notes in his
book and looking at his watch.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 21,
		HP = "3d10+40",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 14,
				Damage = "1d8+2",
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
	Key = "mob5420",
	Keywords = {
		"construction",
		"worker"
	},
	Name = "the construction worker",
	RoomDesc = "A construction worker steadily works here.",
	FullDesc = "A large sweaty looking man doesn't even return your glance.",
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "3d8+35",
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
		XPValue = 50
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5421",
	Keywords = {
		"statue",
		"brahman"
	},
	Name = "the statue of Brahman",
	RoomDesc = "The statue of Brahman stands here.",
	FullDesc = [[
The statue made of solid marble depicts the mighty God defeating Siva
in magical combat.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5422",
	Keywords = {
		"statue",
		"siva"
	},
	Name = "the statue of Siva",
	RoomDesc = "The statue of Siva stands here.",
	FullDesc = [[
The statue of the High Lord of Destruction stands here beings attacked
by Brahman in magical combat.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5423",
	Keywords = {
		"statue",
		"indra"
	},
	Name = "the statue of Indra",
	RoomDesc = "The statue of Indra stands here.",
	FullDesc = "This statue looks like an enormous elephant.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5424",
	Keywords = {
		"statue",
		"yama"
	},
	Name = "the statue of Yama",
	RoomDesc = "The statue of Yama stands here.",
	FullDesc = "This is a statue of the God of Death.  It is covered with odd runes.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5425",
	Keywords = {
		"statue",
		"surya"
	},
	Name = "the statue of Surya",
	RoomDesc = "The statue of Surya stands here.",
	FullDesc = [[
The statue of Surya, the God in charge of the Sun, almost glows
with a firey aura.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5426",
	Keywords = {
		"statue",
		"kali"
	},
	Name = "the statue of Kali",
	RoomDesc = "The statue of Kali stands here.",
	FullDesc = [[
The statue of the Black Mother, Kali, is made of black marble and
is covered with silver runes.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5427",
	Keywords = {
		"statue",
		"brihaspati"
	},
	Name = "the statue of Brihaspati",
	RoomDesc = "The statue of Brihaspati stands here.",
	FullDesc = [[
The statue of Brihaspati, the God of Scholars and Knowledge is made
of a weathered marble.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5428",
	Keywords = {
		"statue",
		"puchan"
	},
	Name = "The statue of Puchan",
	RoomDesc = "The statue of Puchan stands here.",
	FullDesc = [[
The statue of Puchan, God of Travellers, is covered with dust and worn
as if it had been dragged a long way down a dusty road.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "1d1+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "6d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 12000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5429",
	Keywords = {
		"aziz",
		"human",
		"canon"
	},
	Name = "Aziz",
	RoomDesc = "Aziz the Human Canon stands here.",
	FullDesc = "This big and burly man grins at you as he draws his sword.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 19,
		HP = "2d11+40",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 6,
				Damage = "2d5+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 384
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5430",
	Keywords = {
		"mustafah",
		"human",
		"robber"
	},
	Name = "Mustafah",
	RoomDesc = "Mustafah the Human Robber stands here.",
	FullDesc = "This man is lithe and has an evil smirk upon his face.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 7,
		AC = -11,
		HP = "3d8+41",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "2d4+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 99
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5431",
	Keywords = {
		"fatima",
		"elf",
		"invoker"
	},
	Name = "Fatima",
	RoomDesc = "Fatima the Elven Invoker stands here.",
	FullDesc = [[
This female elf has dusky skin and black hair.  A combination you don't
see very often on elves.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 9,
		AC = -31,
		HP = "2d6+25",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "3d3+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 93
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5432",
	Keywords = {
		"kareem",
		"dwarf",
		"mercenary"
	},
	Name = "Kareem",
	RoomDesc = "Kareem the Dwarven Mercenary stands here.",
	FullDesc = "This short stocky fellow has a chest the girth of a barrel.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 12,
		AC = 19,
		HP = "4d4+50",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "2d6+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 939
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5433",
	Keywords = {
		"nomad",
		"merchant"
	},
	Name = "the nomad merchant",
	RoomDesc = "A nomad merchant looks you over.",
	FullDesc = [[
This robust fellow returns your gaze with a smile, but something inside
tells you not to trust him very far.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"assistall",
		"stayzone"
	},
	Stats = {
		Level = 35,
		AC = -1,
		HP = "1d1+1500",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 9,
				Damage = "1d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 800
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5434",
	Keywords = {
		"bodyguard",
		"guard"
	},
	Name = "the Sultan's Bodyguard",
	RoomDesc = "A bodyguard sizes you up.",
	FullDesc = "The large half-orc quickly glances you over and returns to his duties.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 12,
		AC = 16,
		HP = "3d10+100",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d6+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 400
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5435",
	Keywords = {
		"kid",
		"thief"
	},
	Name = "the skinny kid",
	RoomDesc = "A skinny kid wanders around.",
	FullDesc = "This small child sees you looking at him and quickly looks away.",
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 7,
		AC = 18,
		HP = "14d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d5+1",
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
	Key = "mob5436",
	Keywords = {
		"dockworker"
	},
	Name = "the dockworker",
	RoomDesc = "A strong dockworker walks by moving crates.",
	FullDesc = [[
Although seemingly dull witted, this hulking mass carries the huge
crates from the boats like it was a box of lilies.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 12,
		AC = -1,
		HP = "3d5+65",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 550
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5437",
	Keywords = {
		"man",
		"taxcollector"
	},
	Name = "the taxcollector",
	RoomDesc = "A small man walks around scribbling in a notebook.",
	FullDesc = [[
The city's taxcollextor walks from store to store collecting the
Sultan's fee for living in his grand city.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 5,
		AC = -31,
		HP = "10d2+45",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "2d3+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 431
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5438",
	Keywords = {
		"gord"
	},
	Name = "Gord",
	RoomDesc = "Gord the Rogue stand here.",
	FullDesc = "",
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 15,
		AC = 22,
		HP = "5d3+105",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d6+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5439",
	Keywords = {
		"chulainn",
		"knight"
	},
	Name = "Chulainn",
	RoomDesc = "Chulainn the Knight stands here.",
	FullDesc = [[
This large man does not seem to be surprised at your approach and
looks at you quizically.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"assistall"
	},
	Stats = {
		Level = 15,
		AC = 29,
		HP = "4d1+231",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 8700
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5440",
	Keywords = {
		"daghdha"
	},
	Name = "Daghdha",
	RoomDesc = "Daghdha the Arch-Magi stands here.",
	FullDesc = "This man is dressed in long brown robes and has a penetrating gaze.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 16,
		HP = "5d2+180",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "1d6+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 8700
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5441",
	Keywords = {
		"curley",
		"greenleaf"
	},
	Name = "Curley GreenLeaf",
	RoomDesc = "Curley GreenLeaf stands here.",
	FullDesc = "",
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 15,
		AC = 19,
		HP = "3d5+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d4+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5442",
	Keywords = {
		"man",
		"wandering",
		"prophet"
	},
	Name = "the wandering prophet",
	RoomDesc = "A small grey-haired man walks around spouting gospel.",
	FullDesc = [[
This sad case may have been an evangelist in another lifetime. He is known
to stand on corners and accost passers-by with his doomsday preaching.
]],
	Flags = {
	},
	Stats = {
		Level = 7,
		AC = -31,
		HP = "1d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "1d5+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5443",
	Keywords = {
		"alley",
		"cat"
	},
	Name = "the alley cat",
	RoomDesc = "A small harmless feline searches for food.",
	FullDesc = "You see a small starved cat.",
	Flags = {
	},
	Stats = {
		Level = 2,
		AC = -51,
		HP = "1d2+5",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "2d2+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 0
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5444",
	Keywords = {
		"vulture"
	},
	Name = "the vulture",
	RoomDesc = "A vulture circles above you.",
	FullDesc = "As you look up at this bird, you see the only thing it wants is a corpse.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 2,
		AC = 12,
		HP = "1d3+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "1d6+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5445",
	Keywords = {
		"old",
		"man"
	},
	Name = "the old man",
	RoomDesc = "An old man sits here playing chess.",
	FullDesc = "He seems intent on winning.",
	Flags = {
	},
	Stats = {
		Level = 4,
		AC = -61,
		HP = "2d3+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d3+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 20
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5446",
	Keywords = {
		"lugh",
		"librarian"
	},
	Name = "Lugh the Librarian",
	RoomDesc = "Lugh the Librarian sits behind a desk.",
	FullDesc = "The huge hulking mass rises as someone asks him a question.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "10d10+430",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 19,
				Damage = "3d6+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 23000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5447",
	Keywords = {
		"dirt",
		"dust",
		"devil"
	},
	Name = "the dirt devil",
	RoomDesc = "The wind kicks up some dust.",
	FullDesc = "What you see before you is really a baby air elemental.",
	Flags = {
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Stats = {
		Level = 1,
		AC = -71,
		HP = "2d2+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "2d3+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5448",
	Keywords = {
		"lamia",
		"beast"
	},
	Name = "the lamia",
	RoomDesc = "A strange lamia stands here waiting for her next meal. ",
	FullDesc = [[
This is a creature with the upper torso of a beautiful woman, but the
lower body of a four-legged beast.  She licks her lips as she looks at
you greedily.
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 12,
		AC = 16,
		HP = "1d10+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d5+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10500
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5449",
	Keywords = {
		"dervish"
	},
	Name = "the raggety dervish",
	RoomDesc = "A raggety dervish stands here.",
	FullDesc = "This man looks like he could use a lot of rest.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "4d4+20",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d6+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 105
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5450",
	Keywords = {
		"sultan"
	},
	Name = "the Sultan",
	RoomDesc = "The Sultan rests here on his throne.",
	FullDesc = "You see a large wealthy man in red robes smiling at you.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 23,
		HP = "6d6+830",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "1d6+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 25000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5451",
	Keywords = {
		"harem",
		"girl"
	},
	Name = "a harem girl",
	RoomDesc = "A lovely, veiled harem girl stands here.",
	FullDesc = [[
You see a dark skinned beauty, wearing almost transparent silks and 
light blue veil.  Her loyalty to the Sultan is unwavering.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "1d1+15",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d6+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 40
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5452",
	Keywords = {
		"jailer"
	},
	Name = "the jailer",
	RoomDesc = "The Jailer sleeps here, snoring loudly.",
	FullDesc = [[
You see a pathetic soul lying here.  Probably some ex-nobleman that has
fallen out of grace with the Sultan.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 18,
		AC = 19,
		HP = "3d4+100",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "1d6+6",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1200
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5453",
	Keywords = {
		"eunich"
	},
	Name = "a eunich",
	RoomDesc = "A eunich stands here watching over the girls.",
	FullDesc = [[
You see a large man whose only duty is to protect the harem.  He has been
castrated for the ladies' safety.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 12,
		AC = 19,
		HP = "5d1+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 12,
				Damage = "2d4+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1300
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5454",
	Keywords = {
		"sultans",
		"favorite",
		"girl",
		"nichole"
	},
	Name = "Nichole, the Sultan's favorite",
	RoomDesc = "Nichole, the Sultan's favorite girl rests on a mound of pillows.",
	FullDesc = [[
You see the most beautiful Arabian girl that has ever meet your eyes.
Too bad she is about to kill you.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 10,
		AC = 21,
		HP = "1d1+54",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 17,
				Damage = "2d5+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 150
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5455",
	Keywords = {
		"allah"
	},
	Name = "Allah",
	RoomDesc = "Allah is here.",
	FullDesc = "You see the all-knowing Allah.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 11,
		AC = 19,
		HP = "2d3+2300",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d20+20",
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
	Key = "mob5456",
	Keywords = {
		"mage",
		"guildguard"
	},
	Name = "the guildguard",
	RoomDesc = "The Guard for the Guild of Mages stand here.",
	FullDesc = "This man looks like a mage/warrior, I wouldn't mess with him.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 8,
		AC = 29,
		HP = "2d5+500",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 21,
				Damage = "3d8+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5457",
	Keywords = {
		"cleric",
		"guildguard"
	},
	Name = "the guildguard",
	RoomDesc = "The Guard for the Guild of Clerics stands here.",
	FullDesc = "This man looks like a cleric/warrior, I wouldn't mess with him.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 8,
		AC = 29,
		HP = "2d5+500",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 21,
				Damage = "3d8+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5458",
	Keywords = {
		"warrior",
		"guildguard"
	},
	Name = "the guildguard",
	RoomDesc = "The Guard for the Guild of Warriors stands here.",
	FullDesc = "The man looks like Conan's cousin, I wouldn't mess with him.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 8,
		AC = 29,
		HP = "2d5+500",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 21,
				Damage = "3d8+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5459",
	Keywords = {
		"thief",
		"guildguard"
	},
	Name = "the guildguard",
	RoomDesc = "The Guard for the Guild of theives stands here.",
	FullDesc = [[
You see a thief dressed all in black, he quickly stands as you
enter and steps to bar your way.  You notice his hands resting
on two sheathes.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 8,
		AC = 29,
		HP = "2d5+500",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 21,
				Damage = "3d8+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5460",
	Keywords = {
		"servant",
		"boy"
	},
	Name = "the servant boy",
	RoomDesc = "A servant boy is here running errands.",
	FullDesc = "You see a small boy running around the halls of the palace.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 2,
		AC = -71,
		HP = "10d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d4+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5461",
	Keywords = {
		"sultans",
		"guard"
	},
	Name = "the Sultan's Guard",
	RoomDesc = "A guard stands here, protecting the innocent.",
	FullDesc = "You see a trained fighter, ready to help those in need.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 10,
		HP = "2d4+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d8+0",
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
	Key = "mob5462",
	Keywords = {
		"sultans",
		"guard"
	},
	Name = "the Sultan's Guard",
	RoomDesc = "A guard stands here, watching the gate.",
	FullDesc = "You see a trained fighter, ready to defend the city.",
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 11,
		HP = "2d4+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d8+1",
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
	Key = "mob5463",
	Keywords = {
		"sultans",
		"guard",
		"chief"
	},
	Name = "the Chief Guard",
	RoomDesc = "The Chief of the Sultan's Guard stands here.",
	FullDesc = "You see a large man skilled in hunting and killing.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 19,
		HP = "4d5+251",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d8+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 5000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5464",
	Keywords = {
		"mercenary"
	},
	Name = "the mercenary",
	RoomDesc = "A mercenary stands here waiting for a job.",
	FullDesc = "You see an assassin down on his luck looking to be freelanced out.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 5,
		AC = 10,
		HP = "1d8+14",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 5,
				Damage = "1d4+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 50
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5465",
	Keywords = {
		"shipwright",
		"captain"
	},
	Name = "the shipwright",
	RoomDesc = "An old captain rests here carving on a stick.",
	FullDesc = [[
You see the shipwright of New Thalos, waiting to make someone a boat.  He
beams a smile at you through his beard as you walk in.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "5d5+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5466",
	Keywords = {
		"blacksmith"
	},
	Name = "the blacksmith",
	RoomDesc = "The blacksmith stands here pumping air into his fire.",
	FullDesc = [[
You see a large human, dripping in sweat, standing before you.  He takes
a break from his swealtering work to bid you welcome.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d4+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5467",
	Keywords = {
		"horse"
	},
	Name = "the horse",
	RoomDesc = "A horse stands here.",
	FullDesc = "You see one of the fine Arabian beasts known about the land.",
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 4,
		AC = -31,
		HP = "10d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "2d4+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5468",
	Keywords = {
		"tourist"
	},
	Name = "the tourist",
	RoomDesc = "A tourist stands here looking lost.",
	FullDesc = [[
You see a small, rotund man, with a strange object around his neck and
a nose guard.  He is looking at a small map that he seems to be holding
upside down.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Stats = {
		Level = 5,
		AC = -61,
		HP = "2d10+15",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "1d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 650
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5469",
	Keywords = {
		"ixitxachitl",
		"ray"
	},
	Name = "the ixitxachitl",
	RoomDesc = "A very large ray with a wicked looking tail swims here.",
	FullDesc = "You see a large ray with sharp fangs and a barbed tail.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 10,
		AC = 24,
		HP = "3d3+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d4+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5470",
	Keywords = {
		"cryohydra"
	},
	Name = "the cryohydra",
	RoomDesc = "The cryohydra stands here.",
	FullDesc = "A grey-brown reptillian creature with amber eyes stands before you.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 14,
		HP = "10d1+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d10+0",
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
	Key = "mob5471",
	Keywords = {
		"minotaur",
		"lizard"
	},
	Name = "the minotaur lizard",
	RoomDesc = "the minotaur lizard stands here.",
	FullDesc = "A huge lizard like reptile with horns like a minotaur.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 14,
		HP = "1d10+55",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 12,
				Damage = "3d5+0",
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
	Key = "mob5472",
	Keywords = {
		"dog",
		"death"
	},
	Name = "the death dog",
	RoomDesc = "The death dog stands here.",
	FullDesc = "A large two-headed hound barks at you vicously.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 4,
		AC = 12,
		HP = "1d15+76",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d10+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 900
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5473",
	Keywords = {
		"lion",
		"spotted"
	},
	Name = "the spotted lion",
	RoomDesc = "The spotted lion stands here.",
	FullDesc = "A large fierce dapple skinned lion glares at you.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 5,
		AC = 13,
		HP = "5d5+45",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d8+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5474",
	Keywords = {
		"behir"
	},
	Name = "the behir",
	RoomDesc = "A behir slithers on the ground.",
	FullDesc = "You see a large snake-like reptile with more than a dozen legs.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 12,
		AC = 15,
		HP = "4d3+146",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "2d8+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5475",
	Keywords = {
		"chimera",
		"creature",
		"lion",
		"goat",
		"dragon"
	},
	Name = "the chimera",
	RoomDesc = "A creature with three heads: lion, goat, and dragon stands here.",
	FullDesc = [[
The chimera is still a mystery, better left unexplored.  This creature
has the hindquarters of a goat, the forepaws of a lion and the body of
a red dragon.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 9,
		AC = 19,
		HP = "5d5+261",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "3d4+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 3500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5476",
	Keywords = {
		"couatl"
	},
	Name = "the couatl",
	RoomDesc = "A couatl hovers here.",
	FullDesc = [[
A beautiful creature with the body of a serpent and feathered wings the
colour of the rainbow.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 15,
		AC = 18,
		HP = "10d5+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "2d4+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2400
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5477",
	Keywords = {
		"giant",
		"hornet"
	},
	Name = "the giant hornet",
	RoomDesc = "The giant hornet hovers here.",
	FullDesc = "It is a hornet, what else can be said?",
	Flags = {
	},
	Stats = {
		Level = 5,
		AC = 15,
		HP = "1d1+5",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 5,
				Damage = "1d4+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 45
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5478",
	Keywords = {
		"pegasus"
	},
	Name = "the pegasus",
	RoomDesc = "The pegasus stands here, flexing its wings.",
	FullDesc = [[
A magnificant winged steed, this horse looks much like the Arabian
thoroughbreds you have seen in stables.
]],
	Flags = {
		"stationary",
		"assistall",
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "1d5+700",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "2d10+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 6500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5479",
	Keywords = {
		"elriva"
	},
	Name = "Elriva",
	RoomDesc = "Elriva stands here mixing a love potion.",
	FullDesc = [[
You see a very healthy female dressed in black, with long flowing
hair to match her outfit.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 19,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "1d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5480",
	Keywords = {
		"braheem"
	},
	Name = "Braheem",
	RoomDesc = "Braheem stands here talking to the walls.",
	FullDesc = "You see a powerful but slighty insane mage.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 29,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "10d10+40",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5481",
	Keywords = {
		"high",
		"priest"
	},
	Name = "the high priest",
	RoomDesc = "The high priest rests here meditating, well he WAS meditating.",
	FullDesc = "He does NOT look real happy that you have disturbed him.",
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 19,
		HP = "10d5+1200",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 18,
				Damage = "2d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 35000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5482",
	Keywords = {
		"royal",
		"guard",
		"elite"
	},
	Name = "the Royal Guard",
	RoomDesc = "An Elite Royal Guard stands here smiling happily.",
	FullDesc = [[
You see one of the Royal Guards of New Thalos who seems to have undergone
some heavy training.
]],
	Flags = {
		"stationary",
		"assistall"
	},
	Stats = {
		Level = 15,
		AC = 25,
		HP = "5d20+900",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "1d10+6",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 25000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5483",
	Keywords = {
		"patch",
		"bartender"
	},
	Name = "Patch the bartender",
	RoomDesc = "A large half-orc with a patch over one eye pours beer behind the counter.",
	FullDesc = [[
You see a really big guy here who seems to have lost an eye in one manner
or another.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 29,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d8+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5484",
	Keywords = {
		"stitch"
	},
	Name = "Stitch, the leather dude",
	RoomDesc = "Stitch, the leather dude reclines in his chair.",
	FullDesc = [[
You see a small hobbit with his feet kicked up on his desk waiting for
some sucker, uhm, customer to walk in his store.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 35,
		AC = 24,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 30,
				Damage = "3d6+6",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 2000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5485",
	Keywords = {
		"gardener",
		"elf"
	},
	Name = "the gardener",
	RoomDesc = "A small elf stands here tending the garden.",
	FullDesc = [[
A young elf stands here in dirt covered overalls.  He seems to be
weeding his garden.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 13,
		HP = "5d5+100",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "2d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5486",
	Keywords = {
		"nightmare",
		"demon",
		"horse"
	},
	Name = "the nightmare",
	RoomDesc = "A large horse, black as night, stands here.",
	FullDesc = [[
You see the largest horse you have ever seen before.  Standing 10'
at the shoulder it breathes flame from his nostrils and leaps to
attack you.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 24,
		HP = "3d9+300",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d5+7",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 5500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5487",
	Keywords = {
		"wolverine",
		"wolf"
	},
	Name = "the wolverine",
	RoomDesc = "A large wolf like creature leaps out from the darkness.",
	FullDesc = [[
You see a half wolf, half human beast wearing a glove with long thin
blades on it.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 15,
		AC = 19,
		HP = "10d2+230",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "2d10+10",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 5000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5488",
	Keywords = {
		"mimic",
		"painting"
	},
	Name = "the mimic",
	RoomDesc = "You see an incredibly life-like painting of the Sultan's mother.",
	FullDesc = "Boy is she ugly.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "5d8+321",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "2d8+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 6000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5489",
	Keywords = {
		"mayor",
		"rabbit"
	},
	Name = "the mayor",
	RoomDesc = "The Mayor of New Thalos stands here.",
	FullDesc = "You see a chubby rabbit dressed in his best suit.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "2d8+600",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d6+6",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 15675
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5490",
	Keywords = {
		"chef"
	},
	Name = "the chef",
	RoomDesc = "The chef stands here making dinner.",
	FullDesc = "You see a very large human who seems to taste everything he makes.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 14,
		AC = 13,
		HP = "10d2+5",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 14,
				Damage = "2d10+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 40
	},
	Gender = 1
})
