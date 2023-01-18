package mud

import (
	"log"

	lua "github.com/yuin/gopher-lua"
)

type EntityScripts struct {
	enteredRoom       func(EntityId, RoomId)
	entityEnteredRoom func(EntityId, EntityId, RoomId)
}

func NewEntityScripts(L *lua.LState, tbl *lua.LTable) *EntityScripts {
	scripts := &EntityScripts{}
	if fn := getScriptFunc(tbl, "entityEnteredRoom"); fn != nil {
		scripts.entityEnteredRoom = func(self EntityId, other EntityId, room RoomId) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, lua.LNumber(self), lua.LNumber(other), lua.LNumber(room)); err != nil {
				log.Panicln("error calling enteredRoom script: ", err)
			}
		}
	}
	if fn := getScriptFunc(tbl, "enteredRoom"); fn != nil {
		scripts.enteredRoom = func(self EntityId, room RoomId) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, lua.LNumber(self), lua.LNumber(room)); err != nil {
				log.Panicln("error calling enteredRoom script: ", err)
			}
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
	if e.cfg.scripts != nil && e.cfg.scripts.enteredRoom != nil {
		e.cfg.scripts.enteredRoom(e.id, r.cfg.Id)
	}
}
func triggerEntityEnteredRoomScript(e *Entity, r *Room) {
	for _, e2 := range r.entities {
		if e2.cfg.scripts != nil && e2.cfg.scripts.entityEnteredRoom != nil {
			e2.cfg.scripts.entityEnteredRoom(e2.id, e.id, r.cfg.Id)
		}
	}
}
