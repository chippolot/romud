package mud

import (
	"encoding/json"
	"os"
	"path"
)

const PlayerFileExtension = ".player"
const PlayersDirectory = "players"

type Database interface {
	SavePlayer(id string, data *PlayerData) error
	LoadPlayer(id string) (*PlayerData, error)
}

type FileSystemDatabase struct {
	dbPath string
}

func NewFileSystemDatabase(path string) *FileSystemDatabase {
	return &FileSystemDatabase{path}
}

func (db *FileSystemDatabase) SavePlayer(id string, data *PlayerData) error {
	jsonData, err := json.MarshalIndent(data, "", " ")
	if err != nil {
		return err
	}

	filePath := path.Join(db.dbPath, PlayersDirectory, id+PlayerFileExtension)
	err = os.WriteFile(filePath, jsonData, 0644)
	if err != nil {
		return err
	}
	return nil
}

func (db *FileSystemDatabase) LoadPlayer(id string) (*PlayerData, error) {
	filePath := path.Join(db.dbPath, PlayersDirectory, id+PlayerFileExtension)

	bytes, err := os.ReadFile(filePath)
	if os.IsNotExist(err) {
		return nil, nil
	} else if err != nil {
		return nil, err
	}

	data := &PlayerData{}
	err = json.Unmarshal(bytes, data)
	if err != nil {
		return nil, err
	}

	return data, nil
}
