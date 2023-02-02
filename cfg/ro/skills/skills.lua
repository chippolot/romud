local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill({
    Key = "bash",
    Name = "Bash",
    Type = "offensive",
    TargetType = "single_enemy",
    CastDelay = 1.0,
    SPCost = 8,
    MaxLevel = 10,
    Desc = "Strike a single enemy with significantly more power.",
    Scripts = {
        Cast = function(user, targets, skill, level)
            local target = targets[1]
            local atkPct = 0.3 * level
            local hitPct = 0.05 * level
            Write.ToPlayer(user, "You dramatically wind up for a big attack...")
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s dramatically winds up for a big attack...", Entity.NameCap(user)))
            Act.SkillAttack(user, target, skill, {
                AtkBonus = atkPct,
                HitBonus = hitPct
            })
        end,
        Missed = function(user, target)
            Write.ToPlayer(user,
                string.format("Your <c yellow>BASH</c> misses %s by a mile! %s", Entity.Name(target),
                    skillUtils.AttackerDamageMessage(0)))
            Write.ToPlayer(target,
                string.format("%s's <c yellow>BASH</c> misses you by a mile! %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(0)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s's <c yellow>BASH</c> misses %s by a mile!", Entity.NameCap(user), Entity.Name(target)))
        end,
        Hit = function(user, target, dam)
            Write.ToPlayer(user,
                string.format("You <c bright yellow>BASH</c> %s! %s", Entity.Name(target),
                    skillUtils.AttackerDamageMessage(dam)))
            Write.ToPlayer(target,
                string.format("%s <c bright yellow>BASHES</c> you! %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(dam)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s <c bright yellow>BASHES</c> %s!", Entity.NameCap(user), Entity.Name(target)))
        end
    }
})

Config.NewSkill({
    Key = "whirlwind",
    Name = "Whirlwind",
    Type = "offensive",
    TargetType = "all_enemies",
    CastDelay = 5.0,
    SPCost = 8,
    MaxLevel = 10,
    Desc = "Strike all enemies in the room with a weapon attack.",
    Scripts = {
        Cast = function(user, targets, skill, level)
            local atkPct = 0.1 * level - 0.5
            local hitPct = 0.05 * level - 0.25
            Write.ToPlayer(user, "You around quickly, sweeping your weapon in a wide arc ...")
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s spins around quickly, sweeping their weapon in a wide arc...", Entity.NameCap(user)))

            Act.SkillAttack(user, targets, skill, {
                AtkBonus = atkPct,
                HitBonus = hitPct
            })
        end,
        Missed = function(user, target)
            Write.ToPlayer(user,
                string.format("%s easily dodges your <c yellow>WHIRLWIND</c>. %s", Entity.NameCap(target),
                    skillUtils.AttackerDamageMessage(0)))
            Write.ToPlayer(target,
                string.format("%s easily dodges your <c yellow>WHIRLWIND</c>. %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(0)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s easily dodges %s's <c yellow>WHIRLWIND</c>.", Entity.NameCap(user), Entity.Name(target)))
        end,
        Hit = function(user, target, dam)
            Write.ToPlayer(user,
                string.format("You slash %s with your <c bright yellow>WHIRLWIND</c>! %s", Entity.Name(target),
                    skillUtils.AttackerDamageMessage(dam)))
            Write.ToPlayer(target,
                string.format("%s slashes you with their <c bright yellow>WHIRLWIND</c>! %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(dam)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s slashes %s with their  <c bright yellow>WHIRLWIND</c>!", Entity.NameCap(user),
                    Entity.Name(target)))
        end
    }
})

Config.NewSkill({
    Key = "cold_bolt",
    Name = "Cold Bolt",
    Type = "offensive",
    TargetType = "single_enemy",
    Range = 9,
    CastTimes = { 0.7, 1.4, 2.1, 2.8, 3.5, 4.2, 4.9, 5.6, 6.3, 7 },
    CastDelays = { 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8 },
    SPCosts = { 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 },
    MaxLevel = 10,
    Desc = "Hits the targeted enemy with 1 Water Element Bolt per SkillLV for 1*MATK each.",
    Scripts = {
        Activated = function(user, targets, skill, level)
            skillUtils.WriteCastingMessages(user, "water")
        end,
        Interrupted = function(user)
            skillUtils.WriteCastInterruptMessages(user)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Frost's wrath, rain down! Cold Bolt!")
            for _ = 1, level do
                Act.SkillAttack(user, targets, skill, {
                    Element = "water"
                })
            end
        end,
        Hit = function(user, target, dam)
            Write.ToPlayer(user,
                string.format("Your <c bright yellow>COLD BOLT</c> smashes into %s! %s", Entity.Name(target),
                    skillUtils.AttackerDamageMessage(dam)))
            Write.ToPlayer(target,
                string.format("%s's <c bright yellow>COLD BOLT</c> smashes into you! %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(dam)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s's <c bright yellow>COLD BOLT</c> smashes into %s!", Entity.NameCap(user),
                    Entity.Name(target)))
        end
    }
})

