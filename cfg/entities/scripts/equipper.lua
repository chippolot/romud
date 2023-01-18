local function pickUpEquippable(self, room, item)
    if Item.IsEquippable(item) then
        Act.Get(self, room, item)
    end
end

local function pickUpEquippables(self, room)
    for _, item in ipairs(Room.Items(room)) do
        pickUpEquippable(self, room, item)
    end
end

local function equipItem(self, item)
    if not Item.IsEquippable(item) then
        return
    end
    slot = Item.EquipSlot(item)
    if Entity.IsEquipSlotOpen(self, slot) then
        Act.Equip(self, item)
    end
end

local function thankSender(self, from, item) 
    if not Item.IsEquippable(item) then
        return
    end
    Act.Say(self, string.format("Ah! Thank you %s!", Entity.Name(from)))
end

return {
    enteredRoom = function(self, room)
        pickUpEquippables(self, room)
    end,
    itemDropped = function(self, room, item)
        pickUpEquippable(self, room, item)
    end,
    givenItem = function(self, from, item)
        thankSender(self, from, item)
    end,
    receivedItem = function(self, item)
        equipItem(self, item)
    end
}
