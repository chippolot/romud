package main

import (
	"log"
	"path"
	"runtime"

	"github.com/chippolot/go-mud/src/mud"
)

func main() {
	eventChannel := make(chan mud.SessionEvent)

	_, b, _, _ := runtime.Caller(0)
	projectRoot := path.Join(path.Dir(b))

	// Prep DB
	db := mud.NewFileSystemDatabase(path.Join(projectRoot, "db"))

	// Build world
	world := mud.NewWorld(db)
	mud.LoadRooms(world, path.Join(projectRoot, "cfg/test.rooms"))

	sh := mud.NewSessionHandler(world, eventChannel)
	go sh.Run()

	err := mud.StartServer(8080, eventChannel)
	if err != nil {
		log.Fatalln(err)
	}
}
