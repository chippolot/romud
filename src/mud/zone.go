package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	ZoneSpawner_Entity ZoneSpawnerType = iota
	ZoneSpawner_Item
)

type ZoneId int32
type ZoneSpawnerType int32

var zoneSpawnerTypeStringMapping = utils.NewStringMapping(map[ZoneSpawnerType]string{
	ZoneSpawner_Entity: "entity",
	ZoneSpawner_Item:   "item",
})

func ParseZoneSpawnerType(str string) (ZoneSpawnerType, error) {
	if val, ok := zoneSpawnerTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown zone spawner type: %s", str)
}

func (s *ZoneSpawnerType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseZoneSpawnerType(str); err != nil {
		return nil
	} else {
		return err
	}
}

type ZoneConfig struct {
	Id        ZoneId
	Name      string
	MinRoomId RoomId
	MaxRoomId RoomId
	Spawners  []*ZoneSpawnerConfig
}

type ZoneSpawnerConfig struct {
	Type      ZoneSpawnerType
	Spawns    *utils.WeightedTableConfig[string]
	MaxActive int
	RoomIds   []RoomId
	Cooldown  utils.Seconds
}

type Zone struct {
	cfg      *ZoneConfig
	spawners []*ZoneSpawner
	rooms    []*Room
}

func NewZone(cfg *ZoneConfig) *Zone {
	spawners := make([]*ZoneSpawner, 0, len(cfg.Spawners))
	for _, s := range cfg.Spawners {
		spawners = append(spawners, NewZoneSpawner(s))
	}
	return &Zone{cfg, spawners, make([]*Room, 0)}
}

type ZoneSpawner struct {
	cfg           *ZoneSpawnerConfig
	spawnTable    *utils.WeightedTable[string]
	active        []RoomPresence
	nextSpawnTime utils.Seconds
}

func NewZoneSpawner(cfg *ZoneSpawnerConfig) *ZoneSpawner {
	return &ZoneSpawner{cfg, utils.NewWeightedTable(*cfg.Spawns), make([]RoomPresence, 0), 0}
}

func (s *ZoneSpawner) UpdateActive(t *GameTime) {
	writeIdx := 0
	for readIdx, a := range s.active {
		if a.RoomId() != InvalidId {
			s.active[writeIdx] = s.active[readIdx]
			writeIdx++
		} else {
			s.nextSpawnTime = t.time + s.cfg.Cooldown
		}
	}
	s.active = s.active[:writeIdx]
}

func (s *ZoneSpawner) CanSpawn(t *GameTime) bool {
	if t.time < s.nextSpawnTime || s.cfg.MaxActive <= len(s.active) {
		return false
	}
	return true
}

func (s *ZoneSpawner) Spawn(z *Zone, w *World) {
	if !s.CanSpawn(w.time) {
		return
	}

	getRoomId := func() RoomId {
		if s.cfg.RoomIds != nil && len(s.cfg.RoomIds) > 0 {
			return s.cfg.RoomIds[rand.Intn(len(s.cfg.RoomIds))]
		} else {
			return z.rooms[rand.Intn(len(z.rooms))].cfg.Id
		}
	}

	key := s.spawnTable.Select()
	var spawned RoomPresence
	switch s.cfg.Type {
	case ZoneSpawner_Entity:
		if cfg, ok := lua_W.TryGetEntityConfig(key); ok {
			ent := NewEntity(cfg)
			spawned = ent
			calculateAndUpdateMonsterStats(ent.stats)
			w.AddEntity(ent, getRoomId())
			Write("%s appears", ObservableNameCap(ent)).ToEntityRoom(w, ent).Subject(ent).Send()
		} else {
			log.Printf("Failed to load entity: %s", key)
		}
	case ZoneSpawner_Item:
		if cfg, ok := lua_W.TryGetItemConfig(key); ok {
			itm := NewItem(cfg)
			spawned = itm
			w.AddItem(itm, getRoomId())
		} else {
			log.Printf("Failed to load item: %s", key)
		}
	}
	s.active = append(s.active, spawned)
}
