package mud

import "github.com/chippolot/go-mud/src/utils"

type ZoneId int32

type ZoneConfig struct {
	Id        ZoneId
	Name      string
	MinRoomId RoomId
	MaxRoomId RoomId
	ResetFreq utils.Seconds
	resetFunc func()
}
