package mud

type ZoneId int32

type ZoneConfig struct {
	Id        ZoneId
	Name      string
	MinRoomId RoomId
	MaxRoomId RoomId
	Spawners  []*ZoneSpawnerConfig
}

type Zone struct {
	cfg      *ZoneConfig
	spawners []*ZoneSpawner
	rooms    []*Room
}

func NewZone(cfg *ZoneConfig) *Zone {
	spawners := make([]*ZoneSpawner, 0, len(cfg.Spawners))
	for _, s := range cfg.Spawners {
		spawners = append(spawners, NewZoneSpawner(s))
	}
	return &Zone{cfg, spawners, make([]*Room, 0)}
}
