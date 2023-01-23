Config.NewEntity({
	Key = "mob7000",
	Keywords = {
		"mudmonster",
		"mud",
		"monster"
	},
	Name = "the horrifying Mudmonster",
	RoomDesc = "A horrifying Mudmonster is slowly evolving from the mud...",
	FullDesc = [[
It sure looks like something out of a horror movie.  It strongly resembles
a huge figure made up from mud alone, and it sure looks like it had human 
flesh for breakfast and is strongly intent on having the same for dinner
- Perhaps you?
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "4d6+140",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 11,
				Damage = "2d5+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 13000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7001",
	Keywords = {
		"bat",
		"small",
		"fierce"
	},
	Name = "the small bat",
	RoomDesc = "The small fierce-looking bat is hanging from the ceiling, obviously sleeping.",
	FullDesc = [[
You have never in your entire life seen such a mean looking small creature,
though it looks rather peaceful, hanging there, sleeping.  The thought of 
arousing this cruel creature doesn't sit well in your bones.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 1,
		AC = 14,
		HP = "5d2+6",
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
		XPValue = 150
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7002",
	Keywords = {
		"rat",
		"sewer"
	},
	Name = "the sewer rat",
	RoomDesc = "The huge hungry-looking sewer rat sits here.",
	FullDesc = [[
This creature is fairly large for a rat, but not so big that it could
be called a giant rat.  Sewer water drips off of its grey fur as it
looks at you with black glistening eyes.
]],
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d12+48",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "2d4+0",
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
	Key = "mob7003",
	Keywords = {
		"spider",
		"small",
		"hairy"
	},
	Name = "the small Spider",
	RoomDesc = "The small hairy Spider is here, busy with its web.",
	FullDesc = [[
This small spider seems to pay you no attention at all as it builds
its intricately designed web.
]],
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 1,
		AC = 16,
		HP = "1d12+8",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d4+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 100
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7004",
	Keywords = {
		"beetle",
		"giant",
		"earth"
	},
	Name = "the giant earth beetle",
	RoomDesc = "The giant, mean-looking earth beetle is here.",
	FullDesc = [[
Now, you've seen beetles, but this one is enormous.  It stretches
perhaps two feet from head to tail.  As it notices you, it waves
its six legs about and makes some strange skittering noises at you.
]],
	Flags = {
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "2d10+98",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 7,
				Damage = "2d4+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 3750
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7005",
	Keywords = {
		"maggot",
		"giant"
	},
	Name = "the maggot",
	RoomDesc = "The giant maggot is here, simply existing.",
	FullDesc = [[
This large mound of grotesque flesh is just lying here quivering,
almost as if it can sense your warm blood nearby.
]],
	Flags = {
	},
	Stats = {
		Level = 3,
		AC = 10,
		HP = "2d5+35",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d7+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 350
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7006",
	Keywords = {
		"snake"
	},
	Name = "the snake",
	RoomDesc = "The snake slithers towards you. It looks very mean.",
	FullDesc = [[
This snake is of a variety that you do not recall seeing recently.
It has near black skin with small white diamond shaped spots all
over its head and upper body.  A thin green stripe stretches along
each side of its body.
]],
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 4,
		AC = 12,
		HP = "2d5+40",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "1d9+0",
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
	Key = "mob7007",
	Keywords = {
		"wanderer",
		"evil"
	},
	Name = "the evil wanderer",
	RoomDesc = "The evil wanderer stares at you with a piercing gaze.",
	FullDesc = [[
The evil wanderer is very thin.  He is dressed in a grey cloak.  He
doesn't look like he'd be your first choice as a travelling companion.
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "4d10+100",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 9,
				Damage = "2d6+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 9500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob7008",
	Keywords = {
		"homunculus",
		"creature"
	},
	Name = "the creature homunculus",
	RoomDesc = "The creature homunculus is here, looking at you with an evil look.",
	FullDesc = [[
The homunculus appears in a man-like form, about eighteen inches tall,
has a greenish, reptilian skin, leathery wings, and a batlike mouth,
with teeth dripping with a greenish sludge.
]],
	Flags = {
	},
	Stats = {
		Level = 11,
		AC = 18,
		HP = "6d3+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 10,
				Damage = "2d6+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 11500
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7009",
	Keywords = {
		"morkoth",
		"shadowy"
	},
	Name = "the shadowy morkoth",
	RoomDesc = "The morkoth are standing here, waiting for someone to KILL!",
	FullDesc = [[
It is a five foot tall, shadow monster.  This has the shape between
a human and a rat.  It breaths very heavily while staring at you.
]],
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 10,
		AC = 16,
		HP = "1d20+120",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 8,
				Damage = "2d6+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 9000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7010",
	Keywords = {
		"chr-eff'n",
		"chreffn"
	},
	Name = "the evil chr-eff'n",
	RoomDesc = "The chr-eff'n are crawling here, looking around with its yellow eyes.",
	FullDesc = [[
The head and torso of a chr-eff'n is copper-covered, with yellow,
glowing eyes.  The lower body is in an orange shading.
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "2d26+148",
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
		XPValue = 13000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7040",
	Keywords = {
		"dragon",
		"red"
	},
	Name = "the red dragon",
	RoomDesc = "The fierce-looking red dragon stares at you angrily.",
	FullDesc = [[
The red dragon stares at you, angrily, as it wakes when you arrive.
It says 'Oh, human YOU woke me up... Hsssss', while it moves closer,
'Can one NEVER sleep in peace... Hssss... '
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 19,
		AC = 19,
		HP = "5d4+230",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 18,
				Damage = "3d6+3",
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
	Key = "mob7041",
	Keywords = {
		"hag",
		"sea"
	},
	Name = "the sea hag",
	RoomDesc = "A sea hag is here, swimming around.",
	FullDesc = [[
The sea hag is so ghastly looking that you feel the deepest fear:  Big
yellow eyes and sharp teeth.  Its ears are very big, and it has small
sharp horns.  This beast is obviously a hater of beauty.
]],
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "1d8+172",
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
	Key = "mob7042",
	Keywords = {
		"naga",
		"guardian"
	},
	Name = "the guardian naga",
	RoomDesc = "The guardian naga looks kindly at you.",
	FullDesc = [[
The naga are a snake-liked creature.  She is covered in green-gold scales
with silvery triangles along her back.  Her eyes are golden.  She notices
that you are staring at her, and she says 'Watch out.  This way leads to
some evil creatures.'
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "1d18+148",
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
		XPValue = 13500
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob7043",
	Keywords = {
		"basilisk",
		"scaled"
	},
	Name = "the scaled basilisk",
	RoomDesc = "The scaled basilisk crawls towards you slowly.",
	FullDesc = [[
The basilisk is a reptilian monster.  It has eight legs, and a strong,
toothy jaws.  It is dull brown with yellowish underbelly.  Its eyes are
glowing pale green.
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 13,
		AC = 19,
		HP = "1d12+160",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 9,
				Damage = "2d7+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 16000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob7044",
	Keywords = {
		"lemure",
		"blob"
	},
	Name = "the lemure",
	RoomDesc = "The lemure blob slithers towards you for an attack!",
	FullDesc = [[
This looks like a vaguely human blob.  Big black yellow eyes, and a mouth
going a little bit out from the face.  The lemure does not look interested
in you at all, but it attacks anyway.  It looks like its mind has been
burned out.
]],
	Flags = {
		"aggro"
	},
	Stats = {
		Level = 5,
		AC = 13,
		HP = "3d5+57",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 4,
				Damage = "2d4+0",
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
	Key = "mob7045",
	Keywords = {
		"jones",
		"cruncher",
		"ettin"
	},
	Name = "Jones 'cruncher' ettin",
	RoomDesc = "Jones is standing here glaring at you.",
	FullDesc = [[
At the first sight you thought Jones was an Orc, but when he came closer you
see his second head.  He wears an animal skin dress, filthy and moth eaten. 
Jones really stinks...
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "1d5+130",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 9,
				Damage = "2d6+2",
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
	Key = "mob7046",
	Keywords = {
		"herald",
		"mouse",
		"killer",
		"ettin"
	},
	Name = "Herald 'the mouse-killer' ettin",
	RoomDesc = "Herald is standing here looking confused at you.",
	FullDesc = [[
When you look at Herald, you feel pity.  His clothes are really poor, and
one of his heads hangs down.  At the rope around his stomach hangs dead
mice and rats.  He does not smell good.
]],
	Flags = {
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "3d5+70",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 6,
				Damage = "1d8+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1500
	},
	Gender = 1
})
