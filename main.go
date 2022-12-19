package main

import (
	"fmt"
	"log"
)

func startGameLoop(sessionChannel <-chan SessionEvent) {
	for sessionEvent := range sessionChannel {
		switch evt := sessionEvent.event.(type) {

		case *SessionStartedEvent:
			log.Printf("Session %d Started", sessionEvent.session.SessionId())

		case *SessionEndedEvent:
			log.Printf("Session %d Ended", sessionEvent.session.SessionId())

		case *ClientInputEvent:
			log.Printf("%d said '%s'", sessionEvent.session.SessionId(), evt.input)
			echo := fmt.Sprintf("You said '%s'\n\r", evt.input)
			sessionEvent.session.conn.Write([]byte(echo))

		default:
			log.Printf("Unexpected event type: %T", sessionEvent.event)
		}
	}
}

func main() {
	sessionChannel := make(chan SessionEvent)

	go startGameLoop(sessionChannel)

	err := startServer(8080, sessionChannel)
	if err != nil {
		log.Fatalln(err)
	}
}
