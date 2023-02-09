package mud

import "github.com/chippolot/ro-mud/src/utils"

type AsyncCallback struct {
	time utils.Seconds
	fn   func()
}
