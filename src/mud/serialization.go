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
	ItemsFileExtension  = ".itm"
	ScriptFileExtension = ".lua"
)

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

func RunScript(w *World, filePath string) error {
	if err := w.L.DoFile(filePath); err != nil {
		return err
	}
	return nil
}

func LoadAssets(w *World, root string) {
	// Load zones
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "zones"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load zone file %s -- %v", path, err)
		}
	}
	log.Printf("loaded %d zones", len(w.zones))

	// Load rooms
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "rooms"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load room file %s -- %v", path, err)
		}
	}
	log.Printf("loaded %d rooms", len(w.rooms))

	// Load mobs
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "entities"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load entities file %s -- %v", path, err)
		}
	}
	log.Printf("loaded %d mobs", len(w.entityConfigs))

	// Loat items
	for _, path := range utils.FindFilePathsWithExtension(root, ItemsFileExtension) {
		if err := LoadItems(w, path); err != nil {
			log.Fatalf("failed to load items file %s -- %v", path, err)
		}
	}
	log.Printf("loaded %d items", len(w.itemConfigs))
}
