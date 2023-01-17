package mud

import (
	"log"

	lua "github.com/yuin/gopher-lua"
)

type EntityScripts struct {
	willLeaveRoom func(*Entity, *Room)
	didEnterRoom  func(*Entity, *Room)
}

func NewEntityScripts(luaState *lua.LState, tbl *lua.LTable) *EntityScripts {
	scripts := &EntityScripts{}
	if fn := getScriptFunc(tbl, "willLeaveRoom"); fn != nil {
		scripts.willLeaveRoom = func(e *Entity, r *Room) {
			luaState.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: false}) // TODO pass entity and room
		}
	}
	if fn := getScriptFunc(tbl, "didEnterRoom"); fn != nil {
		scripts.didEnterRoom = func(e *Entity, r *Room) {
			luaState.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: false}) // TODO pass entity and room
		}
	}
	return scripts
}

func getScriptFunc(tbl *lua.LTable, fnName string) *lua.LFunction {
	val := tbl.RawGetString(fnName)
	if val == lua.LNil {
		return nil
	}
	if fn, ok := val.(*lua.LFunction); !ok {
		log.Panicf("expected lua value '%s' to b a function", fnName)
		return nil
	} else {
		return fn
	}
}

func triggerEnterRoomScript(e *Entity, r *Room) {
	if e.cfg.scripts != nil && e.cfg.scripts.didEnterRoom != nil {
		e.cfg.scripts.didEnterRoom(e, r)
	}
}
func triggerWillLeaveRoomScript(e *Entity, r *Room) {
	if e.cfg.scripts != nil && e.cfg.scripts.willLeaveRoom != nil {
		e.cfg.scripts.willLeaveRoom(e, r)
	}
}
