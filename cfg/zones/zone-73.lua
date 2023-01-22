Config.NewZone({
	Id = 73,
	Name = "The Sewer Maze",
	MinRoomId = 7201,
	MaxRoomId = 7300,
	ResetFreq = 1500,
	ResetFunc = function()
		World.LoadEntityLimited("mob7200", 7201, 1)
		World.LoadEntityLimited("mob7201", 7203, 1)
		World.LoadEntityLimited("mob7202", 7205, 2)
		World.LoadEntityLimited("mob7202", 7207, 2)
		World.LoadEntityLimited("mob7203", 7214, 10)
		World.LoadEntityLimited("mob7203", 7213, 10)
		World.LoadEntityLimited("mob7203", 7215, 10)
		World.LoadEntityLimited("mob7203", 7217, 10)
		World.LoadEntityLimited("mob7203", 7219, 10)
		World.LoadEntityLimited("mob7203", 7221, 10)
		World.LoadEntityLimited("mob7203", 7223, 10)
		World.LoadEntityLimited("mob7203", 7225, 10)
		World.LoadEntityLimited("mob7203", 7233, 10)
		World.LoadEntityLimited("mob7203", 7233, 10)
		World.LoadEntityLimited("mob7204", 7234, 1)
		World.LoadEntityLimited("mob7002", 7285, 5)
		World.LoadEntityLimited("mob7002", 7285, 5)
		World.LoadEntityLimited("mob7002", 7285, 5)
		World.LoadEntityLimited("mob7000", 7286, 8)
		World.LoadEntityLimited("mob7000", 7286, 8)
		World.LoadEntityLimited("mob7000", 7281, 8)
		World.LoadEntityLimited("mob7000", 7281, 8)
		World.LoadEntityLimited("mob7000", 7280, 8)
	end
})
