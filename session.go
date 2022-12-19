package main

import (
	"net"
)

var idCounter ConcurrentIdCounter

type Session struct {
	id   int
	conn net.Conn
}

func (s *Session) SessionId() int {
	return s.id
}

func makeSessionId() int {
	return idCounter.Next()
}
