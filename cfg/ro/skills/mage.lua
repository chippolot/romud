require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

-- Forward Decls
local magicProjectileMissedFunc
local magicProjectileHitFunc

Config.NewSkill({
    Key = "cold_bolt",
    Name = "Cold Bolt",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.Single_Enemy,
    Range = 9,
    CastTimes = { 0.7, 1.4, 2.1, 2.8, 3.5, 4.2, 4.9, 5.6, 6.3, 7 },
    CastDelays = { 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8 },
    SPCosts = { 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 },
    MaxLevel = 10,
    Job = JobType.Mage,
    Desc = "Hits the targeted enemy with 1 Water Element Bolt per SkillLV for 1*MATK each.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Water)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Frost's wrath, rain down! Cold Bolt!")
            for _ = 1, level do
                Act.SkillAttack(user, targets, skill, {
                    AtkType = SkillAttackType.Magic,
                    Element = Element.Water
                })
            end
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "COLD BOLT") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "COLD BOLT") end,
    }
})

Config.NewSkill({
    Key = "fire_bolt",
    Name = "Fire Bolt",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.Single_Enemy,
    Range = 9,
    CastTimes = { 0.7, 1.4, 2.1, 2.8, 3.5, 4.2, 4.9, 5.6, 6.3, 7 },
    CastDelays = { 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8 },
    SPCosts = { 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 },
    MaxLevel = 10,
    Job = JobType.Mage,
    Desc = "Hits the targeted enemy with 1 Fire Element Bolt per SkillLV for 1*MATK each.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Fire)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Burn brightly! Fire Bolt!")
            for _ = 1, level do
                Act.SkillAttack(user, targets, skill, {
                    AtkType = SkillAttackType.Magic,
                    Element = Element.Fire
                })
            end
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "FIRE BOLT") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "FIRE BOLT") end,
    }
})

Config.NewSkill({
    Key = "lightning_bolt",
    Name = "Lightning Bolt",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.Single_Enemy,
    Range = 9,
    CastTimes = { 0.7, 1.4, 2.1, 2.8, 3.5, 4.2, 4.9, 5.6, 6.3, 7 },
    CastDelays = { 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8 },
    SPCosts = { 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 },
    MaxLevel = 10,
    Job = JobType.Mage,
    Desc = "Hits the targeted enemy with 1 Wind Element Bolt per SkillLV for 1*MATK each.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Wind)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Shocking strike! Lightning Bolt!")
            for _ = 1, level do
                Act.SkillAttack(user, targets, skill, {
                    AtkType = SkillAttackType.Magic,
                    Element = Element.Wind
                })
            end
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "LIGHTNING BOLT") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "LIGHTNING BOLT") end,
    }
})

Config.NewSkill({
    Key = "napalm_beat",
    Name = "Napalm Beat",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.All_Enemies,
    Range = 9,
    CastTimes = { 1 },
    CastDelays = { 1, 1, 1, 0.9, 0.9, 0.8, 0.8, 0.7, 0.6, 0.5 },
    SPCosts = { 9, 9, 9, 12, 12, 12, 15, 15, 15, 18 },
    MaxLevel = 10,
    Job = JobType.Mage,
    Desc = "Hits every Enemy in a 3x3 area around the target for an MATK of (70+10*SkillLV)% using Ghost Element. This damage is spread equally between all targets. For example, if 3 monsters are hit, then each takes 1/3rd of the damage a single target would take.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Ghost)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Ethereal energy! Napalm Beat!")
            if #targets == 0 then
                return
            end

            local matk = (0.7 + 0.1 * level) / #targets
            Act.SkillAttack(user, targets, skill, {
                AtkType = SkillAttackType.Magic,
                MAtkBonus = matk - 1.0,
                Element = Element.Ghost
            })
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "NAPALM BEAT") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "NAPALM BEAT") end,
    }
})

Config.NewSkill({
    Key = "fire_ball",
    Name = "Fire Ball",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.All_Enemies,
    Range = 9,
    CastTimes = { 1.5, 1.5, 1.5, 1.5, 1.5, 1.0, 1.0, 1.0, 1.0, 1.0 },
    CastDelays = { 1.5, 1.5, 1.5, 1.5, 1.5, 1.0, 1.0, 1.0, 1.0, 1.0 },
    SPCosts = { 25 },
    MaxLevel = 10,
    PreReqs = {
        Key = "fire_bolt",
        Level = 4
    },
    Job = JobType.Mage,
    Desc = "Hits every enemy in a 5x5 area around the target with an MATK of (70+10*SkillLV)% and Fire Element. After SkillLV 6, it has a reduced cast / after-Cool Down.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Fire)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Bring forth the flames! Fire Ball!")
            if #targets == 0 then
                return
            end

            local matk = (0.7 + 0.1 * level)
            Act.SkillAttack(user, targets, skill, {
                AtkType = SkillAttackType.Magic,
                MAtkBonus = matk - 1.0,
                Element = Element.Fire
            })
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "FIRE BALL") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "FIRE BALL") end,
    }
})

