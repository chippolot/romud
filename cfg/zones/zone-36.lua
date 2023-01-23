Config.NewZone({
	Id = 36,
	Name = "Miden'Nir",
	MinRoomId = 3501,
	MaxRoomId = 3600,
	ResetFreq = 3600,
	ResetFunc = function()
		World.LoadEntityLimited("mob3500", 3522, 3)
		World.LoadEntityLimited("mob3500", 3522, 3)
		World.LoadEntityLimited("mob3500", 3522, 3)
		World.LoadEntityLimited("mob3501", 3509, 10)
		World.LoadEntityLimited("mob3501", 3510, 10)
		World.LoadEntityLimited("mob3501", 3510, 10)
		World.LoadEntityLimited("mob3501", 3513, 10)
		World.LoadEntityLimited("mob3501", 3513, 10)
		World.LoadEntityLimited("mob3501", 3513, 10)
		World.LoadEntityLimited("mob3501", 3515, 10)
		World.LoadEntityLimited("mob3501", 3517, 10)
		World.LoadEntityLimited("mob3501", 3519, 10)
		World.LoadEntityLimited("mob3501", 3557, 10)
		World.LoadEntityLimited("mob3502", 3552, 4)
		World.LoadEntityLimited("mob3502", 3557, 4)
		World.LoadEntityLimited("mob3503", 3557, 1)
		World.LoadEntityLimited("mob3504", 3576, 1)
		World.LoadEntityLimited("mob3505", 3577, 1)
		World.LoadEntityLimited("mob3506", 3578, 1)
		World.LoadEntityLimited("mob3507", 3585, 4)
		World.LoadEntityLimited("mob3507", 3585, 4)
	end
})
