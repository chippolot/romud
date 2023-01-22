Config.NewZone({
	Id = 64,
	Name = "Arachnos",
	MinRoomId = 6301,
	MaxRoomId = 6400,
	ResetFreq = 2040,
	ResetFunc = function()
		World.LoadEntityLimited("mob6301", 6301, 10)
		World.LoadEntityLimited("mob6301", 6306, 10)
		World.LoadEntityLimited("mob6301", 6306, 10)
		World.LoadEntityLimited("mob6301", 6304, 10)
		World.LoadEntityLimited("mob6305", 6303, 1)
		World.LoadEntityLimited("mob6310", 6342, 1)
		World.LoadEntityLimited("mob6303", 6313, 1)
		World.LoadEntityLimited("mob6308", 6308, 5)
		World.LoadEntityLimited("mob6308", 6308, 5)
		World.LoadEntityLimited("mob6308", 6308, 5)
		World.LoadEntityLimited("mob6308", 6308, 5)
		World.LoadEntityLimited("mob6308", 6308, 5)
		World.LoadEntityLimited("mob6309", 6327, 2)
		World.LoadEntityLimited("mob6307", 6335, 5)
		World.LoadEntityLimited("mob6307", 6333, 5)
		World.LoadEntityLimited("mob6304", 6332, 1)
		World.LoadEntityLimited("mob6306", 6321, 3)
		World.LoadEntityLimited("mob6306", 6331, 3)
		World.LoadEntityLimited("mob6311", 6373, 1)
		World.LoadEntityLimited("mob6315", 6350, 1)
		World.LoadEntityLimited("mob6314", 6399, 1)
		World.LoadEntityLimited("mob6312", 6370, 1)
		World.LoadEntityLimited("mob6313", 6367, 1)
		World.LoadEntityLimited("mob6306", 6330, 3)
		World.LoadEntityLimited("mob6302", 6360, 1)
		World.LoadEntityLimited("mob6316", 6330, 1)
		World.LoadEntityLimited("mob6317", 6340, 1)
	end
})
