require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig(Element.Water, {
    "You fire a jet of <c yellow>WATER</c> at %s, but it misses. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but they easliy dodge it."
}, {
    "You spray %s with <c bright yellow>WATER</c>! %s",
    "%s sprays you with <c bright yellow>WATER</c>! %s",
    "%s sprays %s with <c bright yellow>WATER</c>!"
}))

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig(Element.Fire, {
    "You swipe at %s with searing <c yellow>FLAMES</c> but miss. %s",
    "%s swipes at you with searing <c yellow>FLAMES</c>, but you easliy dodge. %s",
    "%s swipes at %s with searing <c yellow>FLAMES</c>, but they easliy dodge."
}, {
    "You scortch %s with searing <c bright yellow>FLAMES</c>! %s",
    "%s scortches you with searing <c bright yellow>FLAMES</c>! %s",
    "%s scortches %s with searing <c bright yellow>FLAMES</c>!"
}))

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig(Element.Wind, {
    "You blow a violent gust of <c yellow>AIR</c> at %s, but miss. %s",
    "%s blows a violent gust of <c yellow>AIR</c> at you, but you easliy dodge. %s",
    "%s blows a violent bust of <c yellow>AIR</c> at %s, but they easliy dodge."
}, {
    "You shred %s with a violent gust of <c bright yellow>AIR</c>! %s",
    "%s shreds you with a violent gust of <c bright yellow>AIR</c>! %s",
    "%s shreds %s with a violent gust of <c bright yellow>AIR</c>!"
}))

Config.NewSkill({
    Key = "npc_metamorphasis_creamy",
    Name = "Metamorphasis: Into Creamy",
    Type = SkillType.Active,
    TargetType = SkillTargetType.Self,
    CastTimes = { 2 },
    CastDelays = { 5 },
    Desc = "Changes the caster into a creamy.",
    Scripts = {
        Activated = function(self)
            Write.ToRoom(Entity.Room(self), { self }, string.format("%s starts to move...", Entity.NameCap(self)))
        end,
        Cast = function(self, _, _, _)
            local room = Entity.Room(self)
            local oldSelf = self
            self = Spawn.Entity("creamy", room)
            Write.ToRoom(room, { self, oldSelf }, string.format("%s bursts open revealing %s!", Entity.NameCap(oldSelf), Entity.NameCap(self)))
            Destroy.Entity(oldSelf)
        end
    }
})