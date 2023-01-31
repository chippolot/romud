package mud

import "log"

type ShopConfig struct {
	RoomId RoomId
	Stock  []string
}

type Shop struct {
	cfg   *ShopConfig
	stock []*ItemConfig
}

func NewShop(cfg *ShopConfig) *Shop {
	return &Shop{cfg, make([]*ItemConfig, 0)}
}

func (s *Shop) Init(w *World) {
	s.stock = s.stock[:0]
	for _, key := range s.cfg.Stock {
		if itemCfg, ok := w.TryGetItemConfig(key); ok {
			s.stock = append(s.stock, itemCfg)
		} else {
			log.Panicf("Failed to resolve item '%s' for shop in room '%d' ", key, s.cfg.RoomId)
		}
	}
}
