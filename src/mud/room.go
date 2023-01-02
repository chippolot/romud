package mud

import (
	"encoding/json"
	"fmt"
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

type RoomId uint32

type RoomExitsConfig map[Direction]RoomId

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
	Exits        *RoomExitsConfig
	Perceptibles *PerceptiblesConfig
}

type Room struct {
	cfg      *RoomConfig
	entities map[EntityId]*Entity
}

func ParseRoom(cfg *RoomConfig) (*Room, error) {
	r := &Room{cfg, make(map[EntityId]*Entity)}
	return r, nil
}

func (r *Room) AddEntity(e *Entity) {
	oldRoomId := e.data.RoomId
	e.data.RoomId = r.cfg.Id
	r.entities[e.id] = e
	if oldRoomId != 0 {
		if e.player != nil {
			r.SendAllExcept(e.player.id, "%s entered the room", e.Name())
		} else {
			r.SendAll("%s entered the room", e.Name())
		}
	}
}

func (r *Room) RemoveEntity(e *Entity) {
	if e.player != nil {
		r.SendAllExcept(e.player.id, "%s left the room", e.Name())
	} else {
		r.SendAll("%s left the room", e.Name())
	}
	delete(r.entities, e.id)
}

func (r *Room) SendAll(format string, a ...any) {
	for _, e := range r.entities {
		if e.player != nil {
			e.player.Send(format, a...)
		}
	}
}

func (r *Room) SendAllExcept(pid PlayerId, format string, a ...any) {
	for _, e := range r.entities {
		if e.player != nil && pid != e.player.id {
			e.player.Send(format, a...)
		}
	}
}

func (r *Room) TryPerceive(sense SenseType, words []string) (string, bool) {
	return r.cfg.Perceptibles.TryPerceive(sense, words)
}

func (r *Room) Describe(subject *Entity) string {
	var sb utils.StringBuilder
	sb.WriteNewLine().
		WriteString("<c bright yellow>").
		WriteString(r.cfg.Name).
		WriteLine("</c>").
		WriteLinef("   %s", r.cfg.Desc).
		WriteString(utils.HorizontalDivider)
	describeExits(r, &sb)
	describePlayers(r, &sb, subject)
	describeNonPlayerEntities(r, &sb)
	return sb.String()
}

func describeExits(r *Room, sb *utils.StringBuilder) {
	if len(*r.cfg.Exits) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteString("<c dim yellow>Obvious Exits: ")
	i := 0
	for verb := range *r.cfg.Exits {
		if i > 0 && i < len(*r.cfg.Exits)-1 {
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
			desc = fmt.Sprintf("A %s is here", e.Name())
		}
		descs = append(descs, desc)
	}
	if len(descs) == 0 {
		return
	}
	sb.WriteNewLine()
	sb.WriteStringf("<c blue>%s</c>", strings.Join(descs, utils.NewLine))
}

type Direction int

const (
	DirectionEast Direction = iota
	DirectionWest
	DirectionNorth
	DirectionSouth
	DirectionUp
	DirectionDown
)

func ParseDirection(s string) (Direction, error) {
	s = strings.TrimSpace(strings.ToLower(s))
	switch s {
	case "e", "east":
		return DirectionEast, nil
	case "w", "west":
		return DirectionWest, nil
	case "n", "north":
		return DirectionNorth, nil
	case "s", "south":
		return DirectionSouth, nil
	case "u", "up":
		return DirectionUp, nil
	case "d", "down":
		return DirectionDown, nil
	default:
		return 0, fmt.Errorf("failed to parse Direction: %s", s)
	}
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
	case DirectionEast:
		return "east"
	case DirectionWest:
		return "west"
	case DirectionNorth:
		return "north"
	case DirectionSouth:
		return "south"
	case DirectionUp:
		return "up"
	case DirectionDown:
		return "down"
	}
	return "unknown"
}

func (d *Direction) Reverse() (Direction, error) {
	switch *d {
	case DirectionEast:
		return DirectionWest, nil
	case DirectionWest:
		return DirectionEast, nil
	case DirectionNorth:
		return DirectionSouth, nil
	case DirectionSouth:
		return DirectionNorth, nil
	case DirectionUp:
		return DirectionDown, nil
	case DirectionDown:
		return DirectionUp, nil
	}
	return 0, fmt.Errorf("failed to reverse direction: %s", d)
}
