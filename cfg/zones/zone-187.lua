Config.NewZone({
	Id = 187,
	Name = "Newbie Zone",
	MinRoomId = 18601,
	MaxRoomId = 18700,
	ResetFreq = 600,
	ResetFunc = function()
		World.LoadEntityLimited("mob18601", 18605, 1)
		World.LoadEntityLimited("mob18602", 18600, 3)
		World.LoadEntityLimited("mob18602", 18607, 3)
		World.LoadEntityLimited("mob18611", 18646, 1)
		World.LoadEntityLimited("mob18612", 18642, 1)
		World.LoadEntityLimited("mob18613", 18640, 1)
		World.LoadEntityLimited("mob18614", 18604, 1)
		World.LoadEntityLimited("mob18615", 18645, 1)
		World.LoadEntityLimited("mob18603", 18602, 1)
		World.LoadEntityLimited("mob18604", 18606, 1)
		World.LoadEntityLimited("mob18605", 18612, 1)
		World.LoadEntityLimited("mob18606", 18602, 4)
		World.LoadEntityLimited("mob18606", 18606, 4)
		World.LoadEntityLimited("mob18606", 18609, 4)
		World.LoadEntityLimited("mob18607", 18620, 5)
		World.LoadEntityLimited("mob18607", 18624, 5)
		World.LoadEntityLimited("mob18607", 18637, 5)
		World.LoadEntityLimited("mob18607", 18633, 5)
		World.LoadEntityLimited("mob18608", 18627, 5)
		World.LoadEntityLimited("mob18608", 18636, 5)
		World.LoadEntityLimited("mob18608", 18638, 5)
		World.LoadEntityLimited("mob18608", 18621, 5)
		World.LoadEntityLimited("mob18609", 18629, 1)
		World.LoadEntityLimited("mob18610", 18639, 1)
	end
})
