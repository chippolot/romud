Config.NewZone({
	Id = 32,
	Name = "Southern part of Midgaard",
	MinRoomId = 3101,
	MaxRoomId = 3300,
	ResetFreq = 2400,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob3060", 3112, 20)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3105", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3112, 20)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3112, 20)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3112, 20)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3068", 3107, 4)
		e = World.LoadEntityLimited("mob3100", 3107, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3100", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3101", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3102", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3101", 3107, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3106", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3102", 3111, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3107", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3103", 3111, 4)
		e = World.LoadEntityLimited("mob3103", 3111, 4)
		e = World.LoadEntityLimited("mob3103", 3111, 4)
		e = World.LoadEntityLimited("mob3103", 3111, 4)
		e = World.LoadEntityLimited("mob3104", 3138, 1)
		e = World.LoadEntityLimited("mob3105", 3139, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3112", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3106", 3121, 1)
		e = World.LoadEntityLimited("mob3120", 3115, 1)
		e = World.LoadEntityLimited("mob3121", 3115, 1)
		e = World.LoadEntityLimited("mob3122", 3110, 1)
		e = World.LoadEntityLimited("mob3123", 3114, 2)
		e = World.LoadEntityLimited("mob3123", 3116, 2)
	end
})
