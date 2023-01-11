package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/go-mud/src/utils"
)

type StatType int

const (
	Stat_HP StatType = iota
	Stat_MaxHP
	Stat_AC
	Stat_Mov
	Stat_MaxMov
	Stat_Speed
	Stat_Str
	Stat_Dex
	Stat_Con
	Stat_Int
	Stat_Wis
	Stat_Cha
	Stat_Level
	Stat_XP
)

func ParseStatType(str string) (StatType, error) {
	switch str {
	case "HP":
		return Stat_HP, nil
	case "MaxHP":
		return Stat_MaxHP, nil
	case "AC":
		return Stat_AC, nil
	case "Mov":
		return Stat_Mov, nil
	case "MaxMov":
		return Stat_MaxMov, nil
	case "Speed":
		return Stat_Speed, nil
	case "Str":
		return Stat_Str, nil
	case "Dex":
		return Stat_Dex, nil
	case "Con":
		return Stat_Con, nil
	case "Int":
		return Stat_Int, nil
	case "Wis":
		return Stat_Wis, nil
	case "Cha":
		return Stat_Cha, nil
	case "Level":
		return Stat_Level, nil
	case "XP":
		return Stat_XP, nil
	default:
		return 0, fmt.Errorf("unknown stat type: %s", str)
	}
}

func (s StatType) String() string {
	switch s {
	case Stat_HP:
		return "HP"
	case Stat_MaxHP:
		return "MaxHP"
	case Stat_AC:
		return "AC"
	case Stat_Mov:
		return "Mov"
	case Stat_MaxMov:
		return "MaxMov"
	case Stat_Speed:
		return "Speed"
	case Stat_Str:
		return "Str"
	case Stat_Dex:
		return "Dex"
	case Stat_Con:
		return "Con"
	case Stat_Int:
		return "Int"
	case Stat_Wis:
		return "Wis"
	case Stat_Cha:
		return "Cha"
	case Stat_Level:
		return "Level"
	case Stat_XP:
		return "XP"
	}
	return "unknown"
}

func (s *StatType) MarshalJSON() ([]byte, error) {
	return json.Marshal(s.String())
}

func (s *StatType) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *s, err = ParseStatType(str); err != nil {
		return err
	}
	return nil
}

type StatMap map[StatType]int

func (m *StatMap) MarshalJSON() ([]byte, error) {
	m2 := make(map[string]int)
	for stat, mod := range *m {
		m2[stat.String()] = mod
	}
	return json.Marshal(m2)
}

func (m *StatMap) UnmarshalJSON(data []byte) (err error) {
	var m2 map[string]int
	if err := json.Unmarshal(data, &m2); err != nil {
		return err
	}
	*m = make(StatMap)
	for statStr, mod := range m2 {
		if stat, err := ParseStatType(statStr); err == nil {
			(*m)[stat] = mod
		}
	}
	return nil
}

