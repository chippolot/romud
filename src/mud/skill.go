package mud

import "github.com/chippolot/go-mud/src/utils"

const (
	SkillType_Passive SkillType = iota
	SkillType_Active
	SkillType_Offensive
)
const (
	SkillTargetType_None SkillType = iota
	SkillTargetType_Self
	SkillTargetType_SingleEnemy
	SkillTargetType_AllEnemies
)

type SkillType int
type SkillTargetType int

// TODO: SkillType Mapping
// TODO: SkillType Lua

// TODO: SkillTargetType Mapping
// TODO: SkillTargetType Lua

type SkillConfig struct {
	Name       string
	Type       SkillType
	TargetType SkillTargetType
	CastTime   utils.Seconds
	SPCost     int
	MaxLevel   int
	Desc       string
	fn         func(user *Entity, targets []*Entity)
}
