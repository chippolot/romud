package server

import (
	"fmt"
	"strings"
)

type Server interface {
	Start(port int, events chan<- SessionEvent) error
}

func NewServer(serverType string) (Server, error) {
	switch strings.ToLower(serverType) {
	case "telnet":
		return &TelnetServer{}, nil
	default:
		return nil, fmt.Errorf("invalid server type: %s", serverType)
	}
}
