package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"path"

	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

const (
	EntitiesFileExtension = ".ent"
	RoomsFileExtension    = ".lvl"
	ItemsFileExtension    = ".itm"
	ZoneFileExtension     = ".zon"
)

func LoadZone(w *World, filePath string) error {
	bytes, err := utils.LoadFileBytes(filePath)
	if err != nil {
		return err
	}

	cfg := &ZoneConfig{}
	err = json.Unmarshal(bytes, &cfg)
	if err != nil {
		return err
	}

	w.zones[cfg.Id] = cfg
	log.Printf("loaded zone %d from %s", cfg.Id, filePath)

	return nil
}

func LoadRooms(w *World, filePath string) error {
	bytes, err := utils.LoadFileBytes(filePath)
	if err != nil {
		return err
	}

	cfgList := RoomConfigList{}
	err = json.Unmarshal(bytes, &cfgList)
	if err != nil {
		return err
	}

	for _, cfg := range cfgList {
		// Find zone id for room
		rid := cfg.Id
		zoneId := ZoneId(-1)
		for _, z := range w.zones {
			if rid >= z.MinRoomId && rid <= z.MaxRoomId {
				zoneId = z.Id
				break
			}
		}
		if zoneId == -1 {
			log.Fatalf("cannot find zone for room id %d", rid)
		}

		r, err := NewRoom(cfg, zoneId)
		if err != nil {
			log.Fatalf("failed to parse room with error: %v", err)
		}
		w.AddRoom(r)
	}

	log.Printf("loaded %d rooms from %s", len(cfgList), filePath)

	return nil
}

func LoadEntities(w *World, filePath string) error {
	bytes, err := utils.LoadFileBytes(filePath)
	if err != nil {
		return err
	}

	cfgList := EntityConfigList{}
	err = json.Unmarshal(bytes, &cfgList)
	if err != nil {
		return err
	}

	for _, cfg := range cfgList {
		cfg.Init()
		w.AddEntityConfig(cfg)

		if cfg.ScriptFile != "" {
			fileDir := path.Dir(filePath)
			scriptPath := path.Join(fileDir, cfg.ScriptFile)
			if scriptsTable, err := LoadScript(w, scriptPath); err != nil {
				log.Fatalf("failed to load script file %s -- %v", scriptPath, err)
			} else {
				cfg.scripts = NewEntityScripts(w.L, scriptsTable)
			}
		}
	}

	log.Printf("loaded %d entities from %s", len(cfgList), filePath)

	return nil
}

func LoadItems(w *World, filePath string) error {
	bytes, err := utils.LoadFileBytes(filePath)
	if err != nil {
		return err
	}

	cfgList := ItemConfigList{}
	err = json.Unmarshal(bytes, &cfgList)
	if err != nil {
		return err
	}

	for _, cfg := range cfgList {
		cfg.Init()
		w.AddItemConfig(cfg)
	}

	log.Printf("loaded %d items from %s", len(cfgList), filePath)

	return nil
}

func LoadScript(w *World, filePath string) (*lua.LTable, error) {
	if fn, err := w.L.LoadFile(filePath); err != nil {
		return nil, err
	} else {
		if err := w.L.CallByParam(lua.P{Fn: fn, NRet: 1, Protect: false}); err != nil {
			return nil, err
		}
		tbl, ok := w.L.Get(-1).(*lua.LTable)
		if !ok {
			return nil, fmt.Errorf("expected returned table from lua script: %s", filePath)
		}
		w.L.Pop(1)
		return tbl, nil
	}
}

func LoadAssets(w *World, root string) {
	// Load zones
	for _, path := range utils.FindFilePathsWithExtension(root, ZoneFileExtension) {
		if err := LoadZone(w, path); err != nil {
			log.Fatalf("failed to load zone file %s -- %v", path, err)
		}
	}
	// Load rooms
	for _, path := range utils.FindFilePathsWithExtension(root, RoomsFileExtension) {
		if err := LoadRooms(w, path); err != nil {
			log.Fatalf("failed to load room file %s -- %v", path, err)
		}
	}

	// Load mobs
	for _, path := range utils.FindFilePathsWithExtension(root, EntitiesFileExtension) {
		if err := LoadEntities(w, path); err != nil {
			log.Fatalf("failed to load entities file %s -- %v", path, err)
		}
	}

	// Loat items
	for _, path := range utils.FindFilePathsWithExtension(root, ItemsFileExtension) {
		if err := LoadItems(w, path); err != nil {
			log.Fatalf("failed to load items file %s -- %v", path, err)
		}
	}
}
