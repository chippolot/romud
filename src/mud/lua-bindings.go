package mud

import (
	"fmt"
	"log"
	"math/rand"
	"reflect"

	"github.com/benkeatingsmith/gluamapper"
	"github.com/chippolot/romud/src/utils"
	lua "github.com/yuin/gopher-lua"
	luar "layeh.com/gopher-luar"
)

var lua_W *World
var lua_Mapper *gluamapper.Mapper

func RegisterGlobalLuaBindings(L *lua.LState, w *World) {
	lua_W = w

	lua_Mapper = gluamapper.NewMapper(gluamapper.Option{NameFunc: func(s string) string { return s }, DecodeHook: lua_DecodeHook})

	// Bind API
	entityTbl := L.NewTable()
	entityTbl.RawSetString("Name", luar.New(L, lua_EntityName))
	entityTbl.RawSetString("NameCap", luar.New(L, lua_EntityNameCap))
	entityTbl.RawSetString("RoomId", luar.New(L, lua_EntityRoomId))
	entityTbl.RawSetString("Room", luar.New(L, lua_EntityRoom))
	entityTbl.RawSetString("Zone", luar.New(L, lua_EntityZone))
	entityTbl.RawSetString("Stat", luar.New(L, lua_EntityStat))
	entityTbl.RawSetString("Element", luar.New(L, lua_EntityElement))
	entityTbl.RawSetString("EquipSlotOpen", luar.New(L, lua_EntityEquipSlotOpen))
	entityTbl.RawSetString("HealHP", luar.New(L, lua_EntityHealHP))
	entityTbl.RawSetString("HealSP", luar.New(L, lua_EntityHealSP))
	entityTbl.RawSetString("HealMov", luar.New(L, lua_EntityHealMov))
	entityTbl.RawSetString("InCombat", luar.New(L, lua_EntityInCombat))
	entityTbl.RawSetString("CanAttack", luar.New(L, lua_EntityCanAttack))
	entityTbl.RawSetString("CanTalk", luar.New(L, lua_EntityCanTalk))
	entityTbl.RawSetString("IsPlayer", luar.New(L, lua_EntityIsPlayer))
	L.SetGlobal("Entity", entityTbl)

	itemTbl := L.NewTable()
	itemTbl.RawSetString("Name", luar.New(L, lua_ItemName))
	itemTbl.RawSetString("NameCap", luar.New(L, lua_ItemNameCap))
	itemTbl.RawSetString("Equippable", luar.New(L, lua_ItemEquippable))
	itemTbl.RawSetString("EquipSlot", luar.New(L, lua_ItemEquipSlot))
	L.SetGlobal("Item", itemTbl)

	roomTbl := L.NewTable()
	roomTbl.RawSetString("Entities", luar.New(L, lua_RoomEntities))
	roomTbl.RawSetString("Items", luar.New(L, lua_RoomItems))
	L.SetGlobal("Room", roomTbl)

	zoneTbl := L.NewTable()
	zoneTbl.RawSetString("RandomRoom", luar.New(L, lua_ZoneRandomRoom))
	L.SetGlobal("Zone", zoneTbl)

	actTbl := L.NewTable()
	actTbl.RawSetString("Attack", luar.New(L, lua_ActAttack))
	actTbl.RawSetString("SkillAttack", luar.New(L, lua_ActSkillAttack))
	actTbl.RawSetString("Get", luar.New(L, lua_ActGet))
	actTbl.RawSetString("Equip", luar.New(L, lua_ActEquip))
	actTbl.RawSetString("MoveDir", luar.New(L, lua_ActMoveDir))
	actTbl.RawSetString("MoveTo", luar.New(L, lua_ActMoveTo))
	actTbl.RawSetString("Say", luar.New(L, lua_ActSay))
	actTbl.RawSetString("Tell", luar.New(L, lua_ActTell))
	actTbl.RawSetString("Yell", luar.New(L, lua_ActYell))
	actTbl.RawSetString("IncreaseDistance", luar.New(L, lua_ActIncreaseDistance))
	L.SetGlobal("Act", actTbl)

	spawnTbl := L.NewTable()
	spawnTbl.RawSetString("Item", luar.New(L, lua_SpawnItem))
	spawnTbl.RawSetString("Entity", luar.New(L, lua_SpawnEntity))
	L.SetGlobal("Spawn", spawnTbl)

	destroyTbl := L.NewTable()
	destroyTbl.RawSetString("Entity", luar.New(L, lua_DestroyEntity))
	L.SetGlobal("Destroy", destroyTbl)

	writeTbl := L.NewTable()
	writeTbl.RawSetString("ToPlayer", luar.New(L, lua_WriteToPlayer))
	writeTbl.RawSetString("ToRoom", luar.New(L, lua_WriteToRoom))
	L.SetGlobal("Write", writeTbl)

	configTable := L.NewTable()
	configTable.RawSetString("NewZone", luar.New(L, lua_ConfigNewZone))
	configTable.RawSetString("NewRoom", luar.New(L, lua_ConfigNewRoom))
	configTable.RawSetString("NewShop", luar.New(L, lua_ConfigNewShop))
	configTable.RawSetString("NewEntity", luar.New(L, lua_ConfigNewEntity))
	configTable.RawSetString("NewItem", luar.New(L, lua_ConfigNewItem))
	configTable.RawSetString("NewSkill", luar.New(L, lua_ConfigNewSkill))
	configTable.RawSetString("NewJob", luar.New(L, lua_ConfigNewJob))
	configTable.RawSetString("RegisterNouns", luar.New(L, lua_ConfigRegisterNouns))
	configTable.RawSetString("RegisterNewPlayerScript", luar.New(L, lua_ConfigRegisterNewPlayerScript))
	L.SetGlobal("Config", configTable)

	asyncTbl := L.NewTable()
	asyncTbl.RawSetString("Delay", luar.New(L, lua_AsyncDelay))
	L.SetGlobal("Async", asyncTbl)

	utilTbl := L.NewTable()
	utilTbl.RawSetString("RandomChance", luar.New(L, lua_UtilChance))
	utilTbl.RawSetString("RandomRange", luar.New(L, lua_UtilRandomRange))
	L.SetGlobal("Util", utilTbl)

	// Bind enums
	lua_BindEnum(L, "Dir", directionStringMapping.ToString)
	lua_BindEnum(L, "Stat", statTypeStringMapping.ToString)
	lua_BindEnum(L, "Element", elementStringMapping.ToString)
	lua_BindEnum(L, "Size", sizeStringMapping.ToString)
	lua_BindEnum(L, "Speed", speedStringMapping.ToString)
	lua_BindEnum(L, "Element", elementStringMapping.ToString)
	lua_BindEnum(L, "SkillType", skillTypeStringMapping.ToString)
	lua_BindEnum(L, "SkillAttackType", skillAttackTypeStringMapping.ToString)
	lua_BindEnum(L, "SkillTargetType", skillTargetTypeStringMapping.ToString)
	lua_BindEnum(L, "WeaponType", weaponTypeStringMapping.ToString)
	lua_BindEnum(L, "SpawnerType", spawnerTypeStringMapping.ToString)
	lua_BindEnum(L, "EntityState", entityStateStringMapping.ToString)
	lua_BindEnum(L, "Race", raceStringMapping.ToString)
	lua_BindEnum(L, "JobTier", jobTierStringMapping.ToString)
	lua_BindEnumFlags(L, "EquipSlot", equipSlotStringMapping.ToString)
	lua_BindEnumFlags(L, "JobType", jobTypeMaskStringMapping.ToString)

	// Fool Lua into thinking that the shim API file has already been loaded
	if mudConfig.LuaAPIFile != "" {
		loaded := L.GetField(L.Get(lua.RegistryIndex), "_LOADED")
		L.SetField(loaded, mudConfig.LuaAPIFile, lua.LBool(true))
	}
}

