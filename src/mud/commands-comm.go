package mud

import "strings"

func DoSay(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		Write("What do you want to say?").ToPlayer(e).Send()
	}
	msg := strings.Join(tokens[1:], " ")
	performSay(e, w, msg)
}

func DoYell(e *Entity, w *World, tokens []string) {
	if len(tokens) == 1 {
		Write("What do you want to yell?").ToPlayer(e).Send()
	}
	msg := strings.Join(tokens[1:], " ")
	performYell(e, w, msg)
}

func DoWhisper(e *Entity, w *World, tokens []string) {
	switch len(tokens) {
	case 1:
		Write("What do you want to whisper to who?").ToPlayer(e).Send()
	case 2:
		Write("What do you want to whisper to %s?", tokens[1]).ToPlayer(e).Send()
	default:
		name := tokens[1]
		msg := strings.Join(tokens[2:], " ")

		if name == e.Name() {
			Write("You try whispering to yourself").ToPlayer(e).Send()
			return
		} else if te, ok := TryGetEntityByName(name, w.entities); ok {
			performWhisper(e, w, te, msg)
		} else {
			Write("No player named %s is online", name).ToPlayer(e).Send()
		}
	}
}

func performSay(e *Entity, w *World, msg string) {
	Write("Ok.").ToPlayer(e).Send()
	Write("%s says, '%s'", ObservableNameCap(e), msg).ToEntityRoom(w, e).Subject(e).Send()
}

func performWhisper(e *Entity, w *World, to *Entity, msg string) {
	Write("Ok.").ToPlayer(e).Send()
	Write("%s whispers to you, %s", ObservableNameCap(e), msg).ToPlayer(e).Subject(e).Send()
}

func performYell(e *Entity, w *World, msg string) {
	Write("Ok.").ToPlayer(e).Send()
	Write("%s yells, '%s'", ObservableNameCap(e), msg).ToWorld(w).Subject(e).Send()
}