Config.NewSkill({
    Key = "fire_bolt",
    Name = "Fire Bolt",
    Type = "offensive",
    TargetType = "single_enemy",
    Range = 9,
    CastTimes = { 0.7, 1.4, 2.1, 2.8, 3.5, 4.2, 4.9, 5.6, 6.3, 7 },
    CastDelays = { 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8 },
    SPCosts = { 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 },
    MaxLevel = 10,
    Desc = "Hits the targeted enemy with 1 Fire Element Bolt per SkillLV for 1*MATK each.",
    Scripts = {
        Activated = function(user, targets, skill, level)
            skillUtils.WriteCastingMessages(user, "fire")
        end,
        Interrupted = function(user)
            skillUtils.WriteCastInterruptMessages(user)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Burn brightly! Fire Bolt!")
            for _ = 1, level do
                Act.SkillAttack(user, targets, skill, {
                    Element = "fire"
                })
            end
        end,
        Hit = function(user, target, dam)
            Write.ToPlayer(user,
                string.format("Your <c bright yellow>FIRE BOLT</c> smashes into %s! %s", Entity.Name(target),
                    skillUtils.AttackerDamageMessage(dam)))
            Write.ToPlayer(target,
                string.format("%s's <c bright yellow>FIRE BOLT</c> smashes into you! %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(dam)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s's <c bright yellow>FIRE BOLT</c> smashes into %s!", Entity.NameCap(user),
                    Entity.Name(target)))
        end
    }
})

Config.NewSkill({
    Key = "lightning_bolt",
    Name = "Lightning Bolt",
    Type = "offensive",
    TargetType = "single_enemy",
    Range = 9,
    CastTimes = { 0.7, 1.4, 2.1, 2.8, 3.5, 4.2, 4.9, 5.6, 6.3, 7 },
    CastDelays = { 1, 1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8 },
    SPCosts = { 12, 14, 16, 18, 20, 22, 24, 26, 28, 30 },
    MaxLevel = 10,
    Desc = "Hits the targeted enemy with 1 Wind Element Bolt per SkillLV for 1*MATK each.",
    Scripts = {
        Activated = function(user, targets, skill, level)
            skillUtils.WriteCastingMessages(user, "wind")
        end,
        Interrupted = function(user)
            skillUtils.WriteCastInterruptMessages(user)
        end,
        Cast = function(user, targets, skill, level)
            skillUtils.WriteCastSuccessMessages(user, "Shocking strike! Lightning Bolt!")
            for _ = 1, level do
                Act.SkillAttack(user, targets, skill, {
                    Element = "wind"
                })
            end
        end,
        Hit = function(user, target, dam)
            Write.ToPlayer(user,
                string.format("Your <c bright yellow>LIGHTNING BOLT</c> smashes into %s! %s", Entity.Name(target),
                    skillUtils.AttackerDamageMessage(dam)))
            Write.ToPlayer(target,
                string.format("%s's <c bright yellow>LIGHTNING BOLT</c> smashes into you! %s", Entity.NameCap(user),
                    skillUtils.TargetDamageMessage(dam)))
            Write.ToRoom(Entity.Room(user), { user, target },
                string.format("%s's <c bright yellow>LIGHTNING BOLT</c> smashes into %s!", Entity.NameCap(user),
                    Entity.Name(target)))
        end
    }
})


Config.NewSkill({
    Key = "first_aid",
    Name = "First Aid",
    Type = "active",
    TargetType = "self",
    SPCost = 3,
    MaxLevel = 1,
    Desc = "Heal yourself for 5 HP. Not a crazy powerful skill, but mages seem to like it for saving money on healing items.",
    Scripts = {
        Cast = function(user, _, _, _)
            local amt = 5
            Write.ToPlayer(user, string.format("You tend some of your wounds. %s", skillUtils.HealMessage(5)))
            Write.ToRoom(Entity.Room(user), { user }, string.format("%s tends to their wounds.", Entity.NameCap(user)))
            Entity.HealHP(user, amt)
        end
    }
})

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig("water", {
    "You fire a jet of <c yellow>WATER</c> at %s, but it misses. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but they easliy dodge it."
}, {
    "You spray %s with <c bright yellow>WATER</c>! %s!",
    "%s sprays you with <c bright yellow>WATER</c>! %s",
    "%s sprays %s with <c bright yellow>WATER</c>!"
}))

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig("fire", {
    "You swipe at %s with searing <c yellow>FLAMES</c> but miss. %s",
    "%s swipes at you with searing <c yellow>FLAMES</c>, but you easliy dodge. %s",
    "%s swipes at %s with searing <c yellow>FLAMES</c>, but they easliy dodge."
}, {
    "You scortch %s with searing <c bright yellow>FLAMES</c>! %s!",
    "%s scortches you with searing <c bright yellow>FLAMES</c>! %s",
    "%s scortches %s with searing <c bright yellow>FLAMES</c>!"
}))
