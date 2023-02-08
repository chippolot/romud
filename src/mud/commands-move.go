package mud

import "log"

func DoMove(e *Entity, w *World, tokens []string) {
	cmd := tokens[0]
	dir, err := ParseDirection(cmd)
	if err != nil {
		Write("%s isn't a direction!", cmd).ToPlayer(e).Send()
	}

	_ = performMoveDirection(e, w, dir)
}

func DoSit(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sitting {
		Write("But you're already sitting!").ToPlayer(e).Send()
		return
	}

	oldPos := e.position
	e.position = Pos_Sitting

	if oldPos == Pos_Prone {
		Write("You sit up").ToPlayer(e).Send()
		Write("%s sits up", ObservableNameCap(e)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
	} else {
		Write("You sit down").ToPlayer(e).Send()
		Write("%s sits down", ObservableNameCap(e)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
	}
}

func DoSleep(e *Entity, w *World, _ []string) {
	if e.position == Pos_Sleeping {
		Write("But you're already sleeping!").ToPlayer(e).Send()
		return
	}
	e.position = Pos_Sleeping
	Write("You lie down and doze off...").ToPlayer(e).Send()
	Write("%s lies down and falls asleep", ObservableNameCap(e)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
}

func DoWake(e *Entity, w *World, _ []string) {
	if e.position != Pos_Sleeping {
		Write("But you're not sleeping!").ToPlayer(e).Send()
		return
	}
	e.position = Pos_Prone
	Write("You open your eyes and wake up").ToPlayer(e).Send()
	Write("%s wakes up", ObservableNameCap(e)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
}

func DoStand(e *Entity, w *World, _ []string) {
	if e.position == Pos_Standing {
		Write("But you're already standing!").ToPlayer(e).Send()
		return
	}
	e.position = Pos_Standing

	if e.combat != nil {
		Write("You scramble back to your feet!").ToPlayer(e).Send()
		Write("%s scrambles back to their feet", ObservableNameCap(e)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
	} else {
		Write("You stand up").ToPlayer(e).Send()
		Write("%s stands up", ObservableNameCap(e)).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
	}
}

func performMoveDirection(e *Entity, w *World, dir Direction) bool {
	if e.stats.Get(Stat_Mov) <= 0 {
		Write("You're way too tired...").ToPlayer(e).Send()
		return false
	}
	if e.combat != nil {
		Write("You can't do that while you're fighting!").ToPlayer(e).Send()
		return false
	}
	if e.skills.casting != nil {
		Write("You can't do that while you're casting!").ToPlayer(e).Send()
		return false
	}
	if e.stats.Condition() < Cnd_Healthy {
		Write("You're not feeling up for that!").ToPlayer(e).Send()
		return false
	}

	srcRoom := w.rooms[e.data.RoomId]

	nextRoomId, ok := srcRoom.cfg.Exits[dir]
	if !ok {
		Write("Can't go that way!").ToPlayer(e).Send()
		return false
	}

	dstRoom, ok := w.rooms[nextRoomId]
	if !ok {
		log.Printf("Tried to move to invalid room id: %d", nextRoomId)
		Write("An unseen force blocks you from going there!").ToPlayer(e).Send()
		return false
	}

	performMove(e, w, dstRoom, func() {
		if e.player != nil {
			Write("%s leaves %s", ObservableNameCap(e), dir.String()).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
		} else {
			Write("%s wanders %s", ObservableNameCap(e), dir.String()).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
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
			Write("%s enters from the %s", ObservableNameCap(e), fromDirStr).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
		} else {
			Write("%s wanders in from the %s", ObservableNameCap(e), fromDirStr).ToEntityRoom(w, e).Subject(e).Restricted(SendRst_CanSee).Send()
		}
	})

	e.stats.Add(Stat_Mov, -1)
	return true
}

func performMoveRoom(e *Entity, w *World, dstRoom *Room) {
	// TODO: broadcast something here!
	performMove(e, w, dstRoom, nil, nil)
}

func performMove(e *Entity, w *World, dstRoom *Room, broadcastLeaveFn func(), broadcastEnterFn func()) {
	srcRoom := w.rooms[e.data.RoomId]

	if broadcastLeaveFn != nil {
		broadcastLeaveFn()
	}

	srcRoom.RemoveEntity(e)
	dstRoom.AddEntity(e)

	// Reset regen timers
	e.stats.lastHPMovRegen = w.time
	e.stats.lastSPRegen = w.time

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
