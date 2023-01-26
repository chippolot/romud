Config.NewEntity({
	Key = "mob6500",
	Keywords = {
		"guard",
		"dwarf",
		"dwarven"
	},
	Name = "the dwarf guard",
	RoomDesc = "A dwarven guard is here.",
	FullDesc = [[
The guard looks very tough and mean.  He wears his beard long, and he
smells like he hasn't bathed in over a month.
]],
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "2d8+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 21,
		AC = 20,
		HP = "4d20+336",
		XPValue = 60000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6501",
	Keywords = {
		"worker",
		"dwarf",
		"dwarven"
	},
	Name = "the dwarf worker",
	RoomDesc = "A dwarven mining worker is here.",
	FullDesc = "He is very dirty, and looks extremely over-worked.",
	Flags = {
		"usesequipment",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "2d4+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 13,
		AC = 17,
		HP = "25d5+170",
		XPValue = 16000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6502",
	Keywords = {
		"wraith"
	},
	Name = "the wraith",
	RoomDesc = "A wraith is awaiting your first move here.",
	FullDesc = "A black, almost transparent wraith.",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "4d5+25",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 25,
		AC = 25,
		HP = "9d7+500",
		XPValue = 125000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6503",
	Keywords = {
		"storekeeper"
	},
	Name = "the Hide & Tooth storekeeper",
	RoomDesc = "The Hide & Tooth storekeeper is standing here, waiting patiently.",
	FullDesc = "The storekeeper is very rotund, but looks in excellent condition.",
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "2d8+32",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "1d1+30000",
		XPValue = 800000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6504",
	Keywords = {
		"baker",
		"granite",
		"head"
	},
	Name = "Granite Head the baker",
	RoomDesc = "Granite Head, the baker, is waiting for a customer here.",
	FullDesc = "Granite Head is covered with flour and grains.",
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "2d8+22",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "1d1+30000",
		XPValue = 800000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6505",
	Keywords = {
		"lizard",
		"giant"
	},
	Name = "the giant lizard",
	RoomDesc = "A giant lizard is foraging for food along the cavern floor here.",
	FullDesc = [[
This scaly creature looks like it is well adapted to its underground
habitat.  He looks very powerful.
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 21,
		AC = 18,
		HP = "4d20+340",
		XPValue = 55000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6506",
	Keywords = {
		"giant"
	},
	Name = "the giant",
	RoomDesc = "A giant is wandering around the mountainside here.",
	FullDesc = [[
The giant is about 18 feet tall, with arms of steel, and looks in
excellent physical condition.
]],
	Flags = {
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "3d3+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "4d20+300",
		XPValue = 45000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6507",
	Keywords = {
		"mineworker",
		"dwarven",
		"dwarf",
		"miner",
		"worker"
	},
	Name = "the dwarven mineworker",
	RoomDesc = "A dwarven mineworker is here.",
	FullDesc = "The mineworker is very tired, and very dirty, and he has bulging muscles.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "1d3+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 12,
		HP = "3d13+40",
		XPValue = 700,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6508",
	Keywords = {
		"mineleader",
		"dwarven",
		"dwarf",
		"mine",
		"leader"
	},
	Name = "the mine leader",
	RoomDesc = "A dwarven mine leader is here, supervising the work.",
	FullDesc = [[
The mine leader is very big and very strong, though he must be fairly
bright also, to have gotten this job.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d4+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "50d2+270",
		XPValue = 35000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6509",
	Keywords = {
		"doctor",
		"dwarven",
		"healer"
	},
	Name = "the dwarven doctor",
	RoomDesc = "The dwarven doctor is here, aiding the sick of his people.",
	FullDesc = "He is a very skilled healer, and extremely faithful to his god.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d8+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 22,
		AC = 20,
		HP = "9d4+375",
		XPValue = 60000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6510",
	Keywords = {
		"peon",
		"dwarven"
	},
	Name = "the dwarven peon",
	RoomDesc = "A dwarven peon is awaiting help here.",
	FullDesc = "",
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "2d3+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "10d3+35",
		XPValue = 350,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6511",
	Keywords = {
		"dwarf"
	},
	Name = "the Dwarf",
	RoomDesc = "A dwarf is here.",
	FullDesc = "",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "3d3+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "1d15+70",
		XPValue = 1500,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6514",
	Keywords = {
		"guard",
		"barrack"
	},
	Name = "the barrack guard",
	RoomDesc = "A barrack guard is here, lounging around while off duty.",
	FullDesc = "",
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d5+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "5d10+170",
		XPValue = 20000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6516",
	Keywords = {
		"mazekeeper",
		"keeper"
	},
	Name = "the mazekeeper",
	RoomDesc = "A mazekeeper is here.",
	FullDesc = "He looks VERY tough.",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d3+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 29,
		AC = 26,
		HP = "250d4+2000",
		XPValue = 1700000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6517",
	Keywords = {
		"snake",
		"giant"
	},
	Name = "the giant snake",
	RoomDesc = "There is a giant snake here.",
	FullDesc = "",
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d4+22",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "0",
		XPValue = 800000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
