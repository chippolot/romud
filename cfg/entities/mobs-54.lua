Config.NewEntity({
	Key = "mob5300",
	Keywords = {
		"asp",
		"snake"
	},
	Name = "the horrible asp",
	RoomDesc = "A small, poisonous asp slithers over your feet.",
	FullDesc = [[
The asp is a small, smooth-scaled snake the color of worn pottery.
The poison bite of this snake has felled many a mighty pharoah.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "1d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 11,
		HP = "5d5+50",
		XPValue = 1000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5301",
	Keywords = {
		"cobra",
		"snake"
	},
	Name = "the hooded cobra snake",
	RoomDesc = "A cobra snake rears up and opens its fearsome hood.",
	FullDesc = [[
The cobra snake waves back and forth before you, its hood displaying brilliant
colors designed to serve notice to its prey that it is about to strike.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d4+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 12,
		HP = "7d7+70",
		XPValue = 2000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5302",
	Keywords = {
		"mongoose"
	},
	Name = "the wily little mongoose",
	RoomDesc = "A small mongoose slinks along the ground, hunting snakes.",
	FullDesc = [[
The mongoose is a wily rodent, a quick hunter of nasty poisonous snakes.
She sniffs you and appears to be looking for food in your hand.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "3d5+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 13,
		HP = "11d11+110",
		XPValue = 10000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5303",
	Keywords = {
		"pyramid",
		"watcher"
	},
	Name = "the pyramid watcher",
	RoomDesc = "The pyramid watcher protects the tombs from intruders.",
	FullDesc = [[
The pyramid watcher has made a pledge to destroy any would-be looters of
the tombs of the pharoahs.  He is clad from head to foot in utilitarian
sand-colored clothing.
]],
	Flags = {
		"stationary",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 8,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 14,
		HP = "8d8+80",
		XPValue = 3750
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5304",
	Keywords = {
		"thief",
		"tomb"
	},
	Name = "the tomb thief",
	RoomDesc = "A sneaky tomb thief moves about in search of treasure.",
	FullDesc = "The thief brushes against you briefly, then slinks back into the shadows.",
	Flags = {
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 14,
		HP = "10d10+100",
		XPValue = 9000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5305",
	Keywords = {
		"ali",
		"baba",
		"thief"
	},
	Name = "Ali Baba",
	RoomDesc = "Ali Baba is here, hunting for the pharoah's tomb.",
	FullDesc = [[
You see a tall, full-bearded man with a mischevious glint in his eye.  Ali Baba
has made his life from stealing things from others, including many items stolen
recently from under the nose of the hapless guardians of this pyramid.  Someday
he might get caught, but not today...
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "3d8+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 18,
		AC = 19,
		HP = "18d18+180",
		XPValue = 30000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5306",
	Keywords = {
		"magic",
		"carpet"
	},
	Name = "the magic carpet",
	RoomDesc = "A small woven carpet lies under your feet.",
	FullDesc = [[
The carpet is simply beautiful, made from intricately woven silken material.  
It seems to rise up at the touch of your feet.  Wait, it is rising, a few feet
above the ground!  In fact, it seems to be ALIVE!
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d5+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 9,
		AC = 12,
		HP = "9d9+90",
		XPValue = 6000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5307",
	Keywords = {
		"mummy",
		"corpse"
	},
	Name = "the mummy",
	RoomDesc = "A mummy reaches for you, disturbed by your presence.",
	FullDesc = [[
You only see the disfigured, rotting features of decaying human flesh,
animated by the distempered spirit of a long-deceased person.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 12,
			Damage = "1d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 15,
		HP = "12d12+120",
		XPValue = 15000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5308",
	Keywords = {
		"sand",
		"man",
		"sandman"
	},
	Name = "the sandman",
	RoomDesc = "A sandman rises up from the desert floor.",
	FullDesc = [[
The sandman is exactly that -- some sort of strange being formed from the sands
of the desert floor.  It seems quite large and strong and at home in the heat
and sandy winds.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 14,
			Damage = "2d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 17,
		HP = "14d14+140",
		XPValue = 18000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5309",
	Keywords = {
		"efreeti",
		"efreet"
	},
	Name = "the efreeti",
	RoomDesc = "The efreeti stands here, sheathed in a column of fire.",
	FullDesc = [[
The efreeti is a mighty being formed from living fire.  He gazes down at
you with disdain and scorn, arms folded across his mighty chest.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d6+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 20,
		HP = "20d20+200",
		XPValue = 40000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5310",
	Keywords = {
		"caryatid",
		"column"
	},
	Name = "the caryatid",
	RoomDesc = "A sandstone column stands here, carved into a feminine figure.",
	FullDesc = [[
The column has been carved into a set of four shapely women, each facing
outward into the room.  The sandstone of the caryatid is smooth with age,
but you can still make out a deadly stone sword in the hands of each figure.
]],
	Flags = {
		"stationary",
		"assistall"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 24,
			Damage = "4d6+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 22,
		HP = "24d24+240",
		XPValue = 100000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5311",
	Keywords = {
		"djinn",
		"genie"
	},
	Name = "the djinn",
	RoomDesc = "The djinn issues forth from the confines of a small lamp.",
	FullDesc = [[
The djinn is a mighty being formed from the air itself and frequently
imprisoned in a small lamp, used to do the bidding of those who find him.
He smiles down at you congenially, arms folded across his blue-tinged 
skin, and strokes his goatee.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 28,
			Damage = "6d6+12",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 28,
		AC = 25,
		HP = "28d28+280",
		XPValue = 310000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5312",
	Keywords = {
		"hieracosphinx",
		"sphinx"
	},
	Name = "the hieracosphinx",
	RoomDesc = "A hieracosphinx looks at you cunningly.",
	FullDesc = [[
The hieracosphinx are cunning, small, but nasty creatures, having the heads
of birds, mighty wingspans, and a full set of four paws to rend their victims
to pieces.  They tend to be quite jealous of the sharper wits of their older
cousins.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "1d10+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 15,
		AC = 16,
		HP = "15d15+150",
		XPValue = 21000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5313",
	Keywords = {
		"gynosphinx",
		"sphinx"
	},
	Name = "the gynosphinx",
	RoomDesc = "A gynosphinx sits here, befuddled by a riddle.",
	FullDesc = [[
The gynosphinx is a crafty but gentle creature, having the body of a
beautiful dark-skinned woman from the waist up, a feathery set of wings
and the hind legs of a mighty cat.  Right now she is confused, having 
just heard a puzzling riddle from a cousin criosphinx.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "2d10+10",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "19d19+190",
		XPValue = 35000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob5314",
	Keywords = {
		"criosphinx",
		"sphinx"
	},
	Name = "the criosphinx",
	RoomDesc = "A criosphinx calmly watches you.",
	FullDesc = [[
The criosphinx is a calm and friendly creature, having the head of a ram atop
the body of a well-furred feline with eagle-like wings.  He delights in riddles,
and in poking occasional fun at his easily confused lesser cousins.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 23,
			Damage = "3d10+15",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 21,
		HP = "23d23+230",
		XPValue = 80000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob5315",
	Keywords = {
		"androsphinx",
		"sphinx"
	},
	Name = "the androsphinx",
	RoomDesc = "A mighty androsphinx tosses its lion-like mane.",
	FullDesc = [[
The mighty androsphinx is a huge creature, with the body of a lion whose
face  is quite man-like, perhaps even handsome, and a massive pair of feathered
wings.  Tales are told of pharoahs that were rendered permanently deaf by the 
mighty roar of this sphinx.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 27,
			Damage = "4d10+20",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 27,
		AC = 25,
		HP = "27d27+270",
		XPValue = 200000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5316",
	Keywords = {
		"great",
		"sphinx"
	},
	Name = "the great sphinx",
	RoomDesc = "A mighty sphinx rests here in the sand, dormant now for centuries.",
	FullDesc = [[
The great sphinx towers tens of feet above you, resting here in a state of 
dormancy.  It has become almost indistinguishable from the sand that surrounds
it, although you can still make out the features of the handsome face that once
advised many rulers.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 41,
			Damage = "5d10+25",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 41,
		AC = 39,
		HP = "41d41+410",
		XPValue = 1500000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob5317",
	Keywords = {
		"ramses",
		"mummy"
	},
	Name = "Ramses the Damned",
	RoomDesc = "You have awakened the mighty servant to the pharoahs, Ramses.",
	FullDesc = [[
As your light spills over his face and body, you can see his features
begin to fill out, swell, and harden, until an apparently healthy man 
stands before you, clad only in the raiments he was left in when he last 
slept.  His hair is a soft black, his skin a deep chocolate, and his 
tall frame is totally still, his chest not even moving to breathe.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 38,
			Damage = "8d5+40",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 38,
		AC = 37,
		HP = "38d38+380",
		XPValue = 1000000
	},
	Gender = 1
})
