Config.NewZone({
	Id = 62,
	Name = "Haon-Dor, Dark Forest",
	MinRoomId = 6101,
	MaxRoomId = 6200,
	ResetFreq = 1800,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob6100", 6117, 2)
		e = World.LoadEntityLimited("mob6100", 6117, 2)
		e = World.LoadEntityLimited("mob6101", 6128, 2)
		e = World.LoadEntityLimited("mob6101", 6128, 2)
		e = World.LoadEntityLimited("mob6102", 6109, 4)
		e = World.LoadEntityLimited("mob6102", 6109, 4)
		e = World.LoadEntityLimited("mob6102", 6105, 4)
		e = World.LoadEntityLimited("mob6102", 6105, 4)
		e = World.LoadEntityLimited("mob6103", 6113, 4)
		e = World.LoadEntityLimited("mob6103", 6113, 4)
		e = World.LoadEntityLimited("mob6103", 6119, 4)
		e = World.LoadEntityLimited("mob6103", 6119, 4)
		e = World.LoadEntityLimited("mob6110", 6121, 4)
		e = World.LoadEntityLimited("mob6110", 6124, 4)
		e = World.LoadEntityLimited("mob6111", 6110, 4)
		e = World.LoadEntityLimited("mob6111", 6106, 4)
		e = World.LoadEntityLimited("mob6112", 6144, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6108", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6110", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6112", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6113", 6134, 3)
		e = World.LoadEntityLimited("mob6113", 6134, 3)
		e = World.LoadEntityLimited("mob6113", 6134, 3)
		e = World.LoadEntityLimited("mob6114", 6135, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6108", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6109", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6113", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6115", 6101, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6114", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6116", 6156, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6115", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3055", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6117", 6135, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6116", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6117", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6118", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6119", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6120", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
