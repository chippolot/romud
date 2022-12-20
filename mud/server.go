package mud

import (
	"fmt"
	"io"
	"log"
	"net"
	"strings"
)

func handleConnection(conn net.Conn, sid SessionId, eventChannel chan<- SessionEvent) error {
	defer conn.Close()

	session := &Session{sid, conn}
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

func StartServer(port int, eventChannel chan<- SessionEvent) error {
	var sessionCounter SessionId

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

		sessionCounter++
		go func(sid SessionId) {
			err := handleConnection(conn, sid, eventChannel)
			if err != nil {
				log.Println("Error handling connection", err)
				return
			}
		}(sessionCounter)
	}
	return nil
}