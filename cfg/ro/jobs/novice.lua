require('cfg.ro.utils.go-api')

Config.NewJob({
    JobType = JobType.Novice,
    JobTier = JobTier.Novice,
    Name = "Novice",
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