local stringUtils = require('cfg.ro.utils.string-utils')

local function getElementColor(element)
    if element == "water" then
        return "blue"
    elseif element == "neutral" then
        return "dimly"
    elseif element == "earth" then
        return "dark green"
    elseif element == "fire" then
        return "red"
    elseif element == "wind" then
        return "light blue"
    elseif element == "poison" then
        return "green"
    elseif element == "holy" then
        return "white"
    elseif element == "shadow" then
        return "black"
    elseif element == "ghost" then
        return "grey"
    elseif element == "undead" then
        return "purple"
    end
end

local lib = {}

lib.AttackerDamageMessage = function(dam)
    return string.format("(<c green>%d</c>)", dam)
end

lib.TargetDamageMessage = function(dam)
    return string.format("(<c red>%d</c>)", dam)
end

lib.HealMessage = function(amt)
    return string.format("(<c yellow>%d</c>)", amt)
end

lib.GenerateElementAttackSkillConfig = function(element, missedMessages, hitMessages)
    return {
        Key = string.format("npc_%s_attack", element),
        Name = string.format("%s Attack", stringUtils.FirstToUpper(element)),
        Type = "offensive",
        TargetType = "single_enemy",
        CastDelays = { 5.0 },
        MaxLevel = 10,
        Desc = string.format("(NPC Only) Deals %s damage to the target. Damage is based on the monster's ATK.",
            element),
        Scripts = {
            Cast = function(user, targets, skill, level)
                local atkBonus = (level - 1)
                Act.SkillAttack(user, targets, skill, {
                    AtkBonus = atkBonus,
                    Element = element
                })
            end,
            Missed = function(user, target)
                Write.ToPlayer(user,
                    string.format(missedMessages[1], Entity.Name(target), lib.AttackerDamageMessage(0)))
                Write.ToPlayer(target,
                    string.format(missedMessages[2], Entity.NameCap(user), lib.TargetDamageMessage(0)))
                Write.ToRoom(Entity.Room(user), { user, target },
                    string.format(missedMessages[3], Entity.NameCap(user), Entity.Name(target)))
            end,
            Hit = function(user, target, dam)
                Write.ToPlayer(user,
                    string.format(hitMessages[1], Entity.Name(target), lib.AttackerDamageMessage(dam)))
                Write.ToPlayer(target,
                    string.format(hitMessages[2], Entity.NameCap(user), lib.TargetDamageMessage(dam)))
                Write.ToRoom(Entity.Room(user), { user, target },
                    string.format(hitMessages[3], Entity.NameCap(user), Entity.Name(target)))
            end
        }
    }
end

lib.WriteCastingMessages = function(e, element)
    local elementColor = getElementColor(element)
    Write.ToPlayer(e, string.format("Your eyes flash %s as you begin murmuring a spell incantation...", elementColor))
    Write.ToRoom(Entity.Room(e), { e },
        string.format("%s's eyes flash %s as they begin murmuring a spell incantation...", Entity.NameCap(e),
            elementColor))
end

lib.WriteCastInterruptMessages = function(e)
    Write.ToPlayer(e, "!! Your concentration suddenly breaks as you snap out of your trance!")
end

lib.WriteCastSuccessMessages = function(e, chant)
    Write.ToPlayer(e, string.format("You shout '%s'", chant))
    Write.ToRoom(Entity.Room(e), { e }, string.format("%s shouts '%s'", Entity.NameCap(e), chant))
end
return lib
