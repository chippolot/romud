package mud

import (
	"encoding/json"
	"fmt"
	"math/rand"
	"strconv"
	"strings"
)

var D4 = &Dice{1, 4, 0}
var D6 = &Dice{1, 6, 0}
var D8 = &Dice{1, 8, 0}
var D10 = &Dice{1, 10, 0}
var D12 = &Dice{1, 12, 0}
var D20 = &Dice{1, 20, 0}
var D100 = &Dice{1, 100, 0}

type Dice struct {
	Num   uint
	Sides uint
	Plus  int
}

func ParseDice(s string) (Dice, error) {
	i1 := strings.Index(s, "d")
	i2 := strings.Index(s, "+")
	if i2 == -1 {
		i2 = len(s)
	}
	if i1 != -1 {
		// Parse 'XdY'
		num, err1 := strconv.ParseUint(s[:i1], 10, 8)
		sides, err2 := strconv.ParseUint(s[i1+1:i2], 10, 8)

		// Optionally parse the number after a '+'
		var plus int64
		var err3 error
		if i2 != len(s) {
			plus, err3 = strconv.ParseInt(s[i2+1:], 10, 16)
		}
		if err1 == nil && err2 == nil && err3 == nil {
			return Dice{uint(num), uint(sides), int(plus)}, nil
		}
	}
	return Dice{}, fmt.Errorf("failed to parse dice from string: %s", s)
}

func (d *Dice) CriticalRoll() int {
	if d == nil {
		return 0
	}
	sum := 0
	for i := 0; i < int(d.Num*2); i++ {
		sum += rand.Intn(int(d.Sides)) + 1
	}
	return sum + d.Plus
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

func (d *Dice) String() string {
	return fmt.Sprintf("%dd%d+%d", d.Num, d.Sides, d.Plus)
}

func (d *Dice) StringColorized(color string) string {
	return fmt.Sprintf("<c %s>%d</c>d<c %s>%d</c>+<c %s>%d</c>", color, d.Num, color, d.Sides, color, d.Plus)
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
