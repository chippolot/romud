Config.NewEntity({
    Key = "poring",
    Name = "a poring",
    Keywords = { "poring" },
    RoomDesc = "A smiling pink ball of jelly is wiggling here.",
    FullDesc = "It's kind of cute!",
    Attacks = { {
        Name = "Hit",
        Damage = "1d2+7",
        Noun = "splash"
    } },
    DropTable = {
        {Key = jellopy , Chance = 70},
        {Key = knife , Chance = 1},
        {Key = sticky_mucus , Chance = 4},
        {Key = apple , Chance = 10},
        {Key = apple , Chance = 1.5},
        {Key = empty_bottle , Chance = 15},
        {Key = unripe_apple , Chance = 0.2},
        {Key = poring_card , Chance = 0.02}
    },
    Flags = { "scavenger" },
    Stats = {
        HP = "2d5+48",
        Level = 1,
        ExpBase = 27,
        ExpPerHP = 0.45,
        AtkSpd = 100,
        Agi = 1,
        Vit = 1,
        Int = 0,
        Dex = 6,
        Luk = 5
    }
})