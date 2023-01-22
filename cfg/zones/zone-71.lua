Config.NewZone({
	Id = 71,
	Name = "The Sewer, First Level",
	MinRoomId = 7001,
	MaxRoomId = 7100,
	ResetFreq = 900,
	ResetFunc = function()
		World.LoadEntityLimited("mob7001", 7041, 9)
		World.LoadEntityLimited("mob7001", 7025, 9)
		World.LoadEntityLimited("mob7001", 7004, 9)
		World.LoadEntityLimited("mob7001", 7004, 9)
		World.LoadEntityLimited("mob7002", 7049, 3)
		World.LoadEntityLimited("mob7002", 7031, 3)
		World.LoadEntityLimited("mob7003", 7039, 8)
		World.LoadEntityLimited("mob7003", 7039, 8)
		World.LoadEntityLimited("mob7003", 7039, 8)
		World.LoadEntityLimited("mob7003", 7037, 8)
		World.LoadEntityLimited("mob7003", 7037, 8)
		World.LoadEntityLimited("mob7003", 7050, 8)
	end
})
