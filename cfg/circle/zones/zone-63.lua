Config.NewZone({
	Id = 63,
	Name = "The Orc Enclave",
	MinRoomId = 6201,
	MaxRoomId = 6300,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob6200", 6220, 3)
		e = World.LoadEntityLimited("mob6200", 6225, 3)
		e = World.LoadEntityLimited("mob6200", 6219, 3)
		e = World.LoadEntityLimited("mob6201", 6220, 2)
		e = World.LoadEntityLimited("mob6201", 6225, 2)
		e = World.LoadEntityLimited("mob6202", 6228, 3)
		e = World.LoadEntityLimited("mob6202", 6225, 3)
		e = World.LoadEntityLimited("mob6202", 6239, 3)
		e = World.LoadEntityLimited("mob6203", 6235, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6241, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6237, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6230, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6213, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6222, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6224, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6226, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6215, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6203", 6231, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6204", 6253, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6205", 6254, 3)
		e = World.LoadEntityLimited("mob6205", 6251, 3)
		e = World.LoadEntityLimited("mob6205", 6250, 3)
		e = World.LoadEntityLimited("mob6206", 6247, 2)
		e = World.LoadEntityLimited("mob6206", 6252, 2)
		e = World.LoadEntityLimited("mob6207", 6254, 1)
		e = World.LoadEntityLimited("mob6208", 6255, 2)
		e = World.LoadEntityLimited("mob6208", 6255, 2)
		e = World.LoadEntityLimited("mob6209", 6252, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6209", 6251, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6209", 6245, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item6204", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6210", 6260, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6205", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6203", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6211", 6217, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6200", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6212", 6268, 4)
		e = World.LoadEntityLimited("mob6212", 6265, 4)
		e = World.LoadEntityLimited("mob6212", 6262, 4)
		e = World.LoadEntityLimited("mob6213", 6266, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6201", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6202", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})