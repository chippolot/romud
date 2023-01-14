package mud

type LookDescriptor interface {
	Desc(perceiver *Entity) string
}

type EntityNameDescriptor struct {
	e           *Entity
	capitalized bool
}

func (d EntityNameDescriptor) Desc(perceiver *Entity) string {
	if perceiver == nil || (perceiver != d.e && d.e.CanBeSeenBy(perceiver)) {
		if d.capitalized {
			return d.e.NameCapitalized()
		} else {
			return d.e.Name()
		}
	}
	if d.capitalized {
		return "Something"
	} else {
		return "something"
	}
}

func LookEntityName(e *Entity) LookDescriptor {
	return EntityNameDescriptor{e, false}
}

func LookEntityNameCap(e *Entity) LookDescriptor {
	return EntityNameDescriptor{e, true}
}
