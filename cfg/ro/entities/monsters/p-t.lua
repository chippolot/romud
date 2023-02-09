require('cfg.ro.utils.go-api')

Config.NewEntity({
    Key = "poring",
    Name = "a poring",
    Keywords = { "poring", "pink", "ball", "jelly" },
    RoomDesc = "A smiling pink ball of jelly is wiggling here.",
    FullDesc = "It's kind of cute!",
    Attack = {
        Power = "7-10",
        Noun = "splash",
        Range = 1
    },
    SkillTriggers = {
        [EntityState.Combat] = {
            { Key = "npc_water_attack", Level = 1, Chance = 20 }
        }
    },
    DropTable = {
        { Value = "jellopy", Chance = 70 },
        { Value = "knife", Chance = 1 },
        { Value = "sticky_mucus", Chance = 4 },
        { Value = "apple", Chance = 10 },
        { Value = "apple", Chance = 1.5 },
        { Value = "empty_bottle", Chance = 15 },
        { Value = "unripe_apple", Chance = 0.2 },
        { Value = "poring_card", Chance = 0.01 }
    },
    Flags = { "scavenger" },
    Stats = {
        HP = 50,
        Size = Size.Medium,
        Speed = Speed.Very_Slow,
        Level = 1,
        XPValue = 2,
        JobXPValue = 1,
        Str = 1,
        Agi = 1,
        Vit = 1,
        Int = 0,
        Dex = 6,
        Luk = 30,
        Hit100 = 22,
        Flee95 = 82,
        Element = Element.Water,
        ElementLevel = 1,
        Race = Race.Plant
    }
})
Config.NewEntity({
    Key = "pupa",
    Name = "a pupa",
    Keywords = { "pupa", "brown", "chrysalis" },
    RoomDesc = "A pulsating brown chrysalis is nestled in the grass.",
    FullDesc = "It's kind of cute!",
    DropTable = {
        { Value = "chrysalis", Chance = 55 },
        { Value = "shell", Chance = 10 },
        { Value = "sticky_mucus", Chance = 6 },
        { Value = "sticky_mucus", Chance = 6 },
        { Value = "iron_ore", Chance = 2 },
        { Value = "phracon", Chance = 0.8 },
        { Value = "guard", Chance = 0.02 },
        { Value = "pupa_card", Chance = 0.01 }
    },
    SkillTriggers = {
        [EntityState.Idle] = {
            { Key = "npc_metamorphasis_creamy", Chance = 1 }
        }
    },
    Flags = { "stationary", "pacifist", "detector" },
    Stats = {
        HP = 427,
        Size = Size.Small,
        Speed = Speed.Immovable,
        Level = 2,
        XPValue = 2,
        JobXPValue = 4,
        Str = 1,
        Agi = 1,
        Vit = 1,
        Int = 0,
        Dex = 1,
        Luk = 20,
        Hit100 = 23,
        Flee95 = 78,
        Element = Element.Earth,
        ElementLevel = 1,
        Race = Race.Insect
    }
})
