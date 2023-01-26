package main

type ServerConfig struct {
	Type string
	Port int
}

type AppConfig struct {
	ConfigRoot string
	Servers    []ServerConfig
}
