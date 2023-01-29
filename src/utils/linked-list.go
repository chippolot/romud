package utils

type Node[T any] struct {
	Value T
	Next  *Node[T]
}

type List[T comparable] struct {
	Head *Node[T]
	Tail *Node[T]
}

func (l *List[T]) AddFront(value T) {
	l.Head = &Node[T]{Value: value, Next: l.Head}
	if l.Tail == nil {
		l.Tail = l.Head
	}
}

func (l *List[T]) AddBack(value T) {
	tail := &Node[T]{Value: value}
	if l.Tail != nil {
		l.Tail.Next = tail
	} else {
		l.Head = tail
	}
	l.Tail = tail
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
			} else {
				l.Head = i.Next
			}
			i.Next = nil
			return
		}
		prev = i
	}
}
