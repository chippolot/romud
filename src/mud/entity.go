package mud

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
}

func NewEntityData(name string) *EntityData {
	return &EntityData{Name: name}
}
