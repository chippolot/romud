# romud
roMUD is an open-source cross-platform MUD heavily inspired by DikuMUD and Ragnarok Online

## Features
- MUD framework inspired by DikuMUD and its derivatives
- Gameplay mechanics and content inspired by Ragnarok Online Classic
  - Currently includes monster, item, and room content from the first Prontera field map
  - Jobs and Skills (Currently supports novice, 1st, and 2nd tier jobs)
- Combat distance mechanic for simulating ranged combat
- Lua script support for config, entity/item/room scripts, and more

## Usage
roMUD can be build using `go build` or run from source `go run .`. 
This will start a local server on the configured port (4000 by default).

Currently roMUD only supports basic Telnet connections. 
To connect a client to a local server: `telnet localhost 4000`

The file `app.json` contains configuration for the MUD server.
