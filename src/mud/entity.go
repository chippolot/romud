package mud

import "github.com/chippolot/go-mud/src/mud/bits"

const (
	EFlag_Player bits.Bits = 1 << iota
)

type StatsData struct {
	HitP    int
	MaxHitP int
	Mov     int
	MaxMov  int
}

type EntityData struct {
	Name   string
	Desc   string
	RoomId RoomId
	Stats  *StatsData
	Flags  bits.Bits
}

func NewEntityData(name string) *EntityData {
	return &EntityData{Name: name}
}

func (e *EntityData) IsPlayer() bool {
	return bits.Has(e.Flags, EFlag_Player)
}
