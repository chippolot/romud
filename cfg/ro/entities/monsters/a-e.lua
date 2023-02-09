require('cfg.ro.utils.go-api')

Config.NewEntity({
    Key = "creamy",
    Name = "a creamy",
    Keywords = { "butterfly", "creamy" },
    RoomDesc = "A beautiful butterfly is fluttering around here.",
    FullDesc = "It's kind of cute!",
    Attack = {
        Power = "53-64",
        Noun = "gust",
        Range = 1
    },
    DropTable = {
        { Value = "honey",                   Chance = 1.5 },
        { Value = "butterfly_wing",          Chance = 1 },
        { Value = "lightning_bolt_scroll_3", Chance = 1 },
        { Value = "flower",                  Chance = 5 },
        { Value = "powder_of_butterfly",     Chance = 90 },
        { Value = "fancy_flower",            Chance = 0.02 },
        { Value = "silk_robe",               Chance = 0.1 },
        { Value = "creamy_card",             Chance = 0.01 }
    },
    Flags = { "detector" },
    SkillTriggers = {
        [EntityState.Combat] = {
            { Key = "npc_wind_attack", Level = 1, Chance = 20 }
        }
    },
    Stats = {
        HP = 595,
        Size = Size.Small,
        Speed = Speed.Fast,
        Level = 16,
        XPValue = 105,
        JobXPValue = 70,
        Str = 1,
        Agi = 40,
        Vit = 16,
        Int = 15,
        Dex = 16,
        Luk = 55,
        Hit100 = 76,
        Flee95 = 106,
        Element = Element.Wind,
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
        { Value = "jellopy",      Chance = 75 },
        { Value = "rod",          Chance = 0.8 },
        { Value = "sticky_mucus", Chance = 5 },
        { Value = "apple",        Chance = 11 },
        { Value = "apple",        Chance = 8 },
        { Value = "empty_bottle", Chance = 17 },
        { Value = "orange_juice", Chance = 0.2 },
        { Value = "drops_card",   Chance = 0.01 }
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
        XPValue = 4,
        JobXPValue = 3,
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
