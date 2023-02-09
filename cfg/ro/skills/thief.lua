require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill({
    Key = "back_slide",
    Name = "Back Slide",
    Type = SkillType.Active,
    TargetType = SkillTargetType.Self,
    SPCost = 7,
    MaxLevel = 1,
    Job = JobType.Theif,
    CastDelays = { 1 },
    Desc = "Instantly slides 5 cells backwards.",
    Scripts = {
        Cast = function(self, _, _, _)
            Write.ToPlayer(self, "You dash backwards.")
            Write.ToRoom(Entity.Room(self), { self }, string.format("%s dashes backwards.", Entity.NameCap(self)))
            Act.IncreaseDistance(self, 5)
        end
    }
})