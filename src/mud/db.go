package mud

import (
	"encoding/json"
	"os"
	"path"
	"strings"
)

const PlayerFileExtension = ".player"
const PlayersDirectory = "players"

type Database interface {
	DoesPlayerExist(id string) bool
	SavePlayer(id string, data *PlayerData) error
	LoadPlayer(id string) (*PlayerData, error)
}

type FileSystemDatabase struct {
	dbPath string
}

func NewFileSystemDatabase(path string) *FileSystemDatabase {
	return &FileSystemDatabase{path}
}

func (db *FileSystemDatabase) DoesPlayerExist(id string) bool {
	id = strings.ToLower(id)

	filePath := db.getPlayerFilePath(id)
	_, err := os.Stat(filePath)
	return !os.IsNotExist(err)
}

func (db *FileSystemDatabase) SavePlayer(id string, data *PlayerData) error {
	id = strings.ToLower(id)

	jsonData, err := json.MarshalIndent(data, "", " ")
	if err != nil {
		return err
	}

	filePath := db.getPlayerFilePath(id)
	err = os.WriteFile(filePath, jsonData, 0644)
	if err != nil {
		return err
	}
	return nil
}

func (db *FileSystemDatabase) LoadPlayer(id string) (*PlayerData, error) {
	id = strings.ToLower(id)

	filePath := db.getPlayerFilePath(id)

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

func (db *FileSystemDatabase) getPlayerFilePath(id string) string {
	return path.Join(db.dbPath, PlayersDirectory, id+PlayerFileExtension)
}
