package main

type SessionEvent struct {
	session *Session
	event   interface{}
}

type SessionStartedEvent struct{}

type SessionEndedEvent struct{}

type ClientInputEvent struct {
	input string
}

type Player struct {
	session *Session
}

type World struct {
	players map[int]*Player
}
