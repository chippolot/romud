package main

import (
	"fmt"
	"log"
	"net"
	"sync"
)

var (
	sessionIdCounter uint64
	sessionIdMutex   sync.Mutex
)

type Session struct {
	id uint64
}

func newSession() *Session {
	sessionIdMutex.Lock()
	defer sessionIdMutex.Unlock()

	s := &Session{sessionIdCounter}
	sessionIdCounter++
	return s
}

func handleConnection(conn net.Conn) error {

	session := newSession()

	log.Printf("Session %d started", session.id)

	buf := make([]byte, 1024)

	for {
		_, err := conn.Read(buf)
		if err != nil {
			if err.Error() == "EOF" {
				log.Printf("Session %d ended", session.id)
				break
			}
			return err
		}
		msg := string(buf)
		log.Println("Got msg:", msg)
	}
	return nil
}

func startServer(port int) error {
	ln, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		return err
	}

	log.Printf("Now listening on port %d", port)

	for {
		conn, err := ln.Accept()
		if err != nil {
			log.Println("Error accepting connection", err)
			break
		}

		go func() {
			err := handleConnection(conn)
			if err != nil {
				log.Println("Error handling connection", err)
				return
			}
		}()
	}
	return nil
}

func main() {
	err := startServer(8080)
	if err != nil {
		log.Fatalln(err)
	}
}
