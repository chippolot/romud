package main

import (
	"net"
	"sync"
)

var (
	sessionIdLock    sync.Mutex
	sessionIdCounter int
)

type Session struct {
	id   int
	conn net.Conn
}

func (s *Session) SessionId() int {
	return s.id
}

func makeSessionId() int {
	sessionIdLock.Lock()
	defer sessionIdLock.Unlock()

	sid := sessionIdCounter
	sessionIdCounter++
	return sid
}
