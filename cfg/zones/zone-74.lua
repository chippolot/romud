Config.NewZone({
	Id = 74,
	Name = "The Tunnels In The Sewer",
	MinRoomId = 7301,
	MaxRoomId = 7400,
	ResetFreq = 1500,
	ResetFunc = function()
		World.LoadEntityLimited("mob7040", 7328, 1)
		World.LoadEntityLimited("mob7041", 7344, 2)
		World.LoadEntityLimited("mob7042", 7335, 2)
		World.LoadEntityLimited("mob7043", 7339, 3)
		World.LoadEntityLimited("mob7044", 7306, 6)
		World.LoadEntityLimited("mob7045", 7319, 1)
		World.LoadEntityLimited("mob7046", 7324, 1)
		World.LoadEntityLimited("mob7010", 7329, 2)
	end
})
