package utils

type ChanceTableEntry[T any] struct {
	Value  T
	Chance float64
}

type ChanceTable[T any] []*ChanceTableEntry[T]

func (t *ChanceTable[T]) Select() []T {
	return t.SelectMultiplied(1)
}

func (t *ChanceTable[T]) SelectMultiplied(mult float64) []T {
	ret := make([]T, 0)
	for _, v := range *t {
		if RandChance100() < v.Chance*mult {
			ret = append(ret, v.Value)
		}
	}
	return ret
}
