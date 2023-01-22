Config.NewZone({
	Id = 65,
	Name = "Rand's Tower",
	MinRoomId = 6401,
	MaxRoomId = 6500,
	ResetFreq = 1200,
	ResetFunc = function()
		World.LoadEntityLimited("mob6400", 6400, 3)
		World.LoadEntityLimited("mob6400", 6402, 3)
		World.LoadEntityLimited("mob6400", 6404, 3)
		World.LoadEntityLimited("mob6401", 6407, 2)
		World.LoadEntityLimited("mob6401", 6407, 2)
		World.LoadEntityLimited("mob6402", 6412, 1)
		World.LoadEntityLimited("mob6403", 6411, 1)
		World.LoadEntityLimited("mob6405", 6437, 1)
		World.LoadEntityLimited("mob6404", 6416, 3)
		World.LoadEntityLimited("mob6404", 6416, 3)
		World.LoadEntityLimited("mob6404", 6416, 1)
	end
})
