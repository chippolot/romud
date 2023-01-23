package main

import (
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
			parseZone(bytes, filepath.Join(outPath, "zones", fmt.Sprintf("zone-%d%s", id, mud.ScriptFileExtension)))
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
			parseRooms(bytes, filepath.Join(outPath, "rooms", fmt.Sprintf("rooms-%d%s", id, mud.ScriptFileExtension)))
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
			parseEntities(bytes, filepath.Join(outPath, "entities", fmt.Sprintf("mobs-%d%s", id, mud.ScriptFileExtension)))
		} else {
			log.Panic(err)
			os.Exit(1)
		}
	}

	for _, path := range utils.FindFilePathsWithExtension(inPath, ".obj") {
		id := parseInt(trimExtension(filepath.Base(path)))
		id++
		log.Println("Parsing:", path)
		if bytes, err := utils.LoadFileBytes(path); err == nil {
			parseItems(bytes, filepath.Join(outPath, "items", fmt.Sprintf("items-%d%s", id, mud.ScriptFileExtension)))
		} else {
			log.Panic(err)
			os.Exit(1)
		}
	}
}

func parseZone(data []byte, outPath string) {
	lb := NewLuaBuilder()

	var line string
	lines := strings.Split(string(data), "\n")
	if len(lines) > 0 {
		line = lines[0]
	}

	lb.FuncCall("Config.NewZone", func() {
		lb.Table(func() {
			for len(lines) > 0 {
				if len(line) == 0 || line[0] != '#' {
					line, lines = nextLine(lines)
					continue
				}

				// Parse Id
				lb.Field("Id", mud.ZoneId(parseInt(line[1:])+1))

				// Parse Name
				line, lines = nextLine(lines)
				lb.Field("Name", line[:len(line)-1])

				// Parse values
				line, lines = nextLine(lines)
				toks := strings.Split(line, " ")
				lb.Field("MinRoomId", mud.RoomId(parseInt(toks[0]))+1)
				lb.Field("MaxRoomId", mud.RoomId(parseInt(toks[1]))+1)
				lb.Field("ResetFreq", utils.Seconds(parseInt(toks[2])*60))

				// Parse reset commands
				lb.FieldScope("ResetFunc", func() {
					lb.Func(func() {
						for lines[0] != "S" {
							toks, lines = parseLineTokens(lines)
							if toks[0][0] == '*' {
								continue
							}
							switch toks[0] {
							case "M":
								key := "mob" + toks[2]
								lb.Linef("e = World.LoadEntityLimited(\"%s\", %d, %s)", key, parseInt(toks[4])+1, toks[3])
							case "I":
								key := "item" + toks[2]
								lb.Linef("World.LoadItemLimited(\"%s\", %d, %s)", key, parseInt(toks[4])+1, toks[3])
							case "G":
								key := "item" + toks[2]
								lb.Linef("i = World.LoadItemLimited(\"%s\", Entity.RoomId(e), %s)", key, toks[3])
								lb.Linef("Act.Get(e, i)")
							case "E":
								key := "item" + toks[2]
								lb.Linef("i = World.LoadItemLimited(\"%s\", Entity.RoomId(e), %s)", key, toks[3])
								lb.Linef("Act.Get(e, i)")
								lb.Linef("Act.Equip(e, i)")
							}
						}
					})
				})
			}
		})
	})
	saveString(outPath, lb.Build())
}

func parseRooms(data []byte, outPath string) {
	lb := NewLuaBuilder()

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
		lb.FuncCall("Config.NewRoom", func() {
			lb.Table(func() {
				// Parse Id
				rid := parseInt(line[1:])
				lb.Field("Id", rid+1)

				// Parse Name
				line, lines = nextLine(lines)
				lb.Field("Name", line[:len(line)-1])

				// Parse Description
				desc, lines := parseMultilineString(lines)
				lb.Field("Desc", desc)

				// Parse exits
				line, lines = nextLine(lines)
				lb.FieldScope("Exits", func() {
					lb.Table(func() {
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
								lb.Field(dir.String(), mud.RoomId(toRid+1))
							}
							line, lines = nextLine(lines)
						}
					})
				})
			})
		})
	}
	saveString(outPath, lb.Build())
}

