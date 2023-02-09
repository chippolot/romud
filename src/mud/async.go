package mud

import "github.com/chippolot/go-mud/src/utils"

type AsyncCallback struct {
	time utils.Seconds
	fn   func()
}
