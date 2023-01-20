package mud

import "github.com/chippolot/go-mud/src/utils"

type ZoneId int32

type ZoneConfig struct {
	Id            ZoneId
	Name          string
	MinRoomId     RoomId
	MaxRoomId     RoomId
	ResetFreq     utils.Seconds `json:",omitempty"`
	ResetCommands []interface{} `json:",omitempty"`
}

type SpawnEntityZoneResetCommand struct {
	Key       string
	Max       int
	Items     []string
	Equipment []string
}

type SpawnItemZoneResetCommand struct {
	Key string
	Max int
}
