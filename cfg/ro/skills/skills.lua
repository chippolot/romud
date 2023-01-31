Config.NewSkill({
    Name = "Bash",
    Type = "offensive",
    TargetType = "single_enemy",
    CastTime = 0,
    SPCost = 8,
    MaxLevel = 10,
    Desc = "Strike a single enemy with significantly more power.",
    Script = function(user, target, level)
        local atkPct = 1 + 0.3 * level
        local hitPct = 1 + 0.05 * level
        Act.CustomAttack(user, target, {
            AtkMultiplier = atkPct,
            HitMultiplier = hitPct,
            HitMessages = {
                ToAttacker = string.format("You <c yellow>BASH</c> %s", Entity.Name(target)),
                ToTarget = string.format("%s <c yellow>BASHES</c> you", Entity.NameCap(user)),
                ToRoom = string.format("%s <c yellow>BASHES</c> %s", Entity.NameCap(user), Entity.Name(target))
            },
            MissMessages = {
                ToAttacker = string.format("Your <c dim yellow>BASH</c> misses %s by a mile!", Entity.Name(target)),
                ToTarget = string.format("%s's <c dim yellow>BASH</c> misses you by a mile!", Entity.NameCap(user)),
                ToRoom = string.format("%s's <c dim yellow>BASH</c> misses %s by a mile!", Entity.NameCap(user), Entity.Name(target))
            }
        })
    end
})