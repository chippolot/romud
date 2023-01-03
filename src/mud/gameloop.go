package mud

import (
	"math/rand"
	"time"

	"github.com/chippolot/go-mud/src/bits"
	"github.com/chippolot/go-mud/src/utils"
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
		if e.Dead() {
			continue
		}

		if e.data.Stats.HP < e.data.Stats.MaxHP {
			hpGain := 3 // TODO Improve this
			e.data.Stats.HP = utils.MinInts(e.data.Stats.HP+hpGain, e.data.Stats.MaxHP)
			SendToPlayer(e, "")
		}
		if e.data.Stats.Mov < e.data.Stats.MaxMov {
			MovGain := 3 // TODO Improve this
			e.data.Stats.Mov = utils.MinInts(e.data.Stats.Mov+MovGain, e.data.Stats.MaxMov)
			SendToPlayer(e, "")
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

		if !e.combat.Valid(e) {
			i = i.Next
			w.inCombat.EndCombat(e)
			continue
		}

		nextAttack := e.combat.nextAttack
		if now.After(nextAttack) {
			performAttack(e, w, e.combat.target)
			e.combat.nextAttack = e.combat.nextAttack.Add(e.combat.AttackCooldown())
		}
		i = i.Next
	}
}

func flushPlayerOuput(w *World) {
	for _, s := range w.sessions {
		s.Flush()
	}
}
