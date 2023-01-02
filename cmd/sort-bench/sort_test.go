package main

import (
	"fmt"
	"math/rand"
	"sort"
	"testing"

	"github.com/chippolot/go-mud/src/mud/utils"
)

type Value struct {
	Speed int
}

type Node[T any] struct {
	Val  *T
	Next *Node[T]
}

var lens = []int{
	10,
	100,
	1000,
	10000,
}

func BenchmarkSliceInsert(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkSliceInsert-%d", l), func(b *testing.B) {
			arr := make([]*Value, 0)
			for j := 0; j < l; j++ {
				arr = sliceSortedInsert(arr)
			}
			arr2 := make([]*Value, len(arr))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				copy(arr2, arr)
				arr2 = arr2[:len(arr)]
				b.StartTimer()
				arr2 = sliceSortedInsert(arr2)
			}
		})
	}
}

func BenchmarkSliceRemove(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkSliceRemove-%d", l), func(b *testing.B) {
			arr := make([]*Value, 0)
			for j := 0; j < l; j++ {
				arr = sliceSortedInsert(arr)
			}
			arr2 := make([]*Value, len(arr))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				copy(arr2, arr)
				arr2 = arr2[:len(arr)]
				b.StartTimer()
				arr2 = sliceSortedRemove(arr2)
			}
		})
	}
}

func BenchmarkSliceRange(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkSliceRange-%d", l), func(b *testing.B) {
			arr := make([]*Value, 0)
			for j := 0; j < l; j++ {
				arr = sliceSortedInsert(arr)
			}
			arr2 := make([]*Value, len(arr))
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				copy(arr2, arr)
				arr2 = arr2[:len(arr)]
				b.StartTimer()
				for _, v := range arr2 {
					_ = v
				}
			}
		})
	}
}

func BenchmarkSortedSliceInsert(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkSortedSliceInsert-%d", l), func(b *testing.B) {
			slice := utils.NewSortedSlice(func(a *Value, b *Value) bool {
				return a.Speed >= b.Speed
			})
			for j := 0; j < l; j++ {
				slice.Insert(randomValue())
			}
			slice2 := slice.Clone()
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				slice.CopyTo(slice2)
				b.StartTimer()
				slice2.Insert(randomValue())
			}
		})
	}
}

func BenchmarkSortedSliceRemove(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkSortedSliceRemove-%d", l), func(b *testing.B) {
			slice := utils.NewSortedSlice(func(a *Value, b *Value) bool {
				return a.Speed >= b.Speed
			})
			for j := 0; j < l; j++ {
				slice.Insert(randomValue())
			}
			slice2 := slice.Clone()
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				slice.CopyTo(slice2)
				b.StartTimer()
				slice2.Remove(sliceRandomElem(slice2.Slice()))
			}
		})
	}
}

func BenchmarkSortedSliceRange(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkSortedSliceRange-%d", l), func(b *testing.B) {
			slice := utils.NewSortedSlice(func(a *Value, b *Value) bool {
				return a.Speed >= b.Speed
			})
			for j := 0; j < l; j++ {
				slice.Insert(randomValue())
			}
			slice2 := slice.Clone()
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				slice.CopyTo(slice2)
				b.StartTimer()
				for _, v := range slice2.Slice() {
					_ = v
				}
			}
		})
	}
}

func BenchmarkLListInsert(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkLListInsert-%d", l), func(b *testing.B) {
			var lst *Node[Value]
			for j := 0; j < l; j++ {
				listSortedInsert(&lst)
			}
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				lst2 := copyLinkedList(lst)
				b.StartTimer()
				listSortedInsert(&lst2)
			}
		})
	}
}
func BenchmarkLListRange(b *testing.B) {
	rand.Seed(0)
	for _, l := range lens {
		b.Run(fmt.Sprintf("BenchmarkLListRange-%d", l), func(b *testing.B) {
			var lst *Node[Value]
			for j := 0; j < l; j++ {
				listSortedInsert(&lst)
			}
			b.ResetTimer()
			for i := 0; i < b.N; i++ {
				b.StopTimer()
				lst2 := copyLinkedList(lst)
				b.StartTimer()
				cur := lst2
				for cur.Next != nil {
					cur = cur.Next
				}
			}
		})
	}
}

func randomValue() *Value {
	return &Value{rand.Intn(1000)}
}

func sliceSortedInsert(arr []*Value) []*Value {
	v := randomValue()
	i := sort.Search(len(arr), func(i int) bool {
		return arr[i].Speed >= v.Speed
	})
	arr = append(arr, nil)
	copy(arr[i+1:], arr[i:])
	arr[i] = v
	return arr
}

func sliceRandomElem(arr []*Value) *Value {
	return arr[rand.Intn(len(arr))]
}

func sliceSortedRemove(arr []*Value) []*Value {
	v := sliceRandomElem(arr)
	i := sort.Search(len(arr), func(i int) bool {
		return arr[i].Speed >= v.Speed
	})
	for ; arr[i] != v; i++ {
	}
	copy(arr[i:], arr[i+1:])
	arr = arr[:len(arr)-1]
	return arr
}

func copyLinkedList(l *Node[Value]) *Node[Value] {
	if l == nil {
		return nil
	}
	ret := &Node[Value]{l.Val, l.Next}
	cur := ret
	for cur.Next != nil {
		toCopy := cur.Next
		cur.Next = &Node[Value]{toCopy.Val, toCopy.Next}
		cur = cur.Next
	}
	return ret
}

func listSortedInsert(l **Node[Value]) {
	v := &Node[Value]{&Value{rand.Intn(1000)}, nil}
	if *l == nil || (*l).Val.Speed >= v.Val.Speed {
		v.Next = *l
		*l = v
		return
	}
	cur := *l
	for cur.Next != nil && cur.Next.Val.Speed < v.Val.Speed {
		cur = cur.Next
	}
	v.Next = cur.Next
	cur.Next = v
}
