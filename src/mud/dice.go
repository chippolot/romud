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

func NewDice(num uint, sides uint, plus int) Dice {
	return Dice{num, sides, plus}
}

func ParseDice(s string) (Dice, error) {
	var num, sides uint64
	var plus int64
	var err error

	sLen := len(s)

	i1 := strings.Index(s, "d")
	if i1 == -1 {
		i1 = sLen
	}

	i2 := strings.LastIndexAny(s, "+-")
	if i2 == -1 || i2 < i1 {
		i2 = sLen
	}

	// Parse first num
	num, err = strconv.ParseUint(s[:i1], 10, 8)
	if err != nil {
		return Dice{}, fmt.Errorf("failed to parse dice from string: %s -- %v", s, err)
	}

	// Just a constant number
	if i1 == sLen {
		return Dice{uint(0), uint(0), int(num)}, nil
	}

	// Parse second num
	sides, err = strconv.ParseUint(s[i1+1:i2], 10, 8)
	if err != nil {
		return Dice{}, fmt.Errorf("failed to parse dice from string: %s -- %v", s, err)
	}

	// Just a num + sides
	if i2 == sLen {
		return Dice{uint(num), uint(sides), 0}, nil
	}

	// Parse third num
	plus, err = strconv.ParseInt(s[i2+1:], 10, 16)
	if err != nil {
		return Dice{}, fmt.Errorf("failed to parse dice from string: %s -- %v", s, err)
	}

	// Num + sides + plus
	return Dice{uint(num), uint(sides), int(plus)}, nil
}

func (d *Dice) IsZero() bool {
	return d.Num == 0 && d.Plus == 0 && d.Sides == 0
}

func (d *Dice) Add(num int) Dice {
	return Dice{d.Num, d.Sides, d.Plus + num}
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

func (d *Dice) Average() int {
	min := d.Num*1 + uint(d.Plus)
	max := d.Num*d.Sides + uint(d.Plus)
	return int((max + min) / 2.0)
}

func (d *Dice) String() string {
	if d.Sides == 0 {
		return fmt.Sprintf("%d", d.Plus)
	} else {
		return fmt.Sprintf("%dd%d+%d", d.Num, d.Sides, d.Plus)
	}
}

func (d *Dice) StringColorized(color ANSIColor) string {
	if d.Sides == 0 {
		return Colorize(color, d.Plus)
	} else {
		return fmt.Sprintf("%sd%s+%s", Colorize(color, d.Num), Colorize(color, d.Sides), Colorize(color, d.Plus))
	}
}

func (d *Dice) MarshalJSON() ([]byte, error) {
	return json.Marshal(d.String())
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
