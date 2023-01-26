Config.NewEntity({
	Key = "mob3300",
	Keywords = {
		"farmer"
	},
	Name = "the farmer",
	RoomDesc = "A farmer walks around, looking for something to do.",
	FullDesc = [[
This farmer is a resident of Stanneg by the Mountains,
and as such, is one of the most boring people on earth.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "2d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "3d5+83",
		XPValue = 2250,
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
	Key = "mob3301",
	Keywords = {
		"storekeeper"
	},
	Name = "the storekeeper",
	RoomDesc = "A bored storekeeper waits for you to do something.",
	FullDesc = [[
The bored storekeeper keeps a lazy eye on you as he
waits for you to buy something.  Whee.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 59,
		HP = "3d5+245",
		XPValue = 40000,
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
	Key = "mob3302",
	Keywords = {
		"cowgirl"
	},
	Name = "the cowgirl",
	RoomDesc = "A cowgirl stand here ready to defend her horses...",
	FullDesc = [[
This woman seems ready for anything you might do...
she is truly a woman to be reckoned with...
]],
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d6+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 79,
		HP = "3d5+245",
		XPValue = 40000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob3303",
	Keywords = {
		"horse"
	},
	Name = "the horse",
	RoomDesc = "A horse does horsely things here.",
	FullDesc = [[
This horse looks like a nice horse.  It looks at you
with soft brown eyes and you want to give it a carrot.
]],
	Flags = {
		"stationary",
		"usesequipment"
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
		AC = 14,
		HP = "1d10+60",
		XPValue = 1000,
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
	Key = "mob3304",
	Keywords = {
		"farmer's",
		"wife"
	},
	Name = "the farmer's wife",
	RoomDesc = "A farmer's wife offers you some vegetables.",
	FullDesc = [[
This woman has many different types of fruits and
vegetables for you to buy.  She looks bored, though.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "3d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 59,
		HP = "3d5+245",
		XPValue = 40000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob3305",
	Keywords = {
		"aglandiir",
		"dragon"
	},
	Name = "Aglandiir",
	RoomDesc = "The Dragon Prince, Aglandiir, sits here looking at you curiously.",
	FullDesc = [[
Aglandiir is a prince of his kind, and he didn't get where 
he is today by letting people steal from his horde!
]],
	Flags = {
		"stationary",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "8d5+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 30,
		AC = 119,
		HP = "1d1+1499",
		XPValue = 1000000,
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
	Key = "mob3306",
	Keywords = {
		"cyclops"
	},
	Name = "the Cyclops",
	RoomDesc = "A Cyclops is here, trying to judge range with no depth perception.",
	FullDesc = [[
This Cyclops throws rocks real good.  With one eye though, 
hitting the target is another matter.  He looks at you and 
growls as he misses again!
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "2d8+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 19,
		HP = "3d5+295",
		XPValue = 24000,
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
	Key = "mob3307",
	Keywords = {
		"salle",
		"woman"
	},
	Name = "Salle",
	RoomDesc = "A woman ignores you completely, so intent is she upon her sword.",
	FullDesc = [[
She is a stunning woman, all hair and eyes, it seems.
Her clothing is of the same tawny brown of her skin and
hair.  Her blue eyes look at you appraisingly, seemingly
to show great intelligence.  Her mouth twitches into a 
sneer...
]],
	Flags = {
		"stationary",
		"usesequipment",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 49,
		HP = "3d5+200",
		XPValue = 24000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob3308",
	Keywords = {
		"duwick",
		"man"
	},
	Name = "Duwick",
	RoomDesc = "A truly immense man laughs at you, and draws his knife!",
	FullDesc = [[
This has to be one of the biggest men you've ever seen.  He is
a full seven feet toe to head, and weighs a good three hundred
pounds -- mostly on his biceps and pectorals it appears.  An
ornate scabbard slaps by his side, with the pommel of a silvered
dagger sticking out... a tiny weapon for such a large man!
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
			Damage = "3d6+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 22,
		AC = 89,
		HP = "3d5+400",
		XPValue = 70000,
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
	Key = "mob3309",
	Keywords = {
		"receptionist"
	},
	Name = "the Receptionist",
	RoomDesc = "A receptionist offers you a room.",
	FullDesc = [[
He looks like a retired farmer now making an honest living in an inn.
More power to him!
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d7+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 49,
		HP = "3d5+140",
		XPValue = 8000,
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
	Key = "mob3310",
	Keywords = {
		"innkeeper"
	},
	Name = "the innkeeper",
	RoomDesc = "An aged innkeeper greets you as you enter.",
	FullDesc = [[
He is old and greying, but seems to have been able to
keep his mental faculties through the years.  A large
woolen sweater is wrapped about him for warmth.  His
blue eyes dance with amusement as he notices your weapons,
but he doesn't seem too terribly startled.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = -1,
		HP = "3d5+120",
		XPValue = 9000,
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
	Key = "mob3311",
	Keywords = {
		"hunter"
	},
	Name = "the hunter",
	RoomDesc = "A hunter walks through the town streets on his own time.",
	FullDesc = [[
He looks mean, as if the very personality of the mountains
had infected him with hardness.  His stride is purposeful,
his face weathered, his eyes cold and dark.  Others are
standing out of his way as he walks on by.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 39,
		HP = "3d5+133",
		XPValue = 11000,
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
	Key = "mob3312",
	Keywords = {
		"waiter"
	},
	Name = "a waiter",
	RoomDesc = "A waiter rushes by, intent on his business.",
	FullDesc = [[
He looks harried from the way he hastily takes orders and 
rushes in the back to get food, and to the bar for drinks.  
He doesn't even spare you a glance as he passes by.
]],
	Flags = {
		"stationary",
		"usesequipment"
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
		HP = "3d5+60",
		XPValue = 850,
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
	Key = "mob3313",
	Keywords = {
		"waitress"
	},
	Name = "a waitress",
	RoomDesc = "A waitress rushes by, intent on her business.",
	FullDesc = [[
She looks harried from the way she hastily takes orders and rushes
in the back to get food, and to the bar for drinks.  She doesn't
even spare you a glance as she passes by.
]],
	Flags = {
		"stationary",
		"usesequipment"
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
		HP = "3d5+60",
		XPValue = 850,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob3314",
	Keywords = {
		"bartender"
	},
	Name = "a bartender",
	RoomDesc = "A bartender washes a glass idly here.",
	FullDesc = [[
He nods, smiles, and asks you what you would like to drink.
As you decide, he slowly polishes a glass with an old bar
rag.  The glass is completely clean, but he polishes it anyway.
Go figure.
]],
	Flags = {
		"stationary",
		"usesequipment"
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
		AC = 9,
		HP = "3d5+180",
		XPValue = 21000,
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
	Key = "mob3315",
	Keywords = {
		"bandit"
	},
	Name = "the bandit",
	RoomDesc = "A bandit springs into action upon seeing you.",
	FullDesc = [[
Whew!  Has this guy ever seen a bath?  His face, hands, arms...
nearly every bit of him is covered with grime, dust, dirt and
decay.  His sword is polished and cleaned though...
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "2d8+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 39,
		HP = "3d5+195",
		XPValue = 25000,
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
	Key = "mob3316",
	Keywords = {
		"bandit",
		"guard"
	},
	Name = "the bandit guard",
	RoomDesc = "A bandit guard stands at attention here.",
	FullDesc = [[
He may be a bandit, but he's no slacker.  You wonder
who would be able to keep these bandits in line enough
to pull a good guard duty...

(boy is this guy DIRTY!!!)
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 17,
			Damage = "3d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 18,
		AC = 49,
		HP = "3d5+220",
		XPValue = 32000,
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
	Key = "mob3317",
	Keywords = {
		"miner",
		"worker",
		"slave"
	},
	Name = "the slave",
	RoomDesc = "A slave here is mining out a new passageway.",
	FullDesc = [[
The slave looks up at you with pleading eyes.  He
wants his freedom.  The chains around his ankles are
tight, and you wonder if you should set him free, and
if you even can.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "1d8+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = -81,
		HP = "3d5+70",
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
	Key = "mob3318",
	Keywords = {
		"farmer"
	},
	Name = "the farmer",
	RoomDesc = "A farmer walks around, looking for something to do.",
	FullDesc = [[
This farmer is a resident of Stanneg by the Mountains,
and as such, is one of the most boring people on earth.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "2d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "3d5+83",
		XPValue = 2250,
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
	Key = "mob3319",
	Keywords = {
		"hunter"
	},
	Name = "the hunter",
	RoomDesc = "A hunter walks through the town streets on his own time.",
	FullDesc = [[
He looks mean, as if the very personality of the mountains
had infected him with hardness.  His stride is purposeful,
his face weathered, his eyes cold and dark.  Others are
standing out of his way as he walks on by.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"usesequipment",
		"assistall",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 39,
		HP = "3d5+133",
		XPValue = 11000,
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
