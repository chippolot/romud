Config.NewZone({
	Id = 52,
	Name = "Drow City",
	MinRoomId = 5101,
	MaxRoomId = 5200,
	ResetFreq = 1800,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5100", 5123, 15)
		e = World.LoadEntityLimited("mob5101", 5119, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item5100", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5101", 5134, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item5100", Entity.RoomId(e), 50)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5102", 5105, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5101", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5102", 5125, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5101", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5102", 5109, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5101", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5102", 5112, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5101", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5103", 5105, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5102", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5103", 5125, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5102", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5103", 5109, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5102", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5103", 5112, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5102", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5104", 5105, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5103", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5104", 5125, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5103", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5104", 5109, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5103", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5104", 5112, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item5103", Entity.RoomId(e), 12)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5105", 5119, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5105", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5110", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5105", 5121, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5104", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5110", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5105", 5117, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5104", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5110", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5106", 5151, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item5105", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5109", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5106", 5102, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item5105", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5107", 5126, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5106", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5114", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5107", 5106, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5106", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5111", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5107", 5110, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5106", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5108", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5108", 5114, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5107", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5112", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5109", 5102, 6)
		e = World.LoadEntityLimited("mob5109", 5107, 6)
		e = World.LoadEntityLimited("mob5109", 5116, 6)
		e = World.LoadEntityLimited("mob5109", 5122, 6)
		e = World.LoadEntityLimited("mob5110", 5111, 2)
		e = World.LoadEntityLimited("mob5110", 5111, 2)
		e = World.LoadEntityLimited("mob5111", 5149, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5113", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5115", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
