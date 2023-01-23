Config.NewZone({
	Id = 37,
	Name = "The Chessboard of Midgaard",
	MinRoomId = 3601,
	MaxRoomId = 3700,
	ResetFreq = 600,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob3600", 3610, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3611, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3612, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3613, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3614, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3615, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3616, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3600", 3617, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3600", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3602", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3650, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3651, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3652, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3653, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3654, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3655, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3656, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3601", 3657, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3601", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3603", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3602", 3602, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3604", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3602", 3609, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3604", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3603", 3658, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3605", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3603", 3665, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3605", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3604", 3603, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3606", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3604", 3608, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3606", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3605", 3659, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3607", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3605", 3664, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3607", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3606", 3604, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3608", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3606", 3607, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3608", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3607", 3660, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3609", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3607", 3663, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3609", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3608", 3605, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3610", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3609", 3661, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3611", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3610", 3606, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3612", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3614", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3611", 3662, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3613", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3615", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
	end
})
