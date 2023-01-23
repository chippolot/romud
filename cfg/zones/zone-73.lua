Config.NewZone({
	Id = 73,
	Name = "The Sewer Maze",
	MinRoomId = 7201,
	MaxRoomId = 7300,
	ResetFreq = 1500,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob7200", 7202, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item7200", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7203", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7205", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob7201", 7204, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item7201", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7202", 7206, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item7202", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7202", 7208, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item7202", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7203", 7215, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7203", 7214, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7203", 7216, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7203", 7218, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7203", 7220, 10)
		e = World.LoadEntityLimited("mob7203", 7222, 10)
		e = World.LoadEntityLimited("mob7203", 7224, 10)
		e = World.LoadEntityLimited("mob7203", 7226, 10)
		e = World.LoadEntityLimited("mob7203", 7234, 10)
		e = World.LoadEntityLimited("mob7203", 7234, 10)
		e = World.LoadEntityLimited("mob7204", 7235, 1)
		e = World.LoadEntityLimited("mob7002", 7286, 5)
		e = World.LoadEntityLimited("mob7002", 7286, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item7190", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7209", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7208", Entity.RoomId(e), 20)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob7002", 7286, 5)
		e = World.LoadEntityLimited("mob7000", 7287, 8)
		e = World.LoadEntityLimited("mob7000", 7287, 8)
		e = World.LoadEntityLimited("mob7000", 7282, 8)
		e = World.LoadEntityLimited("mob7000", 7282, 8)
		e = World.LoadEntityLimited("mob7000", 7281, 8)
	end
})
