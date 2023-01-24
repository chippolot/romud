package mud

import (
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type ZoneId int32

type ZoneConfig struct {
	Id        ZoneId
	Name      string
	MinRoomId RoomId
	MaxRoomId RoomId
	ResetFreq utils.Seconds
	resetFunc func()
}

type Zone struct {
	cfg       *ZoneConfig
	lastReset time.Time
}
