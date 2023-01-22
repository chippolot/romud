Config.NewZone({
	Id = 10,
	Name = "River Island Of Minos",
	MinRoomId = 901,
	MaxRoomId = 1000,
	ResetFreq = 2340,
	ResetFunc = function()
		World.LoadEntityLimited("mob900", 915, 3)
		World.LoadEntityLimited("mob900", 915, 3)
		World.LoadEntityLimited("mob900", 915, 3)
		World.LoadEntityLimited("mob901", 916, 2)
		World.LoadEntityLimited("mob901", 916, 2)
		World.LoadEntityLimited("mob902", 917, 1)
		World.LoadEntityLimited("mob903", 918, 1)
		World.LoadEntityLimited("mob904", 919, 1)
		World.LoadEntityLimited("mob905", 920, 1)
		World.LoadEntityLimited("mob906", 920, 1)
		World.LoadEntityLimited("mob907", 921, 1)
		World.LoadEntityLimited("mob909", 908, 2)
		World.LoadEntityLimited("mob909", 908, 2)
		World.LoadEntityLimited("mob910", 909, 2)
		World.LoadEntityLimited("mob910", 909, 2)
		World.LoadEntityLimited("mob911", 910, 3)
		World.LoadEntityLimited("mob911", 910, 3)
	end
})
