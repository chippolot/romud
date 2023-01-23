Config.NewZone({
	Id = 16,
	Name = "The Straight Path",
	MinRoomId = 1501,
	MaxRoomId = 1600,
	ResetFreq = 600,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob1500", 1541, 1)
		e = World.LoadEntityLimited("mob1501", 1534, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1500", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1502", 1532, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1501", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1503", 1531, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1503", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1504", 1529, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1502", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1505", 1502, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1508", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1506", 1506, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1509", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1507", 1510, 5)
		e = World.LoadEntityLimited("mob1507", 1517, 5)
		e = World.LoadEntityLimited("mob1507", 1522, 5)
		e = World.LoadEntityLimited("mob1507", 1525, 5)
		e = World.LoadEntityLimited("mob1507", 1540, 5)
		e = World.LoadEntityLimited("mob1508", 1513, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1504", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1509", 1512, 1)
		e = World.LoadEntityLimited("mob1510", 1511, 1)
		e = World.LoadEntityLimited("mob1511", 1510, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1512", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1512", 1520, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1505", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1513", 1521, 1)
		e = World.LoadEntityLimited("mob1514", 1522, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1510", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1515", 1523, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1511", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1516", 1515, 1)
		e = World.LoadEntityLimited("mob1517", 1516, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1514", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1518", 1517, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1513", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob1519", 1518, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1506", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob1520", 1525, 1)
		e = World.LoadEntityLimited("mob1521", 1526, 1)
		e = World.LoadEntityLimited("mob1522", 1527, 1)
		e = World.LoadEntityLimited("mob1523", 1528, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item1507", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
	end
})
