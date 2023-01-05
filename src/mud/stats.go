package mud

import "github.com/chippolot/go-mud/src/utils"

type StatsConfig struct {
	HP      Dice
	AC      int
	Attack  Dice
	Speed   int
	Str     int
	Dex     int
	Con     int
	Int     int
	Wis     int
	Cha     int
	Level   int
	XPValue int
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
	Level  int
	XP     int
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
		Level:  utils.MaxInts(1, cfg.Level),
	}
}

func (s *StatsData) AddHP(delta int) {
	s.HP = utils.MinInts(s.MaxHP, s.HP+delta)
}

func (s *StatsData) AddMov(delta int) {
	s.Mov = utils.MaxInts(0, utils.MinInts(s.MaxMov, s.Mov+delta))
}

func (s *StatsData) AddXP(delta int) {
	s.XP += delta
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
			return "<c green>bumps and bruises</c>"
		} else if pct >= 0.50 {
			return "<c yellow>roughed up</c>"
		} else if pct >= 0.30 {
			return "<c yellow>bleeding</c>"
		} else if pct >= 0.15 {
			return "<c yellow>bleeding heavily</c>"
		} else {
			return "<c red>awful condition</c>"
		}
	}
}

const (
	Cnd_Dead Condition = iota
	Cnd_MortallyWounded
	Cnd_Incapacitated
	Cnd_Stunned
	Cnd_Healthy
)

type Condition int

func (c Condition) InactionString() string {
	switch c {
	case Cnd_Dead:
		return "If only you were alive..."
	case Cnd_MortallyWounded, Cnd_Incapacitated:
		return "You can't do that while you're bleeding out!"
	case Cnd_Stunned:
		return "You can't do that in your state!"
	}
	return ""
}

var XPChart = []int{
	0,
	300,
	900,
	2700,
	6500,
	14000,
	23000,
	34000,
	48000,
	64000,
	85000,
	100000,
	120000,
	140000,
	165000,
	195000,
	225000,
	265000,
	305000,
	355000,
}

var ProficiencyChart = []int{
	2,
	2,
	2,
	2,
	3,
	3,
	3,
	3,
	4,
	4,
	4,
	4,
	5,
	5,
	5,
	5,
	6,
	6,
	6,
	6,
}

func GetAbilityModifier(score int) int {
	return (score - 10) / 2
}

func IsMaxLevel(e *Entity) bool {
	return e.data.Stats.Level >= len(XPChart)
}

func GetXpForNextLevel(e *Entity) int {
	if IsMaxLevel(e) {
		return -1
	}
	nextLevel := e.data.Stats.Level + 1
	requiredXp := XPChart[nextLevel] - e.data.Stats.XP
	return utils.MaxInts(0, requiredXp)
}

func IsReadyForLevelUp(e *Entity) bool {
	return !IsMaxLevel(e) && GetXpForNextLevel(e) == 0
}
