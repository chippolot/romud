require('cfg.ro.utils.go-api')
local skillUtils = require('cfg.ro.skills.skill-utils')

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig("water", {
    "You fire a jet of <c yellow>WATER</c> at %s, but it misses. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but you easliy dodge it. %s",
    "%s fires a jet of <c yellow>WATER</c> at you, but they easliy dodge it."
}, {
    "You spray %s with <c bright yellow>WATER</c>! %s!",
    "%s sprays you with <c bright yellow>WATER</c>! %s",
    "%s sprays %s with <c bright yellow>WATER</c>!"
}))

Config.NewSkill(skillUtils.GenerateElementAttackSkillConfig("fire", {
    "You swipe at %s with searing <c yellow>FLAMES</c> but miss. %s",
    "%s swipes at you with searing <c yellow>FLAMES</c>, but you easliy dodge. %s",
    "%s swipes at %s with searing <c yellow>FLAMES</c>, but they easliy dodge."
}, {
    "You scortch %s with searing <c bright yellow>FLAMES</c>! %s!",
    "%s scortches you with searing <c bright yellow>FLAMES</c>! %s",
    "%s scortches %s with searing <c bright yellow>FLAMES</c>!"
}))