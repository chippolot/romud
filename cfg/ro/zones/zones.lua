Config.NewZone({
	Id = 1,
	Name = "Newbie Fields",
	MinRoomId = 1,
	MaxRoomId = 10,
	ResetFreq = 60,
	ResetFunc = function()
		e = World.LoadEntityLimited("poring", 1, 10)
	end
})
