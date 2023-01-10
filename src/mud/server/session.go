package server

import (
	"fmt"
	"net"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

type PromptProvider interface {
	Prompt() string
}

type DefaultPromptProvider struct {
}

func (pp *DefaultPromptProvider) Prompt() string {
	return "> "
}

type SessionEvent struct {
	Session *Session
	Event   interface{}
}

type SessionStartedEvent struct{}

type SessionEndedEvent struct{}

type ClientInputEvent struct {
	Input string
}

type SessionId uint32

type Session struct {
	Id             SessionId
	Conn           net.Conn
	promptProvider PromptProvider
	sendQueue      utils.StringBuilder
}

func NewSession(id SessionId, conn net.Conn) *Session {
	return &Session{id, conn, &DefaultPromptProvider{}, utils.StringBuilder{}}
}

func (s *Session) SetPromptProvider(pp PromptProvider) {
	s.promptProvider = pp
}

func (s *Session) Send(format string, a ...any) {
	if s.sendQueue.Len() == 0 {
		s.sendQueue.WriteNewLine()
	}
	if len(a) == 0 {
		s.sendQueue.WriteLine(format)
	} else {
		s.sendQueue.WriteLine(fmt.Sprintf(format, a...))
	}
}

func (s *Session) Flush() {
	if s.sendQueue.Len() == 0 {
		return
	}
	str := s.sendQueue.String()
	s.sendQueue.Reset()
	if strings.HasSuffix(str, utils.NewLine) {
		s.sendQueue.WriteString(str)
	} else {
		s.sendQueue.WriteLine(str)
	}
	s.sendQueue.WriteString(s.promptProvider.Prompt())
	str = processANSIColorCodes(s.sendQueue.String())
	s.sendQueue.Reset()
	_, _ = s.Conn.Write([]byte(str))
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
