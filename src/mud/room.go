package mud

import (
	"encoding/json"
	"fmt"
	"strings"
	"unicode"

	"github.com/chippolot/go-mud/src/utils"
)

type RoomId int32

type RoomExitsConfig map[Direction]RoomId

func (cfg *RoomExitsConfig) MarshalJSON() ([]byte, error) {
	arr := make([]RoomExitConfig, 0)
	for dir, rid := range *cfg {
		arr = append(arr, RoomExitConfig{rid, dir})
	}
	return json.Marshal(arr)
}

func (cfg *RoomExitsConfig) UnmarshalJSON(data []byte) (err error) {
	var arr []RoomExitConfig
	if err := json.Unmarshal(data, &arr); err != nil {
		return err
	}
	roomExits := make(RoomExitsConfig)
	for _, re := range arr {
		roomExits[re.Verb] = re.RoomId
	}
	*cfg = roomExits
	return nil
}

type RoomExitConfig struct {
	RoomId RoomId
	Verb   Direction
}

type RoomConfigList []*RoomConfig

type RoomConfig struct {
	Id           RoomId
	Name         string
	Desc         string
	Exits        RoomExitsConfig
	Perceptibles *PerceptiblesConfig
}

type Room struct {
	cfg      *RoomConfig
	entities map[EntityId]*Entity
	items    map[ItemId]*Item
}

func NewRoom(cfg *RoomConfig) (*Room, error) {
	r := &Room{cfg, make(map[EntityId]*Entity), make(map[ItemId]*Item)}
	return r, nil
}

func (r *Room) Name() string {
	return r.cfg.Name
}

func (r *Room) NameCapitalized() string {
	arr := []rune(r.Name())
	arr[0] = unicode.ToUpper(arr[0])
	return string(arr)
}

func (r *Room) AddEntity(e *Entity) {
	e.data.RoomId = r.cfg.Id
	r.entities[e.id] = e
}

func (r *Room) SearchEntities(query SearchQuery) []*Entity {
	return SearchMap(query, r.entities)
}

func (r *Room) AllEntities() []*Entity {
	ents := make([]*Entity, len(r.entities))
	for _, e := range r.entities {
		ents = append(ents, e)
	}
	return ents
}

func (r *Room) RemoveEntity(e *Entity) {
	e.data.RoomId = InvalidId
	delete(r.entities, e.id)
}

func (r *Room) AddItem(i *Item) {
	i.data.RoomId = r.cfg.Id
	r.items[i.id] = i
}

func (r *Room) SearchItems(query SearchQuery) []*Item {
	return SearchMap(query, r.items)
}

func (r *Room) AllItems() []*Item {
	items := make([]*Item, 0)
	for _, i := range r.items {
		items = append(items, i)
	}
	return items
}

func (r *Room) RemoveItem(i *Item) {
	i.data.RoomId = InvalidId
	delete(r.items, i.id)
}

func (r *Room) IsExitOpen(dir Direction) bool {
	_, ok := r.cfg.Exits[dir]
	return ok
}

func (r *Room) TryPerceive(sense SenseType, words []string) (string, bool) {
	return r.cfg.Perceptibles.TryPerceive(sense, words)
}

func (r *Room) Describe(subject *Entity) string {
	var sb utils.StringBuilder
	sb.WriteString("<c bright yellow>").
		WriteString(r.Name()).
		WriteLine("</c>").
		WriteLinef("   %s", r.cfg.Desc).
		WriteString(utils.HorizontalDivider)
	describeExits(r, &sb)
	describePlayers(r, &sb, subject)
	describeNonPlayerEntities(r, &sb)
	describeItems(r, &sb)
	return sb.String()
}

func describeExits(r *Room, sb *utils.StringBuilder) {
	if len(r.cfg.Exits) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteString("<c dim yellow>Obvious Exits: ")
	i := 0
	for verb := range r.cfg.Exits {
		if i > 0 && i < len(r.cfg.Exits) {
			sb.WriteString(", ")
		}
		sb.WriteString(verb.String())
		i++
	}
	sb.WriteString("</c>")
}

func describePlayers(r *Room, sb *utils.StringBuilder, subject *Entity) {
	if len(r.entities) == 0 {
		return
	}
	var descs = make([]string, 0)
	for _, e := range r.entities {
		if e.player == nil {
			continue
		}
		if subject == e {
			continue
		}
		descs = append(descs, fmt.Sprintf("%s is here", e.Name()))
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c cyan>%s</c>", strings.Join(descs, utils.NewLine))
}

func describeNonPlayerEntities(r *Room, sb *utils.StringBuilder) {
	if len(r.entities) == 0 {
		return
	}
	var descs = make([]string, 0)
	for _, e := range r.entities {
		if e.player != nil {
			continue
		}
		desc := e.cfg.RoomDesc
		if desc == "" {
			desc = fmt.Sprintf("%s is here", e.Name())
		}
		descs = append(descs, desc)
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c blue>%s</c>", strings.Join(descs, utils.NewLine))
}

func describeItems(r *Room, sb *utils.StringBuilder) {
	if len(r.items) == 0 {
		return
	}
	var descs = make([]string, 0)
	for _, i := range r.items {
		desc := i.cfg.RoomDesc
		if desc == "" {
			desc = fmt.Sprintf("%s is here", i.Name())
		}
		descs = append(descs, desc)
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c white>%s</c>", strings.Join(descs, utils.NewLine))
}

type Direction int

const (
	DirNorth Direction = iota
	DirEast
	DirSouth
	DirWest
	DirUp
	DirDown
)

func ParseDirection(s string) (Direction, error) {
	s = strings.TrimSpace(strings.ToLower(s))
	switch s {
	case "e", "east":
		return DirEast, nil
	case "w", "west":
		return DirWest, nil
	case "n", "north":
		return DirNorth, nil
	case "s", "south":
		return DirSouth, nil
	case "u", "up":
		return DirUp, nil
	case "d", "down":
		return DirDown, nil
	default:
		return 0, fmt.Errorf("failed to parse Direction: %s", s)
	}
}

func (d *Direction) MarshalJSON() ([]byte, error) {
	return json.Marshal(d.String())
}

func (d *Direction) UnmarshalJSON(data []byte) (err error) {
	var str string
	if err := json.Unmarshal(data, &str); err != nil {
		return err
	}
	if *d, err = ParseDirection(str); err != nil {
		return err
	}
	return nil
}

func (d *Direction) String() string {
	switch *d {
	case DirEast:
		return "east"
	case DirWest:
		return "west"
	case DirNorth:
		return "north"
	case DirSouth:
		return "south"
	case DirUp:
		return "up"
	case DirDown:
		return "down"
	}
	return "unknown"
}

func (d *Direction) Reverse() (Direction, error) {
	switch *d {
	case DirEast:
		return DirWest, nil
	case DirWest:
		return DirEast, nil
	case DirNorth:
		return DirSouth, nil
	case DirSouth:
		return DirNorth, nil
	case DirUp:
		return DirDown, nil
	case DirDown:
		return DirUp, nil
	}
	return 0, fmt.Errorf("failed to reverse direction: %s", d)
}
