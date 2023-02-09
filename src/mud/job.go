package mud

import (
	"encoding/json"
	"fmt"

	"github.com/chippolot/romud/src/bits"
	"github.com/chippolot/romud/src/utils"
)

const (
	JobTier_Novice JobTier = iota
	JobTier_First
	JobTier_Second
)

const (
	JobType_Novice JobTypeMask = 1 << iota
	JobType_Swordman
	JobType_Mage
	JobType_Archer
	JobType_Merchant
	JobType_Thief
	JobType_Acolyte
	JobType_Knight
	JobType_Crusader
	JobType_Wizard
	JobType_Sage
	JobType_Hunter
	JobType_Bard
	JobType_Dancer
	JobType_Blacksmith
	JobType_Alchemist
	JobType_Assassin
	JobType_Rogue
	JobType_Priest
	JobType_Monk
	JobType_Num
	JobType_All
)

type JobTier int
type JobTypeMask bits.Bits

var jobTierStringMapping = utils.NewStringMapping(map[JobTier]string{
	JobTier_Novice: "novice",
	JobTier_First:  "first",
	JobTier_Second: "second",
})

func ParseJobTier(str string) (JobTier, error) {
	if val, ok := jobTierStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown JobTier: %s", str)
}

var jobTypeMaskStringMapping = utils.NewStringMapping(map[JobTypeMask]string{
	JobType_Novice:     "novice",
	JobType_Swordman:   "swordman",
	JobType_Mage:       "mage",
	JobType_Archer:     "archer",
	JobType_Merchant:   "merchant",
	JobType_Thief:      "thief",
	JobType_Acolyte:    "acolyte",
	JobType_Knight:     "knight",
	JobType_Crusader:   "crusader",
	JobType_Wizard:     "wizard",
	JobType_Sage:       "sage",
	JobType_Hunter:     "hunter",
	JobType_Bard:       "bard",
	JobType_Dancer:     "dancer",
	JobType_Blacksmith: "blacksmith",
	JobType_Alchemist:  "alchemist",
	JobType_Assassin:   "assassin",
	JobType_Rogue:      "rogue",
	JobType_Priest:     "priest",
	JobType_Monk:       "monk",
	JobType_All:        "all",
})

func ParseJobTypeMask(str string) (JobTypeMask, error) {
	if val, ok := jobTypeMaskStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown JobTypeMask: %s", str)
}

func (jt *JobTypeMask) String() string {
	if str, ok := jobTypeMaskStringMapping.ToString[*jt]; ok {
		return str
	}
	return "unknown"
}

func (jt *JobTypeMask) MarshalJSON() ([]byte, error) {
	return json.Marshal(jt.String())
}

func (jt *JobTypeMask) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *jt, err = ParseJobTypeMask(str); err != nil {
		return err
	}
	return nil
}

type JobBonusStat struct {
	Level int
	Stat  StatType
}

type JobConfig struct {
	Name                string
	JobType             JobTypeMask
	JobTier             JobTier
	Base                JobTypeMask
	AspdBase            map[WeaponType]int
	MaxHPMod            float64
	MaxSPMod            float64
	CarryingCapacityMod int
	BonusStats          []JobBonusStat

	baseJob         *JobConfig
	learnableSkills map[string]bool
}

func (cfg *JobConfig) Init() {
	cfg.learnableSkills = make(map[string]bool)
}

func (cfg *JobConfig) IsJobTypeOrAncestor(jobType JobTypeMask) bool {
	for iter := cfg; iter != nil; iter = iter.baseJob {
		if iter.JobType == jobType {
			return true
		}
	}
	return false
}

type JobData struct {
	JobType JobTypeMask
}

type Job struct {
	cfg  *JobConfig
	data *JobData
}

func newJob(cfg *JobConfig) *Job {
	return &Job{cfg, &JobData{cfg.JobType}}
}

func (j *Job) CanLearnSkill(skey string) bool {
	return j.cfg.learnableSkills[skey]
}