func parseEntities(data []byte, outPath string) {
	lb := NewLuaBuilder()

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

		lb.FuncCall("Config.NewEntity", func() {
			lb.Table(func() {

				// Parse Key
				key := strings.Trim("mob"+line[1:], " ")
				lb.Field("Key", key)

				// Parse Keywords
				line, lines = nextLine(lines)
				lb.FieldScope("Keywords", func() {
					lb.Table(func() {
						for _, k := range strings.Split(line[:len(line)-1], " ") {
							lb.Item(k)
						}
					})
				})

				// Parse Name
				line, lines = nextLine(lines)
				lb.Field("Name", line[:len(line)-1])

				// Parse Room Desc
				roomDesc, lines := parseMultilineString(lines)
				lb.Field("RoomDesc", roomDesc)

				// Parse Full Desc
				fullDesc, lines := parseMultilineString(lines)
				lb.Field("FullDesc", fullDesc)

				toks, lines := parseLineTokens(lines)

				// Parse flags
				eflags := mud.EFlag_UsesEquipment
				flagsStr := toks[0]
				for _, v := range flagsStr {
					switch v {
					case 'b':
						eflags |= mud.EFlag_Stationary
					case 'c':
						eflags |= mud.EFlag_Scavenger | mud.EFlag_TrashCollector
					case 'f':
						eflags |= mud.EFlag_Aggro
					case 'g':
						eflags |= mud.EFlag_StayZone
					case 'm':
						eflags |= mud.EFlag_AssistAll
					}
				}

				// Parse affectations
				flagsStr = toks[1]
				for _, v := range flagsStr {
					switch v {
					case 'a':
						eflags |= mud.EFlag_Blind
					case 'b':
						eflags |= mud.EFlag_Invisible
					}
				}

				lb.FieldScope("Flags", func() {
					lb.Table(func() {
						for _, f := range eflags.Strings() {
							lb.Item(f)
						}
					})
				})

				// Parse entity type (CircleMUD specific)
				_ = toks[3]

				// Parse THACO and convert to hit bonus
				toks, lines = parseLineTokens(lines)
				toHit := 20 - parseInt(toks[1])

				// Parse Attack
				dam, _ := mud.ParseDice(toks[4])
				lb.FieldScope("Attacks", func() {
					lb.Table(func() {
						lb.ItemScope(func() {
							lb.Table(func() {
								lb.Field("Name", "Hit")
								lb.Field("ToHit", toHit)
								lb.Field("Damage", dam.String())
								lb.Field("DamageType", "bludgeoning")
								lb.Field("VerbSingular", "hit")
								lb.Field("VerbPlural", "hits")
							})
						})
					})
				})

				// Parse stats
				lb.FieldScope("Stats", func() {
					lb.Table(func() {
						// Parse level
						lb.Field("Level", parseInt(toks[0]))

						// Parse AC
						lb.Field("AC", 19-parseInt(toks[2]))

						// Parse Hit Die
						hp, _ := mud.ParseDice(toks[3])
						lb.Field("HP", hp.String())

						// Parse XP
						toks, lines = parseLineTokens(lines)
						lb.Field("XPValue", parseInt(toks[1]))

						// Set some defaults
						lb.Field("Speed", 30)
						lb.Field("Str", 10)
						lb.Field("Dex", 10)
						lb.Field("Con", 10)
						lb.Field("Int", 10)
						lb.Field("Wis", 10)
						lb.Field("Cha", 10)
					})
				})

				// Parse Gender
				toks, lines = parseLineTokens(lines)
				lb.Field("Gender", mud.Gender(parseInt(toks[2])))
			})
		})
	}
	saveString(outPath, lb.Build())
}

