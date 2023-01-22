Config.NewZone({
	Id = 32,
	Name = "Southern part of Midgaard",
	MinRoomId = 3101,
	MaxRoomId = 3300,
	ResetFreq = 2400,
	ResetFunc = function()
		World.LoadEntityLimited("mob3060", 3111, 20)
		World.LoadEntityLimited("mob3060", 3111, 20)
		World.LoadEntityLimited("mob3060", 3111, 20)
		World.LoadEntityLimited("mob3060", 3111, 20)
		World.LoadEntityLimited("mob3068", 3106, 4)
		World.LoadEntityLimited("mob3100", 3106, 1)
		World.LoadEntityLimited("mob3101", 3106, 1)
		World.LoadEntityLimited("mob3102", 3110, 1)
		World.LoadEntityLimited("mob3103", 3110, 4)
		World.LoadEntityLimited("mob3103", 3110, 4)
		World.LoadEntityLimited("mob3103", 3110, 4)
		World.LoadEntityLimited("mob3103", 3110, 4)
		World.LoadEntityLimited("mob3104", 3137, 1)
		World.LoadEntityLimited("mob3105", 3138, 1)
		World.LoadEntityLimited("mob3106", 3120, 1)
		World.LoadEntityLimited("mob3120", 3114, 1)
		World.LoadEntityLimited("mob3121", 3114, 1)
		World.LoadEntityLimited("mob3122", 3109, 1)
		World.LoadEntityLimited("mob3123", 3113, 2)
		World.LoadEntityLimited("mob3123", 3115, 2)
	end
})
