package mud

type StatsConfig struct {
	HP     Dice
	AC     int
	Attack Dice
	Speed  int
	Str    int
	Dex    int
	Con    int
	Int    int
	Wis    int
	Cha    int
}

type StatsData struct {
	HP     int
	MaxHP  int
	Attack Dice
	AC     int
	Mov    int
	MaxMov int
	Str    int
	Dex    int
	Con    int
	Int    int
	Wis    int
	Cha    int
}

func newStatsData(cfg *StatsConfig) *StatsData {
	maxHP := cfg.HP.Roll()
	return &StatsData{
		HP:     maxHP,
		MaxHP:  maxHP,
		Attack: cfg.Attack,
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
