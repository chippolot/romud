package mud

const (
	Male Gender = iota
	Female
	Other
)

type Gender uint8

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
