Config.NewZone({
	Id = 187,
	Name = "Newbie Zone",
	MinRoomId = 18601,
	MaxRoomId = 18700,
	ResetFreq = 600,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob18601", 18606, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18604", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18602", 18601, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item18602", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18602", 18608, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item18606", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18611", 18647, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18606", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18612", 18643, 1)
		e = World.LoadEntityLimited("mob18613", 18641, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18602", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18614", 18605, 1)
		e = World.LoadEntityLimited("mob18615", 18646, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18613", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item18612", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item18602", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item18614", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18603", 18603, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18607", Entity.RoomId(e), 99)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18604", 18607, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18605", Entity.RoomId(e), 60)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item18608", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item18603", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18605", 18613, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18609", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob18606", 18603, 4)
		e = World.LoadEntityLimited("mob18606", 18607, 4)
		e = World.LoadEntityLimited("mob18606", 18610, 4)
		e = World.LoadEntityLimited("mob18607", 18621, 5)
		e = World.LoadEntityLimited("mob18607", 18625, 5)
		e = World.LoadEntityLimited("mob18607", 18638, 5)
		e = World.LoadEntityLimited("mob18607", 18634, 5)
		e = World.LoadEntityLimited("mob18608", 18628, 5)
		e = World.LoadEntityLimited("mob18608", 18637, 5)
		e = World.LoadEntityLimited("mob18608", 18639, 5)
		e = World.LoadEntityLimited("mob18608", 18622, 5)
		e = World.LoadEntityLimited("mob18609", 18630, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item18610", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item18611", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob18610", 18640, 1)
	end
})
