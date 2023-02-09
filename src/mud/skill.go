package mud

import (
	"fmt"
	"log"

	"github.com/chippolot/romud/src/utils"
)

const (
	SkillType_Passive SkillType = iota
	SkillType_Active
	SkillType_Offensive
)
const (
	SkillTargetType_None SkillTargetType = iota
	SkillTargetType_Self
	SkillTargetType_Single_Ally
	SkillTargetType_Single_Enemy
	SkillTargetType_Single_Entity
	SkillTargetType_All_Enemies
)

type SkillType int
type SkillTargetType int

var skillTypeStringMapping = utils.NewStringMapping(map[SkillType]string{
	SkillType_Passive:   "passive",
	SkillType_Active:    "active",
	SkillType_Offensive: "offensive",
})

func ParseSkillType(str string) (SkillType, error) {
	if val, ok := skillTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown skill type: %s", str)
}

func (s *SkillType) String() string {
	if str, ok := skillTypeStringMapping.ToString[*s]; ok {
		return str
	}
	return "unknown"
}

var skillTargetTypeStringMapping = utils.NewStringMapping(map[SkillTargetType]string{
	SkillTargetType_None:          "none",
	SkillTargetType_Self:          "self",
	SkillTargetType_Single_Ally:   "single_ally",
	SkillTargetType_Single_Entity: "single_entity",
	SkillTargetType_Single_Enemy:  "single_enemy",
	SkillTargetType_All_Enemies:   "all_enemies",
})

func ParseSkillTargetType(str string) (SkillTargetType, error) {
	if val, ok := skillTargetTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown skill target type: %s", str)
}

func (s *SkillTargetType) String() string {
	if str, ok := skillTargetTypeStringMapping.ToString[*s]; ok {
		return str
	}
	return "unknown"
}

type SkillPreReqs struct {
	Key   string
	Level int
}

type SkillConfig struct {
	Key        string
	Name       string
	Type       SkillType
	TargetType SkillTargetType
	Range      int
	CastTimes  []utils.Seconds
	CastDelays []utils.Seconds
	SPCosts    []int
	MaxLevel   int
	Job        JobTypeMask
	PreReqs    *SkillPreReqs
	Desc       string
	scripts    *SkillScripts
}

func (cfg *SkillConfig) SPCost(level int) int {
	if len(cfg.SPCosts) == 0 {
		return 0
	}
	ret := cfg.SPCosts[0]
	level = utils.MaxInt(1, level)
	if level <= len(cfg.SPCosts) {
		ret = cfg.SPCosts[level-1]
	}
	return ret
}

func (cfg *SkillConfig) CastTime(level int) utils.Seconds {
	if len(cfg.CastTimes) == 0 {
		return 0
	}
	ret := cfg.CastTimes[0]
	level = utils.MaxInt(1, level)
	if level <= len(cfg.CastTimes) {
		ret = cfg.CastTimes[level-1]
	}
	return ret
}

func (cfg *SkillConfig) CastDelay(level int) utils.Seconds {
	if len(cfg.CastDelays) == 0 {
		return 0
	}
	ret := cfg.CastDelays[0]
	level = utils.MaxInt(1, level)
	if level <= len(cfg.CastDelays) {
		ret = cfg.CastDelays[level-1]
	}
	return ret
}

func (cfg *SkillConfig) SelectableLevel() bool {
	return len(cfg.SPCosts) > 1
}

type LearnedSkill struct {
	Key   string
	Level int
	cfg   *SkillConfig
}

type SkillsData struct {
	Learned []*LearnedSkill
}

func newSkillsData() *SkillsData {
	return &SkillsData{make([]*LearnedSkill, 0)}
}

type Skills struct {
	data          *SkillsData              // Persisted skills data
	casting       *CastingData             // If casting a skill, data about skill being cast
	coldownExpiry utils.Seconds            // Amount of time the entity must wait before using another skill
	lookup        map[string]*LearnedSkill // Lookup of learned skills key -> level
}

func newSkills(data *SkillsData) *Skills {
	s := &Skills{data, nil, 0, make(map[string]*LearnedSkill)}
	s.SetData(data)
	return s
}

func (s *Skills) SetData(data *SkillsData) {
	s.data = data
	for _, ls := range data.Learned {
		s.lookup[ls.Key] = ls
	}
}

func (s *Skills) KnowsSkill(key string) bool {
	_, ok := s.lookup[key]
	return ok
}

func (s *Skills) SkillLevel(key string) int {
	ls, ok := s.lookup[key]
	if !ok {
		return 0
	}
	return ls.Level
}

func (s *Skills) SkillMastered(key string) bool {
	ls, ok := s.lookup[key]
	if !ok {
		return false
	}
	return ls.Level >= ls.cfg.MaxLevel
}

func (s *Skills) Learn(key string) {
	ls := &LearnedSkill{Key: key, Level: 1}
	s.data.Learned = append(s.data.Learned, ls)
	s.lookup[key] = ls
}

