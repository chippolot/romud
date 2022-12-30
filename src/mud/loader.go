package mud

import (
	"encoding/json"
	"log"
)

func LoadRooms(w *World, path string) error {
	bytes, err := LoadFileBytes(path)
	if err != nil {
		return err
	}

	roomDatas := RoomDataList{}
	err = json.Unmarshal(bytes, &roomDatas)
	if err != nil {
		return err
	}

	for _, rData := range roomDatas {
		r, err := ParseRoom(&rData)
		if err != nil {
			log.Panicf("Failed to parse room with error: %v", err)
		}
		w.AddRoom(r)
	}

	log.Printf("loaded %d rooms from %s", len(roomDatas), path)

	return nil
}
