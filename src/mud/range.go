package mud

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"strconv"
	"strings"
)

type Range struct {
	Min int
	Max int
}

func NewRange(min int, max int) Range {
	return Range{min, max}
}

func ParseRange(s string) (Range, error) {
	i1 := strings.Index(s, "-")
	if i1 == -1 {
		if val, err := strconv.Atoi(s); err != nil {
			return Range{}, err
		} else {
			return Range{val, val}, nil
		}
	}

	min, errMin := strconv.Atoi(s[:i1])
	max, errMax := strconv.Atoi(s[i1+1:])
	if errMin != nil {
		return Range{}, errMin
	}
	if errMax != nil {
		return Range{}, errMax
	}

	return Range{min, max}, nil
}

func (r *Range) Random() int {
	if r.Min == r.Max {
		return r.Min
	}
	return r.Min + rand.Intn(r.Max-r.Min+1)
}

func (r *Range) Average() int {
	return int((r.Max + r.Min) / 2.0)
}

func (r *Range) String() string {
	if r.Min == r.Max {
		return fmt.Sprintf("%d", r.Min)
	} else {
		return fmt.Sprintf("%d-%d", r.Min, r.Max)
	}
}

func (r *Range) StringColorized(color ANSIColor) string {
	if r.Min == r.Max {
		return Colorize(color, r.Min)
	} else {
		return fmt.Sprintf("%s-%s", Colorize(color, r.Min), Colorize(color, r.Max))
	}
}

func (r *Range) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *r, err = ParseRange(str); err != nil {
		return err
	}
	return nil
}