Config.NewSkill({
    Key = "soul_strike",
    Name = "Soul Strike",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.Single_Enemy,
    Range = 9,
    CastTimes = { 0.5 },
    CastDelays = { 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8, 2.7 },
    SPCosts = { 18, 14, 24, 20, 30, 26, 36, 32, 42, 38 },
    MaxLevel = 10,
    PreReqs = {
        Key = "napalm_beat",
        Level = 4
    },
    Job = JobType.Mage,
    Desc = "Hits the target with (1+SkillLV/2) bolts for 1*MATK using Ghost Element. Does extra 5% damage per SkillLV to Undead property Monsters.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Ghost)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Tear through the veil! Soul Strike!")
            local hits = (level / 2) + 1
            for _ = 1, hits do
                for _, target in ipairs(targets) do
                    Act.SkillAttack(user, { target }, skill, {
                        AtkType = SkillAttackType.Magic,
                        MAtkBonus = Entity.Element(target) == Element.Undead and 0.05 * level or 0,
                        Element = Element.Ghost
                    })
                end
            end
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "SOUL STRIKE") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "SOUL STRIKE") end,
    }
})

Config.NewSkill({
    Key = "thunder_storm",
    Name = "Thunder Storm",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.All_Enemies,
    Range = 9,
    CastTimes = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 },
    CastDelays = { 2 },
    SPCosts = { 29, 34, 39, 44, 49, 54, 59, 64, 69, 74 },
    MaxLevel = 10,
    PreReqs = {
        Key = "lightning_bolt",
        Level = 4
    },
    Job = JobType.Mage,
    Desc = "Hits every Enemy in a 5x5 area around the targeted cell with 1 Wind Element Bolt per level at a rate of 1 bolt every 0.2 seconds. Each bolt does 0.8*MATK Wind element damage.",
    Scripts = {
        Activated = function(user)
            skillUtils.WriteCastingMessages(user, Element.Wind)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Let the thunder roar! Thunder Storm!")
            if #targets == 0 then
                return
            end
            for i = 1, level do
                Async.Delay(i * 0.2, function()
                    for _, target in ipairs(targets) do
                        if Entity.CanAttack(user, target) then
                            Act.SkillAttack(user, { target }, skill, {
                                AtkType = SkillAttackType.Magic,
                                MAtkBonus = 0.8 - 1.0,
                                Element = Element.Wind
                            })
                        end
                    end
                end)
            end
        end,
        Missed = function(user, target) magicProjectileMissedFunc(user, target, "THUNDER STORM") end,
        Hit = function(user, target, dam) magicProjectileHitFunc(user, target, dam, "THUNDER STORM") end,
    }
})

-- Helper Funcs
magicProjectileMissedFunc = function(user, target, magName)
    Write.ToPlayer(user,
        string.format("Your <c yellow>%s</c> zips by %s, barely missing them!", magName, Entity.Name(target)))
    Write.ToPlayer(target,
        string.format("%s's <c yellow>%s</c> zips by, barely missing you!", Entity.NameCap(user), magName))
    Write.ToRoom(Entity.Room(user), { user, target },
        string.format("%s's <c yellow>%s</c> zips by %, barely missing them!", Entity.NameCap(user), magName,
            Entity.Name(target)))
end

magicProjectileHitFunc = function(user, target, dam, magName)
    Write.ToPlayer(user,
        string.format("Your <c bright yellow>%s</c> smashes into %s! %s", magName, Entity.Name(target),
            skillUtils.AttackerDamageMessage(dam)))
    Write.ToPlayer(target,
        string.format("%s's <c bright yellow>%s</c> smashes into you! %s", Entity.NameCap(user), magName,
            skillUtils.TargetDamageMessage(dam)))
    Write.ToRoom(Entity.Room(user), { user, target },
        string.format("%s's <c bright yellow>%s</c> smashes into %s!", Entity.NameCap(user), magName,
            Entity.Name(target)))
end
