Config.NewZone({
	Id = 121,
	Name = "Rome",
	MinRoomId = 12001,
	MaxRoomId = 12100,
	ResetFreq = 2700,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob12000", 12002, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12000", 12002, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12000", 12002, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12001", 12002, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12003", 12004, 10)
		e = World.LoadEntityLimited("mob12003", 12005, 10)
		e = World.LoadEntityLimited("mob12003", 12009, 10)
		e = World.LoadEntityLimited("mob12003", 12023, 10)
		e = World.LoadEntityLimited("mob12003", 12024, 10)
		e = World.LoadEntityLimited("mob12003", 12004, 10)
		e = World.LoadEntityLimited("mob12003", 12005, 10)
		e = World.LoadEntityLimited("mob12003", 12009, 10)
		e = World.LoadEntityLimited("mob12003", 12023, 10)
		e = World.LoadEntityLimited("mob12003", 12024, 10)
		e = World.LoadEntityLimited("mob12004", 12003, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12033", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12004", 12029, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12001", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12004", 12044, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12000", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12005", 12022, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3023", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12005", 12022, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3023", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12005", 12022, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3023", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12005", 12007, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3023", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12005", 12050, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3023", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12006", 12011, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12006", 12011, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12006", 12011, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12006", 12010, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12006", 12010, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12002", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12007", 12017, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12007", 12010, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12007", 12017, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12007", 12017, 4)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12008", 12010, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3043", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12009", 12012, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3043", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12004", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12028", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12010", 12012, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3043", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12005", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12027", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12011", 12007, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3020", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3023", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3024", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3025", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12034", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12012", 12033, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12006", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12007", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12013", 12044, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3020", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12013", 12038, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3020", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12014", 12051, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12011", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12015", 12026, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12015", 12026, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12015", 12026, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item12015", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12016", 12005, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item12010", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12016", 12009, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item12010", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12016", 12024, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item12010", Entity.RoomId(e), 25)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12017", 12013, 15)
		e = World.LoadEntityLimited("mob12017", 12033, 15)
		e = World.LoadEntityLimited("mob12017", 12022, 15)
		e = World.LoadEntityLimited("mob12017", 12032, 15)
		e = World.LoadEntityLimited("mob12017", 12019, 15)
		e = World.LoadEntityLimited("mob12017", 12033, 15)
		e = World.LoadEntityLimited("mob12017", 12046, 15)
		e = World.LoadEntityLimited("mob12017", 12035, 15)
		e = World.LoadEntityLimited("mob12017", 12040, 15)
		e = World.LoadEntityLimited("mob12017", 12041, 15)
		e = World.LoadEntityLimited("mob12017", 12047, 15)
		e = World.LoadEntityLimited("mob12017", 12034, 15)
		e = World.LoadEntityLimited("mob12017", 12020, 15)
		e = World.LoadEntityLimited("mob12017", 12025, 15)
		e = World.LoadEntityLimited("mob12017", 12014, 15)
		e = World.LoadEntityLimited("mob12018", 12052, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12018", 12030, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12018", 12036, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12018", 12052, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12018", 12006, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12019", 12007, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12019", 12043, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12019", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12019", 12046, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12018", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12020", 12037, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12017", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12024", Entity.RoomId(e), 7)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12021", 12037, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3046", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12021", 12037, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3046", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12022", 12056, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12012", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12023", 12044, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12013", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12035", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12036", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12024", 12042, 6)
		e = World.LoadEntityLimited("mob12024", 12049, 6)
		e = World.LoadEntityLimited("mob12024", 12055, 6)
		e = World.LoadEntityLimited("mob12024", 12058, 6)
		e = World.LoadEntityLimited("mob12024", 12055, 6)
		e = World.LoadEntityLimited("mob12024", 12058, 6)
		if e ~= nil then
			i = World.LoadItemLimited("item12030", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12025", 12050, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12014", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12025", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12026", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12029", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12026", 12008, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12016", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3046", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12027", 12038, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3044", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12037", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12027", 12038, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3044", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3050", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12028", 12051, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12039", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12029", 12051, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3024", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item3043", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12030", 12048, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12020", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12031", 12053, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12022", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12032", 12057, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12016", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12021", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12033", 12060, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12023", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12034", 12043, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3050", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3051", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3052", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3053", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3054", Entity.RoomId(e), 500)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12030", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12008", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item12038", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12035", 12062, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item12031", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob12036", 12063, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3000", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3001", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3009", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3010", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3011", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12006", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12007", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob12037", 12064, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3030", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3031", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3032", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3033", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3036", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item12003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
