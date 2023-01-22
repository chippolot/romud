Config.NewZone({
	Id = 1,
	Name = "Limbo - Internal",
	MinRoomId = 1,
	MaxRoomId = 100,
	ResetFreq = 600,
	ResetFunc = function()
		World.LoadEntityLimited("mob1", 1, 1)
	end
})
