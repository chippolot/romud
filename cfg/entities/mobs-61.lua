Config.NewEntity({
	Key = "mob6000",
	Keywords = {
		"john",
		"lumberjack"
	},
	Name = "John the Lumberjack",
	RoomDesc = "John the Lumberjack is here, looking for some trees to chop down.",
	FullDesc = [[
He is six feet tall and looks quite strong, muscles bulging under his heavy,
chequered shirt.  His features are worn with hard work and his expression is
one of a peaceful man leading a simple life.
]],
	Flags = {
		"scavenger",
		"trashcollector",
		"assistall",
		"stayzone"
	},
	Stats = {
		Level = 5,
		AC = 13,
		HP = "1d12+60",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 5,
				Damage = "1d4+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1050
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6001",
	Keywords = {
		"rabbit",
		"small"
	},
	Name = "the rabbit",
	RoomDesc = "A small rabbit is foraging in the bushes here.",
	FullDesc = "It is a small, furry creature with long ears and big feet.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 0,
		AC = 13,
		HP = "1d4+1",
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
		XPValue = 60
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6002",
	Keywords = {
		"bear",
		"brown"
	},
	Name = "the brown bear",
	RoomDesc = "A big, brown, angry-looking bear is here.",
	FullDesc = [[
The bear is a big, brown, furry animal with very large claws and very sharp
teeth.  It doesn't resemble those cute little dolls from toy shops at all.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "1d12+98",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 7,
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
	Key = "mob6003",
	Keywords = {
		"rabbit",
		"ferocious"
	},
	Name = "the ferocious rabbit",
	RoomDesc = "A ferocious rabbit is here, glaring hungrily at you.",
	FullDesc = [[
This small, furry creature with long ears and big feet has been attacked
by the dreaded rabbit rabies, a horrible disease that turns helpless and
innocent rabbits into ferocious and bloodthirsty monsters.
]],
	Flags = {
		"aggro",
		"stayzone"
	},
	Stats = {
		Level = 3,
		AC = 13,
		HP = "1d4+26",
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
		XPValue = 350
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6004",
	Keywords = {
		"deer",
		"fallow"
	},
	Name = "the fallow deer",
	RoomDesc = "A fallow deer is grazing peacefully here.",
	FullDesc = [[
She is a graceful creature on long, slender legs, and with large, brown eyes
looking back at you with an air of watchful interest.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 2,
		AC = 14,
		HP = "2d8+8",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d6+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 230
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob6005",
	Keywords = {
		"fox",
		"brown"
	},
	Name = "the brown fox",
	RoomDesc = "A brown fox is stalking rabbits through the underbrush here.",
	FullDesc = "It is a large fox with beautiful, red-brown fur and a long, thick bushy tail.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 2,
		AC = 13,
		HP = "1d4+18",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 2,
				Damage = "1d6+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 225
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6006",
	Keywords = {
		"bird",
		"large"
	},
	Name = "the bird",
	RoomDesc = "A large bird with a broken wing has been cornered here.",
	FullDesc = "The bird isn't going to live much longer, by the looks of it.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 0,
		AC = 9,
		HP = "2d3+1",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d2+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 25
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6007",
	Keywords = {
		"bobcat",
		"cat"
	},
	Name = "the bobcat",
	RoomDesc = "A medium sized bobcat is stalking a bird here.",
	FullDesc = [[
The bobcat has sharp claws and teeth, and will probably eat you instead of
the bird if you give it the chance.
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d12+60",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 5,
				Damage = "2d4+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1100
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6008",
	Keywords = {
		"sparrow"
	},
	Name = "the sparrow",
	RoomDesc = "A sparrow is flapping around by the ground.",
	FullDesc = "The sparrow looks like it is enjoying life.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 0,
		AC = 10,
		HP = "3d3+1",
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
		XPValue = 25
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6009",
	Keywords = {
		"robin"
	},
	Name = "the robin",
	RoomDesc = "A robin is hopping around looking for bugs to eat.",
	FullDesc = "The robin looks quite intent on finding a bug or worm to eat.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 0,
		AC = 10,
		HP = "3d3+1",
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
		XPValue = 25
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6010",
	Keywords = {
		"squirrel"
	},
	Name = "the squirrel",
	RoomDesc = "A squirrel is here seeking refuge in its nest.",
	FullDesc = [[
It peers out of its nest at you anxiously, seeming to plead silently with
you to leave it alone.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 1,
		AC = 11,
		HP = "1d7+9",
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
		XPValue = 120
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6011",
	Keywords = {
		"badger"
	},
	Name = "the sleepy badger",
	RoomDesc = "A furry brown badger is curled up under a log here.",
	FullDesc = [[
The badger is slowly awakening and peering up at you from its burrow. You
know that it won't be moving this slow for long.  Its sharp claws and teeth
catch your attention when you consider killing it.
]],
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 4,
		AC = 14,
		HP = "1d5+48",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "2d3+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 650
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6012",
	Keywords = {
		"grey",
		"squirrel"
	},
	Name = "the grey squirrel",
	RoomDesc = "A grey squirrel with a bushy tail is foraging for nuts here.",
	FullDesc = [[
This happy creature seems to pay you no heed as it goes about its search for
nuts among the leaves and twigs on the ground here.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 2,
		AC = 11,
		HP = "1d12+22",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d6+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 200
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6013",
	Keywords = {
		"chipmunk"
	},
	Name = "the small chipmunk",
	RoomDesc = "A small brown-red chipmunk dashes from tree to tree here.",
	FullDesc = [[
The absolute zenith of hyperactivity, this small rodent seems to never tire
of running up, down, and around the trees in this area.  If you could ever
catch it, you imagine it would make an easy meal.
]],
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 0,
		AC = 14,
		HP = "2d5+3",
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
		XPValue = 40
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6014",
	Keywords = {
		"crow",
		"black",
		"bird"
	},
	Name = "the large black crow",
	RoomDesc = "A large black bird flits about here, picking at bits of carrion.",
	FullDesc = "The bird eyes you warily, but continues with its meal.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Stats = {
		Level = 2,
		AC = 11,
		HP = "1d12+22",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 1,
				Damage = "1d5+1",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 200
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6015",
	Keywords = {
		"grotesque",
		"vulture"
	},
	Name = "the grotesque vulture",
	RoomDesc = "A grotesque vulture covered in blood and gore is here feeding madly.",
	FullDesc = [[
It sickens you to even look at this foul bird.  Bits of dried gore stick to
its beak, and unidentifiable organs hang from its talons and feathers.  
It sees you and attacks, protecting its horrible feast!
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Stats = {
		Level = 6,
		AC = 15,
		HP = "1d12+68",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 5,
				Damage = "2d3+2",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1750
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6016",
	Keywords = {
		"buck",
		"deer"
	},
	Name = "the young buck",
	RoomDesc = "A young 5-point buck is drinking from the lake here.",
	FullDesc = [[
This young male deer is drinking from the edge of the lake and watching you
warily.  His antlers are not full size yet, and will no doubt be quite 
impressive in a few years.
]],
	Flags = {
		"stationary",
		"stayzone"
	},
	Stats = {
		Level = 4,
		AC = 15,
		HP = "1d12+48",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 3,
				Damage = "1d5+3",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 750
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob6017",
	Keywords = {
		"fish"
	},
	Name = "the fish",
	RoomDesc = "A fish is swimming about here.",
	FullDesc = "The fish looks about the right size for a meal.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 0,
		AC = 9,
		HP = "2d5+0",
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
		XPValue = 30
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6018",
	Keywords = {
		"duckling"
	},
	Name = "the duckling",
	RoomDesc = "A duckling is swimming around in the pond.",
	FullDesc = "The duckling is adorable, it looks most of all like a tiny furball.",
	Flags = {
		"stationary"
	},
	Stats = {
		Level = 0,
		AC = 9,
		HP = "1d1+0",
		Attacks = {
			{
				Name = "Hit",
				ToHit = 0,
				Damage = "1d1+0",
				DamageType = 1,
				VerbSingular = "hit",
				VerbPlural = "hits"
			}
		},
		XPValue = 1
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob6019 ",
	Keywords = {
		"duck"
	},
	Name = "the duck",
	RoomDesc = "A duck is here, quacking happily.",
	FullDesc = "The duck is quite fat.  It looks like it is enjoying life.",
	Flags = {
		"stayzone"
	},
	Stats = {
		Level = 1,
		AC = 9,
		HP = "2d6+5",
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
		XPValue = 75
	},
	Gender = 0
})
