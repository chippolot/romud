package mud

import (
	"log"
	"math"
	"math/rand"
	"time"

	"github.com/chippolot/go-mud/src/utils"
)

type SystemUpdater interface {
	Update(w *World, dt utils.Seconds)
}

type System struct {
	fn func(w *World, dt utils.Seconds)
}

func (s *System) Update(w *World, dt utils.Seconds) {
	s.fn(w, dt)
}

type UpdateSystem struct {
	sys  SystemUpdater
	freq utils.Seconds
	last utils.Seconds
}

func (s *UpdateSystem) Update(w *World, dt utils.Seconds) {
	nextUpdate := s.last + s.freq
	if w.time < nextUpdate {
		return
	}
	dt = w.time - s.last
	s.sys.Update(w, dt)
	s.last = w.time
}

type SessionHandlerSystem struct {
	handler *SessionHandler
}

func GameLoop(w *World, handler *SessionHandler) {
	systems := []*UpdateSystem{
		{&SessionHandlerSystem{handler}, 0, 0},
		{&System{zoneSpawnersSystem}, 1, 0},
		{&System{statusEffectsSystem}, 1, 0},
		{&System{statRestorationSystem}, 1, 0},
		{&System{scavengersSystem}, 3, 0},
		{&System{wanderersSystem}, 3, 0},
		{&System{aggroSystem}, 1, 0},
		{&System{assistersSystem}, 1, 0},
		{&System{castSystem}, 0.1, 0},
		{&System{combatSystem}, 2, 0},
		{&System{statusMessagesSystem}, 0, 0},
		{&System{cleanupDeadSystem}, 0, 0},
		{&System{playerOutputSystem}, 0, 0},
	}

	lastUpdate := time.Now()
	for {
		time.Sleep(time.Second / 60.0)

		dt := utils.Seconds(time.Since(lastUpdate).Seconds())
		lastUpdate = time.Now()
		w.time += dt * utils.Seconds(mudConfig.GameSpeedMultiplier)

		for _, sys := range systems {
			sys.Update(w, dt)
		}
	}
}

func (s *SessionHandlerSystem) Update(w *World, dt utils.Seconds) {
	for {
		select {
		case evt, ok := <-s.handler.events:
			if !ok {
				log.Println("channel closed!")
				break
			}
			s.handler.HandleEvent(evt)
		default:
			return
		}
	}
}

func zoneSpawnersSystem(w *World, dt utils.Seconds) {
	for _, z := range w.zones {
		for _, s := range z.spawners {
			s.UpdateActive(w.time)
			if s.CanSpawn(w.time) {
				s.Spawn(z, w)
			}
		}
	}
}

func statusEffectsSystem(w *World, dt utils.Seconds) {
	for _, e := range w.entities {
		if e.statusEffects.mask == 0 {
			continue
		}

		// Apply status effects
		if e.HasStatusEffect(StatusType_Poison) && int(w.time)%3 == 0 {
			poisonDam := utils.MaxInt(1, e.stats.Get(Stat_MaxHP)/10)
			applyDamage(e, w, e, poisonDam, DamCtx_Poison, 0, false, "", "")
		}

		// Decrease status timers
		for _, s := range e.statusEffects.statusEffects {
			if s.data == nil {
				continue
			}
			s.data.Duration -= dt
			if s.data.Duration <= 0 {
				performRemoveStatusEffect(e, w, s.statusType, false)
			}
		}
	}
}

func statusMessagesSystem(w *World, dt utils.Seconds) {
	for _, e := range w.entities {
		if !e.tookDamage {
			continue
		}
		sendStatusMessages(e, w)
		e.tookDamage = false
	}
}

