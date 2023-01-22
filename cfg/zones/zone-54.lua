Config.NewZone({
	Id = 54,
	Name = "The Great Pyramid",
	MinRoomId = 5301,
	MaxRoomId = 5400,
	ResetFreq = 1200,
	ResetFunc = function()
		World.LoadEntityLimited("mob5300", 5302, 6)
		World.LoadEntityLimited("mob5300", 5305, 6)
		World.LoadEntityLimited("mob5300", 5313, 6)
		World.LoadEntityLimited("mob5300", 5340, 6)
		World.LoadEntityLimited("mob5301", 5303, 4)
		World.LoadEntityLimited("mob5301", 5341, 4)
		World.LoadEntityLimited("mob5302", 5306, 3)
		World.LoadEntityLimited("mob5302", 5316, 3)
		World.LoadEntityLimited("mob5302", 5326, 3)
		World.LoadEntityLimited("mob5303", 5309, 6)
		World.LoadEntityLimited("mob5303", 5309, 6)
		World.LoadEntityLimited("mob5303", 5337, 6)
		World.LoadEntityLimited("mob5303", 5337, 6)
		World.LoadEntityLimited("mob5303", 5340, 6)
		World.LoadEntityLimited("mob5303", 5340, 6)
		World.LoadEntityLimited("mob5304", 5325, 6)
		World.LoadEntityLimited("mob5304", 5326, 6)
		World.LoadEntityLimited("mob5304", 5333, 6)
		World.LoadEntityLimited("mob5304", 5334, 6)
		World.LoadEntityLimited("mob5304", 5335, 6)
		World.LoadEntityLimited("mob5304", 5342, 6)
		World.LoadEntityLimited("mob5305", 5343, 1)
		World.LoadEntityLimited("mob5306", 5323, 1)
		World.LoadEntityLimited("mob5307", 5325, 4)
		World.LoadEntityLimited("mob5307", 5325, 4)
		World.LoadEntityLimited("mob5307", 5337, 4)
		World.LoadEntityLimited("mob5307", 5341, 4)
		World.LoadEntityLimited("mob5308", 5354, 4)
		World.LoadEntityLimited("mob5308", 5355, 4)
		World.LoadEntityLimited("mob5308", 5356, 4)
		World.LoadEntityLimited("mob5308", 5357, 4)
		World.LoadEntityLimited("mob5309", 5311, 1)
		World.LoadEntityLimited("mob5310", 5345, 2)
		World.LoadEntityLimited("mob5310", 5345, 2)
		World.LoadEntityLimited("mob5311", 5323, 1)
		World.LoadEntityLimited("mob5312", 5348, 3)
		World.LoadEntityLimited("mob5312", 5349, 3)
		World.LoadEntityLimited("mob5312", 5351, 3)
		World.LoadEntityLimited("mob5313", 5350, 2)
		World.LoadEntityLimited("mob5313", 5350, 2)
		World.LoadEntityLimited("mob5314", 5352, 2)
		World.LoadEntityLimited("mob5314", 5352, 2)
		World.LoadEntityLimited("mob5315", 5347, 1)
		World.LoadEntityLimited("mob5316", 5358, 1)
		World.LoadEntityLimited("mob5317", 5332, 1)
	end
})
