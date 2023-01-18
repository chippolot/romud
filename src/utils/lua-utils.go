package utils

import lua "github.com/yuin/gopher-lua"

func ToUserData(L *lua.LState, val any) *lua.LUserData {
	data := L.NewUserData()
	data.Value = val
	return data
}
