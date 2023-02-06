package mud

import (
	"fmt"
	"log"
	"math/rand"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	Spawner_Entity SpawnerType = iota
	Spawner_Item
)

type SpawnerType int

var spawnerTypeStringMapping = utils.NewStringMapping(map[SpawnerType]string{
	Spawner_Entity: "entity",
	Spawner_Item:   "item",
})

func ParseSpawnerType(str string) (SpawnerType, error) {
	if val, ok := spawnerTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown zone spawner type: %s", str)
}

type ZoneSpawnerConfig struct {
	Type      SpawnerType
	Spawns    *utils.WeightedTableConfig[string]
	MaxActive int
	RoomIds   []RoomId
	Cooldown  utils.Seconds
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

func (s *ZoneSpawner) UpdateActive(time utils.Seconds) {
	writeIdx := 0
	for readIdx, a := range s.active {
		if a.RoomId() != InvalidId {
			s.active[writeIdx] = s.active[readIdx]
			writeIdx++
		} else {
			s.nextSpawnTime = time + s.cfg.Cooldown
		}
	}
	s.active = s.active[:writeIdx]
}

func (s *ZoneSpawner) CanSpawn(time utils.Seconds) bool {
	if time < s.nextSpawnTime || s.cfg.MaxActive <= len(s.active) {
		return false
	}
	return true
}

func (s *ZoneSpawner) Spawn(z *Zone, w *World) {
	if !s.CanSpawn(w.time) {
		return
	}

	var roomId RoomId
	if s.cfg.RoomIds != nil && len(s.cfg.RoomIds) > 0 {
		roomId = s.cfg.RoomIds[rand.Intn(len(s.cfg.RoomIds))]
	} else {
		roomId = z.rooms[rand.Intn(len(z.rooms))].cfg.Id
	}

	key := s.spawnTable.Select()
	var spawned RoomPresence
	switch s.cfg.Type {
	case Spawner_Entity:
		spawned = spawnEntityByKey(key, w, roomId)
	case Spawner_Item:
		r := w.rooms[roomId]
		spawned = spawnItemByKey(key, r)
	}
	s.active = append(s.active, spawned)
}

func spawnEntityByKey(key string, w *World, roomId RoomId) *Entity {
	if cfg, ok := lua_W.TryGetEntityConfig(key); ok {
		ent := NewEntity(cfg)
		calculateAndUpdateMonsterStats(ent.stats)
		w.AddEntity(ent, roomId)
		Write("%s appears", ObservableNameCap(ent)).ToEntityRoom(w, ent).Subject(ent).Send()
		return ent
	}
	log.Printf("Failed to spawn entity: %s", key)
	return nil
}

func spawnItemByKey(key string, into ItemContainer) *Item {
	if cfg, ok := lua_W.TryGetItemConfig(key); ok {
		item := NewItem(cfg)
		into.AddItem(item)
		return item
	}
	log.Printf("Failed to load item: %s", key)
	return nil
}
