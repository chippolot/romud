Config.NewZone({
	Id = 187,
	Name = "Newbie Zone",
	MinRoomId = 18601,
	MaxRoomId = 18700,
	ResetFreq = 600,
	ResetFunc = function()
		World.LoadEntityLimited("mob18601", 18606, 1)
		World.LoadEntityLimited("mob18602", 18601, 3)
		World.LoadEntityLimited("mob18602", 18608, 3)
		World.LoadEntityLimited("mob18611", 18647, 1)
		World.LoadEntityLimited("mob18612", 18643, 1)
		World.LoadEntityLimited("mob18613", 18641, 1)
		World.LoadEntityLimited("mob18614", 18605, 1)
		World.LoadEntityLimited("mob18615", 18646, 1)
		World.LoadEntityLimited("mob18603", 18603, 1)
		World.LoadEntityLimited("mob18604", 18607, 1)
		World.LoadEntityLimited("mob18605", 18613, 1)
		World.LoadEntityLimited("mob18606", 18603, 4)
		World.LoadEntityLimited("mob18606", 18607, 4)
		World.LoadEntityLimited("mob18606", 18610, 4)
		World.LoadEntityLimited("mob18607", 18621, 5)
		World.LoadEntityLimited("mob18607", 18625, 5)
		World.LoadEntityLimited("mob18607", 18638, 5)
		World.LoadEntityLimited("mob18607", 18634, 5)
		World.LoadEntityLimited("mob18608", 18628, 5)
		World.LoadEntityLimited("mob18608", 18637, 5)
		World.LoadEntityLimited("mob18608", 18639, 5)
		World.LoadEntityLimited("mob18608", 18622, 5)
		World.LoadEntityLimited("mob18609", 18630, 1)
		World.LoadEntityLimited("mob18610", 18640, 1)
	end
})
