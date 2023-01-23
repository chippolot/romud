Config.NewEntity({
	Key = "mob1",
	Keywords = {
		"Puff",
		"dragon",
		"fractal"
	},
	Name = "Puff",
	RoomDesc = "Puff the Fractal Dragon is here, contemplating a higher reality.",
	FullDesc = [[
Is that some type of differential curve involving some strange, and
unknown calculus that she seems to be made out of?
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "4d6+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 26,
		AC = 20,
		HP = "5d10+550",
		XPValue = 155000,
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
	Key = "mob10",
	Keywords = {
		"clone"
	},
	Name = "the clone",
	RoomDesc = "A boring old clone is standing here.",
	FullDesc = "This clone is nothing to look at.  No, really, it is quite boring.",
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d1+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 19,
		HP = "1d1+1",
		XPValue = 0,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob11",
	Keywords = {
		"zombie",
		"undead",
		"humanoid"
	},
	Name = "the zombie",
	RoomDesc = "A strange humanoid is here.  How odd, its flesh seems to be falling off!",
	FullDesc = [[
This strange humanoid is moving rather slowly, and appears to be
a corpse, a walking corpse!  It must be a zombie or something of
the sort.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d1+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 19,
		HP = "1d1+1",
		XPValue = 0,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob19",
	Keywords = {
		"aerial",
		"servant",
		"shape"
	},
	Name = "the aerial servant",
	RoomDesc = "An amorphous shape is floating in the air.",
	FullDesc = [[
As you stare at this amorphous shape, it begins to appear to take
the shape of a cloud-like humanoid.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d1+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 19,
		HP = "1d1+1",
		XPValue = 0,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob20",
	Keywords = {
		"elemental"
	},
	Name = "the elemental",
	RoomDesc = "An elemental is standing patiently here.",
	FullDesc = [[
This creature is the essence of the elements, and appears to be
waiting patiently for something to occur.
]],
	Flags = {
		"stationary",
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d1+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 19,
		HP = "1d1+1",
		XPValue = 0,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
