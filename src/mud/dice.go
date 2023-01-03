package mud

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"strconv"
	"strings"
)

type Dice struct {
	Num   uint
	Sides uint
	Plus  int
}

func ParseDice(s string) (Dice, error) {
	i1 := strings.Index(s, "d")
	i2 := strings.Index(s, "+")
	if i1 != -1 && i2 != -1 {
		num, err1 := strconv.ParseUint(s[:i1], 10, 8)
		sides, err2 := strconv.ParseUint(s[i1+1:i2], 10, 8)
		plus, err3 := strconv.ParseInt(s[i2+1:], 10, 16)
		if err1 == nil && err2 == nil && err3 == nil {
			return Dice{uint(num), uint(sides), int(plus)}, nil
		}
	}
	return Dice{}, fmt.Errorf("failed to parse dice from string: %s", s)
}

func (d *Dice) Roll() int {
	if d == nil {
		return 0
	}
	sum := 0
	for i := 0; i < int(d.Num); i++ {
		sum += rand.Intn(int(d.Sides)) + 1
	}
	return sum + d.Plus
}

func (d *Dice) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *d, err = ParseDice(str); err != nil {
		return err
	}
	return nil
}
