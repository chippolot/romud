Config.NewZone({
	Id = 80,
	Name = "Redferne's Residence",
	MinRoomId = 7901,
	MaxRoomId = 8000,
	ResetFreq = 3000,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob7900", 7901, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item7901", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7910", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7914", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7915", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7916", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7917", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7918", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7919", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7920", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob7901", 7908, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item7900", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob7901", 7908, 2)
		e = World.LoadEntityLimited("mob7902", 7914, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item7907", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7907", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7911", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item7902", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
	end
})
