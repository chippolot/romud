package utils

type ChanceTableEntry[T any] struct {
	Value  T
	Chance float64
}

type ChanceTable[T any] []*ChanceTableEntry[T]

func (t *ChanceTable[T]) Select() []T {
	ret := make([]T, 0)
	for _, v := range *t {
		if RandChance100() < v.Chance {
			ret = append(ret, v.Value)
		}
	}
	return ret
}
