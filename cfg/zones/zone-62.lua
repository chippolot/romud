Config.NewZone({
	Id = 62,
	Name = "Haon-Dor, Dark Forest",
	MinRoomId = 6101,
	MaxRoomId = 6200,
	ResetFreq = 1800,
	ResetFunc = function()
		World.LoadEntityLimited("mob6100", 6116, 2)
		World.LoadEntityLimited("mob6100", 6116, 2)
		World.LoadEntityLimited("mob6101", 6127, 2)
		World.LoadEntityLimited("mob6101", 6127, 2)
		World.LoadEntityLimited("mob6102", 6108, 4)
		World.LoadEntityLimited("mob6102", 6108, 4)
		World.LoadEntityLimited("mob6102", 6104, 4)
		World.LoadEntityLimited("mob6102", 6104, 4)
		World.LoadEntityLimited("mob6103", 6112, 4)
		World.LoadEntityLimited("mob6103", 6112, 4)
		World.LoadEntityLimited("mob6103", 6118, 4)
		World.LoadEntityLimited("mob6103", 6118, 4)
		World.LoadEntityLimited("mob6110", 6120, 4)
		World.LoadEntityLimited("mob6110", 6123, 4)
		World.LoadEntityLimited("mob6111", 6109, 4)
		World.LoadEntityLimited("mob6111", 6105, 4)
		World.LoadEntityLimited("mob6112", 6143, 1)
		World.LoadEntityLimited("mob6113", 6133, 3)
		World.LoadEntityLimited("mob6113", 6133, 3)
		World.LoadEntityLimited("mob6113", 6133, 3)
		World.LoadEntityLimited("mob6114", 6134, 1)
		World.LoadEntityLimited("mob6115", 6100, 1)
		World.LoadEntityLimited("mob6116", 6155, 1)
		World.LoadEntityLimited("mob6117", 6134, 1)
	end
})
