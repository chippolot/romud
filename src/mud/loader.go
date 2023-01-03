package mud

import (
	"encoding/json"
	"log"

	"github.com/chippolot/go-mud/src/utils"
)

func LoadRooms(w *World, path string) error {
	bytes, err := LoadFileBytes(path)
	if err != nil {
		return err
	}

	cfgList := RoomConfigList{}
	err = json.Unmarshal(bytes, &cfgList)
	if err != nil {
		return err
	}

	for _, cfg := range cfgList {
		r, err := ParseRoom(cfg)
		if err != nil {
			log.Fatalf("Failed to parse room with error: %v", err)
		}
		w.AddRoom(r)
	}

	log.Printf("loaded %d rooms from %s", len(cfgList), path)

	return nil
}

func LoadEntities(w *World, path string) error {
	bytes, err := LoadFileBytes(path)
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
	}

	log.Printf("loaded %d entities from %s", len(cfgList), path)

	return nil
}

func LoadAssets(w *World, root string) {
	// Load rooms
	for _, path := range utils.FindFilePathsWithExtension(root, ".rooms") {
		if err := LoadRooms(w, path); err != nil {
			log.Fatalf("Failed to load room file %s -- %v", path, err)
		}
	}
	for _, path := range utils.FindFilePathsWithExtension(root, ".ents") {
		if err := LoadEntities(w, path); err != nil {
			log.Fatalf("Failed to load entities file %s -- %v", path, err)
		}
	}
}
