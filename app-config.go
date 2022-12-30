package main

type ServerConfig struct {
	Type string
	Port int
}

type AppConfig struct {
	Servers []ServerConfig
}
