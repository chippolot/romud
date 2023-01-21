package mud

import (
	"log"

	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

type EntityScripts struct {
	enteredRoom       func(*Entity, *Room)
	entityEnteredRoom func(*Entity, *Entity, *Room)
	itemDropped       func(*Entity, *Room, *Item)
	givenItem         func(*Entity, *Entity, *Item)
	receivedItem      func(*Entity, *Item)
}

func NewEntityScripts(L *lua.LState, tbl *lua.LTable) *EntityScripts {
	scripts := &EntityScripts{}
	if fn := getScriptFunc(tbl, "entityEnteredRoom"); fn != nil {
		scripts.entityEnteredRoom = func(self *Entity, other *Entity, room *Room) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, self), utils.ToUserData(L, other), utils.ToUserData(L, room)); err != nil {
				log.Panicln("error calling enteredRoom script: ", err)
			}
		}
	}
	if fn := getScriptFunc(tbl, "enteredRoom"); fn != nil {
		scripts.enteredRoom = func(self *Entity, room *Room) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, self), utils.ToUserData(L, room)); err != nil {
				log.Panicln("error calling enteredRoom script: ", err)
			}
		}
	}
	if fn := getScriptFunc(tbl, "itemDropped"); fn != nil {
		scripts.itemDropped = func(self *Entity, room *Room, item *Item) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, self), utils.ToUserData(L, room), utils.ToUserData(L, item)); err != nil {
				log.Panicln("error calling itemDropped script: ", err)
			}
		}
	}
	if fn := getScriptFunc(tbl, "givenItem"); fn != nil {
		scripts.givenItem = func(self *Entity, from *Entity, item *Item) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, self), utils.ToUserData(L, from), utils.ToUserData(L, item)); err != nil {
				log.Panicln("error calling givenItem script: ", err)
			}
		}
	}
	if fn := getScriptFunc(tbl, "receivedItem"); fn != nil {
		scripts.receivedItem = func(self *Entity, item *Item) {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 0, Protect: true}, utils.ToUserData(L, self), utils.ToUserData(L, item)); err != nil {
				log.Panicln("error calling receivedItem script: ", err)
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
		log.Panicf("expected lua value '%s' to be a function", fnName)
		return nil
	} else {
		return fn
	}
}

func triggerEnterRoomScript(e *Entity, r *Room) {
	if e.cfg.scripts != nil && e.cfg.scripts.enteredRoom != nil {
		e.cfg.scripts.enteredRoom(e, r)
	}
}

func triggerEntityEnteredRoomScript(e *Entity, r *Room) {
	for _, e2 := range r.entities {
		if e2.cfg.scripts != nil && e2.cfg.scripts.entityEnteredRoom != nil {
			e2.cfg.scripts.entityEnteredRoom(e2, e, r)
		}
	}
}

func triggerItemDroppedScript(i *Item, r *Room) {
	for _, e := range r.entities {
		if e.cfg.scripts != nil && e.cfg.scripts.itemDropped != nil {
			e.cfg.scripts.itemDropped(e, r, i)
		}
	}
}

func triggerGivenItemScript(e *Entity, from *Entity, i *Item) {
	if e.cfg.scripts != nil && e.cfg.scripts.givenItem != nil {
		e.cfg.scripts.givenItem(e, from, i)
	}
}

func triggerReceivedItemScript(e *Entity, i *Item) {
	if e.cfg.scripts != nil && e.cfg.scripts.receivedItem != nil {
		e.cfg.scripts.receivedItem(e, i)
	}
}
