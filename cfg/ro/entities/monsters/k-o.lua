require('cfg.ro.utils.go-api')

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
        XPValue = 6,
        JobXPValue = 2,
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