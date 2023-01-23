Config.NewZone({
	Id = 62,
	Name = "Haon-Dor, Dark Forest",
	MinRoomId = 6101,
	MaxRoomId = 6200,
	ResetFreq = 1800,
	ResetFunc = function()
		World.LoadEntityLimited("mob6100", 6117, 2)
		World.LoadEntityLimited("mob6100", 6117, 2)
		World.LoadEntityLimited("mob6101", 6128, 2)
		World.LoadEntityLimited("mob6101", 6128, 2)
		World.LoadEntityLimited("mob6102", 6109, 4)
		World.LoadEntityLimited("mob6102", 6109, 4)
		World.LoadEntityLimited("mob6102", 6105, 4)
		World.LoadEntityLimited("mob6102", 6105, 4)
		World.LoadEntityLimited("mob6103", 6113, 4)
		World.LoadEntityLimited("mob6103", 6113, 4)
		World.LoadEntityLimited("mob6103", 6119, 4)
		World.LoadEntityLimited("mob6103", 6119, 4)
		World.LoadEntityLimited("mob6110", 6121, 4)
		World.LoadEntityLimited("mob6110", 6124, 4)
		World.LoadEntityLimited("mob6111", 6110, 4)
		World.LoadEntityLimited("mob6111", 6106, 4)
		World.LoadEntityLimited("mob6112", 6144, 1)
		World.LoadEntityLimited("mob6113", 6134, 3)
		World.LoadEntityLimited("mob6113", 6134, 3)
		World.LoadEntityLimited("mob6113", 6134, 3)
		World.LoadEntityLimited("mob6114", 6135, 1)
		World.LoadEntityLimited("mob6115", 6101, 1)
		World.LoadEntityLimited("mob6116", 6156, 1)
		World.LoadEntityLimited("mob6117", 6135, 1)
	end
})
