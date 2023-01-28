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
        {Value = "jellopy" , Chance = 70},
        {Value = "knife" , Chance = 1},
        {Value = "sticky_mucus" , Chance = 4},
        {Value = "apple" , Chance = 10},
        {Value = "apple" , Chance = 1.5},
        {Value = "empty_bottle" , Chance = 15},
        {Value = "unripe_apple" , Chance = 0.2},
        {Value = "poring_card" , Chance = 0.02}
    },
    Flags = { "scavenger" },
    Stats = {
        HP = "50",
        Size = "medium",
        Level = 1,
        ExpBase = 2,
        ExpPerHP = 0.04,
        Agi = 1,
        Vit = 1,
        Int = 0,
        Dex = 6,
        Luk = 30,
        Hit100 = 22,
        Flee95 = 82
    }
})