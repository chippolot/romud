package mud

import (
	"math/rand"

	lua "github.com/yuin/gopher-lua"
	luar "layeh.com/gopher-luar"
)

func RegisterGlobalLuaBindings(L *lua.LState, w *World) {
	entityTbl := L.NewTable()
	L.SetGlobal("entity", entityTbl)

	roomTbl := L.NewTable()
	L.SetGlobal("room", roomTbl)

	actTbl := L.NewTable()
	actTbl.RawSetString("say", luar.New(L, func(e EntityId, text string) { lua_performSay(w, e, text) }))
	actTbl.RawSetString("whisper", luar.New(L, func(e EntityId, e2 EntityId, text string) { lua_performWhisper(w, e, e2, text) }))
	actTbl.RawSetString("yell", luar.New(L, func(e EntityId, text string) { lua_performYell(w, e, text) }))
	L.SetGlobal("act", actTbl)

	utilTbl := L.NewTable()
	utilTbl.RawSetString("chance", luar.New(L, func() int { return rand.Intn(100) }))
	L.SetGlobal("util", utilTbl)
}

func lua_performSay(w *World, selfId EntityId, msg string) {
	self := w.entities[selfId]
	performSay(self, w, msg)
}

func lua_performWhisper(w *World, selfId EntityId, targetId EntityId, msg string) {
	self := w.entities[selfId]
	target := w.entities[targetId]
	performWhisper(self, w, target, msg)
}

func lua_performYell(w *World, selfId EntityId, msg string) {
	self := w.entities[selfId]
	performYell(self, w, msg)
}
