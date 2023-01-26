package mud

import (
	"log"
	"strings"
	"time"

	"github.com/chippolot/go-mud/src/mud/server"
	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

type World struct {
	db Database
	L  *lua.LState

	entityConfigs map[string]*EntityConfig
	itemConfigs   map[string]*ItemConfig
	vocab         *Vocab

	players      map[PlayerId]*Entity
	sessions     map[server.SessionId]*server.Session
	rooms        map[RoomId]*Room
	zones        map[ZoneId]*Zone
	entities     map[EntityId]*Entity
	entityCounts map[string]int
	itemCounts   map[string]int

	entryRoomId RoomId
	inCombat    *CombatList
	loggingOut  map[PlayerId]bool

	events chan<- server.SessionEvent
}

func NewWorld(db Database, l *lua.LState, events chan<- server.SessionEvent) *World {
	return &World{
		db,
		l,
		make(map[string]*EntityConfig),
		make(map[string]*ItemConfig),
		NewVocab(),
		make(map[PlayerId]*Entity),
		make(map[server.SessionId]*server.Session),
		make(map[RoomId]*Room),
		make(map[ZoneId]*Zone),
		make(map[EntityId]*Entity),
		make(map[string]int),
		make(map[string]int),
		0,
		&CombatList{},
		make(map[PlayerId]bool),
		events,
	}
}

func (w *World) EntryRoomId() RoomId {
	return w.entryRoomId
}

func (w *World) SetEntryRoomId(id RoomId) {
	w.entryRoomId = id
}

func (w *World) CreatePlayerCharacter(name string, pass string, player *Player) *Entity {
	playerEntityCfg, ok := w.entityConfigs[PlayerEntityKey]
	if !ok {
		log.Fatalf("cannot create player. expected entity config with key %s", PlayerEntityKey)
	}
	e := NewEntity(playerEntityCfg)
	e.player = player
	e.player.data = &PlayerData{Name: name, Pass: pass}
	calculateAndUpdatePlayerStats(e.stats)
	e.stats.Set(Stat_HP, e.stats.Get(Stat_MaxHP))
	e.stats.Set(Stat_SP, e.stats.Get(Stat_MaxSP))
	e.stats.Set(Stat_Mov, e.stats.Get(Stat_MaxMov))
	return e
}

func (w *World) TryLoadPlayerCharacter(name string, player *Player) (*Entity, error) {
	data, err := w.db.LoadPlayer(name)
	if err != nil {
		return nil, err
	}

	// Create character entity
	e := w.CreatePlayerCharacter(name, data.Player.Pass, player)
	e.SetData(data.Character, w)
	e.player.SetData(data.Player)

	// Heal up
	timeSinceSave := time.Now().UTC().Sub(e.player.data.LastSavedAt)
	hpPerMin := 15
	spPerMin := 6
	movPerMin := 15
	e.stats.Add(Stat_HP, int(timeSinceSave.Minutes()*float64(hpPerMin)))
	e.stats.Add(Stat_SP, int(timeSinceSave.Minutes()*float64(spPerMin)))
	e.stats.Add(Stat_Mov, int(timeSinceSave.Minutes()*float64(movPerMin)))

	// Update status effect durations
	for statusType, se := range e.data.Statuses {
		se.Duration -= utils.Seconds(timeSinceSave.Seconds())
		if se.Duration <= 0 {
			e.RemoveStatusEffect(statusType, false)
		}
	}

	return e, nil
}

func (w *World) SavePlayerCharacter(pid PlayerId) {
	e, ok := w.players[pid]
	if !ok {
		log.Printf("failed to resolve player entity for player %v", pid)
		return
	}

	// Record last save time
	e.player.data.LastSavedAt = time.Now().UTC()

	data := &PlayerCharacterData{e.player.data, e.data}
	go func() {
		err := w.db.SavePlayer(e.Name(), data)
		if err != nil {
			log.Printf("error saving player %v -- %v", e.Name(), err)
		} else {

			log.Printf("saved player %v", e.Name())
		}
	}()
}

func (w *World) AddEntityConfig(cfg *EntityConfig) {
	if _, found := w.entityConfigs[cfg.Key]; found {
		log.Fatalf("Registered multiple entity configs with key: %v", cfg.Key)
	}
	w.entityConfigs[cfg.Key] = cfg
}

func (w *World) TryGetEntityConfig(key string) (*EntityConfig, bool) {
	if cfg, ok := w.entityConfigs[key]; ok {
		return cfg, true
	}
	return nil, false
}

func (w *World) AddEntity(e *Entity, roomId RoomId) {
	w.entities[e.id] = e
	w.entityCounts[e.cfg.Key] += 1

	r, ok := w.rooms[roomId]
	if !ok {
		log.Panicf("invalid room: %d", roomId)
	}
	r.AddEntity(e)

	if e.player != nil {
		w.players[e.player.id] = e
		Write("%s Joins", ObservableName(e)).ToWorld(w).Subject(e).Restricted(SendRst_CanSee).Send()
		Write(Preamble).ToPlayer(e).Send()

		DoLook(e, w, nil)
	}
}

func (w *World) EntityCount(key string) int {
	return w.entityCounts[key]
}

func (w *World) TryGetEntityByPlayerId(id PlayerId) (*Entity, bool) {
	if e, ok := w.players[id]; ok {
		return e, true
	}
	return nil, false
}

func (w *World) RemoveEntity(eid EntityId) {
	e, ok := w.entities[eid]
	if !ok {
		return
	}

	w.entityCounts[e.cfg.Key] -= 1

	r := w.rooms[e.data.RoomId]
	r.RemoveEntity(e)
	delete(w.entities, eid)

	e.combat = nil
	e.data.RoomId = InvalidId

	if e.player != nil && e.stats.Condition() != Cnd_Dead {
		delete(w.players, e.player.id)
		delete(w.loggingOut, e.player.id)
		Write("%s Leaves", ObservableName(e)).ToWorld(w).Subject(e).Restricted(SendRst_CanSee).Send()
	}
}

func (w *World) AddItemConfig(cfg *ItemConfig) {
	if _, found := w.itemConfigs[cfg.Key]; found {
		log.Fatalf("Registered multiple item configs with key: %v", cfg.Key)
	}
	w.itemConfigs[cfg.Key] = cfg
}

func (w *World) TryGetItemConfig(key string) (*ItemConfig, bool) {
	if cfg, ok := w.itemConfigs[key]; ok {
		return cfg, true
	}
	return nil, false
}

func (w *World) AddItem(i *Item, roomId RoomId) {
	r := w.rooms[roomId]
	w.itemCounts[i.cfg.Key] += 1
	r.AddItem(i)
}

func (w *World) ItemCount(key string) int {
	return w.itemCounts[key]
}

func (w *World) LogoutPlayer(p *Player) {
	if _, ok := w.loggingOut[p.id]; ok {
		return
	}
	w.loggingOut[p.id] = true
	w.events <- server.SessionEvent{Session: p.session, Event: &ChangeStateEvent{GameState_LoggedOut}}
}

func (w *World) AddSession(s *server.Session) {
	w.sessions[s.Id] = s
}

func (w *World) RemoveSession(sid server.SessionId) {
	delete(w.sessions, sid)
}

func (w *World) AddRoom(r *Room) *Room {
	w.rooms[r.cfg.Id] = r
	if w.entryRoomId == 0 {
		w.entryRoomId = r.cfg.Id
	}
	return r
}

func (w *World) ResetZone(id ZoneId) {
	z := w.zones[id]
	if z.cfg.resetFunc != nil {
		z.cfg.resetFunc()
	}
	z.lastReset = time.Now().UTC()
	log.Printf("reset zone %d", z.cfg.Id)
}

func (w *World) ResetAllZones() {
	for zid := range w.zones {
		w.ResetZone(zid)
	}
}

func (w *World) OnPlayerInput(p *Player, input string) StateId {
	e, ok := w.players[p.id]
	if !ok {
		log.Printf("failed to resolve entity for player %v", p.id)
		return 0
	}

	tokens := strings.Split(input, " ")
	if len(tokens) == 0 {
		return 0
	}

	ProcessCommand(e, w, tokens)

	return 0
}
