package mud

import (
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
	SkillTargetType_None SkillType = iota
	SkillTargetType_Self
	SkillTargetType_SingleEnemy
	SkillTargetType_AllEnemies
)

type SkillType int
type SkillTargetType int

// TODO: SkillType Mapping
// TODO: SkillType Lua

// TODO: SkillTargetType Mapping
// TODO: SkillTargetType Lua

type SkillConfig struct {
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

type SkillScripts struct {
	activated func(*Entity, *Entity, *SkillConfig, int)
	missed    func(*Entity, *Entity)
	hit       func(*Entity, *Entity)
}

func NewSkillScripts(L *lua.LState, tbl *lua.LTable) *SkillScripts {
	scripts := &SkillScripts{}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Activated"); fn != nil {
		scripts.activated = func(user *Entity, target *Entity, skill *SkillConfig, level int) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, user), utils.ToUserData(L, target), utils.ToUserData(L, skill), L.ToNumber(level)); err != nil {
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
		scripts.hit = func(user *Entity, target *Entity) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, user), utils.ToUserData(L, target)); err != nil {
				log.Panicln("error calling hit script: ", err)
			}
		}
	}
	return scripts
}

func triggerSkillActivatedScript(skill *SkillConfig, e *Entity, e2 *Entity, level int) {
	if skill.scripts != nil && skill.scripts.activated != nil {
		skill.scripts.activated(e, e2, skill, level)
	}
}

func triggerSkillMissedScript(skill *SkillConfig, e *Entity, e2 *Entity) {
	if skill.scripts != nil && skill.scripts.missed != nil {
		skill.scripts.missed(e, e2)
	}
}

func triggerSkillHitScript(skill *SkillConfig, e *Entity, e2 *Entity) {
	if skill.scripts != nil && skill.scripts.hit != nil {
		skill.scripts.hit(e, e2)
	}
}
