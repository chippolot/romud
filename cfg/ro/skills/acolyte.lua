require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill({
    Key = "heal",
    Name = "Heal",
    Type = SkillType.Active,
    TargetType = SkillTargetType.Single_Ally,
    Range = 9,
    CastDelays = { 1 },
    SPCosts = { 13, 16, 19, 22, 25, 28, 31, 34, 37, 40 },
    MaxLevel = 10,
    Job = JobType.Acolyte,
    Desc = "Heals a target's HP for [(BaseLV+INT)/8]*(4+8*SkillLV). When used against Undead property monsters, it is a holy attack that ignores MDEF and INT, but deals only half damage (that is, HealValue*ElementModifier/2).",
    Scripts = {
        Activated = function(self)
            skillUtils.WriteCastingMessages(self, Element.Holy)
        end,
        Cast = function(self, targets, _, level)
            skillUtils.WriteCastSuccessMessages(self, "Restore and renew! HEAL!")
            
            local amt = ((Entity.Stat(self, Stat.Level) + Entity.Stat(self, Stat.Int)) / 8.0) + (4+8*level)
            for _, tgt in ipairs(targets) do
                Write.ToPlayer(tgt, string.format("You suddenly feel a lot better! %s", skillUtils.HealMessage(amt)))
                Write.ToRoom(Entity.Room(tgt), { tgt }, string.format("%s looks like they're feeling better!", Entity.NameCap(tgt)))
                Entity.HealHP(tgt, amt)
            end
        end
    }
})

Config.NewSkill({
    Key = "teleport",
    Name = "Teleport",
    Type = SkillType.Active,
    TargetType = SkillTargetType.Self,
    SPCosts = { 10 },
    MaxLevel = 1,
    Job = JobType.Acolyte,
    Desc = "Teleports to a random room in the same zone",
    Scripts = {
        Cast = function(self, _, _, _)
            skillUtils.WriteCastSuccessMessages(self, "Blink into the distance! Teleport!")
            Write.ToPlayer(self, string.format("You blink out of existence and appear somewhere new!"))
            Write.ToPlayer(self, "\n\r")
            Write.ToRoom(Entity.Room(self), { self }, string.format("%s blinks out of existence!", Entity.NameCap(self)))
            local room = Zone.RandomRoom(Entity.Zone(self))
            Act.MoveTo(self, room)
            Write.ToRoom(Entity.Room(self), { self }, string.format("%s blinks into existence!", Entity.NameCap(self)))
        end
    }
})