func statRestorationSystem(w *World, dt utils.Seconds) {
	for _, e := range w.entities {
		// Fighting entities don't heal
		if e.combat != nil {
			continue
		}

		// Dead entities don't heal
		if e.stats.Condition() == Cnd_Dead {
			continue
		}

		lastHPMovRegen, lastSPRegen := e.stats.lastHPMovRegen, e.stats.lastSPRegen
		nextHPMovRegen, nextSPRegen := utils.Seconds(-1.0), utils.Seconds(-1.0)

		cnd := e.stats.Condition()
		switch cnd {
		case Cnd_Healthy, Cnd_Stunned:
			switch e.position {
			case Pos_Sitting, Pos_Prone, Pos_Sleeping:
				nextHPMovRegen = lastHPMovRegen + 3
				nextSPRegen = lastSPRegen + 4
			default:
				nextHPMovRegen = lastHPMovRegen + 6
				nextSPRegen = lastSPRegen + 8
			}
		case Cnd_Incapacitated, Cnd_MortallyWounded:
			nextHPMovRegen = lastHPMovRegen + 6
		}

		now := w.time
		if nextHPMovRegen >= 0 && now >= nextHPMovRegen {
			if cnd == Cnd_Incapacitated || cnd == Cnd_MortallyWounded {
				applyDamage(e, w, nil, 1, DamCtx_Bleeding, 0, false, "", "")
				Write("You are bleeding!").ToPlayer(e).Colorized(Color_NegativeBld).Send()
			} else {
				e.stats.Add(Stat_HP, calculateHPRestoration(e.stats))
				e.stats.Add(Stat_Mov, 2)
			}
			e.stats.lastHPMovRegen = now
		}

		if nextSPRegen >= 0 && now >= nextSPRegen {
			if cnd != Cnd_Incapacitated && cnd != Cnd_MortallyWounded {
				e.stats.Add(Stat_SP, calculateSPRestoration(e.stats))
			}
			e.stats.lastSPRegen = now
		}
	}
}

func wanderersSystem(w *World, dt utils.Seconds) {
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

		if utils.RandChance100() > calculateChanceToWander(e.stats) {
			continue
		}

		// Pick a random open exit to take
		r := w.rooms[e.data.RoomId]
		numExits := len(r.cfg.Exits)
		if numExits == 0 {
			continue
		}

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

		nextRid := r.cfg.Exits[dir]
		nextR, ok := w.rooms[nextRid]
		if !ok {
			log.Printf("invalid room %d", nextRid)
			continue
		}

		// Stay in same zone
		if !e.entityFlags.Has(EFlag_CanLeaveZone) {
			if r.zone != nextR.zone {
				continue
			}
		}

		performMoveDirection(e, w, dir)
	}
}

func aggroSystem(w *World, dt utils.Seconds) {
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

func assistersSystem(w *World, dt utils.Seconds) {
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

func scavengersSystem(w *World, dt utils.Seconds) {
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
			itemValue := item.Value()

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

func castSystem(w *World, dt utils.Seconds) {
	for i := w.casting.Head; i != nil; {
		e := i.Value
		i = i.Next

		// Pre attack cleanup
		if !e.casting.Valid(e) {
			interruptSkill(e, w)
			continue
		}

		// Handle attack
		if w.time >= e.casting.castTime {
			castSkill(e.casting.skill, e, w, e.casting.target, e.casting.level)
			w.casting.EndCasting(e)
		}
	}
}

func combatSystem(w *World, dt utils.Seconds) {
	for i := w.inCombat.Head; i != nil; {
		e := i.Value

		// Pre attack cleanup
		if !e.combat.Valid(e) {
			i = i.Next
			w.inCombat.EndCombat(e)
			continue
		}

		// Handle attack
		runCombatLogic(e, w, e.combat.target, dt)
		i = i.Next

		// Post attack cleanup
		if !e.combat.Valid(e) {
			w.inCombat.EndCombat(e)
		}
	}
}

func cleanupDeadSystem(w *World, dt utils.Seconds) {
	for _, e := range w.players {
		if e.stats.Condition() == Cnd_Dead {
			w.LogoutPlayer(e.player)
		}
	}
}

func playerOutputSystem(w *World, dt utils.Seconds) {
	for _, s := range w.sessions {
		s.Flush()
	}
}
