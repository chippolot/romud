package mud

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"os"
)

func LoadRooms(w *World, path string) error {
	bytes, err := loadFileBytes(path)
	if err != nil {
		return err
	}

	roomDatas := RoomDataList{}
	err = json.Unmarshal(bytes, &roomDatas)
	if err != nil {
		return err
	}

	for _, rData := range roomDatas {
		r, err := NewRoomFromData(&rData)
		if err != nil {
			log.Panicf("Failed to parse room with error: %v", err)
		}
		w.AddRoom(r)
	}

	return nil
}

func loadFileBytes(path string) ([]byte, error) {
	file, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	bytes, err := ioutil.ReadAll(file)
	if err != nil {
		return nil, err
	}
	return bytes, nil
}
