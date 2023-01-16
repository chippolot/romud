package mud

type Observable interface {
	CanBeSeenBy(observer *Entity) bool
}

type NamedObservable interface {
	Observable
	Named
}

type LookDescriptor interface {
	Desc(observer *Entity) string
}

type ObservableNameDescriptor struct {
	obj         NamedObservable
	capitalized bool
}

func (d ObservableNameDescriptor) Desc(observer *Entity) string {
	if observer == nil || (observer != d.obj && d.obj.CanBeSeenBy(observer)) {
		if d.capitalized {
			return d.obj.NameCapitalized()
		} else {
			return d.obj.Name()
		}
	}
	if d.capitalized {
		return "Something"
	} else {
		return "something"
	}
}

func LookName(o NamedObservable) LookDescriptor {
	return ObservableNameDescriptor{o, false}
}

func LookNameCap(o NamedObservable) LookDescriptor {
	return ObservableNameDescriptor{o, true}
}
