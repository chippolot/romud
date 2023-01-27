package mud

import "math/rand"

const (
	InvalidId = 0
)

func randRange(min int, max int) int {
	if min == max {
		return min
	}
	d := max - min
	return min + rand.Intn(d+1)
}

func randChance100() float64 {
	return rand.Float64() * 100
}
