package mud

import (
	"github.com/chippolot/go-mud/src/utils"
)

var LogFlag_DiceRolls = utils.DefaultLogger.RegisterFlag(1<<0, "roll")
