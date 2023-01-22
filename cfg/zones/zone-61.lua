Config.NewZone({
	Id = 61,
	Name = "Haon-Dor, Light Forest",
	MinRoomId = 6001,
	MaxRoomId = 6100,
	ResetFreq = 780,
	ResetFunc = function()
		World.LoadEntityLimited("mob6000", 6009, 1)
		World.LoadEntityLimited("mob6001", 6012, 6)
		World.LoadEntityLimited("mob6001", 6015, 6)
		World.LoadEntityLimited("mob6001", 6017, 6)
		World.LoadEntityLimited("mob6001", 6019, 6)
		World.LoadEntityLimited("mob6002", 6022, 1)
		World.LoadEntityLimited("mob6004", 6023, 1)
		World.LoadEntityLimited("mob6005", 6014, 4)
		World.LoadEntityLimited("mob6006", 6033, 1)
		World.LoadEntityLimited("mob6007", 6033, 1)
		World.LoadEntityLimited("mob6008", 6005, 4)
		World.LoadEntityLimited("mob6008", 6013, 4)
		World.LoadEntityLimited("mob6008", 6062, 4)
		World.LoadEntityLimited("mob6009", 6032, 3)
		World.LoadEntityLimited("mob6009", 6066, 4)
		World.LoadEntityLimited("mob6009", 6013, 4)
		World.LoadEntityLimited("mob6009", 6016, 4)
		World.LoadEntityLimited("mob6010", 6030, 2)
		World.LoadEntityLimited("mob6010", 6030, 2)
		World.LoadEntityLimited("mob6011", 6067, 1)
		World.LoadEntityLimited("mob6012", 6003, 7)
		World.LoadEntityLimited("mob6012", 6007, 7)
		World.LoadEntityLimited("mob6012", 6028, 7)
		World.LoadEntityLimited("mob6012", 6032, 7)
		World.LoadEntityLimited("mob6012", 6030, 7)
		World.LoadEntityLimited("mob6012", 6064, 7)
		World.LoadEntityLimited("mob6012", 6075, 7)
		World.LoadEntityLimited("mob6013", 6030, 4)
		World.LoadEntityLimited("mob6013", 6021, 4)
		World.LoadEntityLimited("mob6013", 6067, 4)
		World.LoadEntityLimited("mob6013", 6061, 4)
		World.LoadEntityLimited("mob6014", 6026, 4)
		World.LoadEntityLimited("mob6014", 6026, 4)
		World.LoadEntityLimited("mob6014", 6026, 4)
		World.LoadEntityLimited("mob6014", 6027, 4)
		World.LoadEntityLimited("mob6015", 6026, 1)
		World.LoadEntityLimited("mob6016", 6025, 1)
		World.LoadEntityLimited("mob6017", 6027, 3)
		World.LoadEntityLimited("mob6017", 6027, 3)
		World.LoadEntityLimited("mob6017", 6027, 3)
		World.LoadEntityLimited("mob6018", 6027, 2)
		World.LoadEntityLimited("mob6018", 6027, 2)
		World.LoadEntityLimited("mob6019", 6027, 2)
		World.LoadEntityLimited("mob6019", 6027, 2)
		World.LoadEntityLimited("mob6001", 6068, 11)
		World.LoadEntityLimited("mob6001", 6062, 11)
		World.LoadEntityLimited("mob6001", 6071, 11)
		World.LoadEntityLimited("mob6001", 6070, 11)
		World.LoadEntityLimited("mob6001", 6060, 11)
		World.LoadEntityLimited("mob6005", 6069, 8)
		World.LoadEntityLimited("mob6005", 6074, 8)
		World.LoadEntityLimited("mob6005", 6060, 8)
	end
})
