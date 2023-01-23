package mud

import (
	"fmt"
	"log"
	"math/rand"
	"reflect"

	"github.com/benkeatingsmith/gluamapper"
	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
	luar "layeh.com/gopher-luar"
)

var lua_W *World
var lua_Mapper *gluamapper.Mapper

func RegisterGlobalLuaBindings(L *lua.LState, w *World) {
	lua_W = w

	lua_Mapper = gluamapper.NewMapper(gluamapper.Option{DecodeHook: lua_DecodeHook})

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

	worldTbl := L.NewTable()
	worldTbl.RawSetString("LoadEntityLimited", luar.New(L, lua_WorldLoadEntityLimited))
	L.SetGlobal("World", worldTbl)

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
	configTable.RawSetString("NewRoom", luar.New(L, lua_ConfigNewRoom))
	configTable.RawSetString("NewEntity", luar.New(L, lua_ConfigNewEntity))
	configTable.RawSetString("NewItem", luar.New(L, lua_ConfigNewItem))
	L.SetGlobal("Config", configTable)

	utilTbl := L.NewTable()
	utilTbl.RawSetString("Chance", luar.New(L, lua_UtilChance))
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

func lua_RoomItems(r *Room) *lua.LTable {
	ret := lua_W.L.NewTable()
	for _, i := range r.items {
		ret.Append(utils.ToUserData(lua_W.L, i))
	}
	return ret
}

func lua_WorldLoadEntityLimited(entityKey string, roomId RoomId, max int) *lua.LUserData {
	if cfg, ok := lua_W.TryGetEntityConfig(entityKey); ok {
		ent := NewEntity(cfg)
		lua_W.AddEntity(ent, roomId)
		return utils.ToUserData(lua_W.L, ent)
	}
	log.Printf("Failed to load entity: %s", entityKey)
	return nil
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
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	cfg.resetFunc = utils.WrapLuaFunc(lua_W.L, tbl.RawGetString("ResetFunc"))
	lua_W.zones[cfg.Id] = cfg
}

func lua_ConfigNewRoom(tbl *lua.LTable) {
	cfg := &RoomConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	zoneId := ZoneId(-1)
	for _, z := range lua_W.zones {
		if cfg.Id >= z.MinRoomId && cfg.Id <= z.MaxRoomId {
			zoneId = z.Id
			break
		}
	}
	if zoneId == -1 {
		log.Fatalf("cannot find zone for room id %d", cfg.Id)
	}

	r, err := NewRoom(cfg, zoneId)
	if err != nil {
		log.Fatalf("failed to parse room with error: %v", err)
	}
	lua_W.AddRoom(r)
}

func lua_ConfigNewEntity(tbl *lua.LTable) {
	cfg := &EntityConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	cfg.Init()

	lTriggers := tbl.RawGetString("Triggers")
	if lTriggerTable, ok := lTriggers.(*lua.LTable); ok {
		cfg.scripts = NewEntityScripts(lua_W.L, lTriggerTable)
	}

	lua_W.AddEntityConfig(cfg)
}

func lua_ConfigNewItem(tbl *lua.LTable) {
	cfg := &ItemConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	cfg.Init()
	lua_W.AddItemConfig(cfg)
}

func lua_UtilChance() int {
	return rand.Intn(100)
}

func lua_DecodeHook(from reflect.Type, to reflect.Type, data interface{}) (interface{}, error) {
	var err error

	if to == reflect.TypeOf(Direction(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseDirection(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(Dice{}) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseDice(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(DamageType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseDamageType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(StatType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseStatType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(StatusEffectMask(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseStatusEffectType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(EntityFlagMask(0)) {
		if data, err = lua_parseFlagList[EntityFlagMask](data, func(s string) (interface{}, error) { return ParseEntityFlag(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(ItemFlagMask(0)) {
		if data, err = lua_parseFlagList[ItemFlagMask](data, func(s string) (interface{}, error) { return ParseItemFlag(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(EquipSlot(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseEquipmentSlot(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(RollType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseRollType(s) }); err != nil {
			return nil, err
		}
	}

	return data, nil
}

func lua_parseString(data interface{}, conv func(string) (interface{}, error)) (interface{}, error) {
	var err error
	if sdata, ok := data.(string); !ok {
		return nil, fmt.Errorf("cannot convert %T to string", data)
	} else {
		if data, err = conv(sdata); err != nil {
			return nil, err
		}
	}
	return data, nil
}

func lua_parseFlagList[T ~uint64](data interface{}, conv func(string) (interface{}, error)) (interface{}, error) {
	if slist, ok := data.([]interface{}); !ok {
		if smap, ok := data.(map[any]any); !ok || len(smap) != 0 {
			return nil, fmt.Errorf("cannot convert %T to []string", data)
		} else {
			return 0, nil
		}
	} else {
		var flags T
		for _, sraw := range slist {
			if sconv, err := lua_parseString(sraw, conv); err != nil {
				return nil, err
			} else {
				if sflag, ok := sconv.(T); !ok {
					return nil, fmt.Errorf("cannot convert %T to flags", sconv)
				} else {
					flags |= sflag
				}
			}
		}
		return flags, nil
	}
}
