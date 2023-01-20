package mud

import (
	"math"
	"math/rand"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type GameTime struct {
	time float64
	dt   float64
}

type UpdateSystem struct {
	fn   func(w *World, t GameTime)
	freq float64
	last float64
}

func (s *UpdateSystem) Update(w *World, t GameTime) {
	nextUpdate := s.last + s.freq
	if t.time < nextUpdate {
		return
	}
	t.dt = t.time - s.last
	s.fn(w, t)
	s.last = t.time
}

func GameLoop(w *World) {
	systems := []*UpdateSystem{
		{updateStatusEffects, 1, 0},
		{restoreStats, 10, 0},
		{scavengerNPCs, 3, 0},
		{wanderNPCs, 3, 0},
		{aggroNPCs, 1, 0},
		{assistNPCs, 1, 0},
		{runCombat, 3, 0},
		{logoutTheDead, 0, 0},
		{flushPlayerOuput, 0, 0},
	}

	t := GameTime{}
	lastUpdate := time.Now()
	for {
		if len(w.sessions) > 0 {
			for _, sys := range systems {
				sys.Update(w, t)
			}
		}

		time.Sleep(time.Second / 30.0)

		t.dt = time.Since(lastUpdate).Seconds()
		lastUpdate = time.Now()
		t.time += t.dt
	}
}

func updateStatusEffects(w *World, t GameTime) {
	for _, e := range w.entities {
		if e.statusEffects.mask == 0 {
			continue
		}

		// Apply status effects
		if e.HasStatusEffect(StatusType_Poison) && int(t.time)%3 == 0 {
			poisonDam := utils.MaxInts(1, e.stats.Get(Stat_MaxHP)/10)
			applyDamage(e, w, e, poisonDam, DamCtx_Poison, Dam_Poison, "", "")
		}

		// Decrease status timers
		for _, s := range e.statusEffects.statusEffects {
			if s.data == nil {
				continue
			}
			s.data.Duration -= utils.Seconds(t.dt)
			if s.data.Duration <= 0 {
				performRemoveStatusEffect(e, w, s.statusType, false)
			}
		}
	}
}

func restoreStats(w *World, t GameTime) {
	for _, e := range w.entities {
		// Fighting entities don't heal
		if e.combat != nil {
			continue
		}

		// Dead entities don't heal
		if e.stats.Condition() == Cnd_Dead {
			continue
		}

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
			message = Colorize(Color_NegativeBld, "You are bleeding!")
		}
		e.stats.Add(Stat_Mov, movGain)

		// Force a new prompt if something changed
		if message != "" {
			Write(message).ToPlayer(e).Send()
		}
	}
}

func wanderNPCs(w *World, t GameTime) {
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
		rnd := rand.Intn(numExits)
		var dir Direction
		i := 0
		for dir = range r.cfg.Exits {
			if i == rnd {
				break
			}

			i++
		}
		if !r.IsExitOpen(dir) {
			continue
		}

		// Stay in same zone
		rid2 := r.cfg.Exits[dir]
		r2 := w.rooms[rid2]
		if r.zone != r2.zone {
			continue
		}

		performMoveDirection(e, w, dir)
	}
}

func aggroNPCs(w *World, t GameTime) {
	for _, e := range w.entities {
		if e.player != nil {
			continue
		}

		// Only process aggro mobs
		if !e.entityFlags.Has(EFlag_Aggro) {
			continue
		}

		// Mob already fighting
		if e.combat != nil {
			continue
		}

		if D6.Roll() != 1 {
			continue
		}

		// Find target
		r := w.rooms[e.data.RoomId]
		for _, other := range r.entities {
			if other == e || other.player == nil {
				continue
			}
			performAttack(e, w, other)
			break
		}
	}
}

func assistNPCs(w *World, t GameTime) {
	for _, e := range w.entities {
		if e.player != nil {
			continue
		}

		// Only process aggro mobs
		assistAll := e.entityFlags.Has(EFlag_AssistAll)
		assistSame := e.entityFlags.Has(EFlag_AssistSame)
		if !assistAll && !assistSame {
			continue
		}

		// Mob already fighting
		if e.combat != nil {
			continue
		}

		if D6.Roll() != 1 {
			continue
		}

		// Find ally in combat
		r := w.rooms[e.data.RoomId]
		for _, other := range r.entities {
			if other == e || other.player != nil || other.combat == nil || other.combat.target == nil {
				continue
			}

			// Assist in attack
			if assistAll ||
				(assistSame && other.cfg == e.cfg) {
				performAssist(e, w, other)
			}
			break
		}
	}
}

func scavengerNPCs(w *World, t GameTime) {
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
			performGet(e, w, toPickup)
		}
	}
}

func runCombat(w *World, t GameTime) {
	for i := w.inCombat.Head; i != nil; {
		e := i.Value

		// Pre attack cleanup
		if !e.combat.Valid(e) {
			i = i.Next
			w.inCombat.EndCombat(e)
			continue
		}

		// Handle attack
		runCombatLogic(e, w, e.combat.target)
		i = i.Next

		// Post attack cleanup
		if !e.combat.Valid(e) {
			w.inCombat.EndCombat(e)
		}
	}
}

func logoutTheDead(w *World, t GameTime) {
	for _, e := range w.players {
		if e.stats.Condition() == Cnd_Dead {
			w.LogoutPlayer(e.player)
		}
	}
}

func flushPlayerOuput(w *World, t GameTime) {
	for _, s := range w.sessions {
		s.Flush()
	}
}
