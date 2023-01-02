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
		{npcWander, time.Second * 3, time.Now()},
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
		if e.data.Stats.HP < e.data.Stats.MaxHP {
			hpGain := 3 // TODO Improve this
			e.data.Stats.HP = minInts(e.data.Stats.HP+hpGain, e.data.Stats.MaxHP)
			if e.player != nil {
				e.player.Send("")
			}
		}
		if e.data.Stats.Mov < e.data.Stats.MaxMov {
			MovGain := 3 // TODO Improve this
			e.data.Stats.Mov = minInts(e.data.Stats.Mov+MovGain, e.data.Stats.MaxMov)
			if e.player != nil {
				e.player.Send("")
			}
		}
	}
}

func npcWander(w *World) {
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

		PerformMove(e, w, dir)
	}
}
