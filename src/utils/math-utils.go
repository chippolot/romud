package utils

func MaxInt(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func MinInt(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func ClampInt(v, min, max int) int {
	if v > max {
		return max
	}
	if v < min {
		return min
	}
	return v
}
