package mud

type StatsConfig struct {
	HP    Dice
	AC    uint8
	Speed uint16
	Str   uint8
	Dex   uint8
	Con   uint8
	Int   uint8
	Wis   uint8
	Cha   uint8
}

type StatsData struct {
	HP     uint16
	MaxHP  uint16
	AC     uint8
	Mov    uint16
	MaxMov uint16
	Str    uint8
	Dex    uint8
	Con    uint8
	Int    uint8
	Wis    uint8
	Cha    uint8
}

func newStatsData(cfg *StatsConfig) *StatsData {
	maxHP := cfg.HP.Roll()
	return &StatsData{
		HP:     uint16(maxHP),
		MaxHP:  uint16(maxHP),
		AC:     cfg.AC,
		Mov:    cfg.Speed,
		MaxMov: cfg.Speed,
		Str:    cfg.Str,
		Dex:    cfg.Dex,
		Con:    cfg.Con,
		Int:    cfg.Int,
		Wis:    cfg.Wis,
		Cha:    cfg.Cha,
	}
}
