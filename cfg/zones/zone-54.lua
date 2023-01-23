Config.NewZone({
	Id = 54,
	Name = "The Great Pyramid",
	MinRoomId = 5301,
	MaxRoomId = 5400,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob5300", 5303, 6)
		e = World.LoadEntityLimited("mob5300", 5306, 6)
		e = World.LoadEntityLimited("mob5300", 5314, 6)
		e = World.LoadEntityLimited("mob5300", 5341, 6)
		e = World.LoadEntityLimited("mob5301", 5304, 4)
		e = World.LoadEntityLimited("mob5301", 5342, 4)
		e = World.LoadEntityLimited("mob5302", 5307, 3)
		e = World.LoadEntityLimited("mob5302", 5317, 3)
		e = World.LoadEntityLimited("mob5302", 5327, 3)
		e = World.LoadEntityLimited("mob5303", 5310, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5300", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5303", 5310, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5301", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5303", 5338, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5300", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5303", 5338, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5301", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5303", 5341, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5300", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5303", 5341, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5301", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5304", 5326, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5304", 5327, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5304", 5334, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5304", 5335, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5304", 5336, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5304", 5343, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5305", 5344, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5303", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5302", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5306", 5324, 1)
		e = World.LoadEntityLimited("mob5307", 5326, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5304", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5306", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5307", 5326, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5304", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5305", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5307", 5338, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5304", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5307", 5342, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5304", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5308", 5355, 4)
		e = World.LoadEntityLimited("mob5308", 5356, 4)
		e = World.LoadEntityLimited("mob5308", 5357, 4)
		e = World.LoadEntityLimited("mob5308", 5358, 4)
		e = World.LoadEntityLimited("mob5309", 5312, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5307", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5310", 5346, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item5308", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5310", 5346, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item5308", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5309", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5311", 5324, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5313", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5312", 5349, 3)
		e = World.LoadEntityLimited("mob5312", 5350, 3)
		e = World.LoadEntityLimited("mob5312", 5352, 3)
		e = World.LoadEntityLimited("mob5313", 5351, 2)
		e = World.LoadEntityLimited("mob5313", 5351, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item5314", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5314", 5353, 2)
		e = World.LoadEntityLimited("mob5314", 5353, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item5315", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5315", 5348, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5316", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5316", 5359, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5317", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5317", 5333, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5319", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5320", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5321", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5321", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5322", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
