Config.NewZone({
	Id = 26,
	Name = "The High Tower Of Magic",
	MinRoomId = 2501,
	MaxRoomId = 2700,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob2500", 2503, 6)
		e = World.LoadEntityLimited("mob2500", 2505, 6)
		e = World.LoadEntityLimited("mob2500", 2507, 6)
		e = World.LoadEntityLimited("mob2500", 2509, 6)
		e = World.LoadEntityLimited("mob2500", 2512, 6)
		e = World.LoadEntityLimited("mob2501", 2512, 1)
		e = World.LoadEntityLimited("mob2502", 2508, 1)
		e = World.LoadEntityLimited("mob2503", 2513, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2500", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2504", 2514, 7)
		e = World.LoadEntityLimited("mob2504", 2515, 7)
		e = World.LoadEntityLimited("mob2504", 2515, 7)
		e = World.LoadEntityLimited("mob2504", 2516, 7)
		e = World.LoadEntityLimited("mob2504", 2517, 7)
		e = World.LoadEntityLimited("mob2504", 2519, 7)
		e = World.LoadEntityLimited("mob2504", 2520, 7)
		e = World.LoadEntityLimited("mob2505", 2519, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2504", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2545", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2546", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3010", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3100", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3101", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob2506", 2520, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item3050", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3051", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item3053", Entity.RoomId(e), 100)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob2507", 2521, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2547", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2508", 2521, 1)
		e = World.LoadEntityLimited("mob2509", 2528, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2548", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2510", 2529, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2522", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2511", 2534, 2)
		e = World.LoadEntityLimited("mob2511", 2534, 2)
		e = World.LoadEntityLimited("mob2512", 2536, 10)
		e = World.LoadEntityLimited("mob2512", 2541, 10)
		e = World.LoadEntityLimited("mob2512", 2631, 10)
		e = World.LoadEntityLimited("mob2512", 2536, 10)
		e = World.LoadEntityLimited("mob2512", 2536, 10)
		e = World.LoadEntityLimited("mob2512", 2536, 10)
		e = World.LoadEntityLimited("mob2513", 2536, 5)
		e = World.LoadEntityLimited("mob2513", 2576, 5)
		e = World.LoadEntityLimited("mob2513", 2601, 5)
		e = World.LoadEntityLimited("mob2513", 2634, 5)
		e = World.LoadEntityLimited("mob2513", 2650, 5)
		e = World.LoadEntityLimited("mob2514", 2538, 1)
		e = World.LoadEntityLimited("mob2515", 2543, 3)
		e = World.LoadEntityLimited("mob2515", 2545, 3)
		e = World.LoadEntityLimited("mob2516", 2545, 3)
		e = World.LoadEntityLimited("mob2516", 2543, 3)
		e = World.LoadEntityLimited("mob2517", 2543, 3)
		e = World.LoadEntityLimited("mob2517", 2545, 3)
		e = World.LoadEntityLimited("mob2518", 2546, 3)
		e = World.LoadEntityLimited("mob2518", 2546, 3)
		e = World.LoadEntityLimited("mob2518", 2546, 3)
		e = World.LoadEntityLimited("mob2519", 2546, 1)
		e = World.LoadEntityLimited("mob2520", 2550, 4)
		e = World.LoadEntityLimited("mob2520", 2550, 4)
		e = World.LoadEntityLimited("mob2520", 2550, 4)
		e = World.LoadEntityLimited("mob2520", 2550, 4)
		e = World.LoadEntityLimited("mob2521", 2550, 1)
		e = World.LoadEntityLimited("mob2522", 2555, 4)
		e = World.LoadEntityLimited("mob2522", 2555, 4)
		e = World.LoadEntityLimited("mob2522", 2555, 4)
		e = World.LoadEntityLimited("mob2522", 2555, 4)
		e = World.LoadEntityLimited("mob2523", 2555, 1)
		e = World.LoadEntityLimited("mob2524", 2558, 3)
		e = World.LoadEntityLimited("mob2524", 2558, 3)
		e = World.LoadEntityLimited("mob2524", 2558, 3)
		e = World.LoadEntityLimited("mob2525", 2558, 1)
		e = World.LoadEntityLimited("mob2526", 2560, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item2549", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2526", 2560, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item2549", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2526", 2560, 3)
		if e ~= nil then
			i = World.LoadItemLimited("item2549", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2527", 2560, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2549", Entity.RoomId(e), 6)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2528", 2565, 2)
		e = World.LoadEntityLimited("mob2529", 2566, 1)
		e = World.LoadEntityLimited("mob2530", 2568, 1)
		e = World.LoadEntityLimited("mob2512", 2569, 10)
		e = World.LoadEntityLimited("mob2531", 2572, 2)
		e = World.LoadEntityLimited("mob2531", 2572, 2)
		e = World.LoadEntityLimited("mob2532", 2574, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2552", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob2533", 2574, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2553", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob2534", 2583, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2515", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2554", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob2535", 2583, 1)
		e = World.LoadEntityLimited("mob2536", 2589, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2555", Entity.RoomId(e), 5)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2537", 2591, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2562", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2538", 2596, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2563", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2564", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
		end
		e = World.LoadEntityLimited("mob2539", 2569, 5)
		e = World.LoadEntityLimited("mob2539", 2599, 5)
		e = World.LoadEntityLimited("mob2539", 2599, 5)
		e = World.LoadEntityLimited("mob2539", 2629, 5)
		e = World.LoadEntityLimited("mob2539", 2629, 5)
		e = World.LoadEntityLimited("mob2540", 2603, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2524", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2523", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2565", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2541", 2610, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2567", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2542", 2610, 1)
		e = World.LoadEntityLimited("mob2543", 2612, 1)
		e = World.LoadEntityLimited("mob2544", 2612, 1)
		e = World.LoadEntityLimited("mob2545", 2610, 1)
		e = World.LoadEntityLimited("mob2546", 2612, 1)
		e = World.LoadEntityLimited("mob2547", 2612, 1)
		e = World.LoadEntityLimited("mob2548", 2618, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2568", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2549", 2626, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2570", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2571", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2550", 2626, 4)
		e = World.LoadEntityLimited("mob2550", 2626, 4)
		e = World.LoadEntityLimited("mob2551", 2626, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2572", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2552", 2636, 3)
		e = World.LoadEntityLimited("mob2552", 2636, 3)
		e = World.LoadEntityLimited("mob2552", 2636, 3)
		e = World.LoadEntityLimited("mob2553", 2638, 1)
		e = World.LoadEntityLimited("mob2554", 2654, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2573", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2574", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2555", 2655, 1)
		e = World.LoadEntityLimited("mob2556", 2655, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2593", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2575", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2576", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2577", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2557", 2662, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2578", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2579", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2558", 2665, 1)
		e = World.LoadEntityLimited("mob2559", 2665, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2594", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2580", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2581", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2577", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2560", 2668, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2582", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2583", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2561", 2670, 1)
		e = World.LoadEntityLimited("mob2562", 2670, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2595", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2584", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2585", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2577", Entity.RoomId(e), 3)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2563", 2678, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2586", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
		e = World.LoadEntityLimited("mob2564", 2678, 1)
		if e ~= nil then
			i = World.LoadItemLimited("item2538", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) end
			i = World.LoadItemLimited("item2587", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2592", Entity.RoomId(e), 2)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2588", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2589", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2590", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
			i = World.LoadItemLimited("item2591", Entity.RoomId(e), 1)
			if i ~= nil then Act.Get(e, i) ; Act.Equip(e, i) end
		end
	end
})
