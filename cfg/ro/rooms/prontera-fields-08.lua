require('cfg.ro.utils.go-api')

Config.NewZone({
	Id = 2,
	Name = "Prontera Fields 08",
	MinRoomId = 26,
	MaxRoomId = 50,
	Spawners = {
		{Type = SpawnerType.Entity, MaxActive = 5, Spawns = {
			{Value="poring", Weight=70},
			{Value="pupa", Weight=20},
			{Value="lunatic", Weight=40},
			{Value="drops", Weight=10}
		}}
	}
})
Config.NewRoom({
	Id = 26,
	Name = "Prontera Fields",
	Desc = [[
   A brilliant green meadow stretch out before you, a rolling expanse of lush grass and colorful wildflowers.  The sun shines down from a cloudless sky, casting dappled shadows across the landscape.  To the north you see the majestic city gates of Prontera.  The meadows continue to the east and west.]],
	Exits = {
		[Dir.North] = 1,
        [Dir.East] = 28,
        [Dir.West] = 29
	}
})
Config.NewRoom({
	Id = 28,
	Name = "Prontera Fields",
	Desc = [[
   A brilliant green meadow stretch out before you, a rolling expanse of lush grass and colorful wildflowers.  The sea lies to your east and you can hear waves gently lapping on the shore.  You can still hear the buzz of the city to the west.  The meadows continue to the west and south.]],
	Exits = {
		[Dir.West] = 26,
		[Dir.South] = 30,
	}
})
Config.NewRoom({
	Id = 29,
	Name = "Prontera Fields",
	Desc = [[
   A brilliant green meadow stretch out before you, a rolling expanse of lush grass and colorful wildflowers.  The sun shines down from a cloudless sky, casting dappled shadows across the landscape.  You can still hear the buzz of the city to the east.  The meadows continue to the east and south.]],
	Exits = {
		[Dir.East] = 26,
		[Dir.South] = 31,
	}
})
Config.NewRoom({
	Id = 30,
	Name = "Prontera Fields",
	Desc = [[
   A brilliant green meadow stretch out before you, a rolling expanse of lush grass and colorful wildflowers.  The sea lies to your east and you can hear waves gently lapping on the shore.  In the distance to the south-east you can see what looks like a port.  The meadows continue to the north and south.]],
	Exits = {
		[Dir.North] = 28,
		[Dir.South] = 32,
	}
})
Config.NewRoom({
	Id = 31,
	Name = "Prontera Fields",
	Desc = [[
   The meadow here is elevated and you take in sweeping views of its expanse below you.  To the west, you see some grassy foothills.  The meadows continue to the north and south.]],
	Exits = {
		[Dir.North] = 29,
		[Dir.South] = 33,
		[Dir.West] = 51,
	}
})
Config.NewRoom({
	Id = 32,
	Name = "Prontera Fields",
	Desc = [[
   A brilliant green meadow stretch out before you, a rolling expanse of lush grass and colorful wildflowers.  The sun shines down from a cloudless sky, casting dappled shadows across the landscape.  To the easy, you see the bustling port town of Izlude.  The meadows continue to the north, south, and west.]],
	Exits = {
		[Dir.North] = 30,
		[Dir.South] = 35,
		[Dir.West] = 33,
		[Dir.East] = 76,
	}
})
Config.NewRoom({
	Id = 33,
	Name = "Prontera Fields",
	Desc = [[
   The meadow here is elevated and you take in sweeping views of its expanse below you.  To the west, you see some grassy foothills.  The meadows continue to the north, south, and east.]],
	Exits = {
		[Dir.North] = 31,
		[Dir.South] = 34,
		[Dir.West] = 52,
		[Dir.East] = 32,
	}
})
Config.NewRoom({
	Id = 34,
	Name = "Prontera Fields",
	Desc = [[
   The grasses begin to give way to tougher scrub growth here and you notice that the once fertile soil is looking drier.  To the south, you see a sandy desert.  The meadows continues to the north.]],
	Exits = {
		[Dir.North] = 33,
		[Dir.South] = 101
	}
})
Config.NewRoom({
	Id = 35,
	Name = "Prontera Fields",
	Desc = [[
   The grasses begin to give way to tougher scrub growth here and you notice that the once fertile soil is looking drier.  To the south, you see a sandy desert.  The meadows continues to the north.]],
	Exits = {
		[Dir.North] = 32,
		[Dir.South] = 102
	}
})