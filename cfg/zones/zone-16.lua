Config.NewZone({
	Id = 16,
	Name = "The Straight Path",
	MinRoomId = 1501,
	MaxRoomId = 1600,
	ResetFreq = 600,
	ResetFunc = function()
		World.LoadEntityLimited("mob1500", 1541, 1)
		World.LoadEntityLimited("mob1501", 1534, 1)
		World.LoadEntityLimited("mob1502", 1532, 1)
		World.LoadEntityLimited("mob1503", 1531, 1)
		World.LoadEntityLimited("mob1504", 1529, 1)
		World.LoadEntityLimited("mob1505", 1502, 1)
		World.LoadEntityLimited("mob1506", 1506, 1)
		World.LoadEntityLimited("mob1507", 1510, 5)
		World.LoadEntityLimited("mob1507", 1517, 5)
		World.LoadEntityLimited("mob1507", 1522, 5)
		World.LoadEntityLimited("mob1507", 1525, 5)
		World.LoadEntityLimited("mob1507", 1540, 5)
		World.LoadEntityLimited("mob1508", 1513, 1)
		World.LoadEntityLimited("mob1509", 1512, 1)
		World.LoadEntityLimited("mob1510", 1511, 1)
		World.LoadEntityLimited("mob1511", 1510, 1)
		World.LoadEntityLimited("mob1512", 1520, 1)
		World.LoadEntityLimited("mob1513", 1521, 1)
		World.LoadEntityLimited("mob1514", 1522, 1)
		World.LoadEntityLimited("mob1515", 1523, 1)
		World.LoadEntityLimited("mob1516", 1515, 1)
		World.LoadEntityLimited("mob1517", 1516, 1)
		World.LoadEntityLimited("mob1518", 1517, 1)
		World.LoadEntityLimited("mob1519", 1518, 1)
		World.LoadEntityLimited("mob1520", 1525, 1)
		World.LoadEntityLimited("mob1521", 1526, 1)
		World.LoadEntityLimited("mob1522", 1527, 1)
		World.LoadEntityLimited("mob1523", 1528, 1)
	end
})
