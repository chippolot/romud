package mud

import "log"

func DoMove(e *Entity, w *World, tokens []string) {
	cmd := tokens[0]
	dir, err := ParseDirection(cmd)
	if err != nil {
		SendToPlayer(e, "%s isn't a direction!", cmd)
	}

	_ = performMoveDirection(e, w, dir)
}

func DoSit(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sitting {
		SendToPlayer(e, "But you're already sitting!")
		return
	}

	oldPos := e.position
	e.position = Pos_Sitting

	if oldPos == Pos_Prone {
		SendToPlayer(e, "You sit up")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s sits up", ObservableNameCap(e))
	} else {
		SendToPlayer(e, "You sit down")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s sits down", ObservableNameCap(e))
	}
}

func DoSleep(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sleeping {
		SendToPlayer(e, "But you're already sleeping!")
		return
	}
	e.position = Pos_Sleeping
	SendToPlayer(e, "You lie down and doze off...")
	BroadcastToRoomRe(w, e, SendRst_CanSee, "%s lies down and falls asleep", ObservableNameCap(e))
}

func DoWake(e *Entity, w *World, _ []string) {
	if e.position != Pos_Sleeping {
		SendToPlayer(e, "But you're not sleeping!")
		return
	}
	e.position = Pos_Prone
	SendToPlayer(e, "You open your eyes and wake up")
	BroadcastToRoomRe(w, e, SendRst_CanSee, "%s wakes up", ObservableNameCap(e))
}

func DoStand(e *Entity, w *World, _ []string) {
	if e.position == Pos_Standing {
		SendToPlayer(e, "But you're already standing!")
		return
	}
	e.position = Pos_Standing

	if e.combat != nil {
		SendToPlayer(e, "You scramble back to your feet!")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s scrambles back to their feet", ObservableNameCap(e))
	} else {
		SendToPlayer(e, "You stand up")
		BroadcastToRoomRe(w, e, SendRst_CanSee, "%s stands up", ObservableNameCap(e))
	}
}

func performMoveDirection(e *Entity, w *World, dir Direction) bool {
	if e.stats.Get(Stat_Mov) <= 0 {
		SendToPlayer(e, "You're way too tired...")
		return false
	}
	if e.combat != nil {
		SendToPlayer(e, "You can't do that while you're fighting!")
		return false
	}
	if e.stats.Condition() < Cnd_Healthy {
		SendToPlayer(e, "You're not feeling up for that!")
		return false
	}

	srcRoom := w.rooms[e.data.RoomId]

	nextRoomId, ok := srcRoom.cfg.Exits[dir]
	if !ok {
		SendToPlayer(e, "Can't go that way!")
		return false
	}

	dstRoom, ok := w.rooms[nextRoomId]
	if !ok {
		log.Printf("Tried to move to invalid room id: %d", nextRoomId)
		SendToPlayer(e, "An unseen force blocks you from going there!")
		return false
	}

	performMove(e, w, dstRoom, func() {
		if e.player != nil {
			BroadcastToRoomRe(w, e, SendRst_CanSee, "%s leaves %s", ObservableNameCap(e), dir.String())
		} else {
			BroadcastToRoomRe(w, e, SendRst_CanSee, "%s wanders %s", ObservableNameCap(e), dir.String())
		}
	}, func() {
		fromDirStr := ""
		fromDir, err := dir.Reverse()
		if err != nil {
			fromDirStr = "somewhere"
		} else {
			fromDirStr = fromDir.String()
		}

		if e.player != nil {
			BroadcastToRoomRe(w, e, SendRst_CanSee, "%s enters from the %s", ObservableNameCap(e), fromDirStr)
		} else {
			BroadcastToRoomRe(w, e, SendRst_CanSee, "%s wanders in from the %s", ObservableNameCap(e), fromDirStr)
		}
	})

	e.stats.Add(Stat_Mov, -1)
	return true
}

func performMoveRoom(e *Entity, w *World, dstRoom *Room) {
	// TODO broadcast something here!
	performMove(e, w, dstRoom, nil, nil)
}

func performMove(e *Entity, w *World, dstRoom *Room, broadcastLeaveFn func(), broadcastEnterFn func()) {
	srcRoom := w.rooms[e.data.RoomId]

	if broadcastLeaveFn != nil {
		broadcastLeaveFn()
	}

	srcRoom.RemoveEntity(e)
	dstRoom.AddEntity(e)

	if broadcastEnterFn != nil {
		broadcastEnterFn()
	}

	if e.player != nil {
		DoLook(e, w, nil)
	} else {
		triggerEnterRoomScript(e, dstRoom)
	}
	triggerEntityEnteredRoomScript(e, dstRoom)
}
