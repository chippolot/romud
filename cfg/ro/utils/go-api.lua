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
    JobLevel = "JobLevel",
    JobXP = "JobXP",
    StatPoints = "StatPts",
    SkillPoints = "SkillPts",
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
    Very_Slow = "very_slow",
    Slow = "slow",
    Fast = "fast",
    Very_Fast = "very_fast"
}

EquipSlot = {
    None = "none",
    Head_High = "head_high",
    Head_Mid = "head_mid",
    Head_Low = "head_low",
    Garment = "garment",
    Armor = "armor",
    Feet = "feet",
    Accessory_1 = "accessory_1",
    Accessory_2 = "accessory_2",
    Accessory = "accessory",
    Held_L = "held_l",
    Held_R = "held_r",
    Held_1H = "held_1h",
    Held_2H = "held_2h",
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

SkillAttackType = {
    Physical = "physical",
    Magic = "magic"
}

SkillType = {
    Passive = "passive",
    Active = "active",
    Offensive = "offensive"
}

SkillTargetType = {
    None = "none",
    Self = "self",
    Single_Ally = "single_ally",
    Single_Entity = "single_entity",
    Single_Enemy = "single_enemy",
    All_Enemies = "all_enemies"
}

WeaponType = {
    Bare_Handed = "bare_handed",
    Dagger = "dagger",
    Sword_1H = "sword_1h",
    Sword_2H = "sword_2h",
    Spear = "spear",
    Spear_Mounted = "spear_mounted",
    Axe = "axe",
    Mace = "mace",
    Rod = "rod",
    Bow = "bow",
    Katar = "katar",
    Book = "book",
    Knuckle = "knuckle",
    Instrument = "instrument",
    Whip = "whip",
    Gun = "gun",
    Huuma_Shuriken = "huuma_shuriken"
}

EntityState = {
    Idle = "idle",
    Combat = "combat"
}

SpawnerType = {
    Entity = "entity",
    Item = "item"
}

Race = {
    Demi_Human = "demi_human",
    Brute = "brute",
    Insect = "insect",
    Fish = "fish",
    Dragon = "dragon",
    Plant = "plant",
    Formless = "formless",
    Angel = "angel",
    Demon = "demon",
    Undead = "undead"
}

JobType = {
    Novice = "novice",
    Transcendent_Novice = "transcendent_novice",
    First = "first",
    Transcendent_First = "transcendent_first",
    Second = "second",
    Transcendent_Second = "transcendent_second",
}