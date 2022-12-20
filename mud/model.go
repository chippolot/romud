package mud

type SessionEvent struct {
	session *Session
	event   interface{}
}

type SessionStartedEvent struct{}

type SessionEndedEvent struct{}

type ClientInputEvent struct {
	input string
}
