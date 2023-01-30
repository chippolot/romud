package utils

import (
	"log"
	"math/rand"
)

type WeightedTableEntry[T any] struct {
	Value  T
	Weight float64
}

type WeightedTableConfig[T any] []*WeightedTableEntry[T]

type WeightedTable[T any] struct {
	cfg         WeightedTableConfig[T]
	totalWeight float64
}

func NewWeightedTable[T any](cfg WeightedTableConfig[T]) *WeightedTable[T] {
	sum := 0.0
	for _, e := range cfg {
		sum += e.Weight
	}
	return &WeightedTable[T]{cfg, sum}
}

func (t *WeightedTable[T]) Select() T {
	rnd := rand.Float64() * t.totalWeight
	for _, v := range t.cfg {
		rnd -= v.Weight
		if rnd <= 0 {
			return v.Value
		}
	}

	log.Printf("failed to select value from weighted table!")
	var empty T
	return empty
}
