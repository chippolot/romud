package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/chippolot/go-mud/src/mud"
	"github.com/chippolot/go-mud/src/utils"
)

var sb strings.Builder

func main() {
	if len(os.Args) != 3 {
		log.Println("Must call with input and output parameters. Ex: convert inpath outpath")
		os.Exit(1)
	}
	inPath := os.Args[1]
	outPath := os.Args[2]

	if _, stat := os.Stat(inPath); os.IsNotExist(stat) {
		log.Printf("input path %s does not exist\n", inPath)
		os.Exit(1)
	}

	if _, stat := os.Stat(outPath); os.IsNotExist(stat) {
		log.Printf("output path %s does not exist\n", outPath)
		os.Exit(1)
	}

	for _, path := range utils.FindFilePathsWithExtension(inPath, ".zon") {
		log.Println("Parsing:", path)
		id := parseInt(trimExtension(filepath.Base(path)))
		id++
		if bytes, err := utils.LoadFileBytes(path); err == nil {
			parseZone(bytes, filepath.Join(outPath, "zones", fmt.Sprintf("%d%s", id, mud.ZoneFileExtension)))
		} else {
			log.Panic(err)
			os.Exit(1)
		}
	}

	for _, path := range utils.FindFilePathsWithExtension(inPath, ".wld") {
		log.Println("Parsing:", path)
		id := parseInt(trimExtension(filepath.Base(path)))
		id++
		if bytes, err := utils.LoadFileBytes(path); err == nil {
			parseRooms(bytes, filepath.Join(outPath, "rooms", fmt.Sprintf("%d%s", id, mud.RoomsFileExtension)))
		} else {
			log.Panic(err)
			os.Exit(1)
		}
	}

	for _, path := range utils.FindFilePathsWithExtension(inPath, ".mob") {
		id := parseInt(trimExtension(filepath.Base(path)))
		id++
		log.Println("Parsing:", path)
		if bytes, err := utils.LoadFileBytes(path); err == nil {
			parseEntities(bytes, filepath.Join(outPath, "entities", fmt.Sprintf("%d%s", id, mud.EntitiesFileExtension)))
		} else {
			log.Panic(err)
			os.Exit(1)
		}
	}
}

func parseZone(data []byte, outPath string) {
	cfg := &mud.ZoneConfig{}

	var line string
	lines := strings.Split(string(data), "\n")
	if len(lines) > 0 {
		line = lines[0]
	}
	for len(lines) > 0 {
		if len(line) == 0 || line[0] != '#' {
			line, lines = nextLine(lines)
			continue
		}

		// Parse Id
		cfg.Id = mud.ZoneId(parseInt(line[1:]) + 1)

		// Parse Name
		line, lines = nextLine(lines)
		cfg.Name = line[:len(line)-1]

		// Parse values
		line, lines = nextLine(lines)
		toks := strings.Split(line, " ")
		cfg.MinRoomId = mud.RoomId(parseInt(toks[0])) + 1
		cfg.MaxRoomId = mud.RoomId(parseInt(toks[1])) + 1
		cfg.ResetFreq = utils.Seconds(parseInt(toks[2]) * 60)

		// Parse reset commands
		/*
			cfg.ResetCommands = make([]interface{}, 0)
			for lines[0] != "S" {
				toks, lines = parseLineTokens(lines)
				if toks[0][0] == '*' {
					continue
				}

				// TODO Update this to use scripts
				var cmdData any
				var cmdType int
				switch toks[0] {
				case "M":
					cmdData = &mud.SpawnEntityZoneResetCommandData{Key: "mob" + toks[2]}
					cmdType = 1
				}
				if cmdData != nil {
					cfg.ResetCommands = append(cfg.ResetCommands, mud.ZoneResetCommand{cmdType, cmdData})
				}
			}
		*/
	}
	save(outPath, cfg)
}

func parseRooms(data []byte, outPath string) {
	var line string
	lines := strings.Split(string(data), "\n")
	if len(lines) > 0 {
		line = lines[0]
	}

	rooms := make(mud.RoomConfigList, 0)
	for len(lines) > 0 {
		if len(line) == 0 || line[0] != '#' {
			line, lines = nextLine(lines)
			continue
		}
		cfg := &mud.RoomConfig{}
		cfg.Exits = make(mud.RoomExitsConfig)

		// Parse Id
		rid := parseInt(line[1:])
		cfg.Id = mud.RoomId(rid + 1)

		// Parse Name
		line, lines = nextLine(lines)
		cfg.Name = line[:len(line)-1]

		// Parse Description
		cfg.Desc, lines = parseMultilineString(lines)

		line, lines = nextLine(lines)
		for line != "S" {
			if len(line) == 0 {
				line, lines = nextLine(lines)
				continue
			}
			if line[0] == 'D' && len(line) == 2 {
				idir := line[1] - '0'
				dir := mud.Direction(idir)
				lines = nextLineUntil(lines, '~')
				lines = nextLineUntil(lines, '~')
				line, lines = nextLine(lines)
				toks := strings.Split(line, " ")
				toRid, _ := strconv.Atoi(toks[2])
				cfg.Exits[dir] = mud.RoomId(toRid + 1)
			}
			line, lines = nextLine(lines)
		}

		rooms = append(rooms, cfg)
	}
	save(outPath, &rooms)
}