func lua_EntityName(e *Entity) string {
	return e.GetName()
}

func lua_EntityNameCap(e *Entity) string {
	return e.GetNameCapitalized()
}

func lua_EntityRoomId(e *Entity) RoomId {
	return e.data.RoomId
}

func lua_EntityRoom(e *Entity) *Room {
	return lua_W.rooms[e.data.RoomId]
}

func lua_EntityZone(e *Entity) *Zone {
	r := lua_W.rooms[e.data.RoomId]
	if r == nil {
		return nil
	}
	return lua_W.zones[r.zone]
}

func lua_EntityStat(e *Entity, lStat lua.LString) int {
	stat, err := ParseStatType(lua.LVAsString(lStat))
	if err != nil {
		log.Panicln(err)
		return 0
	}
	return e.stats.Get(stat)
}

func lua_EntityElement(e *Entity) Element {
	return e.stats.cfg.Element
}

func lua_EntityEquipSlotOpen(e *Entity, slot EquipSlot) bool {
	_, ok := e.data.Equipped[slot]
	return !ok
}

func lua_EntityHealHP(e *Entity, amount int) {
	e.stats.Add(Stat_HP, amount)
}

func lua_EntityHealSP(e *Entity, amount int) {
	e.stats.Add(Stat_SP, amount)
}

