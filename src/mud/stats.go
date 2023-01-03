package mud

const (
	Cnd_Healthy Condition = iota
	Cnd_Stunned
	Cnd_Incapacitated
	Cnd_MortallyWounded
	Cnd_Dead
)

type Condition int

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

func (s *StatsData) Condition() Condition {
	if s.HP < -10 {
		return Cnd_Dead
	} else if s.HP < -5 {
		return Cnd_MortallyWounded
	} else if s.HP < -2 {
		return Cnd_Incapacitated
	} else if s.HP <= 0 {
		return Cnd_Stunned
	} else {
		return Cnd_Healthy
	}
}

func (s *StatsData) ConditionShortString() string {
	if s.HP < -10 {
		return "<c red>dead</c>"
	} else if s.HP < -5 {
		return "<c red>mortally wounded</c>"
	} else if s.HP < -2 {
		return "<c red>badly wounded</c>"
	} else if s.HP <= 0 {
		return "<c red>awful condition</c>"
	} else {
		pct := float32(s.HP) / float32(s.MaxHP)
		if pct >= 0.95 {
			return "<c green>excellent</c>"
		} else if pct >= 0.85 {
			return "<c green>a few scratches</c>"
		} else if pct >= 0.70 {
			return "<c yellow>bumps and bruises</c>"
		} else if pct >= 0.50 {
			return "<c yellow>roughed up</c>"
		} else if pct >= 0.30 {
			return "<c magenta>bleeding</c>"
		} else if pct >= 0.15 {
			return "<c magenta>bleeding heavily</c>"
		} else {
			return "<c red>awful condition</c>"
		}
	}
}
