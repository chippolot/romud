Config.NewZone({
	Id = 13,
	Name = "God Simplex",
	MinRoomId = 1201,
	MaxRoomId = 1300,
	ResetFreq = 600,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob1201", 1206, 1)
		e = World.LoadEntityLimited("mob1200", 1202, 1)
		e = World.LoadEntityLimited("mob1202", 1202, 2)
		e = World.LoadEntityLimited("mob1202", 1201, 2)
	end
})
