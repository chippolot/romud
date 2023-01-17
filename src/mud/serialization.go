package mud

import (
	"encoding/json"
	"fmt"
	"log"
	"path"

	"github.com/chippolot/go-mud/src/utils"
	lua "github.com/yuin/gopher-lua"
)

const EntitiesFileExtension = ".ent"
const RoomsFileExtension = ".lvl"
const ItemsFileExtension = ".itm"

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
		r, err := NewRoom(cfg)
		if err != nil {
			log.Fatalf("Failed to parse room with error: %v", err)
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
				log.Fatalf("Failed to load script file %s -- %v", scriptPath, err)
			} else {
				cfg.scripts = NewEntityScripts(w.luaState, scriptsTable)
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
	if fn, err := w.luaState.LoadFile(filePath); err != nil {
		return nil, err
	} else {
		if err := w.luaState.CallByParam(lua.P{Fn: fn, NRet: 1, Protect: false}); err != nil {
			return nil, err
		}
		tbl, ok := w.luaState.Get(-1).(*lua.LTable)
		if !ok {
			return nil, fmt.Errorf("expected returned table from lua script: %s", filePath)
		}
		w.luaState.Pop(1)
		return tbl, nil
	}
}

func LoadAssets(w *World, root string) {
	// Load rooms
	for _, path := range utils.FindFilePathsWithExtension(root, RoomsFileExtension) {
		if err := LoadRooms(w, path); err != nil {
			log.Fatalf("Failed to load room file %s -- %v", path, err)
		}
	}

	// Load mobs
	for _, path := range utils.FindFilePathsWithExtension(root, EntitiesFileExtension) {
		if err := LoadEntities(w, path); err != nil {
			log.Fatalf("Failed to load entities file %s -- %v", path, err)
		}
	}

	// Loat items
	for _, path := range utils.FindFilePathsWithExtension(root, ItemsFileExtension) {
		if err := LoadItems(w, path); err != nil {
			log.Fatalf("Failed to load items file %s -- %v", path, err)
		}
	}
}
