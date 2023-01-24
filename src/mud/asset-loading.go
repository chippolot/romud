package mud

import (
	"log"
	"path"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	ScriptFileExtension = ".lua"
)

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
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "items"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load items file %s -- %v", path, err)
		}
	}
	log.Printf("loaded %d items", len(w.itemConfigs))
}

func RunScript(w *World, filePath string) error {
	if err := w.L.DoFile(filePath); err != nil {
		return err
	}
	return nil
}
