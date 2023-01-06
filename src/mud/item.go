package mud

import (
	"strings"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
)

const (
	IFlag_Container bits.Bits = 1 << iota
	IFlag_Light
)

var itemIdCounter ItemId = InvalidId

type ItemId int32

type ItemConfigList []*ItemConfig

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

type ItemList []*Item

type Item struct {
	id       ItemId
	cfg      *ItemConfig
	data     *ItemData
	contents ItemList
}

func NewItem(cfg *ItemConfig) *Item {
	itemIdCounter++
	id := itemIdCounter
	return &Item{id, cfg, newItemData(cfg), make(ItemList, 0)}
}

func newItemData(cfg *ItemConfig) *ItemData {
	return &ItemData{cfg.Key, InvalidId, make([]*ItemData, 0)}
}

func (i *Item) MatchesKeyword(keyword string) bool {
	if strings.EqualFold(i.cfg.Name, keyword) {
		return true
	}
	_, ok := i.cfg.lookup[keyword]
	return ok
}

func (i *Item) TryPerceive(sense SenseType, words []string) (string, bool) {
	desc, ok := i.cfg.Perceptibles.TryPerceive(sense, words)
	if ok {
		return desc, ok
	}
	if sense == SenseLook && i.cfg.FullDesc != "" {
		return i.cfg.FullDesc, true
	}
	return "", false
}

func (i *Item) AddToContainer(i2 *Item) {
	i.contents = append(i.contents, i2)
	i.data.Contents = append(i.data.Contents, i2.data)
}

func (i *Item) SearchContainer(query SearchQuery) (*Item, bool) {
	return SearchList(query, i.contents)
}

func (i *Item) RemoveFromContainer(item *Item) {
	if idx := utils.FindIndex(i.contents, item); idx != -1 {
		i.contents = utils.SwapDelete(i.contents, idx)
		i.data.Contents = utils.SwapDelete(i.data.Contents, idx)
	}
}

func (i *Item) RemoveAllFromContainer(w *World) ItemList {
	if len(i.contents) == 0 {
		return i.contents[:0]
	}
	items := make(ItemList, len(i.contents))
	copy(items, i.contents)
	i.contents = i.contents[:0]
	i.data.Contents = i.data.Contents[:0]
	return items
}
