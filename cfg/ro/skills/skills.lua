local function attackerDamageMessage(dam)
    return string.format("(<c green>%d</c>)", dam)
end
local function targetDamageMessage(dam)
    return string.format("(<c red>%d</c>)", dam)
end

Config.NewSkill({
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
            local atkPct = 1 + 0.3 * level
            local hitPct = 1 + 0.05 * level
            Write.ToPlayer(user, "You dramatically wind up for a big attack...")
            Write.ToRoom(Entity.Room(user), string.format("%s dramatically winds up for a big attack...", Entity.NameCap(user)))
            Act.SkillAttack(user, target, skill, {
                AtkBonus = atkPct,
                HitBonus = hitPct
            })
        end,
        Missed = function(user, target) 
            Write.ToPlayer(user, string.format("Your <c dim yellow>BASH</c> misses %s by a mile! %s", Entity.Name(target), attackerDamageMessage(0)))
            Write.ToPlayer(target, string.format("%s's <c dim yellow>BASH</c> misses you by a mile! %s", Entity.NameCap(user), targetDamageMessage(0)))
            Write.ToRoom(Entity.Room(user), string.format("%s's <c dim yellow>BASH</c> misses %s by a mile!", Entity.NameCap(user), Entity.Name(target)))
        end,
        Hit = function(user, target, dam)
            Write.ToPlayer(user, string.format("You <c yellow>BASH</c> %s %s!", Entity.Name(target), attackerDamageMessage(dam)))
            Write.ToPlayer(target, string.format("%s <c yellow>BASHES</c> you! %s", Entity.NameCap(user), targetDamageMessage(dam)))
            Write.ToRoom(Entity.Room(user), string.format("%s <c yellow>BASHES</c> %s!", Entity.NameCap(user), Entity.Name(target)))
        end
    }
})