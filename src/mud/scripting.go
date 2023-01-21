package mud

import (
	"math/rand"

	"github.com/chippolot/go-mud/src/utils"
	"github.com/yuin/gluamapper"
	lua "github.com/yuin/gopher-lua"
	luar "layeh.com/gopher-luar"
)

func RegisterGlobalLuaBindings(L *lua.LState, w *World) {
	lua_W = w

	entityTbl := L.NewTable()
	entityTbl.RawSetString("Name", luar.New(L, lua_EntityName))
	entityTbl.RawSetString("EquipSlotOpen", luar.New(L, lua_EntityEquipSlotOpen))
	L.SetGlobal("Entity", entityTbl)

	itemTbl := L.NewTable()
	itemTbl.RawSetString("Equippable", luar.New(L, lua_ItemEquippable))
	itemTbl.RawSetString("EquipSlot", luar.New(L, lua_ItemEquipSlot))
	L.SetGlobal("Item", itemTbl)

	roomTbl := L.NewTable()
	roomTbl.RawSetString("Items", luar.New(L, lua_RoomItems))
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
	actTbl.RawSetString("Attack", luar.New(L, lua_ActAttack))
	actTbl.RawSetString("Get", luar.New(L, lua_ActGet))
	actTbl.RawSetString("Equip", luar.New(L, lua_ActEquip))
	actTbl.RawSetString("MoveDir", luar.New(L, lua_ActMoveDir))
	actTbl.RawSetString("MoveTo", luar.New(L, lua_ActMoveRoom))
	actTbl.RawSetString("Say", luar.New(L, lua_ActSay))
	actTbl.RawSetString("Tell", luar.New(L, lua_ActTell))
	actTbl.RawSetString("Yell", luar.New(L, lua_ActYell))
	L.SetGlobal("Act", actTbl)

	configTable := L.NewTable()
	configTable.RawSetString("NewZone", luar.New(L, lua_ConfigNewZone))
	L.SetGlobal("Config", configTable)

	utilTbl := L.NewTable()
	utilTbl.RawSetString("Chance", luar.New(L, lua_UtilChance))
	L.SetGlobal("Util", utilTbl)
}

var lua_W *World

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

func lua_RoomItems(r *Room) *lua.LTable {
	ret := lua_W.L.NewTable()
	for _, i := range r.items {
		ret.Append(utils.ToUserData(lua_W.L, i))
	}
	return ret
}

func lua_ActAttack(self *Entity, target *Entity) {
	performAttack(self, lua_W, target)
}

func lua_ActGet(self *Entity, r *Room, item *Item) {
	performGet(self, lua_W, r, item)
}

func lua_ActEquip(self *Entity, item *Item) {
	performEquip(self, lua_W, item)
}

func lua_ActMoveDir(self *Entity, dir Direction) {
	performMoveDirection(self, lua_W, dir)
}

func lua_ActMoveRoom(self *Entity, r *Room) {
	performMoveRoom(self, lua_W, r)
}

func lua_ActSay(self *Entity, msg string) {
	performSay(self, lua_W, msg)
}

func lua_ActTell(self *Entity, target *Entity, msg string) {
	performTell(self, lua_W, target, msg)
}

func lua_ActYell(self *Entity, msg string) {
	performYell(self, lua_W, msg)
}

func lua_ConfigNewZone(tbl *lua.LTable) {
	cfg := &ZoneConfig{}
	if err := gluamapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	cfg.ResetFunc = utils.WrapLuaFunc(lua_W.L, tbl.RawGetString("ResetFunc"))
	lua_W.zones[cfg.Id] = cfg
}

func lua_UtilChance() int {
	return rand.Intn(100)
}
