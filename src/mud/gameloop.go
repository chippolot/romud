package mud

import (
	"math/rand"
	"time"

	"github.com/chippolot/go-mud/src/bits"
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
		{flushPlayerOuput, time.Millisecond, time.Now()},
	}

	for {
		for _, sys := range systems {
			sys.Update(w)
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
			hpGain = 3  // TODO Improve this
			movGain = 3 // TODO Improve this
		case Cnd_Incapacitated:
			hpGain = -1
			message = "<c red>You are bleeding...</c>"
		case Cnd_MortallyWounded:
			hpGain = -2
			message = "<c red>You are bleeding badly and will die soon!</c>"
		}

		e.data.Stats.AddHP(hpGain)
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

		if bits.Has(e.cfg.Flags, EFlag_Stationary) {
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

func flushPlayerOuput(w *World) {
	for _, s := range w.sessions {
		s.Flush()
	}
}
