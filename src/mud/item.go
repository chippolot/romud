package mud

import (
	"strings"

	"github.com/chippolot/go-mud/src/bits"
)

const (
	IFlag_Container bits.Bits = 1 << iota
	IFlag_Light
)

var itemIdCounter ItemId

type ItemId uint32

type ItemConfig struct {
	Key          string
	Name         string
	Keywords     []string
	RoomDesc     string
	FullDesc     string
	Perceptibles *PerceptiblesConfig
	Flags        bits.Bits
	lookup       map[string]bool
}

func (cfg *ItemConfig) Init() {
	cfg.lookup = make(map[string]bool)
	for _, s := range cfg.Keywords {
		cfg.lookup[strings.ToLower(s)] = true
	}
}

type ItemData struct {
	Key      string
	RoomId   RoomId
	Contents []*ItemData
}

type Item struct {
	id   ItemId
	cfg  *ItemConfig
	data *ItemData
}

func NewItem(cfg *ItemConfig) *Item {
	itemIdCounter++
	id := itemIdCounter
	return &Item{id, cfg, newItemData(cfg)}
}

func newItemData(cfg *ItemConfig) *ItemData {
	return &ItemData{cfg.Key, InvalidId, make([]*ItemData, 0)}
}

func (e *Item) Matches(s string) bool {
	if strings.EqualFold(e.cfg.Name, s) {
		return true
	}
	_, ok := e.cfg.lookup[s]
	return ok
}

func (e *Item) TryPerceive(sense SenseType, words []string) (string, bool) {
	desc, ok := e.cfg.Perceptibles.TryPerceive(sense, words)
	if ok {
		return desc, ok
	}
	if sense == SenseLook && e.cfg.FullDesc != "" {
		return e.cfg.FullDesc, true
	}
	return "", false
}

func (i *Item) AddToContainer(w *World, i2 *Item) bool {

}

func (i *Item) RemoveFromContainer(w *World, keywords []string) (*Item, bool) {

}

func (i *Item) RemoveAllFromContainer(w *World) ([]*Item, bool) {

}
