require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill({
    Key = "first_aid",
    Name = "First Aid",
    Type = SkillType.Active,
    TargetType = SkillTargetType.Self,
    SPCost = 3,
    MaxLevel = 1,
    Job = JobType.All,
    Desc = "Heal yourself for 5 HP. Not a crazy powerful skill, but mages seem to like it for saving money on healing items.",
    Scripts = {
        Cast = function(self, _, _, _)
            local amt = 5
            Write.ToPlayer(self, string.format("You tend some of your wounds. %s", skillUtils.HealMessage(amt)))
            Write.ToRoom(Entity.Room(self), { self }, string.format("%s tends to their wounds.", Entity.NameCap(self)))
            Entity.HealHP(self, amt)
        end
    }
})