func lua_EntityHealMov(e *Entity, amount int) {
	e.stats.Add(Stat_Mov, amount)
}

func lua_EntityInCombat(e *Entity) bool {
	return e.combat != nil
}

func lua_EntityCanAttack(e *Entity, tgt *Entity) bool {
	ok, _ := validateAttack(e, tgt)
	return ok
}

func lua_EntityCanTalk(e *Entity) bool {
	return e.entityFlags.Has(EFlag_Talks)
}

func lua_EntityIsPlayer(e *Entity) bool {
	return e.player != nil
}

func lua_ItemName(i *Item) string {
	return i.GetName()
}

func lua_ItemNameCap(i *Item) string {
	return i.GetNameCapitalized()
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

func lua_RoomEntities(r *Room) *lua.LTable {
	ret := lua_W.L.NewTable()
	for _, e := range r.entities {
		ret.Append(utils.ToUserData(lua_W.L, e))
	}
	return ret
}

func lua_RoomItems(r *Room) *lua.LTable {
	ret := lua_W.L.NewTable()
	for _, i := range r.items {
		ret.Append(utils.ToUserData(lua_W.L, i))
	}
	return ret
}

func lua_ZoneRandomRoom(z *Zone) *Room {
	numrooms := len(z.rooms)
	if numrooms == 0 {
		return nil
	}
	return z.rooms[rand.Intn(numrooms)]
}

func lua_ActAttack(self *Entity, target *Entity) {
	performAttack(self, lua_W, target)
}

func lua_ActSkillAttack(self *Entity, targets []*Entity, skill *SkillConfig, attackTbl *lua.LTable) {
	skillAttack := &SkillAttack{}
	if err := lua_Mapper.Map(attackTbl, skillAttack); err != nil {
		panic(err)
	}
	skillAttack.skill = skill
	performSkillAttack(self, lua_W, targets, skillAttack)
}

func lua_ActGet(self *Entity, item *Item) {
	performGet(self, lua_W, lua_W.rooms[self.data.RoomId], item)
}

func lua_ActEquip(self *Entity, item *Item, silent bool) {
	performEquip(self, lua_W, item, silent)
}

func lua_ActMoveDir(self *Entity, lDir lua.LString) {
	dir, err := ParseDirection(lua.LVAsString(lDir))
	if err != nil {
		log.Panicln(err)
		return
	}
	performMoveDirection(self, lua_W, dir)
}

func lua_ActMoveTo(self *Entity, r *Room) {
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

func lua_SpawnItem(key string, into ItemContainer) *Item {
	return spawnItemByKey(key, into)
}

func lua_SpawnEntity(key string, room *Room) *Entity {
	return spawnEntityByKey(key, lua_W, room.cfg.Id)
}

func lua_DestroyEntity(entity *Entity) {
	lua_W.RemoveEntity(entity.id)
}

func lua_ActIncreaseDistance(self *Entity, amt int) {
	r := lua_W.rooms[self.data.RoomId]
	for _, e := range r.entities {
		if e.combat != nil && (e == self || e.combat.target == self) {
			e.combat.distance += float64(amt)
		}
	}
}

func lua_WriteToPlayer(e *Entity, msg string) {
	Write(msg).ToPlayer(e).Send()
}

func lua_WriteToRoom(r *Room, except []*Entity, msg string) {
	b := Write(msg).ToRoom(r)
	for _, e := range except {
		b = b.Ignore(e)
	}
	b.Send()
}

func lua_ConfigNewZone(tbl *lua.LTable) {
	cfg := &ZoneConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	lua_W.zones[cfg.Id] = NewZone(cfg)
}

func lua_ConfigNewRoom(tbl *lua.LTable) {
	cfg := &RoomConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	zoneId := ZoneId(InvalidId)
	for _, z := range lua_W.zones {
		if cfg.Id >= z.cfg.MinRoomId && cfg.Id <= z.cfg.MaxRoomId {
			zoneId = z.cfg.Id
			break
		}
	}
	if zoneId == InvalidId {
		log.Fatalf("cannot find zone for room id %d", cfg.Id)
	}

	r, err := NewRoom(cfg, zoneId)
	if err != nil {
		log.Fatalf("failed to parse room with error: %v", err)
	}
	lua_W.AddRoom(r)
}

func lua_ConfigNewShop(tbl *lua.LTable) {
	cfg := &ShopConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	lua_W.shops[cfg.RoomId] = NewShop(cfg)
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

	lScripts := tbl.RawGetString("Scripts")
	if lScriptsTable, ok := lScripts.(*lua.LTable); ok {
		cfg.scripts = NewItemScripts(lua_W.L, lScriptsTable)
	}

	lua_W.AddItemConfig(cfg)
}

func lua_ConfigNewSkill(tbl *lua.LTable) {
	cfg := &SkillConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}

	lScripts := tbl.RawGetString("Scripts")
	if lScriptsTable, ok := lScripts.(*lua.LTable); ok {
		cfg.scripts = NewSkillScripts(lua_W.L, lScriptsTable)
	}

	lua_W.AddSkillConfig(cfg)
}

func lua_ConfigNewJob(tbl *lua.LTable) {
	cfg := &JobConfig{}
	if err := lua_Mapper.Map(tbl, cfg); err != nil {
		panic(err)
	}
	cfg.Init()

	lua_W.AddJobConfig(cfg)
}

func lua_ConfigRegisterNouns(tbl *lua.LTable) {
	nouns, ok := gluamapper.ToGoValue(tbl, gluamapper.Option{}).([]interface{})
	if !ok {
		panic("failed to map arg #1 to array")
	}
	if len(nouns)%2 != 0 {
		panic("expected even number of nouns")
	}
	for i := 0; i < len(nouns); i += 2 {
		ns := nouns[i].(string)
		np := nouns[i+1].(string)
		noun := &NounConfig{ns, np}
		lua_W.cfg.vocab.nouns[noun.Singular] = noun
	}
	log.Printf("registered %d nouns", len(nouns)/2)
}

func lua_ConfigRegisterNewPlayerScript(luaFn *lua.LFunction) {
	lua_W.cfg.newPlayerFn = func(player *Entity) {
		if err := lua_W.L.CallByParam(lua.P{Fn: luaFn, NRet: 1, Protect: false}, utils.ToUserData(lua_W.L, player)); err != nil {
			log.Panicln("error calling new player script: ", err)
		}
	}
}

func lua_AsyncDelay(secs utils.Seconds, luaFn *lua.LFunction) {
	fn := utils.WrapLuaFunc(lua_W.L, luaFn)
	lua_W.asyncCallbacks.AddBack(&AsyncCallback{lua_W.time + secs, fn})
}

func lua_UtilChance() int {
	return rand.Intn(100)
}

func lua_UtilRandomRange(min int, max int) int {
	return utils.RandRange(min, max)
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
	} else if to == reflect.TypeOf(Range{}) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseRange(s) }); err != nil {
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
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseEquipSlot(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(WeaponType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseWeaponType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(Element(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseElement(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(Size(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseSize(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(SpawnerType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseSpawnerType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(Speed(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseSpeed(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(SkillType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseSkillType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(SkillTargetType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseSkillTargetType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(EntityState(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseEntityState(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(SkillAttackType(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseSkillAttackType(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(Race(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseRace(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(JobTier(0)) {
		if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseJobTier(s) }); err != nil {
			return nil, err
		}
	} else if to == reflect.TypeOf(JobTypeMask(0)) {
		if from.Kind() == reflect.String {
			if data, err = lua_parseString(data, func(s string) (interface{}, error) { return ParseJobTypeMask(s) }); err != nil {
				return nil, err
			}
		} else if from.Kind() == reflect.Slice {
			if data, err = lua_parseFlagList[JobTypeMask](data, func(s string) (interface{}, error) { return ParseJobTypeMask(s) }); err != nil {
				return nil, err
			}
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

func lua_BindEnum[T ~int](L *lua.LState, name string, mapping map[T]string) {
	dirTbl := L.NewTable()
	for _, str := range mapping {
		dirTbl.RawSetString(utils.SnakeFriendlyTitle(str), lua.LString(str))
	}
	L.SetGlobal(name, dirTbl)
}

func lua_BindEnumFlags[T ~uint64](L *lua.LState, name string, mapping map[T]string) {
	dirTbl := L.NewTable()
	for _, str := range mapping {
		dirTbl.RawSetString(utils.SnakeFriendlyTitle(str), lua.LString(str))
	}
	L.SetGlobal(name, dirTbl)
}
