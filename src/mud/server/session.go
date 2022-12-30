package server

import (
	"fmt"
	"net"

	"github.com/chippolot/go-mud/src/mud/utils"
)

type SessionEvent struct {
	Session *Session
	Event   interface{}
}

type SessionStartedEvent struct{}

type SessionEndedEvent struct{}

type ClientInputEvent struct {
	Input string
}

type SessionId int

type Session struct {
	Id        SessionId
	Conn      net.Conn
	sendQueue utils.StringBuilder
}

func NewSession(id SessionId, conn net.Conn) *Session {
	return &Session{id, conn, utils.StringBuilder{}}
}

func (s *Session) Enqueue(format string, a ...any) {
	s.sendQueue.WriteNewLine()
	if len(a) == 0 {
		s.sendQueue.WriteLine(format)
	} else {
		s.sendQueue.WriteLine(fmt.Sprintf(format, a...))
	}
}

func (s *Session) Send(format string, a ...any) {
	s.Enqueue(format, a...)
	s.sendQueue.WriteNewLine()
	s.sendQueue.WriteString(makePrompt())
	str := processANSIColorCodes(s.sendQueue.String())
	s.sendQueue.Reset()
	_, _ = s.Conn.Write([]byte(str))
}

func makePrompt() string {
	return "> "
}

func (s *Session) Close() error {
	if tcpConn, ok := s.Conn.(*net.TCPConn); ok {
		err := tcpConn.CloseWrite()
		if err != nil {
			return err
		}
		err = tcpConn.SetLinger(0)
		if err != nil {
			return err
		}
	} else {
		err := s.Conn.Close()
		if err != nil {
			return err
		}
	}
	return nil
}
