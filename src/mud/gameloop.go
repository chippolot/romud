package mud

import (
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
