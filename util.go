package main

import "sync"

type ConcurrentIdCounter struct {
	mutex   sync.Mutex
	counter int
}

func (s *ConcurrentIdCounter) Next() int {
	s.mutex.Lock()
	defer s.mutex.Unlock()

	next := s.counter
	s.counter++
	return next
}
