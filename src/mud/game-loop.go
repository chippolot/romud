package mud

import (
	"fmt"
	"math"
	"math/rand"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type UpdateSystem struct {
	fn   func(w *World)
	freq time.Duration
	last time.Time
}

func (s *UpdateSystem) Update(w *World) {
	now := time.Now().UTC()
	nextUpdate := s.last.Add(s.freq)
	if now.Before(nextUpdate) {
		return
	}
	s.last = now
	s.fn(w)
}

func GameLoop(w *World) {
	systems := []*UpdateSystem{
		{updateStatusEffects, time.Second * 1, time.Now().UTC().Add(randSec())},
		{restoreStats, time.Second * 10, time.Now().UTC().Add(randSec())},
		{scavengerNPCs, time.Second * 3, time.Now().UTC().Add(randSec())},
		{wanderNPCs, time.Second * 3, time.Now().UTC().Add(randSec())},
		{runCombat, time.Second * 1, time.Now().UTC().Add(randSec())},
		{logoutTheDead, time.Millisecond, time.Now().UTC().Add(randSec())},
		{flushPlayerOuput, time.Millisecond, time.Now().UTC().Add(randSec())},
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

func updateStatusEffects(w *World) {
	sec := time.Now().UTC().Second()
	toRemove := make([]StatusEffectMask, 0)
	for _, e := range w.entities {
		if e.statusEffects.mask == 0 {
			continue
		}

		// Apply status effects
		if e.HasStatusEffect(StatusType_Poison) && sec%3 == 0 {
			poisonDam := utils.MaxInts(1, e.stats.Get(Stat_MaxHP)/10)
			applyDamage(e, w, e, poisonDam, DamCtx_Poison, Dam_Poison, "", "")
		}

		// Decrease status timers
		toRemove = toRemove[:0]
		for _, s := range e.statusEffects.statusEffects {
			if s.data.Duration == StatusEffectDuration_Permanent {
				continue
			}
			s.data.Duration -= 1
			if s.data.Duration <= 0 {
				toRemove = append(toRemove, s.data.Type)
			}
		}
		for _, status := range toRemove {
			performRemoveStatusEffect(e, w, status)
		}
	}
}

func restoreStats(w *World) {
	for _, e := range w.entities {
		// Fighting entities don't heal
		if e.combat != nil {
			continue
		}

		// Dead entities don't heal
		if e.stats.Condition() == Cnd_Dead {
			continue
		}

		oldHP := e.stats.Get(Stat_HP)
		oldMov := e.stats.Get(Stat_Mov)

		var hpGain, movGain int
		var message string

		switch e.stats.Condition() {
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
			e.stats.Add(Stat_HP, hpGain)
		} else {
			applyDamage(e, w, nil, -hpGain, DamCtx_Bleeding, Dam_Slashing, "hit", "hits")
			message = Colorize(ColorRed, "You are bleeding!")
		}
		e.stats.Add(Stat_Mov, movGain)

		// Force a new prompt if something changed
		if oldHP != e.stats.Get(Stat_HP) || oldMov != e.stats.Get(Stat_Mov) {
			SendToPlayer(e, message)
		}
	}
}

func wanderNPCs(w *World) {
	for _, e := range w.entities {
		if e.player != nil {
			continue
		}

		if e.entityFlags.Has(EFlag_Stationary) {
			continue
		}

		if e.combat != nil {
			continue
		}

		if rand.Intn(15) != 0 {
			continue
		}

		// TODO Stay in zone
		// Pick a random open exit to take
		r := w.rooms[e.data.RoomId]
		numExits := len(r.cfg.Exits)
		rndExit := rand.Intn(numExits)
		var dir Direction
		i := 0
		for dir, _ = range r.cfg.Exits {
			if i == rndExit {
				break
			}
			i++
		}
		if !r.IsExitOpen(dir) {
			continue
		}

		performMove(e, w, dir)
	}
}

func scavengerNPCs(w *World) {
	for _, e := range w.entities {
		if e.player != nil {
			continue
		}

		isScavenger := e.entityFlags.Has(EFlag_Scavenger)
		isTrashCollector := e.entityFlags.Has(EFlag_TrashCollector)
		if !isScavenger && !isTrashCollector {
			continue
		}

		if e.combat != nil {
			continue
		}

		r := w.rooms[e.data.RoomId]
		if len(r.items) == 0 || rand.Intn(15) != 0 {
			continue
		}

		// Pick up an item
		var toPickup *Item
		var toPickupVal = 0
		if !isScavenger && isTrashCollector {
			toPickupVal = math.MaxInt
		}
		for _, item := range r.items {
			if item.cfg.Flags.Has(IFlag_Environmental) {
				continue
			}
			itemValue := item.cfg.Value

			// Scavengers pick up the most valuable items whereas trash collectors
			// pick up the least valuable item
			if (isScavenger && itemValue >= toPickupVal) ||
				(isTrashCollector && itemValue < toPickupVal && itemValue < 10) {
				toPickup = item
				toPickupVal = itemValue
			}
		}

		if toPickup != nil {
			performGet(e, w,
				func(i *Item) string { return "" },
				func(i *Item) string { return fmt.Sprintf("%s picks up %s", e.NameCapitalized(), toPickup.Name()) },
				r,
				toPickup)
		}
	}
}

func runCombat(w *World) {
	now := time.Now().UTC()
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
			runCombatLogic(e, w, e.combat.target)
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
		if e.stats.Condition() == Cnd_Dead {
			w.LogoutPlayer(e.player)
		}
	}
}

func flushPlayerOuput(w *World) {
	for _, s := range w.sessions {
		s.Flush()
	}
}

func randSec() time.Duration {
	return time.Millisecond * time.Duration(rand.Intn(1000))
}
