package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"strings"

	"github.com/chippolot/romud/src/utils"
)

const (
	MaxLevel     = 100
	MaxStatValue = 99
	SightRange   = 12
)

const (
	Stat_HP StatType = iota
	Stat_MaxHP
	Stat_SP
	Stat_MaxSP
	Stat_Mov
	Stat_MaxMov
	Stat_Str
	Stat_Agi
	Stat_Vit
	Stat_Int
	Stat_Dex
	Stat_Luk
	Stat_Level
	Stat_XP
	Stat_JobLevel
	Stat_JobXP
	Stat_StatPoints
	Stat_SkillPoints
	Stat_Gold

	Stat_Num
)

const (
	Cnd_Dead Condition = iota
	Cnd_MortallyWounded
	Cnd_Incapacitated
	Cnd_Stunned
	Cnd_Healthy
)

const (
	Size_Small Size = iota
	Size_Medium
	Size_Large
)

const (
	Speed_Immovable Speed = iota
	Speed_Very_Slow
	Speed_Slow
	Speed_Fast
	Speed_Very_Fast
)

type Size int
type Condition int
type StatType int
type Speed int

var sizeStringMapping = utils.NewStringMapping(map[Size]string{
	Size_Small:  "small",
	Size_Medium: "medium",
	Size_Large:  "large",
})

func ParseSize(str string) (Size, error) {
	if val, ok := sizeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown Size: %s", str)
}

var speedStringMapping = utils.NewStringMapping(map[Speed]string{
	Speed_Immovable: "immovable",
	Speed_Very_Slow: "very_slow",
	Speed_Slow:      "slow",
	Speed_Fast:      "fast",
	Speed_Very_Fast: "very_fast",
})

func ParseSpeed(str string) (Speed, error) {
	if val, ok := speedStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown Speed: %s", str)
}

var statTypeStringMapping = utils.NewStringMapping(map[StatType]string{
	Stat_HP:          "HP",
	Stat_MaxHP:       "MaxHP",
	Stat_SP:          "SP",
	Stat_MaxSP:       "MaxSP",
	Stat_Mov:         "Mov",
	Stat_MaxMov:      "MaxMov",
	Stat_Str:         "Str",
	Stat_Agi:         "Agi",
	Stat_Vit:         "Vit",
	Stat_Int:         "Int",
	Stat_Dex:         "Dex",
	Stat_Luk:         "Luk",
	Stat_Level:       "Level",
	Stat_XP:          "XP",
	Stat_JobLevel:    "JobLevel",
	Stat_JobXP:       "JP",
	Stat_StatPoints:  "StatPts",
	Stat_SkillPoints: "SkillPts",
	Stat_Gold:        "Gold",
})

func ParseStatType(str string) (StatType, error) {
	if val, ok := statTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	// Case-insensitive compare
	for str2, val := range statTypeStringMapping.ToValue {
		if strings.EqualFold(str, str2) {
			return val, nil
		}
	}
	return 0, fmt.Errorf("unknown StatType: %s", str)
}

