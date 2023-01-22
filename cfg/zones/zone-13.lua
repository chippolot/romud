Config.NewZone({
	Id = 13,
	Name = "God Simplex",
	MinRoomId = 1201,
	MaxRoomId = 1300,
	ResetFreq = 600,
	ResetFunc = function()
		World.LoadEntityLimited("mob1201", 1205, 1)
		World.LoadEntityLimited("mob1200", 1201, 1)
		World.LoadEntityLimited("mob1202", 1201, 2)
		World.LoadEntityLimited("mob1202", 1200, 2)
	end
})
