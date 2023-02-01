local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill({
    Key = "bash",
    Name = "Bash",
    Type = "offensive",
    TargetType = "single_enemy",
    CastTime = 0,
    CastDelay = 1.0,
    SPCost = 8,
    MaxLevel = 10,
    Desc = "Strike a single enemy with significantly more power.",
    Scripts = {
        Activated = function(user, target, skill, level)
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

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig("water", {
    "You fire a jet of <c yellow>WATER</c> at %s, but it misses. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s"
}, {
    "You spray %s with <c bright yellow>WATER</c>! %s!",
    "%s sprays you with <c bright yellow>WATER</c>! %s",
    "%s sprays %s with <c bright yellow>WATER</c>!"
}))

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig("fire", {
    "You fire a jet of <c yellow>WATER</c> at %s, but it misses. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s"
}, {
    "You spray %s with <c bright yellow>WATER</c>! %s!",
    "%s sprays you with <c bright yellow>WATER</c>! %s",
    "%s sprays %s with <c bright yellow>WATER</c>!"
}))
