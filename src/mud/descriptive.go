package mud

type Named interface {
	Name() string
	NameCapitalized() string
}

type Descriptive interface {
	Describe() string
}
