require('cfg.ro.utils.go-api')

Config.NewZone({
	Id = 1,
	Name = "Prontera",
	MinRoomId = 1,
	MaxRoomId = 25
})
Config.NewShop({
	RoomId = 1,
	Stock = {
		"knife",
		"rod"
	}
})
Config.NewRoom({
	Id = 1,
	Name = "City of Prontera",
	Desc = [[
   You find yourself in a bustling metropolis, filled with life and energy at every turn.  The air is filled with the sounds of vendors hawking their wares, adventurers talking about their latest exploits, and the shuffling of feet as people hurry to their next destination.  The streets are lined with shops, taverns, and homes, each one more grand and impressive than the last.  To the north stands the majestic Prontera Castle, its walls towering high above the surrounding buildings.  To the south are the city gates leading to Prontera fields.]],
	Exits = {
		[Dir.South] = 26
	}
})