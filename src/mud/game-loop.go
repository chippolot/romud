package mud

import (
	"math/rand"
	"time"
)

type UpdateSystem struct {
	fn   func(w *World)
	freq time.Duration
	last time.Time
}

func (s *UpdateSystem) Update(w *World) {
	now := time.Now()
	nextUpdate := s.last.Add(s.freq)
	if now.Before(nextUpdate) {
		return
	}
	s.last = now
	s.fn(w)
}

func GameLoop(w *World) {
	systems := []*UpdateSystem{
		{restoreStats, time.Second * 10, time.Now()},
		{wanderNpcs, time.Second * 3, time.Now()},
		{runCombat, time.Second, time.Now()},
		{logoutTheDead, time.Millisecond, time.Now()},
		{flushPlayerOuput, time.Millisecond, time.Now()},
	}

	for {
		if len(w.sessions) > 0 {
			for _, sys := range systems {
				sys.Update(w)
			}
		}
		time.Sleep(time.Second / 30.0)
	}
}

func restoreStats(w *World) {
	for _, e := range w.entities {
		// Fighting entities don't heal
		if e.combat != nil {
			continue
		}

		// Dead entities don't heal
		if e.data.Stats.Condition() == Cnd_Dead {
			continue
		}

		oldHP := e.data.Stats.HP
		oldMov := e.data.Stats.Mov

		var hpGain, movGain int
		var message string

		switch e.data.Stats.Condition() {
		case Cnd_Healthy, Cnd_Stunned:
			switch e.position {
			case Pos_Sitting, Pos_Prone:
				hpGain = 5
				movGain = 5
			case Pos_Sleeping:
				hpGain = 7
				movGain = 7
			default:
				hpGain = 3
				movGain = 3
			}
		case Cnd_Incapacitated:
			hpGain = -1
		case Cnd_MortallyWounded:
			hpGain = -2
		}

		if hpGain > 0 {
			e.data.Stats.AddHP(hpGain)
		} else {
			applyDamage(e, w, nil, -hpGain, Dam_Bleeding)
			message = "<c red>You are bleeding!</c>"
		}
		e.data.Stats.AddMov(movGain)

		// Force a new prompt if something changed
		if oldHP != e.data.Stats.HP || oldMov != e.data.Stats.Mov {
			SendToPlayer(e, message)
		}
	}
}

func wanderNpcs(w *World) {
	for _, e := range w.entities {
		if e.player != nil {
			continue
		}

		if e.cfg.Flags.Has(EFlag_Stationary) {
			continue
		}

		// TODO Stay in zone
		r := w.rooms[e.data.RoomId]
		dir := Direction(rand.Intn(20))
		if !r.IsExitOpen(dir) {
			continue
		}

		performMove(e, w, dir)
	}
}

func runCombat(w *World) {
	now := time.Now()
	for i := w.inCombat.Head; i != nil; {
		e := i.Value

		// Pre attack cleanup
		if !e.combat.Valid(e) {
			i = i.Next
			w.inCombat.EndCombat(e)
			continue
		}

		// Handle attack
		nextAttack := e.combat.nextAttack
		if now.After(nextAttack) {
			performAttack(e, w, e.combat.target)
			e.combat.nextAttack = e.combat.nextAttack.Add(e.combat.AttackCooldown())
		}
		i = i.Next

		// Post attack cleanup
		if !e.combat.Valid(e) {
			w.inCombat.EndCombat(e)
		}
	}
}

func logoutTheDead(w *World) {
	for _, e := range w.players {
		if e.data.Stats.Condition() == Cnd_Dead {
			w.LogoutPlayer(e.player)
		}
	}
}

func flushPlayerOuput(w *World) {
	for _, s := range w.sessions {
		s.Flush()
	}
}
