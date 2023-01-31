Config.NewZone({
	Id = 1,
	Name = "Prontera Fields",
	MinRoomId = 1,
	MaxRoomId = 10,
	Spawners = {
		{Type = "entity", MaxActive = 5, Spawns = {
			{Value="poring", Weight=70},
			{Value="pupa", Weight=20},
			{Value="lunatic", Weight=40},
			{Value="drops", Weight=10}
		}}
	}
})
Config.NewShop({
	RoomId = 1,
	Stock = {
		"knife"
	}
})
Config.NewRoom({
	Id = 1,
	Name = "Newbie Zone",
	Desc = [[
   You are standing in a lush green field that stretches as far as your eyes can see.]],
	Exits = {
		north = 2,
        west = 3
	}
})
Config.NewRoom({
	Id = 2,
	Name = "Newbie Zone",
	Desc = [[
   You are standing in a lush green field that stretches as far as your eyes can see.]],
	Exits = {
		south = 1
	}
})
Config.NewRoom({
	Id = 3,
	Name = "Newbie Zone",
	Desc = [[
   You are standing in a lush green field that stretches as far as your eyes can see.]],
	Exits = {
		east = 1
	}
})