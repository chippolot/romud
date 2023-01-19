package mud

import (
	"strings"

	"github.com/chippolot/go-mud/src/utils"
)

var Preamble = strings.ReplaceAll(`
 ________   ________   _____ ______    ___  ___   ________
|\   ____\ |\   __  \ |\   _ \  _   \ |\  \|\  \ |\   ___ \
\ \  \___| \ \  \|\  \\ \  \\\__\ \  \\ \  \\\  \\ \  \_|\ \
 \ \  \  ___\ \  \\\  \\ \  \\|__| \  \\ \  \\\  \\ \  \ \\ \
  \ \  \|\  \\ \  \\\  \\ \  \    \ \  \\ \  \\\  \\ \  \_\\ \
   \ \_______\\ \_______\\ \__\    \ \__\\ \_______\\ \_______\
    \|_______| \|_______| \|__|     \|__| \|_______| \|_______|
    <c black>"black"</c>
	<c red>"red"</c>
	<c green>"green"</c>
	<c yellow>"yellow"</c>
	<c blue>"blue"</c>
	<c magenta>"magenta"</c>
	<c cyan>"cyan"</c>
	<c white>"white"</c>
`, "\n", utils.NewLine)