type StatsConfig struct {
	HP      Dice
	AC      int
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

type Stats struct {
	cfg  *StatsConfig
	data StatMap
	mods StatMap
}

func newStats(cfg *StatsConfig, data StatMap) *Stats {
	return &Stats{cfg, data, make(StatMap)}
}

func newStatsData(cfg *StatsConfig) StatMap {
	maxHP := cfg.HP.Roll()
	return StatMap{
		Stat_HP:     maxHP,
		Stat_MaxHP:  maxHP,
		Stat_Mov:    cfg.Speed,
		Stat_MaxMov: cfg.Speed,
		Stat_Str:    cfg.Str,
		Stat_Dex:    cfg.Dex,
		Stat_Con:    cfg.Con,
		Stat_Int:    cfg.Int,
		Stat_Wis:    cfg.Wis,
		Stat_Cha:    cfg.Cha,
		Stat_Level:  utils.MaxInts(1, cfg.Level),
	}
}

func (s *Stats) AddMod(stat StatType, mod int) {
	s.mods[stat] += mod
	s.clamp()
}

func (s *Stats) RemoveMod(stat StatType, mod int) {
	s.mods[stat] -= mod
	s.clamp()
}

func (s *Stats) AddHP(delta int) {
	s.data[Stat_HP] += delta
	s.clamp()
}

func (s *Stats) AddMov(delta int) {
	s.data[Stat_Mov] += delta
	s.clamp()
}

func (s *Stats) AddXP(delta int) {
	s.data[Stat_XP] += delta
}

func (s *Stats) CarryingCapacity() int {
	return s.GetStat(Stat_Str) * 15
}

func (s *Stats) MaxStatType(stats ...StatType) StatType {
	maxStat := stats[0]
	maxVal := s.GetStat(stats[0])
	for _, stat := range stats {
		val := s.GetStat(stat)
		if val > maxVal {
			maxStat = stat
			maxVal = val
		}
	}
	return maxStat
}

func (s *Stats) GetStat(stat StatType) int {
	mod := s.mods[stat]
	return s.data[stat] + mod
}

func (s *Stats) Condition() Condition {
	hp := s.GetStat(Stat_HP)
	if hp < -10 {
		return Cnd_Dead
	} else if hp < -5 {
		return Cnd_MortallyWounded
	} else if hp < -2 {
		return Cnd_Incapacitated
	} else if hp <= 0 {
		return Cnd_Stunned
	} else {
		return Cnd_Healthy
	}
}

func (s *Stats) ConditionShortString() string {
	hp := s.GetStat(Stat_HP)
	if hp < -10 {
		return "<c red>dead</c>"
	} else if hp < -5 {
		return "<c red>mortally wounded</c>"
	} else if hp < -2 {
		return "<c red>badly wounded</c>"
	} else if hp <= 0 {
		return "<c red>awful condition</c>"
	} else {
		pct := float32(hp) / float32(s.data[Stat_MaxHP])
		if pct >= 0.95 {
			return "<c green>excellent condition</c>"
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

func (s *Stats) ConditionLongString(e *Entity) string {
	hp := s.GetStat(Stat_HP)
	maxHP := s.GetStat(Stat_MaxHP)
	if hp < -10 {
		return fmt.Sprintf("%s is <c red>dead</c>", e.NameCapitalized())
	} else if hp < -5 {
		return fmt.Sprintf("%s is <c red>mortally wounded</c>", e.NameCapitalized())
	} else if hp < -2 {
		return fmt.Sprintf("%s is <c red>badly wounded</c>", e.NameCapitalized())
	} else if hp <= 0 {
		return fmt.Sprintf("%s is in <c red>awful condition</c>", e.NameCapitalized())
	} else {
		pct := float32(hp) / float32(maxHP)
		if pct >= 0.95 {
			return fmt.Sprintf("%s is in <c green>excellent condition</c>", e.NameCapitalized())
		} else if pct >= 0.85 {
			return fmt.Sprintf("%s has <c green>a few scratches</c>", e.NameCapitalized())
		} else if pct >= 0.70 {
			return fmt.Sprintf("%s has <c green>bumps and bruises</c>", e.NameCapitalized())
		} else if pct >= 0.50 {
			return fmt.Sprintf("%s is looking <c yellow>roughed up</c>", e.NameCapitalized())
		} else if pct >= 0.30 {
			return fmt.Sprintf("%s is <c yellow>bleeding</c>", e.NameCapitalized())
		} else if pct >= 0.15 {
			return fmt.Sprintf("%s is <c yellow>bleeding heavily</c>", e.NameCapitalized())
		} else {
			return fmt.Sprintf("%s is in <c red>awful condition</c>", e.NameCapitalized())
		}
	}
}

func (s *Stats) clamp() {
	s.data[Stat_HP] = utils.MinInts(s.GetStat(Stat_MaxHP), s.data[Stat_HP])
	s.data[Stat_Mov] = utils.MinInts(s.GetStat(Stat_MaxMov), s.data[Stat_Mov])
}

func ContestAbility(e *Entity, tgt *Entity, stat StatType) bool {
	eRoll := D20.Roll() + GetAbilityModifier(e.stats.GetStat(stat))
	tgtRoll := D20.Roll() + GetAbilityModifier(tgt.stats.GetStat(stat))
	return eRoll > tgtRoll
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
	return e.stats.Level >= len(XPChart)
}

func GetXpForNextLevel(e *Entity) int {
	if IsMaxLevel(e) {
		return -1
	}
	nextLevel := e.stats.Level + 1
	requiredXp := XPChart[nextLevel] - e.stats.XP
	return utils.MaxInts(0, requiredXp)
}

func IsReadyForLevelUp(e *Entity) bool {
	return !IsMaxLevel(e) && GetXpForNextLevel(e) == 0
}
