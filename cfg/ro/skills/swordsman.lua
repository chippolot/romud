require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill({
    Key = "bash",
    Name = "Bash",
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.Single_Enemy,
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
                AtkType = SkillAttackType.Physical,
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
    Type = SkillType.Offensive,
    TargetType = SkillTargetType.All_Enemies,
    CastDelay = 5.0,
    SPCost = 8,
    MaxLevel = 10,
    Desc = "Strike all enemies in the room with a weapon attack.",
    Scripts = {
        Cast = function(user, targets, skill, level)
            local atkPct = 0.1 * level - 0.5
            local hitPct = 0.05 * level - 0.25
            Write.ToPlayer(user, "You around quickly, sweeping your weapon in a wide arc ...")
            Write.ToRoom(Entity.Room(user), { user },
                string.format("%s spins around quickly, sweeping their weapon in a wide arc...", Entity.NameCap(user)))

            Act.SkillAttack(user, targets, skill, {
                AtkType = SkillAttackType.Physical,
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