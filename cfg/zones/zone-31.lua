Config.NewZone({
	Id = 31,
	Name = "Northern Midgaard Main City",
	MinRoomId = 3001,
	MaxRoomId = 3100,
	ResetFreq = 900,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob3000", 3034, 1)
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
		end
		e = World.LoadEntityLimited("mob3001", 3010, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3009", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3010", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3011", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3002", 3011, 1)
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
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3003", 3012, 1)
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
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3004", 3021, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3040", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3041", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3042", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3043", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3044", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3045", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3046", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3070", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3071", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3075", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3076", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3080", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3081", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3085", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3086", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3005", 3009, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3006", 3050, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3060", Entity.RoomId(e), 20)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3061", Entity.RoomId(e), 10)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3007", 3051, 1)
		e = World.LoadEntityLimited("mob3009", 3059, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3102", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3103", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3104", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item6013", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3010", 3063, 1)
		e = World.LoadEntityLimited("mob3020", 3020, 1)
		e = World.LoadEntityLimited("mob3021", 3003, 1)
		e = World.LoadEntityLimited("mob3022", 3030, 1)
		e = World.LoadEntityLimited("mob3023", 3024, 1)
		e = World.LoadEntityLimited("mob3024", 3018, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3025", 3005, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3026", 3028, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3027", 3022, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3040", 3008, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3000", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3001", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3002", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3004", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3042", 3019, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3002", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3020", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3043", 3004, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3002", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3004", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3024", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3044", 3029, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3004", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3045", 3023, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3002", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3004", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3046", 3049, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3003", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3004", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3059", 3005, 5)
		e = World.LoadEntityLimited("mob3059", 3015, 5)
		e = World.LoadEntityLimited("mob3059", 3018, 5)
		e = World.LoadEntityLimited("mob3059", 3022, 5)
		e = World.LoadEntityLimited("mob3059", 3028, 5)
		e = World.LoadEntityLimited("mob3060", 3005, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3015, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3018, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3022, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3060", 3028, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3061", 3007, 5)
		e = World.LoadEntityLimited("mob3062", 3025, 15)
		if e ~= nil then
			i = World.LoadItemLimited("item3015", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3062", 3026, 15)
		if e ~= nil then
			i = World.LoadItemLimited("item3015", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3062", 3017, 15)
		if e ~= nil then
			i = World.LoadItemLimited("item3015", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3062", 3013, 15)
		if e ~= nil then
			i = World.LoadItemLimited("item3015", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3063", 3027, 5)
		if e ~= nil then
			i = World.LoadItemLimited("item3021", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3064", 3008, 3)
		e = World.LoadEntityLimited("mob3065", 3045, 2)
		if e ~= nil then
			i = World.LoadItemLimited("item3005", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3065", 3049, 2)
		e = World.LoadEntityLimited("mob3066", 3027, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3015", Entity.RoomId(e), 30)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob3067", 3042, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3067", 3041, 10)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob3068", 3009, 4)
		e = World.LoadEntityLimited("mob3068", 3015, 4)
		e = World.LoadEntityLimited("mob3089", 3032, 1)
		e = World.LoadEntityLimited("mob3090", 3033, 1)
		e = World.LoadEntityLimited("mob3091", 3033, 1)
		e = World.LoadEntityLimited("mob3092", 3033, 1)
		e = World.LoadEntityLimited("mob3093", 3033, 1)
		e = World.LoadEntityLimited("mob3094", 3033, 1)
		e = World.LoadEntityLimited("mob3095", 3065, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3022", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
