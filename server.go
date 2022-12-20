package main

import (
	"fmt"
	"io"
	"log"
	"net"
	"strings"
)

func handleConnection(conn net.Conn, eventChannel chan<- SessionEvent) error {
	defer conn.Close()

	session := NewSession(conn)

	eventChannel <- SessionEvent{session, &SessionStartedEvent{}}

	buf := make([]byte, 1024)

	for {
		n, err := conn.Read(buf)
		if err != nil {
			eventChannel <- SessionEvent{session, &SessionEndedEvent{}}
			if err == io.EOF {
				break
			}
			return err
		}
		msg := string(buf[:n])
		msg = strings.TrimRight(msg, "\n\r")
		if msg != "" {
			eventChannel <- SessionEvent{session, &ClientInputEvent{msg}}
		}
	}
	return nil
}

func startServer(port int, eventChannel chan<- SessionEvent) error {
	listener, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", port))
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
			err := handleConnection(conn, eventChannel)
			if err != nil {
				log.Println("Error handling connection", err)
				return
			}
		}()
	}
	return nil
}
