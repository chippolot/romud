package main

import (
	"encoding/json"
	"log"
	"math/rand"
	"path"
	"runtime"
	"time"

	"github.com/chippolot/go-mud/src/mud"
	"github.com/chippolot/go-mud/src/mud/server"
	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

func main() {
	rand.Seed(time.Now().UnixNano())

	_, b, _, _ := runtime.Caller(0)
	projectRoot := path.Join(path.Dir(b))

	// Load config
	cfg, err := loadConfig(path.Join(projectRoot, "app.json"))
	if err != nil {
		log.Fatalln("failed to load app config")
	}

	// Create DB
	db := mud.NewFileSystemDatabase(path.Join(projectRoot, "db"))

	// Create events channel
	events := make(chan server.SessionEvent, 32)

	// Create lua state
	L := lua.NewState()
	defer L.Close()

	// Create world
	world := mud.NewWorld(db, L, events)
	mud.LoadAssets(world, path.Join(projectRoot, "cfg"))
	world.SetEntryRoomId(3001)

	// Register global lua funcs
	mud.RegisterGlobalLuaBindings(L, world)

	// Create test entity
	addEntities(world, "mob", "rat", "rat", "janitor", "equipper")

	// Create test item
	addItems(world, "woodshortsword", "bag", "ancientscroll", "anvil", "woodbplate", "woodgreaves", "woodhelm")

	// Create session handler
	sessionHandler := mud.NewSessionHandler(world, events)
	go sessionHandler.Run()

	// Start game loop
	go mud.GameLoop(world)

	// Start servers
	for _, s := range cfg.Servers {
		srv, err := server.NewServer(s.Type)
		if err != nil {
			log.Fatalln(err)
		}
		err = srv.Start(s.Port, events)
		if err != nil {
			log.Fatalln(err)
		}
	}
}

func addEntities(w *mud.World, keys ...string) {
	for _, key := range keys {
		if cfg, ok := w.TryGetEntityConfig(key); ok {
			ent := mud.NewEntity(cfg)
			w.AddEntity(ent, w.EntryRoomId())
		} else {
			log.Fatalf("Failed to load entity: %s", key)
		}
	}
}

func addItems(w *mud.World, keys ...string) {
	for _, key := range keys {
		if cfg, ok := w.TryGetItemConfig(key); ok {
			itm := mud.NewItem(cfg)
			w.AddItem(itm, w.EntryRoomId())
		} else {
			log.Fatalf("Failed to load item: %s", key)
		}
	}
}

func loadConfig(path string) (*AppConfig, error) {
	bytes, err := utils.LoadFileBytes(path)
	if err != nil {
		return nil, err
	}

	cfg := &AppConfig{}
	err = json.Unmarshal(bytes, cfg)
	return cfg, err
}