func parseItems(data []byte, outPath string) {
	lb := NewLuaBuilder()

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

		lb.FuncCall("Config.NewItem", func() {
			lb.Table(func() {

				// Parse Key
				key := strings.Trim("item"+line[1:], " ")
				lb.Field("Key", key)

				// Parse Keywords
				line, lines = parseMultilineString(lines)
				lb.FieldScope("Keywords", func() {
					lb.Table(func() {
						for _, k := range strings.Split(line, " ") {
							lb.Item(k)
						}
					})
				})

				// Parse Name
				line, lines = parseMultilineString(lines)
				lb.Field("Name", line)

				// Parse Room Desc
				line, lines := parseMultilineString(lines)
				lb.Field("RoomDesc", line)

				// Skip Action Desc
				_, lines = parseMultilineString(lines)

				// Parse (type, flags, wear)
				toks, lines := parseLineTokens(lines)
				typ, _, wear := toks[0], toks[1], toks[2]
				isWeapon, isArmor := typ == "5", typ == "9"

				// Parse Obj Values
				toks, lines = parseLineTokens(lines)
				v0, v1, v2, _ := toks[0], toks[1], toks[2], toks[3]

				// Parse equipment
				if isWeapon || isArmor {
					lb.FieldScope("Equipment", func() {
						lb.Table(func() {
							if isWeapon {
								lb.FieldScope("Weapon", func() {
									lb.Table(func() {
										dam := mud.NewDice(uint(parseInt(v1)), uint(parseInt(v2)), 0)
										lb.Field("Damage", dam.String())
										lb.Field("DamageType", "slashing")
										lb.Field("VerbSingular", "slash")
										lb.Field("VerbPlural", "slashes")
									})
								})
							} else {
								lb.FieldScope("Armor", func() {
									lb.Table(func() {
										lb.FieldScope("Stats", func() {
											lb.Table(func() {
												lb.Field("AC", v0)
											})
										})
									})
								})
							}
							slot := toEquipSlot(wear)
							lb.Field("Slot", slot.String())
						})
					})
				}

				// Parse (weight, cost, rent)
				toks, lines = parseLineTokens(lines)
				weight, cost, _ := toks[0], toks[1], toks[2]
				lb.Field("Value", parseInt(cost))
				lb.Field("Weight", parseInt(weight))

				// TODO Parse Extras and Affects
			})
		})
	}
	saveString(outPath, lb.Build())
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
		if strings.HasSuffix(line, "~") {
			sb.WriteString(line[:len(line)-1])
			break
		} else {
			sb.WriteString(line)
			line, lines = nextLine(lines)
		}
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

func saveString(path string, data string) error {
	log.Println("Saving to:", path)
	err := os.WriteFile(path, []byte(data), 0644)
	if err != nil {
		return err
	}
	return nil
}

func trimExtension(fileName string) string {
	return fileName[:len(fileName)-len(filepath.Ext(fileName))]
}

func toEquipSlot(s string) mud.EquipSlot {
	f := parseInt(s)
	if f&(1<<1) != 0 {
		return mud.EqSlot_Fingers
	} else if f&(1<<2) != 0 {
		return mud.EqSlot_Neck
	} else if f&(1<<3) != 0 {
		return mud.EqSlot_Body
	} else if f&(1<<4) != 0 {
		return mud.EqSlot_Head
	} else if f&(1<<5) != 0 {
		return mud.EqSlot_Legs
	} else if f&(1<<6) != 0 {
		return mud.EqSlot_Feet
	} else if f&(1<<7) != 0 {
		return mud.EqSlot_Hands
	} else if f&(1<<8) != 0 {
		return mud.EqSlot_Arms
	} else if f&(1<<9) != 0 {
		return mud.EqSlot_Held1H
	} else if f&(1<<10) != 0 {
		return mud.EqSlot_Shoulders
	} else if f&(1<<11) != 0 {
		return mud.EqSlot_Waist
	} else if f&(1<<12) != 0 {
		return mud.EqSlot_Wrists
	} else if f&(1<<13) != 0 {
		return mud.EqSlot_Held1H
	} else if f&(1<<14) != 0 {
		return mud.EqSlot_Held1H
	}
	return mud.EqSlot_None
}
