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
