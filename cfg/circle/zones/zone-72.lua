Config.NewZone({
	Id = 72,
	Name = "The Second Sewer",
	MinRoomId = 7101,
	MaxRoomId = 7200,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob7004", 7103, 3)
		e = World.LoadEntityLimited("mob7005", 7113, 7)
		e = World.LoadEntityLimited("mob7005", 7113, 7)
		e = World.LoadEntityLimited("mob7005", 7123, 7)
		e = World.LoadEntityLimited("mob7002", 7105, 7)
		e = World.LoadEntityLimited("mob7000", 7104, 3)
		e = World.LoadEntityLimited("mob7000", 7104, 3)
		e = World.LoadEntityLimited("mob7006", 7114, 7)
		e = World.LoadEntityLimited("mob7006", 7123, 7)
		e = World.LoadEntityLimited("mob7006", 7123, 7)
	end
})