func (s *Skills) LevelUp(key string) {
	ls, ok := s.lookup[key]
	if !ok {
		log.Printf("cannot level up skill. player doesn't know skill with key %s", key)
		return
	}
	ls.Level++
}

type CastingList struct {
	utils.List[*Entity]
}

func (c *CastingList) StartCasting(e *Entity, time utils.Seconds, target *Entity, skill *SkillConfig, level int) bool {
	// Already casting!
	// TODO: SKILL: Support cancelation
	if e.skills.casting != nil {
		return false
	}

	// Can't cast when you're stunned!
	if e.stats.Condition() <= Cnd_Stunned {
		return false
	}

	// Add to cast list
	castTime := utils.Seconds(calculateCastTime(e.stats, skill.CastTime(level)))
	e.skills.casting = &CastingData{e.data.RoomId, target, skill, level, time + castTime}
	c.AddBack(e)

	return true
}

func (c *CastingList) EndCasting(e *Entity) {
	if e.skills.casting == nil {
		return
	}
	c.Remove(e)
	e.skills.casting = nil
}

type CastingData struct {
	roomId   RoomId        // Id of room where entity began casting
	target   *Entity       // Current skill target (if any)
	skill    *SkillConfig  // Current skill being cast
	level    int           // Level skill is being cast at
	castTime utils.Seconds // Timestamp when skill will be done casting
}

func (c *CastingData) Valid(e *Entity) bool {
	return c != nil && e.stats.Condition() > Cnd_Stunned && e.data.RoomId == c.roomId
}

type SkillTriggerConfig struct {
	Key    string
	Level  int
	Chance float64
}

func performSkill(e *Entity, w *World, target *Entity, skill *SkillConfig, level int) {
	// Cooldown check
	if w.time < e.skills.coldownExpiry {
		Write("You can't use another skill yet!").ToPlayer(e).Send()
		return
	}

	// Already casting something
	if e.skills.casting != nil {
		Write("You're kind of busy casting something else!").ToPlayer(e).Send()
		return
	}

	// Can't afford
	spCost := skill.SPCost(level)
	if spCost > 0 && e.stats.Get(Stat_SP) < spCost {
		Write("You don't have enough SP!").ToPlayer(e).Send()
		return
	}

	// Trigger skill script
	triggerSkillActivatedScript(skill, e)

	// If skill is instant, cast it!
	if skill.CastTime(level) <= 0 {
		castSkill(skill, e, w, target, level)
	} else { // Otherwise, add to casting list
		w.casting.StartCasting(e, w.time, target, skill, level)

		// Skill targets of offensive skills immediately target you
		if skill.Type == SkillType_Offensive {
			for _, tgt := range getSkillTargets(skill, e, w, target) {
				startAttacking(tgt, w, e, float64(skill.Range))
			}
		}
	}
}

func castSkill(skill *SkillConfig, e *Entity, w *World, target *Entity, level int) {
	// Final SP cost check
	spCost := skill.SPCost(level)
	if spCost > 0 && e.stats.Get(Stat_SP) < spCost {
		Write("You don't have enough SP!").ToPlayer(e).Send()
		return
	}

	// Subtract SP
	e.stats.Add(Stat_SP, -spCost)

	// Collect targets for AOE skills
	targets := getSkillTargets(skill, e, w, target)
	triggerSkillCastScript(skill, e, targets, level)
}

func getSkillTargets(skill *SkillConfig, e *Entity, w *World, target *Entity) []*Entity {
	targets := []*Entity{target}
	switch skill.TargetType {
	case SkillTargetType_Self:
		return []*Entity{e}
	case SkillTargetType_All_Enemies:
		targets = make([]*Entity, 0)
		r := w.rooms[e.data.RoomId]
		for _, e2 := range r.entities {
			if e.IsEnemyOf(e2) {
				targets = append(targets, e2)
			}
		}
	}
	return targets
}

func interruptSkill(e *Entity, w *World) {
	if e.skills.casting == nil {
		return
	}
	if e.entityFlags.Has(EFlag_Uninterruptable) {
		return
	}
	w.casting.EndCasting(e)

	Write("You lose your concentration!").ToPlayer(e).Colorized(Color_Negative).Send()
	Write("%s loses their concentration!", ObservableNameCap(e)).ToEntityRoom(w, e).Ignore(e).Send()
}

func tryTriggerSkill(e *Entity, w *World, state EntityState, tgt *Entity) bool {
	// No skill triggers
	triggers := e.SkillTriggers(state)
	if len(triggers) == 0 {
		return false
	}

	// On skill cooldown
	if w.time < e.skills.coldownExpiry {
		return false
	}

	// Check all skill triggers
	chance := utils.RandChance100()
	for _, trigger := range triggers {
		chance -= trigger.Chance
		if chance <= 0 {
			if skill, ok := w.cfg.skillConfigs[trigger.Key]; ok {
				performSkill(e, w, tgt, skill, trigger.Level)
				return true
			} else {
				log.Printf("invalid skill key '%s' used in skill trigger by enitty '%s'", trigger.Key, e.cfg.Key)
				break
			}
		}
	}
	return false
}
