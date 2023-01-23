Config.NewEntity({
	Key = "mob15000",
	Keywords = {
		"gwydion",
		"guard",
		"royal"
	},
	Name = "Gwydion",
	RoomDesc = "Gwydion the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Gwydion wears the chain mail required
of them as uniform.  He seems very well trained, and moves like an
experienced fighter.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15001",
	Keywords = {
		"king",
		"welmar"
	},
	Name = "King Welmar",
	RoomDesc = "The wise King Welmar sits here in his throne.",
	FullDesc = [[
In his later middle-age, with his beard starting to grey, King Welmar
is still very powerfully built, and wouldn't take kindly to an attack.
Despite that, you know he is well-loved throughout the land, and has
a reputation as a wise and just ruler.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "3d60+1480",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d8+16",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15002",
	Keywords = {
		"ghost",
		"horrible"
	},
	Name = "the horrible ghost",
	RoomDesc = "You hear a frightening wail, and see a horrible ghost approaching.",
	FullDesc = "The ghost is almost translucent, and looks really SCARY!",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Stats = {
		Level = 15,
		AC = 25,
		HP = "9d6+150",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 14,
				Damage = "2d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 22000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob15003",
	Keywords = {
		"jim",
		"guard",
		"royal"
	},
	Name = "Jim",
	RoomDesc = "Jim the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Jim wears the chain mail required of
them as uniform.  He seems very well trained, and moves like an
experienced fighter.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15004",
	Keywords = {
		"brian",
		"guard",
		"royal"
	},
	Name = "Brian",
	RoomDesc = "Brian the Royal Guard is here, training with the Master.",
	FullDesc = [[
As all members of the Guard, Brian wears the chain mail required of
them as uniform.  He seems very well trained, and moves like an
experienced fighter.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15005",
	Keywords = {
		"mick",
		"guard",
		"royal"
	},
	Name = "Mick",
	RoomDesc = "Mick the Royal Guard is here, training with the Master.",
	FullDesc = [[
As all members of the Guard, Mick wears the chain mail required of
them as uniform.  He seems very well trained, and moves like an
experienced fighter.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15006",
	Keywords = {
		"matt",
		"guard",
		"royal"
	},
	Name = "Matt",
	RoomDesc = "Matt the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Matt wears the chain mail required of
them as uniform.  He seems very well trained, and moves like an
experienced fighter.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15007",
	Keywords = {
		"jochem",
		"guard",
		"royal"
	},
	Name = "Jochem",
	RoomDesc = "Jochem the Royal Guard sits here, off duty.",
	FullDesc = [[
As all members of the Guard, Jochem wears the chain mail required of
them as uniform.  He seems very well trained, and moves like a fighter
who has seen more than one battle, and longs to see the next!
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "3d6+150",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "1d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 16000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15008",
	Keywords = {
		"anne",
		"guard",
		"royal"
	},
	Name = "Anne",
	RoomDesc = "Anne the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Anne wears the chain mail required of
them as uniform.  She seems very well trained, and moves like a fighter
who has seen more than one battle, and longs to see the next!
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "3d6+150",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "1d8+5",
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
	Key = "mob15009",
	Keywords = {
		"andrew",
		"guard",
		"royal"
	},
	Name = "Andrew",
	RoomDesc = "Andrew the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Andrew wears the chain mail required of
them as uniform.  He seems very well trained, and moves like a fighter
who has seen more than one battle, and longs to see the next!
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "3d6+150",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "1d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 16000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15010",
	Keywords = {
		"bertram",
		"bert",
		"guard",
		"royal"
	},
	Name = "Bertram",
	RoomDesc = "Bertram the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Bertram wears the chain mail required of
them as uniform.  He seems very well trained, and carries his scars
with pride.  This guy seems tough...
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 18,
		HP = "3d6+175",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "1d8+7",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 21000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15011",
	Keywords = {
		"jeanette",
		"guard",
		"royal"
	},
	Name = "Jeanette",
	RoomDesc = "Jeanette the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Jeanette wears the chain mail required of
them as uniform.  She seems very well trained, and carries her scars
with pride.  This girl could be nasty if she wanted to...
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 18,
		HP = "3d6+175",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "1d8+7",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 21000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob15012",
	Keywords = {
		"peter",
		"captain",
		"guard",
		"royal"
	},
	Name = "Peter, the Captain of the Royal Guard",
	RoomDesc = "Peter, the Captain of the Royal Guard, walks around inspecting.",
	FullDesc = [[
As all members of the Guard, Peter wears the chain mail required of
them as uniform.  Even though all the other guards seem well trained,
you realise none of them would stand a chance against this man in a
fight.  He stands at least two metres tall, but still moves with an
almost feline grace.  He actually radiates strength and confidence,
and you have to fight a sudden urge to come to attention as you see
him.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 19,
		AC = 20,
		HP = "3d6+240",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 19,
				Damage = "2d6+8",
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
	Key = "mob15013",
	Keywords = {
		"master",
		"trainingmaster"
	},
	Name = "the Training Master",
	RoomDesc = "The Training Master is here, supervising.",
	FullDesc = [[
Aged, but experienced, the Training Master is skilled in the use
of virtually every weapon type invented by Man.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 18,
		AC = 18,
		HP = "2d6+220",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 19,
				Damage = "1d8+8",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 30000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15014",
	Keywords = {
		"herald",
		"royal"
	},
	Name = "the Royal Herald",
	RoomDesc = "The Royal Herald is standing here.",
	FullDesc = [[
This is a young, powerfully built man, whose primary function
is to make Royal Announcements.
]],
	Flags = {
	},
	Stats = {
		Level = 18,
		AC = 20,
		HP = "3d6+220",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 19,
				Damage = "1d8+9",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 30000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15015",
	Keywords = {
		"ergan",
		"murderer"
	},
	Name = "Ergan the Murderer",
	RoomDesc = "Slumped in a corner you see Ergan, aka the Murderer of Townsbridge.",
	FullDesc = [[
You remember a time almost a decade ago, when the news of the day
was how this man had slaughtered the entire population of the little
village of Townsbridge.  He was imprisoned, and here he is - a shadow
of the undoubtedly great warrior he once was, but still to be reckoned
with.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "3d6+155",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 12,
				Damage = "2d8+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 18000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15016",
	Keywords = {
		"butler",
		"james"
	},
	Name = "James the Butler",
	RoomDesc = "James the Butler is standing here, looking pompous.",
	FullDesc = [[
The typical perfect butler: upper middle age, a bit bald and with 
an impressive belly.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "1d6+100",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 7,
				Damage = "1d9+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 3750
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15017",
	Keywords = {
		"woman",
		"cleaning"
	},
	Name = "the Cleaning Woman",
	RoomDesc = "There is a Cleaning Woman here, trying not be noticed.",
	FullDesc = "Although she has a menial job, she seems to like it.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 1,
		AC = 10,
		HP = "4d6+1",
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
	Gender = 2
})
Config.NewEntity({
	Key = "mob15018",
	Keywords = {
		"cockroach",
		"roach"
	},
	Name = "the cockroach",
	RoomDesc = "A large cockroach is crawling by the wall.",
	FullDesc = "Very large indeed, and they say cockroaches are hard to kill...",
	Flags = {
	},
	Stats = {
		Level = 4,
		AC = 16,
		HP = "2d6+120",
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
		XPValue = 750
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob15019",
	Keywords = {
		"astrologer"
	},
	Name = "the Astrologer",
	RoomDesc = "The Astrologer is sitting here, studying a book.",
	FullDesc = [[
He is old and white-haired, with a long beard.  As you see him,
you can almost believe the rumours about stars deciding Fate,
and that astrology is capable of seeing the future.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 23,
		AC = 21,
		HP = "1d1+30000",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "3d8+30",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 80000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15020",
	Keywords = {
		"tim",
		"guard",
		"lifeguard"
	},
	Name = "Tim, the King's Lifeguard",
	RoomDesc = "Tim, the King's Lifeguard, is standing here.",
	FullDesc = [[
This guy looks just like his twin, Tom.  There seems to be no
doubt that he is completely prepared to give his life for the
King, if necessary.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 17,
		AC = 18,
		HP = "3d6+205",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "1d8+8",
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
	Key = "mob15021",
	Keywords = {
		"tom",
		"guard",
		"lifeguard"
	},
	Name = "Tom, the King's Lifeguard",
	RoomDesc = "Tom, the King's Lifeguard, is standing here.",
	FullDesc = [[
This guy looks just like his twin, Tim.  There seems to be no
doubt that he is completely prepared to give his life for the
King, if necessary.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 17,
		AC = 18,
		HP = "3d6+205",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "1d8+8",
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
	Key = "mob15022",
	Keywords = {
		"chef",
		"cook"
	},
	Name = "the Chef",
	RoomDesc = "The Chef is here, shouting orders to the other cooks.",
	FullDesc = [[
It seems he has been tasting his own food a bit too enthusiastically.
He is, in other words, a bit fat.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 19,
		AC = 20,
		HP = "2d6+1283",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 16,
				Damage = "4d4+14",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 40000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15023",
	Keywords = {
		"cook"
	},
	Name = "the cook",
	RoomDesc = "There is a cook here, making himself busy with a pot.",
	FullDesc = "A junior cook, eager to do the Chef's bidding.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 4,
		AC = 13,
		HP = "2d7+46",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d8+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 600
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15024",
	Keywords = {
		"david",
		"man",
		"guard"
	},
	Name = "David",
	RoomDesc = "David, a big, mean-looking man, stands here, guarding the door.",
	FullDesc = [[
He really is big, and you get the feeling he wouldn't take kindly
to an attempt to get past him.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "2d6+235",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 18,
				Damage = "1d7+10",
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
	Key = "mob15025",
	Keywords = {
		"dick",
		"man",
		"guard"
	},
	Name = "Dick",
	RoomDesc = "Dick, a big, mean-looking man, stands here, guarding the door.",
	FullDesc = [[
He really is big, and you get the feeling he wouldn't take kindly
to an attempt to get past him.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "2d6+235",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 18,
				Damage = "1d7+10",
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
	Key = "mob15026",
	Keywords = {
		"jerry",
		"guard",
		"royal"
	},
	Name = "Jerry",
	RoomDesc = "Jerry the Royal Guard is here off duty, playing dice.",
	FullDesc = [[
As all members of the Guard, Jerry wears the chain mail required
of them as uniform.  He seems very well trained, and moves like
an experienced fighter.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15027",
	Keywords = {
		"michael",
		"guard",
		"royal"
	},
	Name = "Michael",
	RoomDesc = "Michael the Royal Guard is here off duty, playing dice.",
	FullDesc = [[
As all members of the Guard, Michael wears the chain mail required
of them as uniform.  He seems very well trained, and moves like an
experienced fighter.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "1d8+4",
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
	Key = "mob15028",
	Keywords = {
		"hans",
		"guard",
		"royal"
	},
	Name = "Hans",
	RoomDesc = "Hans the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Hans wears the chain mail required
of them as uniform.  He seems very well trained, and moves like
a fighter who has seen more than one battle, and longs to see
the next!
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "3d6+150",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 13,
				Damage = "1d8+5",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 16000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15029",
	Keywords = {
		"boris",
		"guard",
		"royal"
	},
	Name = "Boris",
	RoomDesc = "Boris the Royal Guard is here on duty.",
	FullDesc = [[
As all members of the Guard, Boris wears the chain mail required of
them as uniform.  He seems very well trained, and carries his scars
with pride.  This guy seems tough...
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 15,
		AC = 18,
		HP = "3d6+175",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "1d8+7",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 21000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob15030",
	Keywords = {
		"zombie",
		"villager"
	},
	Name = "the zombie",
	RoomDesc = "A zombie is shambling over some corpses here, moving quite silently.",
	FullDesc = [[
It is entirely possible that this zombie was once one of the villagers
of Townsbridge who has been brought to an undead life by a fuelling
desire for revenge.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 11,
		AC = 16,
		HP = "4d4+95",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 14,
				Damage = "2d4+8",
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
	Key = "mob15031",
	Keywords = {
		"skeleton",
		"villager"
	},
	Name = "the skeleton",
	RoomDesc = "A skeleton is moving about with a loud clatter here, climbing over corpses.",
	FullDesc = [[
It is entirely possible that this skeleton was once one of the villagers
of Townsbridge who has been brought to an undead life by a fuelling desire
for revenge.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 10,
		AC = 16,
		HP = "4d4+80",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 12,
				Damage = "2d3+6",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 8000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob15032",
	Keywords = {
		"pit",
		"fiend",
		"demon"
	},
	Name = "the pit fiend",
	RoomDesc = "A large demon surrounded by flames rises out of the dark pool.",
	FullDesc = [[
It is a horrifying thing, this demonic creature from the depths of the
Abyss.  It glares down at you through blood-red eyes, and bares its huge
white fangs and its razor-sharp talons.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "3d60+1480",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "4d8+16",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1000000
	},
	Gender = 1
})
