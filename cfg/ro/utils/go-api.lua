-- API

Act = {
    Attack = function(entity, target)
    end,
    SkillAttack = function(entity, targets, skill, skillAttack)
    end,
    Get = function(entity, item)
    end,
    Equip = function(entity, item, silent)
    end,
    MoveDir = function(entity, dir)
    end,
    MoveTo = function(entity, room)
    end,
    Say = function(entity, msg)
    end,
    Tell = function(entity, target, msg)
    end,
    Yell = function(entity, yell)
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
    RegisterNewPlayerScript = function(fn)
    end
}

Write = {
    ToPlayer = function(entity, msg)
    end,
    ToRoom = function(room, ignore, msg)
    end
}

Entity = {
    Name = function(entity)
    end,
    NameCap = function(entity)
    end,
    RoomId = function(entity)
    end,
    Room = function(entity)
    end,
    Zone = function(entity)
    end,
    Stat = function(entity, stat)
    end,
    EquipSlotOpen = function(entity, slot)
    end,
    HealHP = function(entity, amt)
    end,
    HealSP = function(entity, amt)
    end,
    HealMov = function(entity, amt)
    end,
    InCombat = function(entity)
    end,
    CanAttack = function(entity, target) 
    end,
    CanTalk = function(entity) 
    end,
    IsPlayer = function(entity)
    end,
}

Spawn = {
    Item = function(itemKey, target)
    end,
    Entity = function(entityKey, target)
    end
}

Destroy = {
    Entity = function(entity)
    end
}

Item = {
    Name = function(item)
    end,
    NameCap = function(item)
    end,
    Equippable = function(item)
    end,
    EquipSlot = function(item)
    end,
}

Room = {
    Entities = function(room)
    end,
    Items = function(room)
    end,
}

Zone = {
    RandomRoom = function(zone)
    end
}

Async = {
    Delay = function(secs, fn)
    end
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
    Fist = "fist",
    Dagger = "dagger",
    Sword_1H = "sword_1h",
    Sword_2H = "sword_2h",
    Spear_1H = "spear_1h",
    Spear_2H = "spear_2h",
    Axe_1H = "axe_1h",
    Axe_2H = "axe_2h",
    Mace_1H = "mace_1h",
    Mace_2H = "mace_2h",
    Staff_1H = "staff_1h",
    Staff_2H = "staff_2h",
    Bow = "bow",
    Knuckle = "knuckle",
    Musical = "musical",
    Whip = "whip",
    Book = "book",
    Katar = "katar",
    Gun = "gun",
    Huuma_Shuriken = "huuma_shuriken",
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

JobTier = {
    Novice = "novice",
    First = "first",
    Second = "second",
}

JobType = {
    Novice = "novice",
    Swordman = "swordman",
    Mage = "mage",
    Archer = "archer",
    Merchant = "merchant",
    Thief = "thief",
    Acolyte = "acolyte",
    Knight = "knight",
    Crusader = "crusader",
    Wizard = "wizard",
    Sage = "sage",
    Hunter = "hunter",
    Bard = "bard",
    Dancer = "dancer",
    Blacksmith = "blacksmith",
    Alchemist = "alchemist",
    Assassin = "assassin",
    Rogue = "rogue",
    Priest = "priest",
    Monk = "monk",
    All = "all"
}
