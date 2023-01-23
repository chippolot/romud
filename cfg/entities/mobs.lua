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
    ScriptFile = "scripts/rat.lua"
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
    ScriptFile = "scripts/equipper.lua"
})
