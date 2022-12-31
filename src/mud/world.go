package mud

import (
	"log"
	"strings"
)

type World struct {
	db            Database
	players       map[PlayerId]*Entity
	entities      map[EntityId]*Entity
	entityConfigs map[string]*EntityConfig
	rooms         map[RoomId]*Room
	entryRoomId   RoomId
}

func NewWorld(db Database) *World {
	return &World{db, make(map[PlayerId]*Entity), make(map[EntityId]*Entity), make(map[string]*EntityConfig), make(map[RoomId]*Room), 0}
}

func (w *World) EntryRoomId() RoomId {
	return w.entryRoomId
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
	e := w.CreatePlayerCharacter(name, player)
	e.data = data.Character
	e.player.data = data.Player
	return e, nil
}

func (w *World) SavePlayerCharacter(pid PlayerId) {
	e, ok := w.players[pid]
	if !ok {
		log.Printf("failed to resolve player entity for player %v", pid)
		return
	}

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
		w.SendAllExcept(e.player.id, "%s Joins", e.Name())
		e.player.Enqueue(Preamble)

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

	if e.player != nil {
		delete(w.players, e.player.id)
		w.SendAllExcept(e.player.id, "%s Leaves", e.Name())
	}
}

func (w *World) AddRoom(r *Room) *Room {
	w.rooms[r.id] = r
	if w.entryRoomId == 0 {
		w.entryRoomId = r.id
	}
	return r
}

func (w *World) SendAll(format string, a ...any) {
	for _, e := range w.players {
		e.player.Send(format, a...)
	}
}

func (w *World) SendAllExcept(pid PlayerId, format string, a ...any) {
	for pid2, e := range w.players {
		if pid != pid2 {
			e.player.Send(format, a...)
		}
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

	cmd := strings.ToLower(tokens[0])
	if cmd == "quit" {
		return LoggedOutStateId
	}

	tokens[0] = cmd
	if cmdDesc, ok := CommandsLookup[cmd]; ok {
		if cmdDesc.fn != nil {
			cmdDesc.fn(e, w, tokens[:])
			return 0
		}
	}

	p.Send("Huh??")
	return 0
}
