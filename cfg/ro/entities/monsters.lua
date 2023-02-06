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
        ExpValue = 2,
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
    Key = "lunatic",
    Name = "a lunatic",
    Keywords = { "lunatic", "white", "fluffy", "creature" },
    RoomDesc = "A small, white, fluffy creature scurries beneath your feet.",
    FullDesc = "It's kind of cute!",
    Attack = {
        Power = "9-12",
        Noun = "scratch",
        Range = 1
    },
    DropTable = {
        { Value = "red_herb", Chance = 6 },
        { Value = "clown_nose", Chance = 0.04 },
        { Value = "carrot", Chance = 11 },
        { Value = "apple", Chance = 20 },
        { Value = "rainbow_carrot", Chance = 0.2 },
        { Value = "clover", Chance = 65 },
        { Value = "feather", Chance = 10 },
        { Value = "lunatic_card", Chance = 0.01 }
    },
    Flags = {},
    Stats = {
        HP = 60,
        Size = Size.Small,
        Speed = Speed.Slow,
        Level = 3,
        ExpValue = 6,
        Str = 1,
        Agi = 3,
        Vit = 3,
        Int = 10,
        Dex = 8,
        Luk = 60,
        Hit100 = 26,
        Flee95 = 86,
        Element = Element.Neutral,
        ElementLevel = 3,
        Race = Race.Brute
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
    Flags = { "stationary", "pacifist" },
    Stats = {
        HP = 427,
        Size = Size.Small,
        Speed = Speed.Immovable,
        Level = 2,
        ExpValue = 2,
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
Config.NewEntity({
    Key = "drops",
    Name = "a drops",
    Keywords = { "drops", "orange", "ball", "jelly" },
    RoomDesc = "A sizzling orange ball of jelly is wiggling here.",
    FullDesc = "It's kind of cute!",
    Attack = {
        Power = "10-13",
        Noun = "splash",
        Range = 1
    },
    DropTable = {
        { Value = "jellopy", Chance = 75 },
        { Value = "rod", Chance = 0.8 },
        { Value = "sticky_mucus", Chance = 5 },
        { Value = "apple", Chance = 11 },
        { Value = "apple", Chance = 8 },
        { Value = "empty_bottle", Chance = 17 },
        { Value = "orange_juice", Chance = 0.2 },
        { Value = "drops_card", Chance = 0.01 }
    },
    Flags = { "scavenger" },
    SkillTriggers = {
        [EntityState.Combat] = {
            { Key = "npc_fire_attack", Level = 1, Chance = 20 }
        }
    },
    Stats = {
        HP = 55,
        Size = Size.Medium,
        Speed = Speed.Very_Slow,
        Level = 3,
        ExpValue = 4,
        Str = 1,
        Agi = 3,
        Vit = 3,
        Int = 0,
        Dex = 12,
        Luk = 15,
        Hit100 = 26,
        Flee95 = 90,
        Element = Element.Fire,
        ElementLevel = 1,
        Race = Race.Plant
    }
})
