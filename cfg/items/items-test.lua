Config.NewItem({
    Key = "woodshortsword",
    Name = "a wooden short sword",
    Keywords = {"wooden", "short", "sword", "weapon"},
    RoomDesc = "A wooden short sword lies discarded on the ground.",
    Equipment = {
        Weapon = {
            Damage = "1d4",
            DamageType = "slashing",
            VerbSingular = "slash",
            VerbPlural = "slashes"
        },
        Slot = "held1h",
        Rolls = {
            Hit = {
                Advantage = true
            },
            Damage = {
                Bonus = "1d4+1"
            }
        }
    },
    Weight = 10
}) 
Config.NewItem({
    Key = "woodbplate",
    Name = "a wooden breastplate",
    Keywords = {"wooden", "breastplate", "armor"},
    RoomDesc = "A wooden breastplate lies discarded on the ground.",
    Equipment = {
        Stats = {
            AC = 3,
            MaxHP = 1
        },
        Slot = "body"
    },
    Weight = 20
})
Config.NewItem({
    Key = "woodhelm",
    Name = "wooden helmet",
    Keywords = {"wooden", "helmet", "armor"},
    RoomDesc = "A wooden helmet lies discarded on the ground.",
    Equipment = {
        Stats = {
            AC = 3,
            MaxHP = 1
        },
        Slot = "head",
        StatusEffect = "blind"
    },
    Weight = 15
})
Config.NewItem({
    Key = "woodgreaves",
    Name = "wooden greaves",
    Keywords = {"wooden", "greaves", "armor"},
    RoomDesc = "A set of wooden greaves lies discarded on the ground.",
    Equipment = {
        Stats = {
            AC = 3,
            MaxHP = 1
        },
        Slot = "legs"
    },
    Weight = 15
})
Config.NewItem({
    Key = "bag",
    Name = "a small bag",
    Keywords = {"small", "bag"},
    RoomDesc = "A small bag is here.",
    Flags = {"container"},
    Weight = 5
})
Config.NewItem({
    Key = "ancientscroll",
    Name = "an ancient scroll",
    Keywords = {"ancient", "scroll"},
    RoomDesc = "An ancient scroll is resting here. It looks ready to disintegrate at the lightest touch.",
    Flags = {"crumbles"},
    Weight = 1
})
Config.NewItem({
    Key = "anvil",
    Name = "an iron anvil",
    Keywords = {"anvil"},
    RoomDesc = "An iron anvil sits here. It looks pretty heavy.",
    FullDesc = "It looks pretty heavy.",
    Weight = 250
})