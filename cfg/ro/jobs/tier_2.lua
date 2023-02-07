require('cfg.ro.utils.go-api')

Config.NewJob({
    JobType = JobType.Knight,
    JobTier = JobTier.Second,
    Base = JobType.Swordman,
    Name = "Knight",
    Skills = {
        "bowling_bash",
        "brandish_spear",
        "cavalier_mastery",
        "counter_attack",
        "peco_peco_ride",
        "pierce",
        "spear_boomerang",
        "spear_mastery",
        "spear_stab",
        "twohand_quicken",
        "charge_attack",
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 49,
        [WeaponType.Sword_1H] = 45,
        [WeaponType.Sword_2H] = 52,
        [WeaponType.Spear_1H] = 55,
        [WeaponType.Spear_2H] = 60,
        [WeaponType.Axe_1H] = 50,
        [WeaponType.Axe_2H] = 55,
        [WeaponType.Mace_1H] = 45,
        [WeaponType.Mace_2H] = 50,
    },
    MaxHPMod = 1.5,
    MaxSPMod = 3.0,
    CarryingCapacityMod = 800,
    BonusStats = {
        { Level = 1, Stat = Stat.Vit },
        { Level = 3, Stat = Stat.Vit },
        { Level = 4, Stat = Stat.Str },
        { Level = 5, Stat = Stat.Luk },
        { Level = 8, Stat = Stat.Vit },
        { Level = 10, Stat = Stat.Str },
        { Level = 11, Stat = Stat.Dex },
        { Level = 12, Stat = Stat.Vit },
        { Level = 13, Stat = Stat.Agi },
        { Level = 15, Stat = Stat.Str },
        { Level = 17, Stat = Stat.Vit },
        { Level = 18, Stat = Stat.Vit },
        { Level = 19, Stat = Stat.Dex },
        { Level = 20, Stat = Stat.Luk },
        { Level = 21, Stat = Stat.Str },
        { Level = 23, Stat = Stat.Vit },
        { Level = 27, Stat = Stat.Str },
        { Level = 28, Stat = Stat.Luk },
        { Level = 29, Stat = Stat.Vit },
        { Level = 31, Stat = Stat.Dex },
        { Level = 33, Stat = Stat.Str },
        { Level = 36, Stat = Stat.Vit },
        { Level = 37, Stat = Stat.Luk },
        { Level = 38, Stat = Stat.Agi },
        { Level = 40, Stat = Stat.Dex },
        { Level = 43, Stat = Stat.Vit },
        { Level = 46, Stat = Stat.Str },
        { Level = 47, Stat = Stat.Str },
        { Level = 48, Stat = Stat.Dex },
        { Level = 49, Stat = Stat.Dex },
    }
})
Config.NewJob({
    JobType = JobType.Priest,
    JobTier = JobTier.Second,
    Base = JobType.Acolyte,
    Name = "Priest",
    Skills = {
        "aspersio",
        "b.s_sacramenti",
        "gloria",
        "impositio_manus",
        "increase_sp_recovery",
        "kyrie_eleison",
        "lex_aeterna",
        "lex_divina",
        "mace_mastery",
        "magnificat",
        "magnus_exorcismus",
        "resurrection",
        "safety_wall",
        "sanctuary",
        "slow_poison",
        "status_recovery",
        "suffragium",
        "turn_undead",
        "redemptio",
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Mace_1H] = 43,
        [WeaponType.Mace_2H] = 48,
        [WeaponType.Staff_1H] = 60,
        [WeaponType.Knuckle] = 60,
        [WeaponType.Book] = 44,
        [WeaponType.Staff_2H] = 60,
    },
    MaxHPMod = 0.75,
    MaxSPMod = 8.0,
    CarryingCapacityMod = 600,
    BonusStats = {
        { Level = 1, Stat = Stat.Luk },
        { Level = 3, Stat = Stat.Luk },
        { Level = 4, Stat = Stat.Str },
        { Level = 6, Stat = Stat.Agi },
        { Level = 7, Stat = Stat.Vit },
        { Level = 8, Stat = Stat.Int },
        { Level = 9, Stat = Stat.Int },
        { Level = 10, Stat = Stat.Luk },
        { Level = 11, Stat = Stat.Str },
        { Level = 14, Stat = Stat.Vit },
        { Level = 16, Stat = Stat.Dex },
        { Level = 17, Stat = Stat.Str },
        { Level = 20, Stat = Stat.Dex },
        { Level = 21, Stat = Stat.Luk },
        { Level = 22, Stat = Stat.Int },
        { Level = 25, Stat = Stat.Dex },
        { Level = 27, Stat = Stat.Str },
        { Level = 29, Stat = Stat.Agi },
        { Level = 31, Stat = Stat.Luk },
        { Level = 32, Stat = Stat.Dex },
        { Level = 34, Stat = Stat.Vit },
        { Level = 35, Stat = Stat.Str },
        { Level = 36, Stat = Stat.Vit },
        { Level = 37, Stat = Stat.Agi },
        { Level = 39, Stat = Stat.Luk },
        { Level = 42, Stat = Stat.Int },
        { Level = 43, Stat = Stat.Int },
        { Level = 45, Stat = Stat.Vit },
        { Level = 48, Stat = Stat.Agi },
        { Level = 50, Stat = Stat.Luk },
    }
})
Config.NewJob({
    JobType = JobType.Wizard,
    JobTier = JobTier.Second,
    Base = JobType.Mage,
    Name = "Wizard",
    Skills = {
        "earth_spike",
        "fire_pillar",
        "frost_nova",
        "heaven's_drive",
        "ice_wall",
        "jupitel_thunder",
        "lord_of_vermilion",
        "meteor_storm",
        "quagmire",
        "sense",
        "sightrasher",
        "storm_gust",
        "water_ball",
        "fire_ivy",
        "sight_blaster",
    },
    AspdBase = {
        [WeaponType.Fist] = 50,
        [WeaponType.Dagger] = 54,
        [WeaponType.Staff_1H] = 53,
        [WeaponType.Staff_2H] = 53,
    },
    MaxHPMod = 0.55,
    MaxSPMod = 9.0,
    CarryingCapacityMod = 400,
    BonusStats = {
        { Level = 1, Stat = Stat.Int },
        { Level = 2, Stat = Stat.Dex },
        { Level = 4, Stat = Stat.Int },
        { Level = 5, Stat = Stat.Dex },
        { Level = 6, Stat = Stat.Agi },
        { Level = 9, Stat = Stat.Int },
        { Level = 10, Stat = Stat.Agi },
        { Level = 12, Stat = Stat.Str },
        { Level = 13, Stat = Stat.Dex },
        { Level = 15, Stat = Stat.Luk },
        { Level = 18, Stat = Stat.Int },
        { Level = 22, Stat = Stat.Int },
        { Level = 24, Stat = Stat.Agi },
        { Level = 26, Stat = Stat.Dex },
        { Level = 29, Stat = Stat.Int },
        { Level = 31, Stat = Stat.Int },
        { Level = 32, Stat = Stat.Dex },
        { Level = 33, Stat = Stat.Int },
        { Level = 34, Stat = Stat.Agi },
        { Level = 36, Stat = Stat.Luk },
        { Level = 38, Stat = Stat.Vit },
        { Level = 39, Stat = Stat.Dex },
        { Level = 40, Stat = Stat.Int },
        { Level = 41, Stat = Stat.Agi },
        { Level = 43, Stat = Stat.Agi },
        { Level = 45, Stat = Stat.Int },
        { Level = 46, Stat = Stat.Agi },
        { Level = 47, Stat = Stat.Agi },
        { Level = 48, Stat = Stat.Int },
        { Level = 50, Stat = Stat.Int },
    }
})
Config.NewJob({
    JobType = JobType.Blacksmith,
    JobTier = JobTier.Second,
    Base = JobType.Merchant,
    Name = "Blacksmith",
    Skills = {
        "adrenaline_rush",
        "hammer_fall",
        "hilt_binding",
        "power_maximize",
        "power-thrust",
        "skin_tempering",
        "weapon_perfection",
        "enchantedstone_craft",
        "iron_tempering",
        "ore_discovery",
        "oridecon_research",
        "smith_axe",
        "smith_dagger",
        "smith_knucklebrace",
        "smith_mace",
        "smith_spear",
        "smith_sword",
        "smith_two-handed_sword",
        "steel_tempering",
        "weapon_repair",
        "weaponry_research",
        "greed",
        "dubious_salesmanship",
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 50,
        [WeaponType.Sword_1H] = 50,
        [WeaponType.Axe_1H] = 46,
        [WeaponType.Axe_2H] = 53,
        [WeaponType.Mace_1H] = 48,
        [WeaponType.Mace_2H] = 53,
    },
    MaxHPMod = 0.9,
    MaxSPMod = 4.0,
    CarryingCapacityMod = 1000,
    BonusStats = {
        { Level = 1, Stat = Stat.Dex },
        { Level = 3, Stat = Stat.Str },
        { Level = 4, Stat = Stat.Dex },
        { Level = 5, Stat = Stat.Dex },
        { Level = 7, Stat = Stat.Vit },
        { Level = 8, Stat = Stat.Str },
        { Level = 9, Stat = Stat.Dex },
        { Level = 11, Stat = Stat.Luk },
        { Level = 12, Stat = Stat.Dex },
        { Level = 13, Stat = Stat.Vit },
        { Level = 16, Stat = Stat.Str },
        { Level = 19, Stat = Stat.Dex },
        { Level = 20, Stat = Stat.Vit },
        { Level = 21, Stat = Stat.Int },
        { Level = 23, Stat = Stat.Str },
        { Level = 26, Stat = Stat.Dex },
        { Level = 28, Stat = Stat.Dex },
        { Level = 29, Stat = Stat.Agi },
        { Level = 31, Stat = Stat.Str },
        { Level = 32, Stat = Stat.Vit },
        { Level = 34, Stat = Stat.Int },
        { Level = 36, Stat = Stat.Dex },
        { Level = 37, Stat = Stat.Vit },
        { Level = 38, Stat = Stat.Agi },
        { Level = 39, Stat = Stat.Dex },
        { Level = 40, Stat = Stat.Dex },
        { Level = 44, Stat = Stat.Str },
        { Level = 46, Stat = Stat.Luk },
        { Level = 47, Stat = Stat.Dex },
        { Level = 49, Stat = Stat.Vit },
    }
})
Config.NewJob({
    JobType = JobType.Hunter,
    JobTier = JobTier.Second,
    Base = JobType.Archer,
    Name = "Hunter",
    Skills = {
        "ankle_snare",
        "beast_bane",
        "blast_mine",
        "blitz_beat",
        "claymore_trap",
        "detect",
        "falconry_mastery",
        "flasher",
        "freezing_trap",
        "land_mine",
        "remove_trap",
        "sandman",
        "shockwave_trap",
        "skid_trap",
        "spring_trap",
        "steel_crow",
        "talkie_box",
        "phantasmic_arrow",
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 53,
        [WeaponType.Bow] = 48,
    },
    MaxHPMod = 0.85,
    MaxSPMod = 4.0,
    CarryingCapacityMod = 700,
    BonusStats = {
        { Level = 1, Stat = Stat.Dex },
        { Level = 3, Stat = Stat.Int },
        { Level = 4, Stat = Stat.Dex },
        { Level = 5, Stat = Stat.Luk },
        { Level = 6, Stat = Stat.Str },
        { Level = 8, Stat = Stat.Dex },
        { Level = 10, Stat = Stat.Str },
        { Level = 11, Stat = Stat.Str },
        { Level = 12, Stat = Stat.Agi },
        { Level = 14, Stat = Stat.Dex },
        { Level = 15, Stat = Stat.Luk },
        { Level = 17, Stat = Stat.Vit },
        { Level = 19, Stat = Stat.Agi },
        { Level = 20, Stat = Stat.Agi },
        { Level = 21, Stat = Stat.Dex },
        { Level = 23, Stat = Stat.Vit },
        { Level = 27, Stat = Stat.Dex },
        { Level = 29, Stat = Stat.Luk },
        { Level = 31, Stat = Stat.Agi },
        { Level = 33, Stat = Stat.Dex },
        { Level = 34, Stat = Stat.Int },
        { Level = 38, Stat = Stat.Dex },
        { Level = 39, Stat = Stat.Agi },
        { Level = 41, Stat = Stat.Int },
        { Level = 42, Stat = Stat.Luk },
        { Level = 43, Stat = Stat.Dex },
        { Level = 44, Stat = Stat.Str },
        { Level = 46, Stat = Stat.Int },
        { Level = 47, Stat = Stat.Agi },
        { Level = 49, Stat = Stat.Dex },
    }
})
Config.NewJob({
    JobType = JobType.Assassin,
    JobTier = JobTier.Second,
    Base = JobType.Thief,
    Name = "Assassin",
    Skills = {
        "cloaking",
        "enchant_poison",
        "grimtooth",
        "katar_mastery",
        "righthand_mastery",
        "lefthand_mastery",
        "poison_react",
        "sonic_blow",
        "venom_dust",
        "venom_splasher",
        "sonic_acceleration",
        "venom_knife",
    },
    AspdBase = {
        [WeaponType.Fist] = 40,
        [WeaponType.Dagger] = 42,
        [WeaponType.Sword_1H] = 50,
        [WeaponType.Axe_1H] = 51,
        [WeaponType.Katar] = 42,
        [WeaponType.Huuma_Shuriken] = 110,
    },
    MaxHPMod = 1.1,
    MaxSPMod = 4.0,
    CarryingCapacityMod = 400,
    BonusStats = {
        { Level = 1, Stat = Stat.Agi },
        { Level = 2, Stat = Stat.Agi },
        { Level = 3, Stat = Stat.Agi },
        { Level = 4, Stat = Stat.Int },
        { Level = 6, Stat = Stat.Vit },
        { Level = 8, Stat = Stat.Vit },
        { Level = 9, Stat = Stat.Dex },
        { Level = 11, Stat = Stat.Str },
        { Level = 14, Stat = Stat.Int },
        { Level = 15, Stat = Stat.Agi },
        { Level = 16, Stat = Stat.Agi },
        { Level = 17, Stat = Stat.Agi },
        { Level = 18, Stat = Stat.Agi },
        { Level = 19, Stat = Stat.Agi },
        { Level = 20, Stat = Stat.Agi },
        { Level = 21, Stat = Stat.Agi },
        { Level = 24, Stat = Stat.Dex },
        { Level = 25, Stat = Stat.Str },
        { Level = 27, Stat = Stat.Str },
        { Level = 30, Stat = Stat.Dex },
        { Level = 31, Stat = Stat.Dex },
        { Level = 32, Stat = Stat.Str },
        { Level = 38, Stat = Stat.Int },
        { Level = 40, Stat = Stat.Dex },
        { Level = 41, Stat = Stat.Dex },
        { Level = 42, Stat = Stat.Int },
        { Level = 45, Stat = Stat.Str },
        { Level = 46, Stat = Stat.Dex },
        { Level = 48, Stat = Stat.Str },
        { Level = 50, Stat = Stat.Dex },
    }
})
