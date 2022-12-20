package main

import (
	"log"

	"github.com/chippolot/go-mud/mud"
)

func main() {
	eventChannel := make(chan mud.SessionEvent)

	// Build world
	world := mud.NewWorld()
	room1 := world.AddRoom(mud.NewRoom("A Simple Room."))
	room2 := world.AddRoom(mud.NewRoom("Another Room!"))
	room1.ConnectsTo(room2, mud.East)

	sh := mud.NewSessionHandler(world, eventChannel)
	go sh.Run()

	err := mud.StartServer(8080, eventChannel)
	if err != nil {
		log.Fatalln(err)
	}
}
