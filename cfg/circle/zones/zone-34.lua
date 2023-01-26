Config.NewZone({
	Id = 34,
	Name = "The Three Of Swords",
	MinRoomId = 3301,
	MaxRoomId = 3400,
	ResetFreq = 1800,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob3300", 3347, 2)
		e = World.LoadEntityLimited("mob3300", 3354, 2)
		e = World.LoadEntityLimited("mob3301", 3346, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3032", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3037", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3038", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3039", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3302", 3348, 1)
		e = World.LoadEntityLimited("mob3303", 3348, 4)
		e = World.LoadEntityLimited("mob3303", 3348, 4)
		e = World.LoadEntityLimited("mob3303", 3348, 4)
		e = World.LoadEntityLimited("mob3303", 3348, 4)
		e = World.LoadEntityLimited("mob3304", 3351, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3300", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3301", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3308", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3309", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3310", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3305", 3376, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3313", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3306", 3369, 3)
		e = World.LoadEntityLimited("mob3306", 3369, 3)
		e = World.LoadEntityLimited("mob3306", 3369, 3)
		e = World.LoadEntityLimited("mob3307", 3358, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3318", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3312", Entity.RoomId(e), 20)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3308", 3331, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3311", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3309", 3359, 1)
		e = World.LoadEntityLimited("mob3310", 3357, 1)
		e = World.LoadEntityLimited("mob3311", 3350, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3317", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3311", 3356, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3317", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3312", 3358, 1)
		e = World.LoadEntityLimited("mob3313", 3358, 1)
		e = World.LoadEntityLimited("mob3314", 3358, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3319", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3320", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3321", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3320, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3324, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3326, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3328, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3333, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3337, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3340, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3322, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3315", 3328, 9)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3316", 3330, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3316", 3330, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3316", 3341, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3316", 3341, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3316", 3318, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3315", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3317", 3341, 2)
		e = World.LoadEntityLimited("mob3317", 3341, 2)
		e = World.LoadEntityLimited("mob3318", 3358, 2)
		e = World.LoadEntityLimited("mob3318", 3358, 2)
		e = World.LoadEntityLimited("mob3319", 3358, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3317", Entity.RoomId(e), 1000)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
