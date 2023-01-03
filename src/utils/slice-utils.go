package utils

func FindIndex[T comparable](s []T, v T) int {
	for idx, v2 := range s {
		if v == v2 {
			return idx
		}
	}
	return -1
}

func AddUnique[T comparable](s []T, v T) []T {
	if FindIndex(s, v) == -1 {
		return append(s, v)
	}
	return s
}

func SwapDelete[T any](s []T, idx int) []T {
	c := len(s)
	s[idx] = s[c-1]
	var empty T
	s[c-1] = empty
	return s[:c-1]
}
