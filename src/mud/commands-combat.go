package mud

func DoAttack(e *Entity, w *World, tokens []string) {
	q, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		Write("What do you want to attack?").ToPlayer(e).Send()
		return
	}

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]
	tgts := SearchEntities(q, e, r)
	if len(tgts) == 0 {
		Write("They don't seem to be here...").ToPlayer(e).Send()
		return
	}
	tgt := tgts[0]
	if tgt == e {
		Write("Stop hitting yourself!").ToPlayer(e).Send()
		Write("%s hits %sself??", ObservableName(e), e.Gender().GetObjectPronoun()).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
		return
	}
	performAttack(e, w, tgt)
}

func DoShove(e *Entity, w *World, tokens []string) {
	q, ok, _ := parseSearchQuery(tokens[1:], false)
	if !ok {
		Write("What do you want to shove?").ToPlayer(e).Send()
		return
	}

	if e.entityFlags.Has(EFlag_Blind) {
		Write("You can't see a thing!").ToPlayer(e).Send()
		return
	}

	r := w.rooms[e.data.RoomId]
	tgts := SearchEntities(q, e, r)
	if len(tgts) == 0 {
		Write("They don't seem to be here...").ToPlayer(e).Send()
		return
	}

	tgt := tgts[0]
	if tgt == e {
		Write("Good luck with that!").ToPlayer(e).Send()
		Write("%s tries to shove %sself but just ends up looking ridiculous", ObservableName(e), e.Gender().GetObjectPronoun()).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
		return
	}

	performShove(e, w, tgt)
}
