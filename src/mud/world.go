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
	db            Database
	players       map[PlayerId]*Entity
	sessions      map[server.SessionId]*server.Session
	entities      map[EntityId]*Entity
	entityConfigs map[string]*EntityConfig
	itemConfigs   map[string]*ItemConfig
	rooms         map[RoomId]*Room
	entryRoomId   RoomId
	inCombat      *CombatList
	loggingOut    map[PlayerId]bool
	events        chan<- server.SessionEvent
	L             *lua.LState
}

func NewWorld(db Database, l *lua.LState, events chan<- server.SessionEvent) *World {
	return &World{
		db,
		make(map[PlayerId]*Entity),
		make(map[server.SessionId]*server.Session),
		make(map[EntityId]*Entity),
		make(map[string]*EntityConfig),
		make(map[string]*ItemConfig),
		make(map[RoomId]*Room),
		0,
		&CombatList{},
		make(map[PlayerId]bool),
		events,
		l,
	}
}

func (w *World) EntryRoomId() RoomId {
	return w.entryRoomId
}

func (w *World) SetEntryRoomId(id RoomId) {
	w.entryRoomId = id
}

func (w *World) CreatePlayerCharacter(name string, player *Player) *Entity {
	playerEntityCfg, ok := w.entityConfigs[PlayerEntityKey]
	if !ok {
		log.Fatalf("cannot create player. expected entity config with key %s", PlayerEntityKey)
	}
	e := NewEntity(playerEntityCfg)
	e.player = player
	e.player.data = &PlayerData{Name: name}
	return e
}

func (w *World) TryLoadPlayerCharacter(name string, player *Player) (*Entity, error) {
	data, err := w.db.LoadPlayer(name)
	if err != nil {
		return nil, err
	}

	// Create character entity
	e := w.CreatePlayerCharacter(name, player)
	e.SetData(data.Character, w)
	e.player.SetData(data.Player)

	// Heal up
	timeSinceSave := time.Now().UTC().Sub(e.player.data.LastSavedAt)
	hpPerMin := 15
	e.stats.Add(Stat_HP, int(timeSinceSave.Minutes()*float64(hpPerMin)))

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

	r := w.rooms[roomId]
	r.AddEntity(e)

	if e.player != nil {
		w.players[e.player.id] = e
		BroadcastToWorldRe(w, e, SendRst_CanSee, "%s Joins", ObservableName(e))
		e.player.Send(Preamble)

		DoLook(e, w, nil)
	}
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

	r := w.rooms[e.data.RoomId]
	r.RemoveEntity(e)
	delete(w.entities, eid)

	e.combat = nil
	e.data.RoomId = InvalidId

	if e.player != nil && e.stats.Condition() != Cnd_Dead {
		delete(w.players, e.player.id)
		delete(w.loggingOut, e.player.id)
		BroadcastToWorldRe(w, e, SendRst_CanSee, "%s Leaves", ObservableName(e))
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
	r.AddItem(i)
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
