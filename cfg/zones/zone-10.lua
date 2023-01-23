Config.NewZone({
	Id = 10,
	Name = "River Island Of Minos",
	MinRoomId = 901,
	MaxRoomId = 1000,
	ResetFreq = 2340,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob900", 916, 3)
		e = World.LoadEntityLimited("mob900", 916, 3)
		e = World.LoadEntityLimited("mob900", 916, 3)
		e = World.LoadEntityLimited("mob901", 917, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item901", Entity.RoomId(e), 15)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob901", 917, 2)
		e = World.LoadEntityLimited("mob902", 918, 1)
		e = World.LoadEntityLimited("mob903", 919, 1)
		e = World.LoadEntityLimited("mob904", 920, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item903", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item902", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob905", 921, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item905", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob906", 921, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item907", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob907", 922, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item901", Entity.RoomId(e), 8)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item900", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob909", 909, 2)
		e = World.LoadEntityLimited("mob909", 909, 2)
		e = World.LoadEntityLimited("mob910", 910, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item908", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob910", 910, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item908", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob911", 911, 3)
		e = World.LoadEntityLimited("mob911", 911, 3)
	end
})
