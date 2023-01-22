Config.NewZone({
	Id = 16,
	Name = "The Straight Path",
	MinRoomId = 1501,
	MaxRoomId = 1600,
	ResetFreq = 600,
	ResetFunc = function()
		World.LoadEntityLimited("mob1500", 1540, 1)
		World.LoadEntityLimited("mob1501", 1533, 1)
		World.LoadEntityLimited("mob1502", 1531, 1)
		World.LoadEntityLimited("mob1503", 1530, 1)
		World.LoadEntityLimited("mob1504", 1528, 1)
		World.LoadEntityLimited("mob1505", 1501, 1)
		World.LoadEntityLimited("mob1506", 1505, 1)
		World.LoadEntityLimited("mob1507", 1509, 5)
		World.LoadEntityLimited("mob1507", 1516, 5)
		World.LoadEntityLimited("mob1507", 1521, 5)
		World.LoadEntityLimited("mob1507", 1524, 5)
		World.LoadEntityLimited("mob1507", 1539, 5)
		World.LoadEntityLimited("mob1508", 1512, 1)
		World.LoadEntityLimited("mob1509", 1511, 1)
		World.LoadEntityLimited("mob1510", 1510, 1)
		World.LoadEntityLimited("mob1511", 1509, 1)
		World.LoadEntityLimited("mob1512", 1519, 1)
		World.LoadEntityLimited("mob1513", 1520, 1)
		World.LoadEntityLimited("mob1514", 1521, 1)
		World.LoadEntityLimited("mob1515", 1522, 1)
		World.LoadEntityLimited("mob1516", 1514, 1)
		World.LoadEntityLimited("mob1517", 1515, 1)
		World.LoadEntityLimited("mob1518", 1516, 1)
		World.LoadEntityLimited("mob1519", 1517, 1)
		World.LoadEntityLimited("mob1520", 1524, 1)
		World.LoadEntityLimited("mob1521", 1525, 1)
		World.LoadEntityLimited("mob1522", 1526, 1)
		World.LoadEntityLimited("mob1523", 1527, 1)
	end
})
