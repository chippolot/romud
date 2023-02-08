package mud

import (
	"log"
	"path"

	"github.com/chippolot/go-mud/src/utils"
)

const (
	ScriptFileExtension = ".lua"
)

func LoadAssets(w *World, projectRoot string) {
	root := path.Join(projectRoot, w.cfg.ConfigRoot)

	// Register misc config
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "misc"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load scipt file %s -- %v", path, err)
		}
	}

	// Load rooms
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "rooms"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load room file %s -- %v", path, err)
		}
	}

	// Load mobs
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "entities"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load entities file %s -- %v", path, err)
		}
	}

	// Load items
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "items"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load items file %s -- %v", path, err)
		}
	}

	// Load skills
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "skills"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load skills file %s -- %v", path, err)
		}
	}

	// Load jobs
	for _, path := range utils.FindFilePathsWithExtension(path.Join(root, "jobs"), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load jobs file %s -- %v", path, err)
		}
	}

	log.Printf("loaded %d zones", len(w.zones))
	log.Printf("loaded %d rooms", len(w.rooms))
	log.Printf("loaded %d mobs", len(w.entityConfigs))
	log.Printf("loaded %d items", len(w.itemConfigs))
	log.Printf("loaded %d skills", len(w.skillConfigs))
	log.Printf("loaded %d jobs", len(w.jobConfigs))

	// Prepare shop configs
	for _, shop := range w.shops {
		shop.Init(w)
	}

	// Prepare job configs
	for _, cfg := range w.jobConfigs {
		// Link base job
		if cfg.Base != 0 {
			if baseJob, ok := w.TryGetJobConfig(cfg.Base); ok {
				cfg.baseJob = baseJob
			} else {
				log.Panicf("unknown base job key '%v' configured on job '%s'", cfg.Base, cfg.Name)
				return
			}
		}
	}

	// Prepare skill configs
	for _, cfg := range w.skillConfigs {
		// NPC jobs
		if cfg.Job == 0 {
			continue
		}

		// All jobs
		if cfg.Job == JobType_All {
			for _, jcfg := range w.jobConfigs {
				jcfg.learnableSkills[cfg.Key] = true
			}
			continue
		}

		// Specific jobs
		_, ok := w.TryGetJobConfig(cfg.Job)
		if !ok {
			log.Panicf("unknown job key '%s' configured on skill '%s'", cfg.Job.String(), cfg.Name)
			return
		}
		for _, jcfg2 := range w.jobConfigs {
			if jcfg2.IsJobTypeOrAncestor(cfg.Job) {
				jcfg2.learnableSkills[cfg.Key] = true
			}
		}
	}
}

func RunScript(w *World, filePath string) error {
	if err := w.L.DoFile(filePath); err != nil {
		return err
	}
	return nil
}
