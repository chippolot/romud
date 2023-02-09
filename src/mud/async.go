package mud

import "github.com/chippolot/romud/src/utils"

type AsyncCallback struct {
	time utils.Seconds
	fn   func()
}
