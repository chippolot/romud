Config.NewEntity({
	Key = "mob5100",
	Keywords = {
		"goblin",
		"slave"
	},
	Name = "the goblin slave",
	RoomDesc = "A goblin slave lies here asleep.",
	FullDesc = "The defenseless goblin begs for mercy.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 1,
		AC = 10,
		HP = "1d11+11",
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
	Key = "mob5101",
	Keywords = {
		"drow",
		"commoner"
	},
	Name = "the Drow commoner",
	RoomDesc = "A drow commoner is here, walking around on guard duty.",
	FullDesc = "I doubt he is the type to give directions.",
	Flags = {
		"aggro",
		"assistall",
		"stayzone"
	},
	Stats = {
		Level = 10,
		AC = 19,
		HP = "1d10+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "13d1+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 10750
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5102",
	Keywords = {
		"drow",
		"noble",
		"warrior"
	},
	Name = "the drow warrior",
	RoomDesc = "A drow warrior stands here guarding his home.",
	FullDesc = "He looks kind of annoyed!",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 12,
		AC = 19,
		HP = "1d5+160",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "14d1+7",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 15000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5103",
	Keywords = {
		"drow",
		"noble",
		"mage"
	},
	Name = "the drow mage",
	RoomDesc = "A drow mage is here protecting his home.",
	FullDesc = "The mage prepares to cast a spell... at you!!",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 15,
		AC = 17,
		HP = "1d12+190",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 12,
				Damage = "8d2+2",
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
	Key = "mob5104",
	Keywords = {
		"drow",
		"priestess"
	},
	Name = "the drow priestess",
	RoomDesc = "A drow priestess is here shouting orders.",
	FullDesc = "I wouldn't want go get on her bad side!",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 17,
		AC = 19,
		HP = "1d11+205",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 15,
				Damage = "14d1+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 28000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5105",
	Keywords = {
		"drow",
		"master"
	},
	Name = "the drow master",
	RoomDesc = "A drow master stares at you angrily.",
	FullDesc = "The drow master is ALWAYS ready for a fight.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 21,
		AC = 19,
		HP = "1d12+248",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "18d1+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 60000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5106",
	Keywords = {
		"drow",
		"weaponsmaster"
	},
	Name = "the weaponsmaster",
	RoomDesc = "A drow weaponsmaster is here shadow boxing.",
	FullDesc = "He definitely know his way around in combat.",
	Flags = {
		"stationary",
		"aggro",
		"assistall"
	},
	Stats = {
		Level = 23,
		AC = 21,
		HP = "1d25+405",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "12d2+4",
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
	Key = "mob5107",
	Keywords = {
		"drow",
		"matron",
		"mother"
	},
	Name = "the Matron Mother",
	RoomDesc = "The Matron Mother of the house is standing here.",
	FullDesc = "She looks really and truly annoyed that you have found your way here.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 24,
		AC = 22,
		HP = "1d50+450",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "15d2+4",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 130000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5108",
	Keywords = {
		"drow",
		"matron",
		"mother"
	},
	Name = "the Matron Mother",
	RoomDesc = "The Matron Mother of the first house is waiting for you.",
	FullDesc = "She looks like she is about to rip your head of and eat it.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 25,
		AC = 23,
		HP = "5d10+350",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "12d2+24",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 150000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5109",
	Keywords = {
		"drider"
	},
	Name = "the drider",
	RoomDesc = "The drider looks at you viciously while it draws its sword.",
	FullDesc = "This half-spider, half-drow creature is a formidable opponent.",
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 17,
		HP = "1d6+195",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d6+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 4000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5110",
	Keywords = {
		"drider"
	},
	Name = "the drider",
	RoomDesc = "The drider looks at you viciously while it draws its sword.",
	FullDesc = "This half-spider, half-drow creature is a formidable opponent.",
	Flags = {
		"stationary",
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 11,
		AC = 19,
		HP = "1d6+295",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "3d6+8",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 7000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5111",
	Keywords = {
		"yochlol"
	},
	Name = "the yochlol",
	RoomDesc = "A yochlol forms out of a swirling mist...",
	FullDesc = "The yochlol is not in a good mood.",
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 23,
		AC = 25,
		HP = "25d2+450",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 20,
				Damage = "15d2+30",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 80000
	},
	Gender = 2
})
