package mud

type Database interface {
	SavePlayer(id string, data *PlayerData) error
	LoadPlayer(id string) (*PlayerData, error)
}
