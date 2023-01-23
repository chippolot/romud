Config.NewZone({
	Id = 151,
	Name = "King Welmar's Castle",
	MinRoomId = 15001,
	MaxRoomId = 15100,
	ResetFreq = 7200,
	ResetFunc = function()
		World.LoadEntityLimited("mob15001", 15017, 1)
		World.LoadEntityLimited("mob15003", 15042, 1)
		World.LoadEntityLimited("mob15004", 15023, 1)
		World.LoadEntityLimited("mob15005", 15023, 1)
		World.LoadEntityLimited("mob15006", 15035, 1)
		World.LoadEntityLimited("mob15007", 15028, 1)
		World.LoadEntityLimited("mob15008", 15023, 1)
		World.LoadEntityLimited("mob15009", 15008, 1)
		World.LoadEntityLimited("mob15010", 15032, 1)
		World.LoadEntityLimited("mob15011", 15019, 1)
		World.LoadEntityLimited("mob15012", 15023, 1)
		World.LoadEntityLimited("mob15013", 15023, 1)
		World.LoadEntityLimited("mob15014", 15017, 1)
		World.LoadEntityLimited("mob15016", 15027, 1)
		World.LoadEntityLimited("mob15017", 15010, 5)
		World.LoadEntityLimited("mob15017", 15010, 5)
		World.LoadEntityLimited("mob15017", 15041, 5)
		World.LoadEntityLimited("mob15017", 15041, 5)
		World.LoadEntityLimited("mob15017", 15038, 5)
		World.LoadEntityLimited("mob15019", 15052, 1)
		World.LoadEntityLimited("mob15020", 15017, 1)
		World.LoadEntityLimited("mob15021", 15017, 1)
		World.LoadEntityLimited("mob15022", 15005, 1)
		World.LoadEntityLimited("mob15023", 15005, 2)
		World.LoadEntityLimited("mob15023", 15005, 2)
		World.LoadEntityLimited("mob15024", 15036, 1)
		World.LoadEntityLimited("mob15025", 15036, 1)
		World.LoadEntityLimited("mob15026", 15008, 1)
		World.LoadEntityLimited("mob15027", 15008, 1)
		World.LoadEntityLimited("mob15028", 15047, 1)
		World.LoadEntityLimited("mob15029", 15009, 1)
		World.LoadEntityLimited("mob15000", 15056, 1)
		World.LoadEntityLimited("mob15002", 15069, 1)
		World.LoadEntityLimited("mob15015", 15059, 1)
		World.LoadEntityLimited("mob15018", 15058, 2)
		World.LoadEntityLimited("mob15018", 15058, 2)
		World.LoadEntityLimited("mob15030", 15067, 2)
		World.LoadEntityLimited("mob15030", 15067, 2)
		World.LoadEntityLimited("mob15031", 15067, 2)
		World.LoadEntityLimited("mob15031", 15067, 2)
		World.LoadEntityLimited("mob15032", 15074, 1)
	end
})