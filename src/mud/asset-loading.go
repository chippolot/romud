package mud

import (
	"log"
	"path"

	"github.com/chippolot/romud/src/utils"
)

const (
	ScriptFileExtension = ".lua"
)

func LoadAssets(w *World, projectRoot string) {
	root := path.Join(projectRoot, mudConfig.ConfigRoot)

	runScriptsInConfigFolder(w, root, "misc")
	runScriptsInConfigFolder(w, root, "rooms")
	runScriptsInConfigFolder(w, root, "entities")
	runScriptsInConfigFolder(w, root, "items")
	runScriptsInConfigFolder(w, root, "skills")
	runScriptsInConfigFolder(w, root, "jobs")
	runScriptsInConfigFolder(w, root, "scripts")

	log.Printf("loaded %d zones", len(w.zones))
	log.Printf("loaded %d rooms", len(w.rooms))
	log.Printf("loaded %d entities", len(w.cfg.entityConfigs))
	log.Printf("loaded %d items", len(w.cfg.itemConfigs))
	log.Printf("loaded %d skills", len(w.cfg.skillConfigs))
	log.Printf("loaded %d jobs", len(w.cfg.jobConfigs))

	// Prepare shop configs
	for _, shop := range w.shops {
		shop.Init(w)
	}

	// Prepare job configs
	for _, cfg := range w.cfg.jobConfigs {
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
	for _, cfg := range w.cfg.skillConfigs {
		// NPC jobs
		if cfg.Job == 0 {
			continue
		}

		// All jobs
		if cfg.Job == JobType_All {
			for _, jcfg := range w.cfg.jobConfigs {
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
		for _, jcfg2 := range w.cfg.jobConfigs {
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

func runScriptsInConfigFolder(w *World, configRoot string, folderName string) {
	for _, path := range utils.FindFilePathsWithExtension(path.Join(configRoot, folderName), ScriptFileExtension) {
		if err := RunScript(w, path); err != nil {
			log.Fatalf("failed to load scipt file %s -- %v", path, err)
		}
	}
}
