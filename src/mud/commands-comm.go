package mud

import "strings"

func DoSay(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to say?")
	}
	msg := strings.Join(tokens[1:], " ")
	performSay(e, w, msg)
}

func DoYell(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		SendToPlayer(e, "What do you want to yell?")
	}
	msg := strings.Join(tokens[1:], " ")
	performYell(e, w, msg)
}

func DoWhisper(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		SendToPlayer(e, "What do you want to whisper to who?")
	case 2:
		SendToPlayer(e, "What do you want to whisper to %s?", tokens[1])
	default:
		name := tokens[1]
		msg := strings.Join(tokens[2:], " ")

		if name == e.Name() {
			SendToPlayer(e, "You try whispering to yourself")
			return
		} else if te, ok := TryGetEntityByName(name, w.entities); ok {
			performWhisper(e, w, te, msg)
		} else {
			SendToPlayer(e, "No player named %s is online", name)
		}
	}
}

func performSay(e *Entity, w *World, msg string) {
	SendToPlayer(e, "Ok.")
	BroadcastToRoomRe(w, e, SendRst_None, "%s says, '%s'", ObservableNameCap(e), msg)
}

func performWhisper(e *Entity, w *World, to *Entity, msg string) {
	SendToPlayer(e, "Ok.")
	SendToPlayerRe(to, e, SendRst_None, "%s whispers to you, %s", ObservableNameCap(e), msg)
}

func performYell(e *Entity, w *World, msg string) {
	SendToPlayer(e, "Ok.")
	BroadcastToWorldRe(w, e, SendRst_None, "%s yells, '%s'", ObservableNameCap(e), msg)
}