func parseEntities(data []byte, outPath string) {
	var line string
	lines := strings.Split(string(data), "\n")
	if len(lines) > 0 {
		line = lines[0]
	}

	entities := make(mud.EntityConfigList, 0)
	for len(lines) > 0 {
		if len(line) == 0 || line[0] != '#' {
			line, lines = nextLine(lines)
			continue
		}
		cfg := &mud.EntityConfig{}

		// Parse Key
		cfg.Key = "mob" + line[1:]

		// Parse Keywords
		line, lines = nextLine(lines)
		cfg.Keywords = strings.Split(line[:len(line)-1], " ")

		// Parse Name
		line, lines = nextLine(lines)
		cfg.Name = line[:len(line)-1]

		// Parse Room Desc
		cfg.RoomDesc, lines = parseMultilineString(lines)

		// Parse Full Desc
		cfg.FullDesc, lines = parseMultilineString(lines)

		toks, lines := parseLineTokens(lines)

		// Parse flags
		eflags := toks[0]
		for _, v := range eflags {
			switch v {
			case 'b':
				cfg.Flags |= mud.EFlag_Stationary
			case 'c':
				cfg.Flags |= mud.EFlag_Scavenger | mud.EFlag_TrashCollector
			case 'f':
				cfg.Flags |= mud.EFlag_Aggro
			case 'g':
				cfg.Flags |= mud.EFlag_StayZone
			case 'm':
				cfg.Flags |= mud.EFlag_AssistAll
			}
		}

		// Parse affectations
		eflags = toks[1]
		for _, v := range eflags {
			switch v {
			case 'a':
				cfg.Flags |= mud.EFlag_Blind
			case 'b':
				cfg.Flags |= mud.EFlag_Invisible
			}
		}

		// Parse entity type (CircleMUD specific)
		_ = toks[3]

		// Parse stats
		toks, lines = parseLineTokens(lines)
		cfg.Stats = &mud.StatsConfig{}

		// Parse level
		cfg.Stats.Level = parseInt(toks[0])

		// Parse THACO and convert to hit bonus
		toHit := 20 - parseInt(toks[1])

		// Parse AC
		cfg.Stats.AC = 19 - parseInt(toks[2])

		// Parse Hit Die
		cfg.Stats.HP, _ = mud.ParseDice(toks[3])

		// Parse Attack
		dam, _ := mud.ParseDice(toks[4])
		cfg.Attacks = make([]*mud.AttackConfig, 1)
		cfg.Attacks[0] = &mud.AttackConfig{
			Name:         "Hit",
			ToHit:        toHit,
			Damage:       dam,
			DamageType:   mud.Dam_Bludgeoning,
			VerbSingular: "hit",
			VerbPlural:   "hits",
		}

		// Parse XP
		toks, lines = parseLineTokens(lines)
		cfg.Stats.XPValue = parseInt(toks[1])

		// Parse Gender
		toks, lines = parseLineTokens(lines)
		cfg.Gender = mud.Gender(parseInt(toks[2]))

		entities = append(entities, cfg)
	}
	save(outPath, &entities)
}

func nextLine(lines []string) (string, []string) {
	lines = lines[1:]
	if len(lines) == 0 {
		return "", lines
	} else {
		return lines[0], lines
	}
}

func nextLineUntil(lines []string, char byte) []string {
	line, lines := nextLine(lines)
	for len(line) == 0 || line[len(line)-1] != char {
		line, lines = nextLine(lines)
	}
	return lines
}

func parseMultilineString(lines []string) (string, []string) {
	sb.Reset()
	line, lines := nextLine(lines)
	for line != "~" {
		if sb.Len() != 0 {
			sb.WriteString("\n")
		}
		sb.WriteString(line)
		line, lines = nextLine(lines)
	}
	return sb.String(), lines
}

func parseLineTokens(lines []string) ([]string, []string) {
	line, lines := nextLine(lines)
	return strings.Split(line, " "), lines
}

func parseInt(str string) int {
	i, _ := strconv.Atoi(str)
	return i
}

func save[T any](path string, data T) error {
	log.Println("Saving to:", path)
	jsonData, err := json.MarshalIndent(data, "", " ")
	if err != nil {
		return err
	}

	err = os.WriteFile(path, jsonData, 0644)
	if err != nil {
		return err
	}
	return nil
}

func trimExtension(fileName string) string {
	return fileName[:len(fileName)-len(filepath.Ext(fileName))]
}
