package mud

type Observable interface {
	CanBeSeenBy(observer *Entity) bool
}

type NamedObservable interface {
	Observable
	Named
}

type ObservableDescriptor interface {
	Desc(observer *Entity) string
}

type ObservableNameDescriptor struct {
	obj         NamedObservable
	capitalized bool
}

func (d ObservableNameDescriptor) Desc(observer *Entity) string {
	if observer == nil || (observer != d.obj && d.obj.CanBeSeenBy(observer)) {
		if d.capitalized {
			return d.obj.GetNameCapitalized()
		} else {
			return d.obj.GetName()
		}
	}
	if d.capitalized {
		return "Something"
	} else {
		return "something"
	}
}

func ObservableName(o NamedObservable) ObservableDescriptor {
	return ObservableNameDescriptor{o, false}
}

func ObservableNameCap(o NamedObservable) ObservableDescriptor {
	return ObservableNameDescriptor{o, true}
}
