package main

import "sync"

const NewLine string = "\n\r"

type ConcurrentIdCounter[T ~int] struct {
	mutex   sync.Mutex
	counter T
}

func (s *ConcurrentIdCounter[T]) Next() (next T) {
	s.mutex.Lock()
	defer s.mutex.Unlock()

	s.counter++
	next = s.counter
	return
}

func HorizontalDivider() string {
	return "---------------------------------"
}
