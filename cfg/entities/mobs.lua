local function pickUpEquippable(self, room, item)
    if Item.Equippable(item) then
        Act.Get(self, room, item)
    end
end

local function pickUpEquippables(self, room)
    for _, item in ipairs(Room.Items(room)) do
        pickUpEquippable(self, room, item)
    end
end

local function equipItem(self, item)
    if not Item.Equippable(item) then
        return
    end
    slot = Item.EquipSlot(item)
    if Entity.EquipSlotOpen(self, slot) then
        Act.Equip(self, item)
    end
end

local function thankSender(self, from, item)
    if not Item.Equippable(item) then
        return
    end
    Act.Say(self, string.format("Ah! Thank you %s!", Entity.Name(from)))
end

Config.NewEntity({
    Key = "mob",
    Name = "Mr. Mob",
    Keywords = { "mr", "mob" },
    RoomDesc = "Mr. Mob is squatting here.",
    FullDesc = "Mr. Mob is a silly little clown that is doing a little jig.",
    Perceptibles = { {
        Sense = "look",
        Keywords = { "nose" },
        Desc = "Wow! What a fun nose!"
    } },
    Attacks = { {
        Name = "Bite",
        ToHit = 4,
        Damage = "1d4+2",
        DamageType = "piercing",
        VerbSingular = "bite",
        VerbPlural = "bites"
    } },
    Stats = {
        HP = "2d5+20",
        AC = 13,
        Speed = 30,
        Str = 5,
        Dex = 14,
        Con = 13,
        Int = 1,
        Wis = 7,
        Cha = 3,
        Level = 1,
        XPValue = 25
    }
})
Config.NewEntity({
    Key = "rat",
    Name = "a small rat",
    Keywords = { "rat" },
    RoomDesc = "A small rat scurries between your feet.",
    FullDesc = "Yuck! A rat!",
    Attacks = { {
        Name = "Bite",
        ToHit = 4,
        Damage = "1d4+2",
        DamageType = "piercing",
        VerbSingular = "bite",
        VerbPlural = "bites",
        Effect = {
            Type = "poisoned",
            Duration = 10,
            Save = {
                Stat = "Con",
                DC = 10
            }
        }
    } },
    Flags = { "scavenger", "assistsame" },
    Stats = {
        HP = "2d6",
        AC = 12,
        Speed = 30,
        Str = 7,
        Dex = 15,
        Con = 11,
        Int = 2,
        Wis = 10,
        Cha = 4,
        Level = 1,
        XPValue = 25
    },
    Triggers = {
        enteredRoom = function(self, room)
            Act.Say(self, "I have arrived!")
        end,
        entityEnteredRoom = function(self, other, room)
            if Util.Chance() < 20 then
                Act.Tell(self, other, "Hello friend!")
            end
        end
    }
})
Config.NewEntity({
    Key = "janitor",
    Name = "a town janitor",
    Keywords = { "janitor" },
    RoomDesc = "A town janitor is busily picking up trash.",
    Attacks = { {
        Name = "Punch",
        ToHit = 4,
        Damage = "1d4",
        DamageType = "bludgeoning",
        VerbSingular = "punch",
        VerbPlural = "punches"
    } },
    Flags = { "trashcollector", "usesequipment" },
    Stats = {
        HP = "1d6+4",
        AC = 10,
        Speed = 30,
        Str = 10,
        Dex = 10,
        Con = 10,
        Int = 10,
        Wis = 10,
        Cha = 10,
        Level = 1,
        XPValue = 10
    }
})
Config.NewEntity({
    Key = "equipper",
    Name = "the equipper",
    Keywords = { "equipper" },
    RoomDesc = "The equipper is rummaging around, looking for things to equip.",
    Attacks = { {
        Name = "Punch",
        ToHit = 4,
        Damage = "1d4",
        DamageType = "bludgeoning",
        VerbSingular = "punch",
        VerbPlural = "punches"
    } },
    Flags = { "usesequipment", "stationary" },
    Stats = {
        HP = "1d6+4",
        AC = 10,
        Speed = 30,
        Str = 10,
        Dex = 10,
        Con = 10,
        Int = 10,
        Wis = 10,
        Cha = 10,
        Level = 1,
        XPValue = 10
    },
    Triggers = {
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
})