func (s *StatType) String() string {
	if str, ok := statTypeStringMapping.ToString[*s]; ok {
		return str
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
	HP           int
	Size         Size
	Speed        Speed
	Element      Element
	ElementLevel int
	Race         Race
	Mov          int
	Str          int
	Agi          int
	Vit          int
	Int          int
	Dex          int
	Luk          int
	Level        int
	Hit100       int // Monster Only: HIT value required for making 100% chance hit on monster
	Flee95       int // Monster Only: FLEE value required for making 95% chance dodge on monster
	XPValue      int
	JobXPValue   int
}

type Stats struct {
	cfg            *StatsConfig
	data           StatMap
	statMods       StatMap
	lastHPMovRegen utils.Seconds
	lastSPRegen    utils.Seconds
}

func newStats(cfg *StatsConfig, data StatMap) *Stats {
	return &Stats{cfg, data, make(StatMap), 0, 0}
}

func newStatsData(cfg *StatsConfig) StatMap {
	return StatMap{
		Stat_HP:     cfg.HP,
		Stat_MaxHP:  cfg.HP,
		Stat_Mov:    cfg.Mov,
		Stat_MaxMov: cfg.Mov,
		Stat_Str:    cfg.Str,
		Stat_Agi:    cfg.Agi,
		Stat_Vit:    cfg.Vit,
		Stat_Int:    cfg.Int,
		Stat_Dex:    cfg.Dex,
		Stat_Luk:    cfg.Luk,
		Stat_Level:  utils.MaxInt(1, cfg.Level),
	}
}

func (s *Stats) Add(stat StatType, delta int) {
	s.data[stat] += delta
	s.clamp()
}

func (s *Stats) Set(stat StatType, val int) {
	s.data[stat] = val
	s.clamp()
}

func (s *Stats) Get(stat StatType) int {
	mod := s.statMods[stat]
	return s.data[stat] + mod
}

func (s *Stats) GetFloat(stat StatType) float64 {
	return float64(s.Get(stat))
}

func (s *Stats) AddMod(stat StatType, mod int) {
	s.statMods[stat] += mod
	s.clamp()
}

func (s *Stats) RemoveMod(stat StatType, mod int) {
	s.statMods[stat] -= mod
	s.clamp()
}
func (s *Stats) MaxStatType(stats ...StatType) StatType {
	maxStat := stats[0]
	maxVal := s.Get(stats[0])
	for _, stat := range stats {
		val := s.Get(stat)
		if val > maxVal {
			maxStat = stat
			maxVal = val
		}
	}
	return maxStat
}

func (s *Stats) Condition() Condition {
	hp := s.Get(Stat_HP)
	switch mudConfig.Death.Mode {
	case Death_Instant:
		if hp > 0 {
			return Cnd_Healthy
		} else {
			return Cnd_Dead
		}
	case Death_Prolonged:
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
	log.Panicln("unknown death mode", mudConfig.Death.Mode)
	return Cnd_Healthy
}

func (s *Stats) ConditionShortString() string {
	hp := s.Get(Stat_HP)
	if hp <= 0 {
		switch mudConfig.Death.Mode {
		case Death_Instant:
			return Colorize(Color_Cnd_Hurt, "dead")
		case Death_Prolonged:
			if hp < -10 {
				return Colorize(Color_Cnd_Hurt, "dead")
			} else if hp < -5 {
				return Colorize(Color_Cnd_Hurt, "mortally wounded")
			} else if hp < -2 {
				return Colorize(Color_Cnd_Hurt, "badly wounded")
			} else {
				return Colorize(Color_Cnd_Hurt, "awful condition")
			}
		}
	}

	pct := float32(hp) / float32(s.Get(Stat_MaxHP))
	if pct >= 0.95 {
		return Colorize(Color_Cnd_Healthy, "excellent condition")
	} else if pct >= 0.85 {
		return Colorize(Color_Cnd_Healthy, "a few scratches")
	} else if pct >= 0.70 {
		return Colorize(Color_Cnd_Healthy, "bumps and bruises")
	} else if pct >= 0.50 {
		return Colorize(Color_Cnd_LightHurt, "roughed up")
	} else if pct >= 0.30 {
		return Colorize(Color_Cnd_LightHurt, "bleeding")
	} else if pct >= 0.15 {
		return Colorize(Color_Cnd_LightHurt, "bleeding heavily")
	} else {
		return Colorize(Color_Cnd_Hurt, "awful condition")
	}
}

func (s *Stats) ConditionLongString(e *Entity) string {
	hp := s.Get(Stat_HP)
	if hp <= 0 {
		switch mudConfig.Death.Mode {
		case Death_Instant:
			return fmt.Sprintf("%s is %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Hurt, "dead"))
		case Death_Prolonged:
			if hp < -10 {
				return fmt.Sprintf("%s is %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Hurt, "dead"))
			} else if hp < -5 {
				return fmt.Sprintf("%s is %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Hurt, "mortally wounded"))
			} else if hp < -2 {
				return fmt.Sprintf("%s is %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Hurt, "badly wounded"))
			} else {
				return fmt.Sprintf("%s is in %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Hurt, "awful condition"))
			}
		}
	}

	maxHP := s.Get(Stat_MaxHP)
	pct := float32(hp) / float32(maxHP)
	if pct >= 0.95 {
		return fmt.Sprintf("%s is in %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Healthy, "excellent condition"))
	} else if pct >= 0.85 {
		return fmt.Sprintf("%s has %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Healthy, "a few scratches"))
	} else if pct >= 0.70 {
		return fmt.Sprintf("%s has %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Healthy, "bumps and bruises"))
	} else if pct >= 0.50 {
		return fmt.Sprintf("%s is looking %s", e.GetNameCapitalized(), Colorize(Color_Cnd_LightHurt, "roughed up"))
	} else if pct >= 0.30 {
		return fmt.Sprintf("%s is %s", e.GetNameCapitalized(), Colorize(Color_Cnd_LightHurt, "bleeding"))
	} else if pct >= 0.15 {
		return fmt.Sprintf("%s is %s", e.GetNameCapitalized(), Colorize(Color_Cnd_LightHurt, "bleeding heavily"))
	} else {
		return fmt.Sprintf("%s is in %s", e.GetNameCapitalized(), Colorize(Color_Cnd_Hurt, "awful condition"))
	}
}

func (s *Stats) Snapshot() map[StatType]int {
	snap := make(map[StatType]int)
	for k, v := range s.data {
		snap[k] = v
	}
	return snap
}

func (s *Stats) Diff(other map[StatType]int) map[StatType]int {
	diff := make(map[StatType]int)
	for k, v := range other {
		ds := s.data[k] - v
		if ds != 0 {
			diff[k] = ds
		}
	}
	return diff
}

func (s *Stats) clamp() {
	s.data[Stat_HP] = utils.MinInt(s.Get(Stat_MaxHP), s.Get(Stat_HP))
	s.data[Stat_SP] = utils.MinInt(s.Get(Stat_MaxSP), s.Get(Stat_SP))
	s.data[Stat_Mov] = utils.MinInt(s.Get(Stat_MaxMov), s.Get(Stat_Mov))
}

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

func IsMaxLevel(e *Entity) bool {
	return e.stats.Get(Stat_Level) >= len(XPLookup)-1
}

func GetXPForNextLevel(e *Entity) int {
	if IsMaxLevel(e) {
		return -1
	}
	nextLevel := e.stats.Get(Stat_Level) + 1
	requiredXP := XPLookup[nextLevel] - e.stats.Get(Stat_XP)
	return utils.MaxInt(0, requiredXP)
}

func IsReadyForLevelUp(e *Entity) bool {
	return !IsMaxLevel(e) && GetXPForNextLevel(e) == 0
}

func GetPercentProgressToNextLevel(e *Entity) int {
	if IsMaxLevel(e) {
		return 0
	}
	lvl := e.stats.Get(Stat_Level)
	return (e.stats.Get(Stat_XP) - XPLookup[lvl]) / (XPLookup[lvl+1] - XPLookup[lvl])
}

func applyXP(e *Entity, w *World, xp int) int {
	if !IsMaxLevel(e) {
		xp = int(float64(xp) * mudConfig.XPRateMultiplier)
		e.stats.Add(Stat_XP, xp)
		if IsReadyForLevelUp(e) {
			performLevelUp(e, w)
		}
		return xp
	}
	return 0
}

func performLevelUp(e *Entity, w *World) {
	if !IsReadyForLevelUp(e) {
		Write("You need more experience to advance to the next level").ToPlayer(e).Send()
		return
	}

	oldStats := e.stats.Snapshot()

	for IsReadyForLevelUp(e) {
		nextLevel := e.stats.Get(Stat_Level) + 1
		e.stats.Set(Stat_Level, nextLevel)

		calculateAndUpdateStats(e)
		e.stats.Add(Stat_StatPoints, calculateStatPointsGainedForLevelUp(nextLevel))
	}

	Write("You advance to level %d!", e.stats.Get(Stat_Level)).ToPlayer(e).Colorized(Color_PositiveBld).Send()
	diff := e.stats.Diff(oldStats)
	for stat, ds := range diff {
		if stat == Stat_Level || stat == Stat_StatPoints {
			continue
		}
		Write("  You gain %d %s", ds, stat.String()).ToPlayer(e).Send()
	}
	Write("  You gain %d Stat Points", diff[Stat_StatPoints]).ToPlayer(e).Send()
	Write("Hooray! %s is now level %d", e.GetName(), e.stats.Get(Stat_Level)).ToEntityRoom(w, e).Ignore(e).Send()

	if e.player != nil {
		e.player.saveRequested = true
	}
}

func IsMaxJobLevel(e *Entity) bool {
	if e.job == nil {
		return true
	}
	jobTier := e.job.cfg.JobTier
	return e.stats.Get(Stat_JobLevel) >= len(JobXPLookup[jobTier])-1
}

func GetJobXPForNextJobLevel(e *Entity) int {
	if e.job == nil {
		return -1
	}
	jobTier := e.job.cfg.JobTier
	if IsMaxJobLevel(e) {
		return -1
	}
	nextLevel := e.stats.Get(Stat_JobLevel) + 1
	requiredJobXP := JobXPLookup[jobTier][nextLevel] - e.stats.Get(Stat_JobXP)
	return utils.MaxInt(0, requiredJobXP)
}

func IsReadyForJobLevelUp(e *Entity) bool {
	return !IsMaxJobLevel(e) && GetJobXPForNextJobLevel(e) == 0
}

func GetPercentProgressToNextJobLevel(e *Entity) int {
	if IsMaxJobLevel(e) {
		return 0
	}
	if e.job == nil {
		return 0
	}
	jobTier := e.job.cfg.JobTier
	lvl := e.stats.Get(Stat_JobLevel)
	return (e.stats.Get(Stat_JobXP) - JobXPLookup[jobTier][lvl]) / (JobXPLookup[jobTier][lvl+1] - JobXPLookup[jobTier][lvl])
}

func applyJobXP(e *Entity, w *World, xp int) int {
	if !IsMaxJobLevel(e) {
		xp = int(float64(xp) * mudConfig.JobXPRateMultiplier)
		e.stats.Add(Stat_JobXP, xp)
		if IsReadyForJobLevelUp(e) {
			performJobLevelUp(e, w)
		}
		return xp
	}
	return 0
}

func performJobLevelUp(e *Entity, w *World) {
	if !IsReadyForJobLevelUp(e) {
		Write("You need more job experience to advance to the next job level").ToPlayer(e).Send()
		return
	}

	oldStats := e.stats.Snapshot()

	for IsReadyForJobLevelUp(e) {
		nextJobLevel := e.stats.Get(Stat_JobLevel) + 1
		for _, bonus := range e.job.cfg.BonusStats {
			if bonus.Level == nextJobLevel {
				e.stats.Add(bonus.Stat, 1)
			}
		}
		e.stats.Set(Stat_JobLevel, nextJobLevel)
		e.stats.Add(Stat_SkillPoints, 1)
	}

	Write("You advance to job level %d!", e.stats.Get(Stat_JobLevel)).ToPlayer(e).Colorized(Color_PositiveBld).Send()
	diff := e.stats.Diff(oldStats)
	for stat, ds := range diff {
		if stat == Stat_JobLevel || stat == Stat_SkillPoints {
			continue
		}
		Write("  You gain %d %s", ds, stat.String()).ToPlayer(e).Send()
	}
	Write("  You gain %d Skill Points", diff[Stat_SkillPoints]).ToPlayer(e).Send()
	Write("Hooray! %s is now job level %d", e.GetName(), e.stats.Get(Stat_JobLevel)).ToEntityRoom(w, e).Ignore(e).Send()

	if e.player != nil {
		e.player.saveRequested = true
	}
}
