package main

import (
	"fmt"
	"math/rand"
	"net"
	"os"
	"time"
)

func main() {
	for i := 0; i < 100; i++ {
		go newClient()
	}
	for {

	}
}

func newClient() {
	servAddr := "localhost:8080"
	tcpAddr, err := net.ResolveTCPAddr("tcp", servAddr)
	if err != nil {
		println("ResolveTCPAddr failed:", err.Error())
		os.Exit(1)
	}

	conn, err := net.DialTCP("tcp", nil, tcpAddr)
	if err != nil {
		println("Dial failed:", err.Error())
		os.Exit(1)
	}
	defer conn.Close()

	writeLine(conn, fmt.Sprintf("Player%d", rand.Intn(1000000)))
	time.Sleep(time.Millisecond * time.Duration(rand.Intn(1000)))
	for {
		writeLine(conn, "e")
		writeLine(conn, "w")
		time.Sleep(time.Second / 5.0)
	}
}

func writeLine(conn net.Conn, str string) {
	conn.Write([]byte(str + "\r\n"))
}
