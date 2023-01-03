package utils

type Node[T any] struct {
	Value T
	Next  *Node[T]
}

type List[T comparable] struct {
	Head *Node[T]
}

func (l *List[T]) Add(value T) {
	l.Head = &Node[T]{value, l.Head}
}

func (l *List[T]) Contains(value T) bool {
	for i := l.Head; i != nil; i = i.Next {
		if i.Value == value {
			return true
		}
	}
	return false
}

func (l *List[T]) Remove(value T) {
	var prev *Node[T]
	for i := l.Head; i != nil; i = i.Next {
		if i.Value == value {
			if prev != nil {
				prev.Next = i.Next
			}
			i.Next = nil
			return
		}
		prev = i
	}
}
