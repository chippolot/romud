Config.NewZone({
	Id = 55,
	Name = "New Thalos",
	MinRoomId = 5401,
	MaxRoomId = 5700,
	ResetFreq = 1200,
	ResetFunc = function()
		e = World.LoadEntityLimited("mob5400", 5549, 1)
		e = World.LoadEntityLimited("mob5401", 5504, 1)
		e = World.LoadEntityLimited("mob5402", 5535, 1)
		e = World.LoadEntityLimited("mob5403", 5547, 1)
		e = World.LoadEntityLimited("mob5404", 5402, 1)
		e = World.LoadEntityLimited("mob5405", 5403, 1)
		i = World.LoadItemLimited("item5467", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5468", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5469", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5406", 5403, 1)
		e = World.LoadEntityLimited("mob5407", 5404, 1)
		e = World.LoadEntityLimited("mob5408", 5405, 1)
		e = World.LoadEntityLimited("mob5409", 5411, 20)
		e = World.LoadEntityLimited("mob5410", 5536, 1)
		i = World.LoadItemLimited("item5440", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5441", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5442", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5443", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5445", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5491", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5411", 5529, 1)
		i = World.LoadItemLimited("item5434", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5435", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5436", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5437", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5438", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5439", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5412", 5522, 1)
		e = World.LoadEntityLimited("mob5413", 5515, 1)
		i = World.LoadItemLimited("item5446", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5447", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5448", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5449", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5450", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5451", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5452", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5453", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5454", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5455", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5483", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5414", 5516, 1)
		i = World.LoadItemLimited("item5456", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5457", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5458", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5459", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5460", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5415", 5523, 1)
		i = World.LoadItemLimited("item5461", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5462", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5463", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5484", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5416", 5530, 1)
		i = World.LoadItemLimited("item5415", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5416", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5418", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5419", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5420", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5417", 5537, 1)
		i = World.LoadItemLimited("item5403", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5404", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5405", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5406", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5407", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5408", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5409", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5410", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5411", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5412", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5414", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5418", 5433, 1)
		i = World.LoadItemLimited("item5464", Entity.RoomId(e), 20)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5465", Entity.RoomId(e), 20)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5419", 5426, 1)
		i = World.LoadItemLimited("item5485", Entity.RoomId(e), 1)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5420", 5426, 2)
		i = World.LoadItemLimited("item5486", Entity.RoomId(e), 2)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5420", 5426, 2)
		i = World.LoadItemLimited("item5486", Entity.RoomId(e), 2)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5421", 5512, 1)
		e = World.LoadEntityLimited("mob5422", 5512, 1)
		e = World.LoadEntityLimited("mob5423", 5512, 1)
		e = World.LoadEntityLimited("mob5424", 5512, 1)
		e = World.LoadEntityLimited("mob5425", 5517, 1)
		e = World.LoadEntityLimited("mob5426", 5517, 1)
		e = World.LoadEntityLimited("mob5427", 5517, 1)
		e = World.LoadEntityLimited("mob5428", 5517, 1)
		e = World.LoadEntityLimited("mob5429", 5467, 1)
		e = World.LoadEntityLimited("mob5430", 5467, 1)
		e = World.LoadEntityLimited("mob5431", 5467, 1)
		e = World.LoadEntityLimited("mob5432", 5467, 1)
		e = World.LoadEntityLimited("mob5433", 5407, 12)
		e = World.LoadEntityLimited("mob5433", 5510, 12)
		e = World.LoadEntityLimited("mob5433", 5415, 12)
		e = World.LoadEntityLimited("mob5433", 5427, 12)
		e = World.LoadEntityLimited("mob5433", 5450, 12)
		e = World.LoadEntityLimited("mob5433", 5463, 12)
		e = World.LoadEntityLimited("mob5434", 5590, 4)
		e = World.LoadEntityLimited("mob5434", 5590, 4)
		e = World.LoadEntityLimited("mob5434", 5590, 4)
		e = World.LoadEntityLimited("mob5434", 5590, 4)
		e = World.LoadEntityLimited("mob5435", 5469, 3)
		e = World.LoadEntityLimited("mob5435", 5469, 3)
		e = World.LoadEntityLimited("mob5435", 5469, 3)
		e = World.LoadEntityLimited("mob5436", 5434, 8)
		e = World.LoadEntityLimited("mob5436", 5434, 8)
		e = World.LoadEntityLimited("mob5436", 5434, 8)
		e = World.LoadEntityLimited("mob5436", 5435, 8)
		e = World.LoadEntityLimited("mob5436", 5435, 8)
		e = World.LoadEntityLimited("mob5436", 5436, 8)
		e = World.LoadEntityLimited("mob5436", 5444, 8)
		e = World.LoadEntityLimited("mob5436", 5444, 8)
		e = World.LoadEntityLimited("mob5437", 5407, 2)
		i = World.LoadItemLimited("item5400", Entity.RoomId(e), 1)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5438", 5416, 1)
		e = World.LoadEntityLimited("mob5439", 5406, 1)
		i = World.LoadItemLimited("item5492", Entity.RoomId(e), 1)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5415", Entity.RoomId(e), 60)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5440", 5407, 1)
		e = World.LoadEntityLimited("mob5441", 5416, 1)
		e = World.LoadEntityLimited("mob5442", 5411, 21)
		e = World.LoadEntityLimited("mob5442", 5425, 21)
		e = World.LoadEntityLimited("mob5442", 5509, 21)
		e = World.LoadEntityLimited("mob5442", 5510, 21)
		e = World.LoadEntityLimited("mob5442", 5514, 21)
		e = World.LoadEntityLimited("mob5442", 5514, 21)
		e = World.LoadEntityLimited("mob5442", 5515, 21)
		e = World.LoadEntityLimited("mob5442", 5632, 21)
		e = World.LoadEntityLimited("mob5442", 5632, 21)
		e = World.LoadEntityLimited("mob5443", 5466, 14)
		e = World.LoadEntityLimited("mob5443", 5468, 14)
		e = World.LoadEntityLimited("mob5443", 5470, 14)
		e = World.LoadEntityLimited("mob5443", 5474, 14)
		e = World.LoadEntityLimited("mob5443", 5515, 14)
		e = World.LoadEntityLimited("mob5443", 5570, 14)
		e = World.LoadEntityLimited("mob5443", 5618, 14)
		e = World.LoadEntityLimited("mob5444", 5430, 24)
		e = World.LoadEntityLimited("mob5444", 5431, 24)
		e = World.LoadEntityLimited("mob5444", 5454, 24)
		e = World.LoadEntityLimited("mob5444", 5464, 24)
		e = World.LoadEntityLimited("mob5444", 5508, 24)
		e = World.LoadEntityLimited("mob5444", 5523, 24)
		e = World.LoadEntityLimited("mob5444", 5524, 24)
		e = World.LoadEntityLimited("mob5444", 5525, 24)
		e = World.LoadEntityLimited("mob5444", 5533, 24)
		e = World.LoadEntityLimited("mob5444", 5550, 24)
		e = World.LoadEntityLimited("mob5444", 5556, 24)
		e = World.LoadEntityLimited("mob5444", 5568, 24)
		e = World.LoadEntityLimited("mob5444", 5569, 24)
		e = World.LoadEntityLimited("mob5444", 5693, 24)
		e = World.LoadEntityLimited("mob5445", 5456, 2)
		i = World.LoadItemLimited("item5490", Entity.RoomId(e), 2)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5445", 5456, 2)
		i = World.LoadItemLimited("item5490", Entity.RoomId(e), 2)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5446", 5552, 1)
		e = World.LoadEntityLimited("mob5447", 5412, 1)
		e = World.LoadEntityLimited("mob5448", 5412, 1)
		e = World.LoadEntityLimited("mob5449", 5412, 1)
		e = World.LoadEntityLimited("mob5450", 5590, 1)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5451", 5588, 8)
		e = World.LoadEntityLimited("mob5452", 5592, 1)
		i = World.LoadItemLimited("item5493", Entity.RoomId(e), 1)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5453", 5588, 4)
		e = World.LoadEntityLimited("mob5453", 5588, 4)
		e = World.LoadEntityLimited("mob5453", 5588, 4)
		e = World.LoadEntityLimited("mob5453", 5588, 4)
		e = World.LoadEntityLimited("mob5454", 5588, 1)
		e = World.LoadEntityLimited("mob5455", 5567, 1)
		i = World.LoadItemLimited("item5496", Entity.RoomId(e), 2)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5456", 5526, 1)
		e = World.LoadEntityLimited("mob5457", 5513, 1)
		e = World.LoadEntityLimited("mob5458", 5527, 1)
		e = World.LoadEntityLimited("mob5459", 5533, 1)
		e = World.LoadEntityLimited("mob5460", 5562, 2)
		e = World.LoadEntityLimited("mob5460", 5562, 2)
		e = World.LoadEntityLimited("mob5461", 5413, 20)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 53)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 52)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5461", 5419, 20)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5461", 5420, 20)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5461", 5421, 20)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5461", 5445, 20)
		e = World.LoadEntityLimited("mob5461", 5446, 20)
		e = World.LoadEntityLimited("mob5461", 5447, 20)
		e = World.LoadEntityLimited("mob5461", 5448, 20)
		e = World.LoadEntityLimited("mob5461", 5573, 20)
		e = World.LoadEntityLimited("mob5461", 5582, 20)
		e = World.LoadEntityLimited("mob5461", 5583, 20)
		e = World.LoadEntityLimited("mob5461", 5589, 20)
		e = World.LoadEntityLimited("mob5462", 5414, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 53)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 72)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5414, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 53)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5423, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5423, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5424, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5424, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5432, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5462", 5432, 12)
		i = World.LoadItemLimited("item5413", Entity.RoomId(e), 100)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5417", Entity.RoomId(e), 43)
		Act.Get(e, i)
		Act.Equip(e, i)
		i = World.LoadItemLimited("item5421", Entity.RoomId(e), 42)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5463", 5407, 1)
		e = World.LoadEntityLimited("mob5464", 5532, 1)
		e = World.LoadEntityLimited("mob5465", 5543, 1)
		i = World.LoadItemLimited("item3060", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item3061", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5466", 5545, 1)
		i = World.LoadItemLimited("item5487", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5488", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5489", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5467", 5546, 6)
		e = World.LoadEntityLimited("mob5467", 5546, 6)
		e = World.LoadEntityLimited("mob5467", 5546, 6)
		e = World.LoadEntityLimited("mob5467", 5546, 6)
		e = World.LoadEntityLimited("mob5467", 5546, 6)
		e = World.LoadEntityLimited("mob5467", 5546, 6)
		e = World.LoadEntityLimited("mob5468", 5428, 8)
		e = World.LoadEntityLimited("mob5468", 5429, 8)
		e = World.LoadEntityLimited("mob5469", 5700, 1)
		e = World.LoadEntityLimited("mob5470", 5601, 1)
		e = World.LoadEntityLimited("mob5471", 5605, 1)
		e = World.LoadEntityLimited("mob5472", 5600, 5)
		e = World.LoadEntityLimited("mob5472", 5600, 5)
		e = World.LoadEntityLimited("mob5472", 5600, 5)
		e = World.LoadEntityLimited("mob5472", 5600, 5)
		e = World.LoadEntityLimited("mob5472", 5600, 5)
		e = World.LoadEntityLimited("mob5473", 5604, 1)
		e = World.LoadEntityLimited("mob5474", 5599, 1)
		e = World.LoadEntityLimited("mob5475", 5598, 1)
		e = World.LoadEntityLimited("mob5476", 5603, 1)
		e = World.LoadEntityLimited("mob5477", 5602, 1)
		e = World.LoadEntityLimited("mob5478", 5584, 1)
		e = World.LoadEntityLimited("mob5479", 5524, 1)
		i = World.LoadItemLimited("item5470", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5471", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5472", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5473", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5474", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5480", 5525, 1)
		i = World.LoadItemLimited("item5478", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5479", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5480", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5481", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5482", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5481", 5505, 1)
		e = World.LoadEntityLimited("mob5482", 5408, 15)
		e = World.LoadEntityLimited("mob5482", 5409, 15)
		e = World.LoadEntityLimited("mob5482", 5415, 15)
		e = World.LoadEntityLimited("mob5482", 5417, 15)
		e = World.LoadEntityLimited("mob5482", 5445, 15)
		e = World.LoadEntityLimited("mob5482", 5446, 15)
		e = World.LoadEntityLimited("mob5482", 5451, 15)
		e = World.LoadEntityLimited("mob5482", 5453, 15)
		e = World.LoadEntityLimited("mob5483", 5539, 1)
		i = World.LoadItemLimited("item5475", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5476", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5477", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5484", 5538, 1)
		i = World.LoadItemLimited("item5422", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5423", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5424", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5425", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5426", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5427", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5428", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5429", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5430", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5431", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5432", Entity.RoomId(e), 100)
		Act.Get(e, i)
		i = World.LoadItemLimited("item5433", Entity.RoomId(e), 100)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5485", 5579, 1)
		e = World.LoadEntityLimited("mob5486", 5584, 1)
		e = World.LoadEntityLimited("mob5487", 5597, 1)
		i = World.LoadItemLimited("item5495", Entity.RoomId(e), 1)
		Act.Get(e, i)
		Act.Equip(e, i)
		e = World.LoadEntityLimited("mob5488", 5581, 1)
		e = World.LoadEntityLimited("mob5489", 5555, 1)
		i = World.LoadItemLimited("item5401", Entity.RoomId(e), 1)
		Act.Get(e, i)
		e = World.LoadEntityLimited("mob5490", 5562, 1)
	end
})
