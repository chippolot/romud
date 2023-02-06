-- API

Act = {
    Attack = function(e, tgt)
    end,
    SkillAttack = function(e, tgts, skill, skillAttack)
    end,
    Get = function(e, i)
    end,
    Equip = function(e, i)
    end,
    MoveDir = function(e, dir)
    end,
    MoveTo = function(e, r)
    end,
    Say = function(e, msg)
    end,
    Tell = function(e, tgt, msg)
    end,
    Yell = function(e, yell)
    end,
}

Config = {
    NewZone = function(cfg)
    end,
    NewRoom = function(cfg)
    end,
    NewShop = function(cfg)
    end,
    NewEntity = function(cfg)
    end,
    NewItem = function(cfg)
    end,
    NewSkill = function(cfg)
    end,
    RegisterNouns = function(cfg)
    end,
}

Write = {
    ToPlayer = function(e, msg)
    end,
    ToRoom = function(r, ignore, msg)
    end
}

Entity = {
    Name = function(e)
    end,
    NameCap = function(e)
    end,
    RoomId = function(e)
    end,
    Room = function(e)
    end,
    Stat = function(e, stat)
    end,
    EquipSlotOpen = function(e, slot)
    end,
    HealHP = function(e, amt)
    end,
    HealSP = function(e, amt)
    end,
    HealMov = function(e, amt)
    end,
    InCombat = function(e)
    end,
    IsPlayer = function(e)
    end,
}

Item = {

    Name = function(i)
    end,
    NameCap = function(i)
    end,
    Equippable = function(i)
    end,
    EquipSlot = function(i)
    end,
}

Room = {
    Entities = function(r)
    end,
    Items = function(r)
    end,
}

Util = {
    RandomChance = function()
    end,
    RandomRange = function(min, max)
    end
}

-- Enums

Dir = {
    North = "North",
    East = "East",
    South = "South",
    West = "West",
    Up = "Up",
    Down = "Down"
}

Stat = {
    HP = "HP",
    MaxHP = "MaxHP",
    SP = "SP",
    MaxSP = "MaxSP",
    Mov = "Mov",
    MaxMov = "MaxMov",
    Str = "Str",
    Agi = "Agi",
    Vit = "Vit",
    Int = "Int",
    Dex = "Dex",
    Luk = "Luk",
    Level = "Level",
    XP = "XP",
    StatPoints = "StatPts",
    Gold = "Gold"
}

Element = {
    Neutral = "neutral",
    Water = "water",
    Earth = "earth",
    Fire = "fire",
    Wind = "wind",
    Poison = "poison",
    Holy = "holy",
    Shadow = "shadow",
    Ghost = "ghost",
    Undead = "undead"
}

Size = {
    Small = "small",
    Medium = "medium",
    Large = "large"
}

Speed = {
    Immovable = "immovable",
    VerySlow = "veryslow",
    Slow = "slow",
    Fast = "fast",
    VeryFast = "veryfast"
}
