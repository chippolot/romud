Config.NewZone({
	Id = 61,
	Name = "Haon-Dor, Light Forest",
	MinRoomId = 6001,
	MaxRoomId = 6100,
	ResetFreq = 780,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob6000", 6010, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6000", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6001", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item6002", Entity.RoomId(e), 20)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6013, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6016, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6018, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6020, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6002", 6023, 1)
		e = World.LoadEntityLimited("mob6004", 6024, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6024", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6005", 6015, 4)
		e = World.LoadEntityLimited("mob6006", 6034, 1)
		e = World.LoadEntityLimited("mob6007", 6034, 1)
		e = World.LoadEntityLimited("mob6008", 6006, 4)
		e = World.LoadEntityLimited("mob6008", 6014, 4)
		e = World.LoadEntityLimited("mob6008", 6063, 4)
		e = World.LoadEntityLimited("mob6009", 6033, 3)
		e = World.LoadEntityLimited("mob6009", 6067, 4)
		e = World.LoadEntityLimited("mob6009", 6014, 4)
		e = World.LoadEntityLimited("mob6009", 6017, 4)
		e = World.LoadEntityLimited("mob6010", 6031, 2)
		e = World.LoadEntityLimited("mob6010", 6031, 2)
		e = World.LoadEntityLimited("mob6011", 6068, 1)
		e = World.LoadEntityLimited("mob6012", 6004, 7)
		e = World.LoadEntityLimited("mob6012", 6008, 7)
		e = World.LoadEntityLimited("mob6012", 6029, 7)
		e = World.LoadEntityLimited("mob6012", 6033, 7)
		e = World.LoadEntityLimited("mob6012", 6031, 7)
		e = World.LoadEntityLimited("mob6012", 6065, 7)
		e = World.LoadEntityLimited("mob6012", 6076, 7)
		e = World.LoadEntityLimited("mob6013", 6031, 4)
		e = World.LoadEntityLimited("mob6013", 6022, 4)
		e = World.LoadEntityLimited("mob6013", 6068, 4)
		e = World.LoadEntityLimited("mob6013", 6062, 4)
		e = World.LoadEntityLimited("mob6014", 6027, 4)
		e = World.LoadEntityLimited("mob6014", 6027, 4)
		e = World.LoadEntityLimited("mob6014", 6027, 4)
		e = World.LoadEntityLimited("mob6014", 6028, 4)
		e = World.LoadEntityLimited("mob6015", 6027, 1)
		e = World.LoadEntityLimited("mob6016", 6026, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item6024", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6017", 6028, 3)
		e = World.LoadEntityLimited("mob6017", 6028, 3)
		e = World.LoadEntityLimited("mob6017", 6028, 3)
		e = World.LoadEntityLimited("mob6018", 6028, 2)
		e = World.LoadEntityLimited("mob6018", 6028, 2)
		e = World.LoadEntityLimited("mob6019", 6028, 2)
		e = World.LoadEntityLimited("mob6019", 6028, 2)
		e = World.LoadEntityLimited("mob6001", 6069, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6063, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6072, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6071, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6001", 6061, 11)
		if e ~= nil then
			i = World.LoadItemLimited("item6023", Entity.RoomId(e), 16)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob6005", 6070, 8)
		e = World.LoadEntityLimited("mob6005", 6075, 8)
		e = World.LoadEntityLimited("mob6005", 6061, 8)
	end
})
