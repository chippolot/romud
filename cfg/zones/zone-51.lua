Config.NewZone({
	Id = 51,
	Name = "The Great Eastern Desert",
	MinRoomId = 5001,
	MaxRoomId = 5100,
	ResetFreq = 1800,
	ResetFunc = function()
		World.LoadEntityLimited("mob5015", 5040, 3)
		World.LoadEntityLimited("mob5015", 5034, 3)
		World.LoadEntityLimited("mob5015", 5050, 3)
		World.LoadEntityLimited("mob5017", 5059, 1)
		World.LoadEntityLimited("mob5000", 5048, 5)
		World.LoadEntityLimited("mob5000", 5034, 5)
		World.LoadEntityLimited("mob5001", 5041, 8)
		World.LoadEntityLimited("mob5002", 5032, 5)
		World.LoadEntityLimited("mob5003", 5051, 5)
		World.LoadEntityLimited("mob5004", 5037, 1)
		World.LoadEntityLimited("mob5005", 5066, 1)
		World.LoadEntityLimited("mob5006", 5062, 1)
		World.LoadEntityLimited("mob5007", 5061, 1)
		World.LoadEntityLimited("mob5008", 5060, 5)
		World.LoadEntityLimited("mob5009", 5058, 10)
		World.LoadEntityLimited("mob5010", 5012, 1)
		World.LoadEntityLimited("mob5011", 5010, 3)
		World.LoadEntityLimited("mob5012", 5015, 3)
		World.LoadEntityLimited("mob5013", 5022, 4)
		World.LoadEntityLimited("mob5014", 5022, 1)
	end
})
