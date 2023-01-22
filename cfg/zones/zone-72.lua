Config.NewZone({
	Id = 72,
	Name = "The Second Sewer",
	MinRoomId = 7101,
	MaxRoomId = 7200,
	ResetFreq = 1200,
	ResetFunc = function()
		World.LoadEntityLimited("mob7004", 7102, 3)
		World.LoadEntityLimited("mob7005", 7112, 7)
		World.LoadEntityLimited("mob7005", 7112, 7)
		World.LoadEntityLimited("mob7005", 7122, 7)
		World.LoadEntityLimited("mob7002", 7104, 7)
		World.LoadEntityLimited("mob7000", 7103, 3)
		World.LoadEntityLimited("mob7000", 7103, 3)
		World.LoadEntityLimited("mob7006", 7113, 7)
		World.LoadEntityLimited("mob7006", 7122, 7)
		World.LoadEntityLimited("mob7006", 7122, 7)
	end
})
