package mud

import (
	"log"

	"github.com/chippolot/romud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

type ItemScripts struct {
	use func(*Entity, *Item) bool
}

func NewItemScripts(L *lua.LState, tbl *lua.LTable) *ItemScripts {
	scripts := &ItemScripts{}
	if fn := utils.GetLuaFunctionFromTable(tbl, "Use"); fn != nil {
		scripts.use = func(user *Entity, item *Item) bool {
			if err := L.CallByParam(lua.P{Fn: fn, NRet: 1, Protect: true}, utils.ToUserData(L, user), utils.ToUserData(L, item)); err != nil {
				log.Panicln("error calling use script: ", err)
			}
			b, ok := L.Get(-1).(lua.LBool)
			if !ok {
				log.Panicf("expected %s item use function to return bool", item.cfg.Key)
			}
			L.Pop(1)
			return lua.LVAsBool(b)
		}
	}
	return scripts
}

func triggerUseItemScript(e *Entity, i *Item) {
	if i.cfg.scripts != nil && i.cfg.scripts.use != nil {
		i.cfg.scripts.use(e, i)
	}
}
