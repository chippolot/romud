Config.NewZone({
	Id = 51,
	Name = "The Great Eastern Desert",
	MinRoomId = 5001,
	MaxRoomId = 5100,
	ResetFreq = 1800,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob5015", 5040, 3)
		e = World.LoadEntityLimited("mob5015", 5034, 3)
		e = World.LoadEntityLimited("mob5015", 5050, 3)
		e = World.LoadEntityLimited("mob5017", 5059, 1)
		e = World.LoadEntityLimited("mob5000", 5048, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5000", 5034, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item7211", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5001", 5041, 8)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5002", 5032, 5)
		e = World.LoadEntityLimited("mob5003", 5051, 5)
		e = World.LoadEntityLimited("mob5004", 5037, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5019", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5020", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5021", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5005", 5066, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5024", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item5022", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5006", 5062, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5016", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5007", 5061, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5017", Entity.RoomId(e), 15)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5008", 5060, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item5018", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5009", 5058, 10)
		e = World.LoadEntityLimited("mob5010", 5012, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5001", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5002", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5011", 5010, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5012", 5015, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5000", Entity.RoomId(e), 15)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5013", 5022, 4)
		e = World.LoadEntityLimited("mob5014", 5022, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5003", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
