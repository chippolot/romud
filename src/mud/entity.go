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

type Entity struct {
	Data *EntityData
}
