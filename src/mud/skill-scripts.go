package mud

import (
	"log"

	"github.com/chippolot/romud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

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
