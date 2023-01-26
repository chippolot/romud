Config.NewZone({
	Id = 53,
	Name = "The City Of Thalos",
	MinRoomId = 5201,
	MaxRoomId = 5300,
	ResetFreq = 900,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob5200", 5251, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5217", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5208", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5223", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5201", 5236, 25)
		e = World.LoadEntityLimited("mob5201", 5233, 25)
		e = World.LoadEntityLimited("mob5201", 5237, 25)
		e = World.LoadEntityLimited("mob5201", 5238, 25)
		e = World.LoadEntityLimited("mob5201", 5243, 25)
		e = World.LoadEntityLimited("mob5201", 5219, 25)
		e = World.LoadEntityLimited("mob5201", 5220, 25)
		e = World.LoadEntityLimited("mob5201", 5221, 25)
		e = World.LoadEntityLimited("mob5201", 5226, 25)
		e = World.LoadEntityLimited("mob5201", 5227, 25)
		e = World.LoadEntityLimited("mob5201", 5204, 25)
		e = World.LoadEntityLimited("mob5201", 5205, 25)
		e = World.LoadEntityLimited("mob5201", 5207, 25)
		e = World.LoadEntityLimited("mob5201", 5209, 25)
		e = World.LoadEntityLimited("mob5209", 5206, 25)
		e = World.LoadEntityLimited("mob5209", 5210, 25)
		e = World.LoadEntityLimited("mob5209", 5217, 25)
		e = World.LoadEntityLimited("mob5209", 5222, 25)
		e = World.LoadEntityLimited("mob5209", 5225, 25)
		e = World.LoadEntityLimited("mob5209", 5230, 25)
		e = World.LoadEntityLimited("mob5209", 5235, 25)
		e = World.LoadEntityLimited("mob5209", 5241, 25)
		e = World.LoadEntityLimited("mob5202", 5230, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5214", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5203", 5227, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5215", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5204", 5220, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5218", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob5205", 5239, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5214", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5206", 5237, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item5222", Entity.RoomId(e), 4)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5207", 5233, 4)
		e = World.LoadEntityLimited("mob5207", 5218, 4)
		e = World.LoadEntityLimited("mob5207", 5228, 4)
		e = World.LoadEntityLimited("mob5207", 5245, 4)
		e = World.LoadEntityLimited("mob5208", 5248, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5224", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item5200", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5208", 5247, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5226", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob5208", 5249, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item5221", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
