Config.NewZone({
	Id = 1,
	Name = "Limbo - Internal",
	MinRoomId = 1,
	MaxRoomId = 100,
	ResetFreq = 600,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob1", 2, 1)
	end
})
