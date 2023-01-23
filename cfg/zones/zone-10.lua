Config.NewZone({
	Id = 10,
	Name = "River Island Of Minos",
	MinRoomId = 901,
	MaxRoomId = 1000,
	ResetFreq = 2340,
	ResetFunc = function()
		World.LoadEntityLimited("mob900", 916, 3)
		World.LoadEntityLimited("mob900", 916, 3)
		World.LoadEntityLimited("mob900", 916, 3)
		World.LoadEntityLimited("mob901", 917, 2)
		World.LoadEntityLimited("mob901", 917, 2)
		World.LoadEntityLimited("mob902", 918, 1)
		World.LoadEntityLimited("mob903", 919, 1)
		World.LoadEntityLimited("mob904", 920, 1)
		World.LoadEntityLimited("mob905", 921, 1)
		World.LoadEntityLimited("mob906", 921, 1)
		World.LoadEntityLimited("mob907", 922, 1)
		World.LoadEntityLimited("mob909", 909, 2)
		World.LoadEntityLimited("mob909", 909, 2)
		World.LoadEntityLimited("mob910", 910, 2)
		World.LoadEntityLimited("mob910", 910, 2)
		World.LoadEntityLimited("mob911", 911, 3)
		World.LoadEntityLimited("mob911", 911, 3)
	end
})
