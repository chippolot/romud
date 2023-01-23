Config.NewZone({
	Id = 151,
	Name = "King Welmar's Castle",
	MinRoomId = 15001,
	MaxRoomId = 15100,
	ResetFreq = 7200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob15001", 15018, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15002", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15003", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15004", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15014", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15003", 15043, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15004", 15024, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15006", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15005", 15024, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15006", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15006", 15036, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15007", 15029, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15008", 15024, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15009", 15009, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15010", 15033, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15011", 15020, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15012", 15024, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15016", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15013", 15024, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15014", 15018, 1)
		e = World.LoadEntityLimited("mob15016", 15028, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15009", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15017", 15011, 5)
		e = World.LoadEntityLimited("mob15017", 15011, 5)
		e = World.LoadEntityLimited("mob15017", 15042, 5)
		e = World.LoadEntityLimited("mob15017", 15042, 5)
		e = World.LoadEntityLimited("mob15017", 15039, 5)
		e = World.LoadEntityLimited("mob15019", 15053, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3052", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3050", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item15012", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15020", 15018, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15021", 15018, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15022", 15006, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15019", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item15020", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15023", 15006, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item15010", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15023", 15006, 2)
		e = World.LoadEntityLimited("mob15024", 15037, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15007", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15025", 15037, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15026", 15009, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15027", 15009, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15028", 15048, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15029", 15010, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob15000", 15057, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15015", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item15017", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob15002", 15070, 1)
		e = World.LoadEntityLimited("mob15015", 15060, 1)
		e = World.LoadEntityLimited("mob15018", 15059, 2)
		e = World.LoadEntityLimited("mob15018", 15059, 2)
		e = World.LoadEntityLimited("mob15030", 15068, 2)
		e = World.LoadEntityLimited("mob15030", 15068, 2)
		e = World.LoadEntityLimited("mob15031", 15068, 2)
		e = World.LoadEntityLimited("mob15031", 15068, 2)
		e = World.LoadEntityLimited("mob15032", 15075, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item15008", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
