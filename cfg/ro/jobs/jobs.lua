require('cfg.ro.utils.go-api')

Config.NewJob({
    JobType = JobType.Novice,
    JobTier = JobTier.Novice,
    Name = "Novice",
    Skills = {
        "first_aid",
        "play_dead"
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 55,
        [WeaponType.Sword_1H] = 57,
        [WeaponType.Axe_1H] = 50,
        [WeaponType.Mace_1H] = 50,
        [WeaponType.Mace_2H] = 55,
        [WeaponType.Staff_1H] = 65,
        [WeaponType.Staff_2H] = 65,
    },
    MaxHPMod = 0,
    MaxSPMod = 1.0,
    CarryingCapacityMod = 0,
    BonusStats = {
        { Level = 2, Stat = Stat.Luk },
        { Level = 3, Stat = Stat.Dex },
        { Level = 5, Stat = Stat.Agi },
        { Level = 6, Stat = Stat.Vit },
        { Level = 8, Stat = Stat.Str },
        { Level = 9, Stat = Stat.Int },
    }
})
Config.NewJob({
    JobType = JobType.Swordman,
    JobTier = JobTier.First,
    Base = JobType.Novice,
    Name = "Swordman",
    Skills = {
        "bash",
        "endure",
        "inc_hp_recovery",
        "magnum_break",
        "provoke",
        "sword_mastery",
        "2h_sword_mastery",
        "berserk",
        "fatal_blow",
        "hp_recovery_while_moving",
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 47,
        [WeaponType.Sword_1H] = 47,
        [WeaponType.Sword_2H] = 54,
        [WeaponType.Spear_1H] = 57,
        [WeaponType.Spear_2H] = 65,
        [WeaponType.Axe_1H] = 55,
        [WeaponType.Axe_2H] = 60,
        [WeaponType.Mace_1H] = 50,
        [WeaponType.Mace_2H] = 55,
    },
    MaxHPMod = 0.7,
    MaxSPMod = 2.0,
    CarryingCapacityMod = 800,
    BonusStats = {
        { Level = 2, Stat = Stat.Str },
        { Level = 6, Stat = Stat.Vit },
        { Level = 10, Stat = Stat.Dex },
        { Level = 14, Stat = Stat.Str },
        { Level = 18, Stat = Stat.Vit },
        { Level = 22, Stat = Stat.Dex },
        { Level = 26, Stat = Stat.Luk },
        { Level = 30, Stat = Stat.Agi },
        { Level = 33, Stat = Stat.Str },
        { Level = 36, Stat = Stat.Dex },
        { Level = 38, Stat = Stat.Vit },
        { Level = 40, Stat = Stat.Str },
        { Level = 42, Stat = Stat.Vit },
        { Level = 44, Stat = Stat.Luk },
        { Level = 46, Stat = Stat.Agi },
        { Level = 47, Stat = Stat.Str },
        { Level = 49, Stat = Stat.Str },
        { Level = 50, Stat = Stat.Str },
    }
})
Config.NewJob({
    JobType = JobType.Mage,
    JobTier = JobTier.First,
    Base = JobType.Novice,
    Name = "Mage",
    Skills = {
        "cold_bolt",
        "fire_ball",
        "fire_bolt",
        "fire_wall",
        "frost_driver",
        "inc_sp_recovery",
        "lightning_bolt",
        "napalm_beat",
        "safety_wall",
        "sight",
        "soul_strike",
        "stone_curse",
        "thunderstorm",
        "energy_coat"
    },
    AspdBase = {
        [WeaponType.Fist] = 50,
        [WeaponType.Dagger] = 50,
        [WeaponType.Staff_1H] = 55,
        [WeaponType.Staff_2H] = 55,
    },
    MaxHPMod = 0.3,
    MaxSPMod = 6.0,
    CarryingCapacityMod = 200,
    BonusStats = {
        { Level = 2, Stat = Stat.Int },
        { Level = 6, Stat = Stat.Dex },
        { Level = 10, Stat = Stat.Dex },
        { Level = 14, Stat = Stat.Int },
        { Level = 18, Stat = Stat.Agi },
        { Level = 22, Stat = Stat.Int },
        { Level = 26, Stat = Stat.Agi },
        { Level = 30, Stat = Stat.Luk },
        { Level = 33, Stat = Stat.Int },
        { Level = 36, Stat = Stat.Dex },
        { Level = 38, Stat = Stat.Int },
        { Level = 40, Stat = Stat.Agi },
        { Level = 42, Stat = Stat.Luk },
        { Level = 44, Stat = Stat.Int },
        { Level = 46, Stat = Stat.Int },
        { Level = 47, Stat = Stat.Agi },
        { Level = 49, Stat = Stat.Luk },
        { Level = 50, Stat = Stat.Int },
    }
})
Config.NewJob({
    JobType = JobType.Archer,
    JobTier = JobTier.First,
    Base = JobType.Novice,
    Name = "Archer",
    Skills = {
        "arrow_shower",
        "double_strafe",
        "improve_concentration",
        "owls_eye",
        "vultures_eye",
        "arrow_crafting",
        "arrow_repel"
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 55,
        [WeaponType.Bow] = 50
    },
    MaxHPMod = 0.5,
    MaxSPMod = 2.0,
    CarryingCapacityMod = 600,
    BonusStats = {
        { Level = 2, Stat = Stat.Dex },
        { Level = 6, Stat = Stat.Str },
        { Level = 10, Stat = Stat.Int },
        { Level = 14, Stat = Stat.Dex },
        { Level = 18, Stat = Stat.Dex },
        { Level = 22, Stat = Stat.Luk },
        { Level = 26, Stat = Stat.Agi },
        { Level = 30, Stat = Stat.Dex },
        { Level = 33, Stat = Stat.Agi },
        { Level = 36, Stat = Stat.Dex },
        { Level = 38, Stat = Stat.Str },
        { Level = 40, Stat = Stat.Str },
        { Level = 42, Stat = Stat.Dex },
        { Level = 44, Stat = Stat.Luk },
        { Level = 46, Stat = Stat.Vit },
        { Level = 47, Stat = Stat.Int },
        { Level = 49, Stat = Stat.Agi },
        { Level = 50, Stat = Stat.Dex },
    }
})
Config.NewJob({
    JobType = JobType.Acolyte,
    JobTier = JobTier.First,
    Base = JobType.Novice,
    Name = "Acolyte",
    Skills = {
        "angelus",
        "aqua_benedicta",
        "blessing",
        "cure",
        "decrease_agi",
        "demon_bane",
        "divine_protection",
        "heal",
        "increase_agi",
        "pneuma",
        "ruwach",
        "signum_crusis",
        "teleport",
        "warp_portal",
        "holy_light"
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Mace_1H] = 45,
        [WeaponType.Mace_2H] = 50,
        [WeaponType.Staff_1H] = 60,
        [WeaponType.Staff_2H] = 60
    },
    MaxHPMod = 0.4,
    MaxSPMod = 5.0,
    CarryingCapacityMod = 400,
    BonusStats = {
        { Level = 2, Stat = Stat.Luk },
        { Level = 6, Stat = Stat.Vit },
        { Level = 10, Stat = Stat.Int },
        { Level = 14, Stat = Stat.Dex },
        { Level = 18, Stat = Stat.Luk },
        { Level = 22, Stat = Stat.Agi },
        { Level = 26, Stat = Stat.Str },
        { Level = 30, Stat = Stat.Vit },
        { Level = 33, Stat = Stat.Int },
        { Level = 36, Stat = Stat.Dex },
        { Level = 38, Stat = Stat.Luk },
        { Level = 40, Stat = Stat.Agi },
        { Level = 42, Stat = Stat.Str },
        { Level = 44, Stat = Stat.Vit },
        { Level = 46, Stat = Stat.Int },
        { Level = 47, Stat = Stat.Dex },
        { Level = 49, Stat = Stat.Str },
        { Level = 50, Stat = Stat.Luk },
    }
})
