package mud

import (
	"fmt"
	"log"
	"strings"
	"time"

	"github.com/chippolot/ro-mud/src/utils"
)

var itemIdCounter ItemId = InvalidId
var emptyItemList = make([]*Item, 0)

type ItemId int32

type ItemConfigList []*ItemConfig

type ItemConfig struct {
	Key        string
	Name       string
	NamePlural string
	Keywords   []string
	RoomDesc   string
	FullDesc   string
	Flags      ItemFlagMask
	Equipment  *EquipmentConfig
	BuyPrice   int
	SellPrice  int
	Weight     int
	lookup     map[string]bool
	scripts    *ItemScripts
}

func (cfg *ItemConfig) Init() {
	cfg.lookup = make(map[string]bool)
	for _, s := range cfg.Keywords {
		cfg.lookup[strings.ToLower(s)] = true
	}
}
func (cfg *ItemConfig) MatchesKeyword(keyword string) bool {
	if strings.EqualFold(cfg.Name, keyword) {
		return true
	}
	_, ok := cfg.lookup[keyword]
	return ok
}

func (cfg *ItemConfig) GetName() string {
	return cfg.Name
}

func (cfg *ItemConfig) GetNameCapitalized() string {
	return utils.Capitalize(cfg.Name)
}

func (cfg *ItemConfig) GetNamePluralized(count int, includeCount bool) string {
	if count < 2 {
		return cfg.Name
	}
	if includeCount {
		return fmt.Sprintf("%d %s", count, cfg.NamePlural)
	}
	return cfg.NamePlural
}

func (cfg *ItemConfig) Stackable() bool {
	return !cfg.Flags.Has(IFlag_Container) && cfg.Equipment == nil
}

type Ownership struct {
	OwnerId EntityId
	Until   time.Time
}

func (o Ownership) Valid() bool {
	return time.Now().UTC().Before(o.Until)
}

type ItemData struct {
	Key      string
	RoomId   RoomId      `json:",omitempty"`
	Contents []*ItemData `json:",omitempty"`
}

type ItemContainer interface {
	AddItem(item *Item)
	SearchItems(query SearchQuery) []*Item
	AllItems() []*Item
	ItemWeight() int
	RemoveItem(item *Item)
}

type ItemList []*Item

type Item struct {
	id       ItemId
	cfg      *ItemConfig
	data     *ItemData
	contents ItemList
	ownedBy  *Ownership
}

func NewItem(cfg *ItemConfig) *Item {
	itemIdCounter++
	id := itemIdCounter
	return &Item{id, cfg, newItemData(cfg), make(ItemList, 0), nil}
}

func newItemData(cfg *ItemConfig) *ItemData {
	data := &ItemData{cfg.Key, InvalidId, make([]*ItemData, 0)}
	return data
}

func (i *Item) SetData(data *ItemData, w *World) {
	i.data = data

	// Prepare contents
	if i.data.Contents == nil {
		i.data.Contents = make([]*ItemData, 0)
	}
	if i.cfg.Flags.Has(IFlag_Container) {
		for _, idata := range i.data.Contents {
			cfg, ok := w.cfg.itemConfigs[idata.Key]
			if !ok {
				log.Fatalf("cannot create item. expected item config with key %s", cfg.Key)
			}
			item := NewItem(cfg)
			item.SetData(idata, w)
			i.contents = append(i.contents, item)
		}
	}
}

func (i *Item) RoomId() RoomId {
	return i.data.RoomId
}

func (i *Item) GetName() string {
	return i.cfg.GetName()
}

func (i *Item) GetNameCapitalized() string {
	return i.cfg.GetNameCapitalized()
}

func (i *Item) GetNamePluralized(count int, includeCount bool) string {
	return i.cfg.GetNamePluralized(count, includeCount)
}

func (i *Item) CanBeSeenBy(viewer *Entity) bool {
	if viewer != nil && !viewer.CanSee() {
		return false
	}
	return true
}

func (i *Item) Describe() string {
	return i.cfg.FullDesc
}

func (i *Item) MatchesKeyword(keyword string) bool {
	return i.cfg.MatchesKeyword(keyword)
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
	return SearchList(query, i.contents, nil)
}

func (i *Item) AllItems() []*Item {
	return i.contents
}

func (i *Item) ItemWeight() int {
	w := i.cfg.Weight
	for _, i2 := range i.AllItems() {
		w += i2.cfg.Weight
	}
	return w
}

func (i *Item) Value() int {
	return utils.MaxInt(i.cfg.BuyPrice, i.cfg.SellPrice*2)
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
		return fmt.Sprintf("%s is not a container!", i.GetName())
	}

	var sb utils.StringBuilder
	state := ""
	if i.data.RoomId == InvalidId {
		state = "carried"
	} else {
		state = "in room"
	}
	sb.WriteLinef("You look in %s (%s):", i.GetName(), state)
	if len(i.contents) == 0 {
		sb.WriteLine("  Nothing.")
	} else {
		for _, i2 := range i.contents {
			sb.WriteLinef("  %s", Colorize(Color_Enum, i2.GetName()))
		}
	}
	return sb.String()
}

func (i *Item) RemoveAllFromContainer() ItemList {
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
	for _, c := range containers {
		if items := c.SearchItems(query); len(items) != 0 {
			return items
		}
	}
	return nil
}
