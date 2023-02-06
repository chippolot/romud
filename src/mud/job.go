package mud

import (
	"fmt"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	JobType_Novice JobType = iota
	JobType_Transcendent_Novice
	JobType_First
	JobType_Transcendent_First
	JobType_Second
	JobType_Transcendent_Second
)

type JobType int

var jobTypeStringMapping = utils.NewStringMapping(map[JobType]string{
	JobType_Novice:              "novice",
	JobType_Transcendent_Novice: "transcendent_novice",
	JobType_First:               "first",
	JobType_Transcendent_First:  "transcendent_first",
	JobType_Second:              "second",
	JobType_Transcendent_Second: "transcendent_second",
})

func ParseJobType(str string) (JobType, error) {
	str = strings.ToLower(str)
	if val, ok := jobTypeStringMapping.ToValue[str]; ok {
		return val, nil
	}
	return 0, fmt.Errorf("unknown JobType: %s", str)
}

type JobConfig struct {
	Key     string
	Name    string
	JobType JobType
}

type JobData struct {
	Key string
}

type Job struct {
	cfg  *JobConfig
	data *JobData
}
