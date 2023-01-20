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
		id, _ := strconv.Atoi(trimExtension(filepath.Base(path)))
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
		id, _ := strconv.Atoi(trimExtension(filepath.Base(path)))
		id++
		if bytes, err := utils.LoadFileBytes(path); err == nil {
			parseRooms(bytes, filepath.Join(outPath, "rooms", fmt.Sprintf("%d%s", id, mud.RoomsFileExtension)))
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
		zid, _ := strconv.Atoi(line[1:])
		cfg.Id = mud.ZoneId(zid + 1)

		// Parse Name
		line, lines = nextLine(lines)
		cfg.Name = line[:len(line)-1]

		// Parse values
		line, lines = nextLine(lines)
		toks := strings.Split(line, " ")
		i, _ := strconv.Atoi(toks[0])
		cfg.MinRoomId = mud.RoomId(i) + 1
		i, _ = strconv.Atoi(toks[1])
		cfg.MaxRoomId = mud.RoomId(i) + 1
		i, _ = strconv.Atoi(toks[2])
		cfg.ResetFreq = utils.Seconds(i * 60)
	}
	save(outPath, cfg)
}

func parseRooms(data []byte, outPath string) {
	var line string
	var sb strings.Builder
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
		room := &mud.RoomConfig{}
		room.Exits = make(mud.RoomExitsConfig)

		// Parse Id
		rid, _ := strconv.Atoi(line[1:])
		room.Id = mud.RoomId(rid + 1)

		// Parse Name
		line, lines = nextLine(lines)
		room.Name = line[:len(line)-1]

		// Parse Description
		sb.Reset()
		line, lines = nextLine(lines)
		for line != "~" {
			if sb.Len() != 0 {
				sb.WriteString("\n")
			}
			sb.WriteString(line)
			line, lines = nextLine(lines)
		}
		room.Desc = sb.String()

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
				room.Exits[dir] = mud.RoomId(toRid + 1)
			}
			line, lines = nextLine(lines)
		}

		rooms = append(rooms, room)
		line, lines = nextLine(lines)
	}
	save(outPath, &rooms)
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
