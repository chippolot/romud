Config.NewZone({
	Id = 32,
	Name = "Southern part of Midgaard",
	MinRoomId = 3101,
	MaxRoomId = 3300,
	ResetFreq = 2400,
	ResetFunc = function()
		World.LoadEntityLimited("mob3060", 3112, 20)
		World.LoadEntityLimited("mob3060", 3112, 20)
		World.LoadEntityLimited("mob3060", 3112, 20)
		World.LoadEntityLimited("mob3060", 3112, 20)
		World.LoadEntityLimited("mob3068", 3107, 4)
		World.LoadEntityLimited("mob3100", 3107, 1)
		World.LoadEntityLimited("mob3101", 3107, 1)
		World.LoadEntityLimited("mob3102", 3111, 1)
		World.LoadEntityLimited("mob3103", 3111, 4)
		World.LoadEntityLimited("mob3103", 3111, 4)
		World.LoadEntityLimited("mob3103", 3111, 4)
		World.LoadEntityLimited("mob3103", 3111, 4)
		World.LoadEntityLimited("mob3104", 3138, 1)
		World.LoadEntityLimited("mob3105", 3139, 1)
		World.LoadEntityLimited("mob3106", 3121, 1)
		World.LoadEntityLimited("mob3120", 3115, 1)
		World.LoadEntityLimited("mob3121", 3115, 1)
		World.LoadEntityLimited("mob3122", 3110, 1)
		World.LoadEntityLimited("mob3123", 3114, 2)
		World.LoadEntityLimited("mob3123", 3116, 2)
	end
})
