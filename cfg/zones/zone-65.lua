Config.NewZone({
	Id = 65,
	Name = "Rand's Tower",
	MinRoomId = 6401,
	MaxRoomId = 6500,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob6400", 6401, 3)
		e = World.LoadEntityLimited("mob6400", 6403, 3)
		e = World.LoadEntityLimited("mob6400", 6405, 3)
		e = World.LoadEntityLimited("mob6401", 6408, 2)
		e = World.LoadEntityLimited("mob6401", 6408, 2)
		e = World.LoadEntityLimited("mob6402", 6413, 1)
		i = World.LoadItemLimited("item6410", Entity.RoomId(e), 20)
		Act.Get(e, i)
		i = World.LoadItemLimited("item6411", Entity.RoomId(e), 20)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob6403", 6412, 1)
		e = World.LoadEntityLimited("mob6405", 6438, 1)
		e = World.LoadEntityLimited("mob6404", 6417, 3)
		e = World.LoadEntityLimited("mob6404", 6417, 3)
		e = World.LoadEntityLimited("mob6404", 6417, 1)
	end
})
