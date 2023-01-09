package mud

const (
	NonGenered Gender = iota
	Male
	Female
	Other
)

type Gender uint8

func (g Gender) GetPossessivePronoun() string {
	switch g {
	case Male:
		return "his"
	case Female:
		return "her"
	default:
		return "their"
	}
}

func (g Gender) GetObjectPronoun() string {
	switch g {
	case Male:
		return "him"
	case Female:
		return "her"
	default:
		return "them"
	}
}
