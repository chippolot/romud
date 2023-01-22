Config.NewZone({
	Id = 36,
	Name = "Miden'Nir",
	MinRoomId = 3501,
	MaxRoomId = 3600,
	ResetFreq = 3600,
	ResetFunc = function()
		World.LoadEntityLimited("mob3500", 3521, 3)
		World.LoadEntityLimited("mob3500", 3521, 3)
		World.LoadEntityLimited("mob3500", 3521, 3)
		World.LoadEntityLimited("mob3501", 3508, 10)
		World.LoadEntityLimited("mob3501", 3509, 10)
		World.LoadEntityLimited("mob3501", 3509, 10)
		World.LoadEntityLimited("mob3501", 3512, 10)
		World.LoadEntityLimited("mob3501", 3512, 10)
		World.LoadEntityLimited("mob3501", 3512, 10)
		World.LoadEntityLimited("mob3501", 3514, 10)
		World.LoadEntityLimited("mob3501", 3516, 10)
		World.LoadEntityLimited("mob3501", 3518, 10)
		World.LoadEntityLimited("mob3501", 3556, 10)
		World.LoadEntityLimited("mob3502", 3551, 4)
		World.LoadEntityLimited("mob3502", 3556, 4)
		World.LoadEntityLimited("mob3503", 3556, 1)
		World.LoadEntityLimited("mob3504", 3575, 1)
		World.LoadEntityLimited("mob3505", 3576, 1)
		World.LoadEntityLimited("mob3506", 3577, 1)
		World.LoadEntityLimited("mob3507", 3584, 4)
		World.LoadEntityLimited("mob3507", 3584, 4)
	end
})
