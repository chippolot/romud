package mud

import (
	"fmt"
	"log"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

var itemIdCounter ItemId = InvalidId
var emptyItemList = make([]*Item, 0)

type ItemId int32

type ItemConfigList []*ItemConfig

type ItemConfig struct {
	Key          string
	Name         string
	Keywords     []string
	RoomDesc     string
	FullDesc     string
	Perceptibles *PerceptiblesConfig
	Flags        ItemFlags
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

type ItemContainer interface {
	AddItem(item *Item)
	SearchItems(query SearchQuery) []*Item
	AllItems() []*Item
	RemoveItem(item *Item)
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

func (i *Item) SetData(data *ItemData, w *World) {
	i.data = data

	// Prepare contents
	if i.cfg.Flags.Has(IFlag_Container) {
		for _, idata := range i.data.Contents {
			cfg, ok := w.itemConfigs[idata.Key]
			if !ok {
				log.Fatalf("cannot create item. expected item config with key %s", cfg.Key)
			}
			item := NewItem(cfg)
			item.SetData(idata, w)
			i.contents = append(i.contents, item)
		}
	}
}

func (i *Item) Name() string {
	return i.cfg.Name
}

func (i *Item) MatchesKeyword(keyword string) bool {
	if strings.EqualFold(i.Name(), keyword) {
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

func (i *Item) AddItem(i2 *Item) {
	if !i.cfg.Flags.Has(IFlag_Container) {
		log.Panicf("trying to add item to non-container item: %s", i.cfg.Key)
	}
	i.contents = append(i.contents, i2)
	i.data.Contents = append(i.data.Contents, i2.data)
}

func (i *Item) SearchItems(query SearchQuery) []*Item {
	if !i.cfg.Flags.Has(IFlag_Container) {
		return emptyItemList
	}
	return SearchList(query, i.contents)
}

func (i *Item) AllItems() []*Item {
	return i.contents
}

func (i *Item) RemoveItem(item *Item) {
	if !i.cfg.Flags.Has(IFlag_Container) {
		log.Panicf("trying to remove item to non-container item: %s", i.cfg.Key)
	}
	if idx := utils.FindIndex(i.contents, item); idx != -1 {
		i.contents = utils.SwapDelete(i.contents, idx)
		i.data.Contents = utils.SwapDelete(i.data.Contents, idx)
	}
}

func (i *Item) DescribeContents() string {
	if !i.cfg.Flags.Has(IFlag_Container) {
		return fmt.Sprintf("%s is not a container!", i.Name())
	}

	var sb utils.StringBuilder
	state := ""
	if i.data.RoomId == InvalidId {
		state = "carried"
	} else {
		state = "in room"
	}
	sb.WriteLinef("You look in %s (%s):", i.Name(), state)
	if len(i.contents) == 0 {
		sb.WriteLine("  Nothing.")
	} else {
		for _, i2 := range i.contents {
			sb.WriteLinef("  <c white>%s</c>", i2.Name())
		}
	}
	return sb.String()
}

func (i *Item) RemoveAllFromContainer(w *World) ItemList {
	if !i.cfg.Flags.Has(IFlag_Container) {
		log.Panicf("trying to remove items to non-container item: %s", i.cfg.Key)
	}
	if len(i.contents) == 0 {
		return i.contents[:0]
	}
	items := make(ItemList, len(i.contents))
	copy(items, i.contents)
	i.contents = i.contents[:0]
	i.data.Contents = i.data.Contents[:0]
	return items
}

func SearchItems(query SearchQuery, containers ...ItemContainer) []*Item {
	// TODO dot notation for specifying container type
	for _, c := range containers {
		if items := c.SearchItems(query); len(items) != 0 {
			return items
		}
	}
	return nil
}
