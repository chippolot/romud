package utils

import "sort"

type SortedSlice[T comparable] struct {
	cmp func(a T, b T) bool
	arr []T
}

func NewSortedSlice[T comparable](cmp func(a T, b T) bool) *SortedSlice[T] {
	return &SortedSlice[T]{cmp, make([]T, 0)}
}

func (s *SortedSlice[T]) Insert(val T) {
	i := sort.Search(len(s.arr), func(i int) bool {
		return s.cmp(s.arr[i], val)
	})
	var empt T
	s.arr = append(s.arr, empt)
	copy(s.arr[i+1:], s.arr[i:])
	s.arr[i] = val
}

func (s *SortedSlice[T]) Remove(val T) {
	i := sort.Search(len(s.arr), func(i int) bool {
		return s.cmp(s.arr[i], val)
	})
	if i >= len(s.arr) {
		return
	}
	for ; i < len(s.arr) && s.arr[i] != val; i++ {
	}
	if i >= len(s.arr) {
		return
	}
	copy(s.arr[i:], s.arr[i+1:])
	s.arr = s.arr[:len(s.arr)-1]
}

func (s *SortedSlice[T]) Slice() []T {
	return s.arr
}

func (s *SortedSlice[T]) Clone() *SortedSlice[T] {
	arr2 := make([]T, len(s.arr))
	copy(arr2, s.arr)
	arr2 = arr2[:len(s.arr)]
	return &SortedSlice[T]{s.cmp, arr2}
}

func (s *SortedSlice[T]) CopyTo(dst *SortedSlice[T]) {
	if len(dst.arr) < len(s.arr) {
		dst.arr = make([]T, 0, len(s.arr))
	}
	copy(dst.arr, s.arr)
	dst.arr = dst.arr[:len(s.arr)]
}
