package utils

import (
	"log"

	lua "github.com/yuin/gopher-lua"
)

func ToUserData(L *lua.LState, val interface{}) *lua.LUserData {
	data := L.NewUserData()
	data.Value = val
	return data
}

func WrapLuaFunc(L *lua.LState, val lua.LValue) func() {
	if val == lua.LNil {
		return nil
	}
	if luaFn, ok := val.(*lua.LFunction); !ok {
		log.Panicf("expected lua value to be a function")
		return nil
	} else {
		return func() {
			if err := L.CallByParam(lua.P{Fn: luaFn, NRet: 0, Protect: true}); err != nil {
				panic(err)
			}
		}
	}
}
