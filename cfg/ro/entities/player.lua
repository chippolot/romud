require('cfg.ro.utils.go-api')

Config.NewEntity({
    Key = "_player",
    Attacks = { {
        Name = "Punch",
        Damage = "1",
        Noun = "punch"
    } },
    Attack = {
        Power = "7-9",
        Noun = "hit"
    },
    Stats = {
        Level = 1,
        Size = Size.Medium,
        HP = 40,
        Str = 1,
        Agi = 1,
        Vit = 1,
        Int = 1,
        Dex = 1,
        Luk = 1,
        Element = Element.Neutral,
        ElementLevel = 1
    }
})
