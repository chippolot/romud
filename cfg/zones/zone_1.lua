Config.NewZone({
    Id = 10,
    Name = "River Island Of Minos",
    MinRoomId =  901,
    MaxRoomId =  1000,
    ResetFreq =  2340
}, function()
    e = World.LoadEntityLimited("rat", 3001, 10)
    if e ~= nil then
        Entity.LoadItems(e, "rock", "rock")
        Entity.LoadEquipment(e, "sword")
    end
end)