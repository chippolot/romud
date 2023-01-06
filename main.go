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

	// Create world
	world := mud.NewWorld(db, events)
	mud.LoadAssets(world, path.Join(projectRoot, "cfg"))
	world.SetEntryRoomId(3001)

	// Create test entity
	if cfg, ok := world.TryGetEntityConfig("mob"); ok {
		mob := mud.NewEntity(cfg)
		world.AddEntity(mob, world.EntryRoomId())
	} else {
		log.Fatalln("Failed to load mob")
	}

	// Create test item
	if cfg, ok := world.TryGetItemConfig("woodshortsword"); ok {
		itm := mud.NewItem(cfg)
		world.AddItem(itm, world.EntryRoomId())
	} else {
		log.Fatalln("Failed to load item")
	}
	if cfg, ok := world.TryGetItemConfig("bag"); ok {
		itm := mud.NewItem(cfg)
		world.AddItem(itm, world.EntryRoomId())
	} else {
		log.Fatalln("Failed to load item")
	}

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

func loadConfig(path string) (*AppConfig, error) {
	bytes, err := utils.LoadFileBytes(path)
	if err != nil {
		return nil, err
	}

	cfg := &AppConfig{}
	err = json.Unmarshal(bytes, cfg)
	return cfg, err
}
