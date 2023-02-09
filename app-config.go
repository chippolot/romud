package main

import "github.com/chippolot/romud/src/mud"

type ServerConfig struct {
	Type string
	Port int
}

type AppConfig struct {
	Mud     *mud.MudConfig
	Servers []*ServerConfig
}
