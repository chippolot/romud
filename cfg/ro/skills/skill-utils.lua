require('cfg.ro.utils.go-api')
local stringUtils = require('cfg.ro.utils.string-utils')

local function getElementColor(element)
    if element == Element.Water then
        return "blue"
    elseif element == Element.Neutral then
        return "dimly"
    elseif element == Element.Earth then
        return "dark green"
    elseif element == Element.Fire then
        return "red"
    elseif element == Element.Wind then
        return "light blue"
    elseif element == Element.Poison then
        return "green"
    elseif element == Element.Holy then
        return "white"
    elseif element == Element.Shadow then
        return "black"
    elseif element == Element.Ghost then
        return "grey"
    elseif element == Element.Undead then
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
        Type = SkillType.Offensive,
        TargetType = SkillTargetType.Single_Enemy,
        CastDelays = { 5.0 },
        MaxLevel = 10,
        Desc = string.format("(NPC Only) Deals %s damage to the target. Damage is based on the monster's ATK.",
            element),
        Scripts = {
            Cast = function(self, targets, skill, level)
                local atkBonus = (level - 1)
                Act.SkillAttack(self, targets, skill, {
                    AtkType = SkillAttackType.Physical,
                    AtkBonus = atkBonus,
                    Element = element
                })
            end,
            Missed = function(self, target)
                Write.ToPlayer(self,
                    string.format(missedMessages[1], Entity.Name(target), lib.AttackerDamageMessage(0)))
                Write.ToPlayer(target,
                    string.format(missedMessages[2], Entity.NameCap(self), lib.TargetDamageMessage(0)))
                Write.ToRoom(Entity.Room(self), { self, target },
                    string.format(missedMessages[3], Entity.NameCap(self), Entity.Name(target)))
            end,
            Hit = function(self, target, dam)
                Write.ToPlayer(self,
                    string.format(hitMessages[1], Entity.Name(target), lib.AttackerDamageMessage(dam)))
                Write.ToPlayer(target,
                    string.format(hitMessages[2], Entity.NameCap(self), lib.TargetDamageMessage(dam)))
                Write.ToRoom(Entity.Room(self), { self, target },
                    string.format(hitMessages[3], Entity.NameCap(self), Entity.Name(target)))
            end
        }
    }
end

lib.WriteCastingMessages = function(e, element)
    local elementColor = getElementColor(element)
    if not Entity.CanTalk(e) then
        Write.ToRoom(Entity.Room(e), { e },
            string.format("%s's eyes flash %s and they look to be concentrating...", Entity.NameCap(e), elementColor))
    else
        Write.ToPlayer(e, string.format("Your eyes flash %s as you begin murmuring a spell incantation...", elementColor))
        Write.ToRoom(Entity.Room(e), { e },
            string.format("%s's eyes flash %s as they begin murmuring a spell incantation...", Entity.NameCap(e),
                elementColor))
    end
end

lib.WriteCastSuccessMessages = function(e, chant)
    if not Entity.CanTalk(e) then
        return
    end
    Write.ToPlayer(e, string.format("You shout '%s'", chant))
    Write.ToRoom(Entity.Room(e), { e }, string.format("%s shouts '%s'", Entity.NameCap(e), chant))
end
return lib
