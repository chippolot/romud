Config.NewZone({
	Id = 36,
	Name = "Miden'Nir",
	MinRoomId = 3501,
	MaxRoomId = 3600,
	ResetFreq = 3600,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob3500", 3522, 3)
		e = World.LoadEntityLimited("mob3500", 3522, 3)
		e = World.LoadEntityLimited("mob3500", 3522, 3)
		e = World.LoadEntityLimited("mob3501", 3509, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3510, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3510, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3513, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3513, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3513, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3515, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3517, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3519, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3501", 3557, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3502", 3552, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3500", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3502", 3557, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3500", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3503", 3557, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3504", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3504", 3576, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3508", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3505", 3577, 1)
		e = World.LoadEntityLimited("mob3506", 3578, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3502", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3507", 3585, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3503", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3507", 3585, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3503", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
