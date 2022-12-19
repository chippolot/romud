package main

import (
	"fmt"
	"log"
	"net"
	"strings"
)

func handleConnection(conn net.Conn, sessionChannel chan<- SessionEvent) error {
	defer conn.Close()

	session := &Session{makeSessionId(), conn}

	sessionChannel <- SessionEvent{session, &SessionStartedEvent{}}

	buf := make([]byte, 1024)

	for {
		n, err := conn.Read(buf)
		if err != nil {
			sessionChannel <- SessionEvent{session, &SessionEndedEvent{}}
			if err.Error() == "EOF" {
				break
			}
			return err
		}
		msg := string(buf[:n])
		msg = strings.TrimRight(msg, "\n\r")
		sessionChannel <- SessionEvent{session, &ClientInputEvent{msg}}
	}
	return nil
}

func startServer(port int, sessionChannel chan<- SessionEvent) error {
	listener, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		return err
	}
	defer listener.Close()

	log.Printf("Now listening on port %d", port)

	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Println("Error accepting connection", err)
			break
		}

		go func() {
			err := handleConnection(conn, sessionChannel)
			if err != nil {
				log.Println("Error handling connection", err)
				return
			}
		}()
	}
	return nil
}
