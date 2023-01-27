package utils

func MaxInts(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func MinInts(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func ClampInts(v, min, max int) int {
	if v > max {
		return max
	}
	if v < min {
		return min
	}
	return v
}
