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
        Cast = function(user, _, _, _)
            Write.ToPlayer(user, "You dash backwards.")
            Write.ToRoom(Entity.Room(user), { user }, string.format("%s dashes backwards.", Entity.NameCap(user)))
            Act.IncreaseDistance(user, 5)
        end
    }
})