Config.NewZone({
	Id = 73,
	Name = "The Sewer Maze",
	MinRoomId = 7201,
	MaxRoomId = 7300,
	ResetFreq = 1500,
	ResetFunc = function()
		World.LoadEntityLimited("mob7200", 7202, 1)
		World.LoadEntityLimited("mob7201", 7204, 1)
		World.LoadEntityLimited("mob7202", 7206, 2)
		World.LoadEntityLimited("mob7202", 7208, 2)
		World.LoadEntityLimited("mob7203", 7215, 10)
		World.LoadEntityLimited("mob7203", 7214, 10)
		World.LoadEntityLimited("mob7203", 7216, 10)
		World.LoadEntityLimited("mob7203", 7218, 10)
		World.LoadEntityLimited("mob7203", 7220, 10)
		World.LoadEntityLimited("mob7203", 7222, 10)
		World.LoadEntityLimited("mob7203", 7224, 10)
		World.LoadEntityLimited("mob7203", 7226, 10)
		World.LoadEntityLimited("mob7203", 7234, 10)
		World.LoadEntityLimited("mob7203", 7234, 10)
		World.LoadEntityLimited("mob7204", 7235, 1)
		World.LoadEntityLimited("mob7002", 7286, 5)
		World.LoadEntityLimited("mob7002", 7286, 5)
		World.LoadEntityLimited("mob7002", 7286, 5)
		World.LoadEntityLimited("mob7000", 7287, 8)
		World.LoadEntityLimited("mob7000", 7287, 8)
		World.LoadEntityLimited("mob7000", 7282, 8)
		World.LoadEntityLimited("mob7000", 7282, 8)
		World.LoadEntityLimited("mob7000", 7281, 8)
	end
})
