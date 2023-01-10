package mud

type Named interface {
	Name() string
	NameCapitalized() string
}

type Descriptive interface {
	RoomDesc() string
	FullDesc() string
}
