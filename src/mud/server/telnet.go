package server

const (
	SE   = byte(240)
	NOP  = byte(241)
	BRK  = byte(243)
	IP   = byte(244)
	AO   = byte(245)
	AYT  = byte(246)
	EC   = byte(247)
	EL   = byte(248)
	GA   = byte(249)
	SB   = byte(250)
	WILL = byte(251)
	WONT = byte(252)
	DO   = byte(253)
	DONT = byte(254)
	IAC  = byte(255)
)

const (
	ECHO    = byte(1)
	TTYPE   = byte(24)
	NAWS    = byte(31)
	ENCRYPT = byte(38)
	EOR     = byte(239)
)

var TelNet_Command_EchoOff = []byte{255, 251, 1} // IAC WILL ECHO
var TelNet_Command_EchoOn = []byte{255, 252, 1}  // IAC WONT ECHO
