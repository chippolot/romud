package main

import (
	"log"
)

func main() {
	eventChannel := make(chan SessionEvent)

	world := NewWorld()

	sh := NewSessionHandler(world, eventChannel)
	go sh.Run()

	err := startServer(8080, eventChannel)
	if err != nil {
		log.Fatalln(err)
	}
}
