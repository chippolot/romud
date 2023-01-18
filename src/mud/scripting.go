package mud

import (
	"math/rand"

	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
	luar "layeh.com/gopher-luar"
)

func RegisterGlobalLuaBindings(L *lua.LState, w *World) {
	entityTbl := L.NewTable()
	entityTbl.RawSetString("Name", luar.New(L, lua_EntityName))
	entityTbl.RawSetString("EquipSlotOpen", luar.New(L, lua_EntityEquipSlotOpen))
	L.SetGlobal("Entity", entityTbl)

	itemTbl := L.NewTable()
	itemTbl.RawSetString("Equippable", luar.New(L, lua_ItemEquippable))
	itemTbl.RawSetString("EquipSlot", luar.New(L, lua_ItemEquipSlot))
	L.SetGlobal("Item", itemTbl)

	roomTbl := L.NewTable()
	roomTbl.RawSetString("Items", luar.New(L, func(r *Room) *lua.LTable { return lua_RoomItems(w, r) }))
	L.SetGlobal("Room", roomTbl)

	dirTbl := L.NewTable()
	dirTbl.RawSetString("North", lua.LNumber(DirNorth))
	dirTbl.RawSetString("South", lua.LNumber(DirSouth))
	dirTbl.RawSetString("East", lua.LNumber(DirEast))
	dirTbl.RawSetString("West", lua.LNumber(DirWest))
	dirTbl.RawSetString("Up", lua.LNumber(DirUp))
	dirTbl.RawSetString("Down", lua.LNumber(DirDown))
	L.SetGlobal("Dir", dirTbl)

	actTbl := L.NewTable()
	actTbl.RawSetString("Attack", luar.New(L, func(e *Entity, e2 *Entity) { lua_ActAttack(w, e, e2) }))
	actTbl.RawSetString("Get", luar.New(L, func(e *Entity, r *Room, i *Item) { lua_ActGet(w, e, r, i) }))
	actTbl.RawSetString("Equip", luar.New(L, func(e *Entity, i *Item) { lua_ActEquip(w, e, i) }))
	actTbl.RawSetString("MoveDir", luar.New(L, func(e *Entity, dir Direction) { lua_ActMoveDir(w, e, dir) }))
	actTbl.RawSetString("MoveTo", luar.New(L, func(e *Entity, r *Room) { lua_ActMoveRoom(w, e, r) }))
	actTbl.RawSetString("Say", luar.New(L, func(e *Entity, text string) { lua_ActSay(w, e, text) }))
	actTbl.RawSetString("Whisper", luar.New(L, func(e *Entity, e2 *Entity, text string) { lua_ActWhisper(w, e, e2, text) }))
	actTbl.RawSetString("Yell", luar.New(L, func(e *Entity, text string) { lua_ActYell(w, e, text) }))
	L.SetGlobal("Act", actTbl)

	utilTbl := L.NewTable()
	utilTbl.RawSetString("Chance", luar.New(L, func() int { return rand.Intn(100) }))
	L.SetGlobal("Util", utilTbl)
}

func lua_EntityName(e *Entity) string {
	return e.Name()
}

func lua_EntityEquipSlotOpen(e *Entity, slot EquipSlot) bool {
	_, ok := e.data.Equipped[slot]
	return !ok
}

func lua_ItemEquippable(i *Item) bool {
	return i.cfg.Equipment != nil
}

func lua_ItemEquipSlot(i *Item) EquipSlot {
	if i.cfg.Equipment == nil {
		return EqSlot_None
	}
	return i.cfg.Equipment.Slot
}

func lua_RoomItems(w *World, r *Room) *lua.LTable {
	ret := w.L.NewTable()
	for _, i := range r.items {
		ret.Append(utils.ToUserData(w.L, i))
	}
	return ret
}

func lua_ActAttack(w *World, self *Entity, target *Entity) {
	performAttack(self, w, target)
}

func lua_ActGet(w *World, self *Entity, r *Room, item *Item) {
	performGet(self, w, r, item)
}

func lua_ActEquip(w *World, self *Entity, item *Item) {
	performEquip(self, w, item)
}

func lua_ActMoveDir(w *World, self *Entity, dir Direction) {
	performMoveDirection(self, w, dir)
}

func lua_ActMoveRoom(w *World, self *Entity, r *Room) {
	performMoveRoom(self, w, r)
}

func lua_ActSay(w *World, self *Entity, msg string) {
	performSay(self, w, msg)
}

func lua_ActWhisper(w *World, self *Entity, target *Entity, msg string) {
	performWhisper(self, w, target, msg)
}

func lua_ActYell(w *World, self *Entity, msg string) {
	performYell(self, w, msg)
}
