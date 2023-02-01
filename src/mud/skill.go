package mud

import (
	"encoding/json"
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
	SkillTargetType_SingleAlly
	SkillTargetType_SingleEnemy
	SkillTargetType_SingleEntity
	SkillTargetType_AllEnemies
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

func (s *SkillType) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

func (s *SkillType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseSkillType(str); err != nil {
		return nil
	} else {
		return err
	}
}

var skillTargetTypeStringMapping = utils.NewStringMapping(map[SkillTargetType]string{
	SkillTargetType_None:         "none",
	SkillTargetType_Self:         "self",
	SkillTargetType_SingleAlly:   "single_ally",
	SkillTargetType_SingleEntity: "single_entity",
	SkillTargetType_SingleEnemy:  "single_enemy",
	SkillTargetType_AllEnemies:   "all_enemies",
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

func (s *SkillTargetType) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

func (s *SkillTargetType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseSkillTargetType(str); err != nil {
		return nil
	} else {
		return err
	}
}

type SkillConfig struct {
	Key        string
	Name       string
	Type       SkillType
	TargetType SkillTargetType
	CastTime   utils.Seconds
	CastDelay  utils.Seconds
	SPCost     int
	MaxLevel   int
	Desc       string
	scripts    *SkillScripts
}

type SkillTriggerConfig struct {
	Key    string
	Level  int
	Chance float64
}

type SkillScripts struct {
	activated func(*Entity, *Entity, *SkillConfig, int)
	missed    func(*Entity, *Entity)
	hit       func(*Entity, *Entity, int)
}

func NewSkillScripts(L *lua.LState, tbl *lua.LTable) *SkillScripts {
	scripts := &SkillScripts{}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Activated"); fn != nil {
		scripts.activated = func(user *Entity, target *Entity, skill *SkillConfig, level int) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: false}, utils.ToUserData(L, user), utils.ToUserData(L, target), utils.ToUserData(L, skill), lua.LNumber(level)); err != nil {
				log.Panicln("error calling activated script: ", err)
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

func triggerSkillActivatedScript(skill *SkillConfig, e *Entity, tgt *Entity, level int) {
	if skill.scripts != nil && skill.scripts.activated != nil {
		skill.scripts.activated(e, tgt, skill, level)
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
