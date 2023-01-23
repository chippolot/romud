Config.NewZone({
	Id = 64,
	Name = "Arachnos",
	MinRoomId = 6301,
	MaxRoomId = 6400,
	ResetFreq = 2040,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob6301", 6302, 10)
		e = World.LoadEntityLimited("mob6301", 6307, 10)
		e = World.LoadEntityLimited("mob6301", 6307, 10)
		e = World.LoadEntityLimited("mob6301", 6305, 10)
		e = World.LoadEntityLimited("mob6305", 6304, 1)
		e = World.LoadEntityLimited("mob6310", 6343, 1)
		e = World.LoadEntityLimited("mob6303", 6314, 1)
		e = World.LoadEntityLimited("mob6308", 6309, 5)
		e = World.LoadEntityLimited("mob6308", 6309, 5)
		e = World.LoadEntityLimited("mob6308", 6309, 5)
		e = World.LoadEntityLimited("mob6308", 6309, 5)
		e = World.LoadEntityLimited("mob6308", 6309, 5)
		e = World.LoadEntityLimited("mob6309", 6328, 2)
		e = World.LoadEntityLimited("mob6307", 6336, 5)
		e = World.LoadEntityLimited("mob6307", 6334, 5)
		e = World.LoadEntityLimited("mob6304", 6333, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6300", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6306", 6322, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item6305", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6306", 6332, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item6305", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6311", 6374, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6302", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6315", 6351, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6109", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6109", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6314", 6400, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6301", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6302", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6303", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6304", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6312", 6371, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6301", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6109", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6313", 6368, 1)
		e = World.LoadEntityLimited("mob6306", 6331, 3)
		e = World.LoadEntityLimited("mob6302", 6361, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6304", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item7203", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6316", 6331, 1)
		e = World.LoadEntityLimited("mob6317", 6341, 1)
	end
})
