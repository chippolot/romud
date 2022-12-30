package mud

import "github.com/chippolot/go-mud/src/mud/bits"

const ()

var entityIdCounter EntityId

type EntityId uint32

type StatsData struct {
	HitP    int
	MaxHitP int
	Mov     int
	MaxMov  int
}

type EntityData struct {
	Key    string
	Name   string
	Desc   string
	RoomId RoomId
	Stats  *StatsData
	Flags  bits.Bits
}

type Entity struct {
	id     EntityId
	data   *EntityData
	player *Player
}

func NewEntity(name string) *Entity {
	entityIdCounter++
	return &Entity{entityIdCounter, &EntityData{Name: name}, nil}
}
