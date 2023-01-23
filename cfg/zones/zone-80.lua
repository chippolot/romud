Config.NewZone({
	Id = 80,
	Name = "Redferne's Residence",
	MinRoomId = 7901,
	MaxRoomId = 8000,
	ResetFreq = 3000,
	ResetFunc = function()
		World.LoadEntityLimited("mob7900", 7901, 1)
		World.LoadEntityLimited("mob7901", 7908, 2)
		World.LoadEntityLimited("mob7901", 7908, 2)
		World.LoadEntityLimited("mob7902", 7914, 1)
	end
})
