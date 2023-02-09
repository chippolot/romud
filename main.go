package main

import (
	"encoding/json"
	"log"
	"math/rand"
	"path"
	"runtime"
	"time"

	"github.com/chippolot/romud/src/mud"
	"github.com/chippolot/romud/src/mud/server"
	"github.com/chippolot/romud/src/utils"
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
	events := make(chan server.SessionEvent, 128)

	// Create lua state
	L := lua.NewState()
	defer L.Close()

	// Create world
	world := mud.NewWorld(db, L, cfg.Mud, events)

	// Register global lua funcs
	mud.RegisterGlobalLuaBindings(L, world)

	// Load assets
	mud.LoadAssets(world, projectRoot)
	world.SetEntryRoomId(1)

	// Start game loop
	sessionHandler := mud.NewSessionHandler(world, events)
	go mud.GameLoop(world, sessionHandler)

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
