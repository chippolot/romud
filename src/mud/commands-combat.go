package mud

func DoAttack(e *Entity, w *World, tokens []string) {
	q, ok, tokens := parseSearchQuery(tokens[1:], false)
	if !ok {
		SendToPlayer(e, "What do you want to attack?")
		return
	}

	if e.entityFlags.Has(EFlag_Blind) {
		SendToPlayer(e, "You can't see a thing!")
		return
	}

	r := w.rooms[e.data.RoomId]
	tgts := SearchEntities(q, e, r)
	if len(tgts) == 0 {
		SendToPlayer(e, "They don't seem to be here...")
		return
	}
	tgt := tgts[0]
	if tgt == e {
		SendToPlayer(e, "Stop hitting yourself!")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s hits %sself??", ObservableName(e), e.Gender().GetObjectPronoun())
		return
	}
	performAttack(e, w, tgt)
}

func DoShove(e *Entity, w *World, tokens []string) {
	q, ok, tokens := parseSearchQuery(tokens[1:], false)
	if !ok {
		SendToPlayer(e, "What do you want to shove?")
		return
	}

	if e.entityFlags.Has(EFlag_Blind) {
		SendToPlayer(e, "You can't see a thing!")
		return
	}

	r := w.rooms[e.data.RoomId]
	tgts := SearchEntities(q, e, r)
	if len(tgts) == 0 {
		SendToPlayer(e, "They don't seem to be here...")
		return
	}

	tgt := tgts[0]
	if tgt == e {
		SendToPlayer(e, "Good luck with that!")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s tries to shove %sself but just ends up looking ridiculous", ObservableName(e), e.Gender().GetObjectPronoun())
		return
	}

	performShove(e, w, tgt)
}
