package main

type ActionFunc func(player *Player, world *World)

func DoLook(player *Player, world *World) {
	room := world.rooms[player.roomId]
	player.Send(room.Describe())
}
