Config.NewZone({
	Id = 80,
	Name = "Redferne's Residence",
	MinRoomId = 7901,
	MaxRoomId = 8000,
	ResetFreq = 3000,
	ResetFunc = function()
		World.LoadEntityLimited("mob7900", 7900, 1)
		World.LoadEntityLimited("mob7901", 7907, 2)
		World.LoadEntityLimited("mob7901", 7907, 2)
		World.LoadEntityLimited("mob7902", 7913, 1)
	end
})
