Config.NewZone({
	Id = 66,
	Name = "The Dwarven Kingdom",
	MinRoomId = 6501,
	MaxRoomId = 6600,
	ResetFreq = 2400,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob6500", 6506, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6505", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6515", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6541, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6505", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6502", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6506, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6505", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6541, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6505", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6510, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6512", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6509", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6522, 11)
		e = World.LoadEntityLimited("mob6500", 6522, 11)
		e = World.LoadEntityLimited("mob6500", 6522, 11)
		e = World.LoadEntityLimited("mob6500", 6513, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6513, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6500", 6510, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6509", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6510", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6511", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6501", 6504, 9)
		e = World.LoadEntityLimited("mob6501", 6503, 9)
		e = World.LoadEntityLimited("mob6501", 6502, 9)
		e = World.LoadEntityLimited("mob6502", 6528, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6503", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6503", 6517, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6505", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6510", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6512", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6504", 6536, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3000", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3010", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3011", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3031", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6013", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6505", 6516, 2)
		e = World.LoadEntityLimited("mob6505", 6521, 2)
		e = World.LoadEntityLimited("mob6506", 6509, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item6505", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6507", 6544, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6507", 6544, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6507", 6543, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6507", 6543, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6508", 6544, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6512", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6508", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6509", 6535, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6506", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6510", 6535, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6510", 6535, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6511", 6524, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6511", 6524, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6511", 6524, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6511", 6525, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item6504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6511", 6525, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6511", 6525, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6514", 6522, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item6509", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6514", 6522, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item6509", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6516", 6554, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6500", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6517", 6549, 2)
		e = World.LoadEntityLimited("mob6517", 6550, 2)
	end
})
