package main

import (
	"encoding/json"
	"log"
	"path"
	"runtime"

	"github.com/chippolot/go-mud/src/mud"
	"github.com/chippolot/go-mud/src/mud/server"
)

func main() {
	_, b, _, _ := runtime.Caller(0)
	projectRoot := path.Join(path.Dir(b))

	// Load config
	cfg, err := loadConfig(path.Join(projectRoot, "app.json"))
	if err != nil {
		log.Fatalln("failed to load app config")
	}

	// Create DB
	db := mud.NewFileSystemDatabase(path.Join(projectRoot, "db"))

	// Create world
	world := mud.NewWorld(db)
	mud.LoadAssets(world, path.Join(projectRoot, "cfg"))

	// Create session handler
	events := make(chan server.SessionEvent, 32)
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
	bytes, err := mud.LoadFileBytes(path)
	if err != nil {
		return nil, err
	}

	cfg := &AppConfig{}
	err = json.Unmarshal(bytes, cfg)
	return cfg, err
}
