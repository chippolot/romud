package utils

func FindIndex[T comparable](s []T, v T) int {
	for idx, v2 := range s {
		if v == v2 {
			return idx
		}
	}
	return -1
}

func SwapDelete[T any](s []T, idx int) []T {
	c := len(s)
	s[idx] = s[c-1]
	var empty T
	s[c-1] = empty
	return s[:c-1]
}
