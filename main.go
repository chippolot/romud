package main

import (
	"log"
)

func main() {
	eventChannel := make(chan SessionEvent)

	// Build world
	world := NewWorld()
	room1 := world.AddRoom(NewRoom("A Simple Room."))
	room2 := world.AddRoom(NewRoom("Another Room!"))
	room1.ConnectsTo(room2, East)

	sh := NewSessionHandler(world, eventChannel)
	go sh.Run()

	err := startServer(8080, eventChannel)
	if err != nil {
		log.Fatalln(err)
	}
}
