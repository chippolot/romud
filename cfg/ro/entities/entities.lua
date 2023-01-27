Config.NewEntity({
    Key = "poring",
    Name = "a poring",
    Keywords = { "poring" },
    RoomDesc = "A smiling pink ball of jelly is wiggling here.",
    FullDesc = "It's kind of cute!",
    Attack = {
        Power = "7-10",
        Noun = "splash"
    },
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
        HP = "50",
        Size = "medium",
        Level = 1,
        ExpValue = 2,
        Agi = 1,
        Vit = 1,
        Int = 0,
        Dex = 6,
        Luk = 30
    }
})