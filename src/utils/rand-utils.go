package utils

import "math/rand"

func RandRange(min int, max int) int {
	if min == max {
		return min
	}
	d := max - min
	return min + rand.Intn(d+1)
}

func RandChance100() float64 {
	return rand.Float64() * 100
}
