Config.NewZone({
	Id = 51,
	Name = "The Great Eastern Desert",
	MinRoomId = 5001,
	MaxRoomId = 5100,
	ResetFreq = 1800,
	ResetFunc = function()
		World.LoadEntityLimited("mob5015", 5039, 3)
		World.LoadEntityLimited("mob5015", 5033, 3)
		World.LoadEntityLimited("mob5015", 5049, 3)
		World.LoadEntityLimited("mob5017", 5058, 1)
		World.LoadEntityLimited("mob5000", 5047, 5)
		World.LoadEntityLimited("mob5000", 5033, 5)
		World.LoadEntityLimited("mob5001", 5040, 8)
		World.LoadEntityLimited("mob5002", 5031, 5)
		World.LoadEntityLimited("mob5003", 5050, 5)
		World.LoadEntityLimited("mob5004", 5036, 1)
		World.LoadEntityLimited("mob5005", 5065, 1)
		World.LoadEntityLimited("mob5006", 5061, 1)
		World.LoadEntityLimited("mob5007", 5060, 1)
		World.LoadEntityLimited("mob5008", 5059, 5)
		World.LoadEntityLimited("mob5009", 5057, 10)
		World.LoadEntityLimited("mob5010", 5011, 1)
		World.LoadEntityLimited("mob5011", 5009, 3)
		World.LoadEntityLimited("mob5012", 5014, 3)
		World.LoadEntityLimited("mob5013", 5021, 4)
		World.LoadEntityLimited("mob5014", 5021, 1)
	end
})
