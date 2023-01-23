Config.NewZone({
	Id = 41,
	Name = "Mines of Moria",
	MinRoomId = 4001,
	MaxRoomId = 4199,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob4000", 4031, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item4001", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4001", 4026, 2)
		e = World.LoadEntityLimited("mob4001", 4016, 2)
		e = World.LoadEntityLimited("mob4002", 4024, 3)
		e = World.LoadEntityLimited("mob4002", 4018, 3)
		e = World.LoadEntityLimited("mob4002", 4021, 3)
		e = World.LoadEntityLimited("mob4003", 4022, 6)
		e = World.LoadEntityLimited("mob4003", 4022, 6)
		e = World.LoadEntityLimited("mob4003", 4014, 6)
		e = World.LoadEntityLimited("mob4003", 4014, 6)
		e = World.LoadEntityLimited("mob4003", 4028, 6)
		e = World.LoadEntityLimited("mob4003", 4028, 6)
		e = World.LoadEntityLimited("mob4004", 4016, 3)
		e = World.LoadEntityLimited("mob4004", 4029, 3)
		e = World.LoadEntityLimited("mob4004", 4029, 3)
		e = World.LoadEntityLimited("mob4005", 4023, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item4000", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob4050", 4063, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item4051", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4051", 4071, 4)
		e = World.LoadEntityLimited("mob4051", 4051, 4)
		e = World.LoadEntityLimited("mob4051", 4074, 4)
		e = World.LoadEntityLimited("mob4051", 4056, 4)
		e = World.LoadEntityLimited("mob4052", 4057, 3)
		e = World.LoadEntityLimited("mob4052", 4066, 3)
		e = World.LoadEntityLimited("mob4052", 4060, 3)
		e = World.LoadEntityLimited("mob4053", 4059, 2)
		e = World.LoadEntityLimited("mob4053", 4069, 2)
		e = World.LoadEntityLimited("mob4054", 4061, 3)
		e = World.LoadEntityLimited("mob4054", 4054, 3)
		e = World.LoadEntityLimited("mob4054", 4053, 3)
		e = World.LoadEntityLimited("mob4055", 4065, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item4050", Entity.RoomId(e), 20)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4055", 4072, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item4050", Entity.RoomId(e), 20)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4056", 4068, 2)
		e = World.LoadEntityLimited("mob4056", 4058, 2)
		e = World.LoadEntityLimited("mob4100", 4115, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item4102", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4101", 4123, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item4100", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4102", 4112, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item4103", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4102", 4112, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item4104", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4103", 4104, 6)
		e = World.LoadEntityLimited("mob4103", 4125, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item4053", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob4105", 4109, 3)
		e = World.LoadEntityLimited("mob4106", 4114, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item4101", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4107", 4120, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item4104", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob4057", 4039, 2)
		e = World.LoadEntityLimited("mob4057", 4042, 2)
		e = World.LoadEntityLimited("mob4058", 4045, 1)
	end
})
