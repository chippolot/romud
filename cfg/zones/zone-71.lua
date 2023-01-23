Config.NewZone({
	Id = 71,
	Name = "The Sewer, First Level",
	MinRoomId = 7001,
	MaxRoomId = 7100,
	ResetFreq = 900,
	ResetFunc = function()
		World.LoadEntityLimited("mob7001", 7042, 9)
		World.LoadEntityLimited("mob7001", 7026, 9)
		World.LoadEntityLimited("mob7001", 7005, 9)
		World.LoadEntityLimited("mob7001", 7005, 9)
		World.LoadEntityLimited("mob7002", 7050, 3)
		World.LoadEntityLimited("mob7002", 7032, 3)
		World.LoadEntityLimited("mob7003", 7040, 8)
		World.LoadEntityLimited("mob7003", 7040, 8)
		World.LoadEntityLimited("mob7003", 7040, 8)
		World.LoadEntityLimited("mob7003", 7038, 8)
		World.LoadEntityLimited("mob7003", 7038, 8)
		World.LoadEntityLimited("mob7003", 7051, 8)
	end
})
