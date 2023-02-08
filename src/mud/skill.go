package mud

import (
	"fmt"
	"log"

	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
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
	if cfg.SPCosts == nil {
		return 0
	}
	ret := cfg.SPCosts[0]
	if level <= len(cfg.SPCosts) {
		ret = cfg.SPCosts[level-1]
	}
	return ret
}

func (cfg *SkillConfig) CastTime(level int) utils.Seconds {
	if cfg.CastTimes == nil {
		return 0
	}
	ret := cfg.CastTimes[0]
	if level <= len(cfg.CastTimes) {
		ret = cfg.CastTimes[level-1]
	}
	return ret
}

func (cfg *SkillConfig) CastDelay(level int) utils.Seconds {
	if cfg.CastDelays == nil {
		return 0
	}
	ret := cfg.CastDelays[0]
	if level <= len(cfg.CastDelays) {
		ret = cfg.CastDelays[level-1]
	}
	return ret
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
	data          *SkillsData    // Persisted skills data
	casting       *CastingData   // If casting a skill, data about skill being cast
	coldownExpiry utils.Seconds  // Amount of time the entity must wait before using another skill
	lookup        map[string]int // Lookup of learned skills key -> level
}

func newSkills(data *SkillsData) *Skills {
	s := &Skills{data, nil, 0, make(map[string]int)}
	s.SetData(data)
	return s
}

func (s *Skills) SetData(data *SkillsData) {
	s.data = data
	for _, ls := range data.Learned {
		s.lookup[ls.Key] = ls.Level
	}
}

func (s *Skills) KnowsSkill(key string) bool {
	_, ok := s.lookup[key]
	return ok
}

func (s *Skills) SkillLevel(key string) int {
	lvl := s.lookup[key]
	return lvl
}

func (s *Skills) Learn(key string) {
	s.data.Learned = append(s.data.Learned, &LearnedSkill{Key: key, Level: 1})
	s.lookup[key] = 1
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

type SkillScripts struct {
	activated func(*Entity)
	cast      func(*Entity, []*Entity, *SkillConfig, int)
	missed    func(*Entity, *Entity)
	hit       func(*Entity, *Entity, int)
}

func NewSkillScripts(L *lua.LState, tbl *lua.LTable) *SkillScripts {
	scripts := &SkillScripts{}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Activated"); fn != nil {
		scripts.activated = func(user *Entity) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: false}, utils.ToUserData(L, user)); err != nil {
				log.Panicln("error calling activated script: ", err)
			}
		}
	}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Cast"); fn != nil {
		scripts.cast = func(user *Entity, targets []*Entity, skill *SkillConfig, level int) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: false}, utils.ToUserData(L, user), utils.ToUserDataList(L, targets), utils.ToUserData(L, skill), lua.LNumber(level)); err != nil {
				log.Panicln("error calling cast script: ", err)
			}
		}
	}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Missed"); fn != nil {
		scripts.missed = func(user *Entity, target *Entity) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, user), utils.ToUserData(L, target)); err != nil {
				log.Panicln("error calling missed script: ", err)
			}
		}
	}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Hit"); fn != nil {
		scripts.hit = func(user *Entity, target *Entity, dam int) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, user), utils.ToUserData(L, target), lua.LNumber(dam)); err != nil {
				log.Panicln("error calling hit script: ", err)
			}
		}
	}
	return scripts
}

func triggerSkillActivatedScript(skill *SkillConfig, e *Entity) {
	if skill.scripts != nil && skill.scripts.activated != nil {
		skill.scripts.activated(e)
	}
}

func triggerSkillCastScript(skill *SkillConfig, e *Entity, targets []*Entity, level int) {
	if skill.scripts != nil && skill.scripts.cast != nil {
		skill.scripts.cast(e, targets, skill, level)
	}
}

func triggerSkillMissedScript(skill *SkillConfig, e *Entity, tgt *Entity) {
	if skill.scripts != nil && skill.scripts.missed != nil {
		skill.scripts.missed(e, tgt)
	}
}

func triggerSkillHitScript(skill *SkillConfig, e *Entity, tgt *Entity, dam int) {
	if skill.scripts != nil && skill.scripts.hit != nil {
		skill.scripts.hit(e, tgt, dam)
	}
}
