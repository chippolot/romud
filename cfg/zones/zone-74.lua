Config.NewZone({
	Id = 74,
	Name = "The Tunnels In The Sewer",
	MinRoomId = 7301,
	MaxRoomId = 7400,
	ResetFreq = 1500,
	ResetFunc = function()
		World.LoadEntityLimited("mob7040", 7329, 1)
		World.LoadEntityLimited("mob7041", 7345, 2)
		World.LoadEntityLimited("mob7042", 7336, 2)
		World.LoadEntityLimited("mob7043", 7340, 3)
		World.LoadEntityLimited("mob7044", 7307, 6)
		World.LoadEntityLimited("mob7045", 7320, 1)
		World.LoadEntityLimited("mob7046", 7325, 1)
		World.LoadEntityLimited("mob7010", 7330, 2)
	end
})
