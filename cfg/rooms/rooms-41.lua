Config.NewRoom({
	Id = 4001,
	Name = "The Hills",
	Desc = [[
   You are on a path leading north, small hills surround you.
You feel the forces of evil approach you from the north.  Off
in the distance to the northeast you can see the beginning of
a large mountain range.
]],
	Exits = {
		north = 4002,
		south = 3501
	}
})
Config.NewRoom({
	Id = 4002,
	Name = "The Hills",
	Desc = [[
   You are on a small path leading north, dark threatening hills
surround you on almost all sides.  A fair distance off to the
north, you can see the enormous shadow of a strangely solitaire
mountain.
]],
	Exits = {
		north = 4003,
		south = 4001
	}
})
Config.NewRoom({
	Id = 4003,
	Name = "The End Of The Path",
	Desc = [[
   The path stops here, to the north is a single mountain and around
you are some threatening hills.  A small trail leads up the hillside
through the rocks to a dark cave located to the north.  Off to the
northeast, you can see the southern end of what appears to be a large
mountain range.
]],
	Exits = {
		north = 4011,
		south = 4002
	}
})
Config.NewRoom({
	Id = 4011,
	Name = "The Cave",
	Desc = [[
   You are standing in a small cave, about fifteen feet across at
the widest point and about forty feet long.  Off to the south you
sense fresh air and you surmise that the entrance must be located
off in that direction.  To the north a small tunnel continues into
the mountain.
]],
	Exits = {
		south = 4003
	}
})
Config.NewRoom({
	Id = 4012,
	Name = "The Tunnel",
	Desc = [[
   You force your way into a narrow tunnel, aided by the wet walls
which help you slide through the passageway.  The smell of mouldy
moss is growing greater the farther north you head, but you can smell
fresh air off to the south as a light breeze wafts past you.
]],
	Exits = {
		north = 4015,
		south = 4011
	}
})
Config.NewRoom({
	Id = 4013,
	Name = "The Tunnel",
	Desc = [[
   You find yourself at a turn in this narrow tunnel.  The tunnel
appears to open up to the north into a cave of some sort while to
the east it leads onwards through the mountain.
]],
	Exits = {
		north = 4017,
		east = 4014
	}
})
Config.NewRoom({
	Id = 4014,
	Name = "The Tunnel",
	Desc = [[
   Standing in the middle of the dusty floor of this tunnel, you can
see that it is not a highly travelled passageway.  It looks to lead
in an east-west direction.
]],
	Exits = {
		east = 4015,
		west = 4013
	}
})
Config.NewRoom({
	Id = 4015,
	Name = "The Tunnel",
	Desc = [[
   You find yourself at a small intersection of sorts in this tunnel.
The main tunnel appears to curve from south to west but there is an
entrance into a cave to the north.  The entrance itself looks to be
unnatural and much more recent than the tunnel or even the cave.
]],
	Exits = {
		north = 4019,
		south = 4012,
		west = 4014
	}
})
Config.NewRoom({
	Id = 4016,
	Name = "The Tunnel",
	Desc = [[
   You clamber on through this narrow tunnel.  The walls are damp
with condensation and the weight of the rock above you is beginning
to make you feel almost claustrophobic.  The tunnel makes a jagged
turn from west to north here.
]],
	Exits = {
		north = 4020,
		west = 4015
	}
})
Config.NewRoom({
	Id = 4017,
	Name = "The Large Cave",
	Desc = [[
   You find yourself in a fairly large cave.  Large enough that the
eastern and western ends are almots completely shrouded in darkness.
A small tunnel breaks through the southern wall, and it too is full
of shadows.
]],
	Exits = {
		east = 4018,
		south = 4013,
		west = 4024
	}
})
Config.NewRoom({
	Id = 4018,
	Name = "The Large Cave",
	Desc = [[
   You move along the cave to the west end of it and find that there
appears to be no other exit from here.  The walls are fairly smooth
and look to have been naturally carved out of the rock by the passage
of water.
]],
	Exits = {
		west = 4017
	}
})
Config.NewRoom({
	Id = 4019,
	Name = "The Cave",
	Desc = [[
   You find yourself at the southern end of a cave as it begins
to turn into a tunnel which leads off to the south.  The cave
continues northwards deeper into the darkness.
You notice a large pile of bones in the corner.
]],
	Exits = {
		north = 4026,
		south = 4015
	}
})
Config.NewRoom({
	Id = 4020,
	Name = "The Tunnel",
	Desc = [[
   You stand in the middle of a fairly wide passageway that leads
in a north-south direction.  The walls are quite smooth, almost as
if a river had gouged them out of the earth.
]],
	Exits = {
		north = 4027,
		south = 4016
	}
})
Config.NewRoom({
	Id = 4021,
	Name = "The Hole",
	Desc = [[
   You are standing in a small alcove off the main tunnel.  There is
a fairly wide hole broken through the floor of the alcove.  The only
other exit is to the north.
]],
	Exits = {
		north = 4028,
		down = 4065
	}
})
Config.NewRoom({
	Id = 4022,
	Name = "The Hole",
	Desc = [[
   As you stand at the end of this tunnel, you notice a large hole
sitting in the floor by the northwestern corner of the walls.  The
tunnel itself leads off towards the east.  The air here feels very
damp and you feel like your clothes are becoming sticky with sweat.
]],
	Exits = {
		east = 4023,
		down = 4116
	}
})
Config.NewRoom({
	Id = 4023,
	Name = "The Damp Tunnel",
	Desc = [[
   You are standing in the middle of a damp tunnel.  The moisture
in the air is so thick that you can almost seem it seeping into your
clothes.  The tunnel continues to the north and west.  A large cave
opens up to the east.
]],
	Exits = {
		north = 4025,
		east = 4024,
		west = 4022
	}
})
Config.NewRoom({
	Id = 4024,
	Name = "The Large Cave",
	Desc = [[
   You are in the western part of the large cave, to the east you can
see a tunnel.  The air near the tunnel entrance is heavy with moisture,
giving you a feeling as if you were standing in the rain.  The walls
of the cave are almost totally shrouded in darkness and shadow as is
the southern end of the cavern.
]],
	Exits = {
		east = 4017,
		west = 4023
	}
})
Config.NewRoom({
	Id = 4025,
	Name = "The Damp Tunnel",
	Desc = [[
   The tunnel you are in now is very humid, and the air seems to almost
hang with moisture.  The walls drip with an almost constant water flow,
and the ground is covered with small pools of stagnent water.
   The tunnel leads away to the south, and to the west you can feel that
the air is even damper than here.
]],
	Exits = {
		south = 4023,
		west = 4060
	}
})
Config.NewRoom({
	Id = 4026,
	Name = "The Cave",
	Desc = [[
   You find yourself standing in the northern end of a reasonably
large cave.  The cave wall to the east has an opening that appears
to lead to a junction of several tunnels.
]],
	Exits = {
		east = 4027,
		south = 4019
	}
})
Config.NewRoom({
	Id = 4027,
	Name = "The Many Tunnels",
	Desc = [[
   You find yourself standing in the midst of an intersection
of numerous tunnels.  There is a musty smell emanating from the
tunnel to the north, whilst the one to the west appears to open
up almost immediately into a cave.  The tunnels to the south and
east are totally shrouded in darkness.
]],
	Exits = {
		north = 4029,
		east = 4028,
		south = 4020,
		west = 4026
	}
})
Config.NewRoom({
	Id = 4028,
	Name = "The Tunnel",
	Desc = [[
   You find yourself at an elbow turn in the tunnel as it turns to the
west and north.  You spot a small alcove hidden in the shadows just to
the south of you, and you can feel a breeze coming from somewhere to the
north you believe.
]],
	Exits = {
		north = 4030,
		south = 4021,
		west = 4027
	}
})
Config.NewRoom({
	Id = 4029,
	Name = "The Smelly Tunnel",
	Desc = [[
   You are in a fairly small north-south leading tunnel.  There
is a a small light visible off to the north.  As you stop for a
moment, you notice a strange smell from the north.
]],
	Exits = {
		north = 4031,
		south = 4027
	}
})
Config.NewRoom({
	Id = 4030,
	Name = "The Cave",
	Desc = [[
   You are in a cave that is filled with fresh air, you sense the
wind blowing from the north.  To the south you see a small tunnel
continue into the mountain.
]],
	Exits = {
		north = 4032,
		south = 4028
	}
})
Config.NewRoom({
	Id = 4031,
	Name = "The Light Cave",
	Desc = [[
   You are in a light cave, through a hole large above you, you
see the sky.  A small tunnel to the south is the only way out.
You notice the source of the strange smell, all around you there
are corpses of several monsters.
]],
	Exits = {
		south = 4029
	}
})
Config.NewRoom({
	Id = 4032,
	Name = "The Valley",
	Desc = [[
   You are in a small valley, surrounded by hills and a mountain to 
the south.  In the mountain there is a cave.  To the north you can
enter the hills.  There is a small trail leading up a steep hill to
the east.
]],
	Exits = {
		north = 4033,
		east = 4046,
		south = 4030
	}
})
Config.NewRoom({
	Id = 4033,
	Name = "The Foothills",
	Desc = [[
   You are on a winding path that leads through the foothills on the
north side of Mount Moria.  The path continues north.
]],
	Exits = {
		north = 4034,
		south = 4032
	}
})
Config.NewRoom({
	Id = 4034,
	Name = "The Intersection In The Foothills",
	Desc = [[
   You stand at a point by a small path that splits off here.  The
path continues north and south while a rough trail leads east into
the mountains.
]],
	Exits = {
		north = 4035,
		east = 4038,
		south = 4033
	}
})
Config.NewRoom({
	Id = 4035,
	Name = "The Grassy Area In The Foothills",
	Desc = [[
   The grass here is unusually high.  You notice several areas where
someone or something large has crushed spots of it down.  Several
very large rocks litter this area.  You can go north towards the end
of the foothills, west to go deeper into the foothills, or south to
a small path intersection.
]],
	Exits = {
		north = 4036,
		south = 4034,
		west = 4043
	}
})
Config.NewRoom({
	Id = 4036,
	Name = "At The Foothills' End",
	Desc = [[
   You find yourself standing at the northern edge of the foothills
where they meet the plains which lie to the north.  You can head back
into the foothills to the south or the plains to the north.
]],
	Exits = {
		north = 4037,
		south = 4035
	}
})
Config.NewRoom({
	Id = 4037,
	Name = "The Plains",
	Desc = [[
   You are in the plains.  The path leads to the south.  As you look
around you notice a small almost invisible trail leading away to the
west towards a copse of trees.
]],
	Exits = {
		south = 4036,
		west = 4076
	}
})
Config.NewRoom({
	Id = 4038,
	Name = "The Path Through The Foothills",
	Desc = [[
   You stand on a path that leads through the foothills in an
east-west direction.  Some distance off to the west you can see
a small intersection of paths and off to the east you see that
the path seems to come to an end as part of the mountain chain
juts out of the ground, blocking your view of the sky.
]],
	Exits = {
		east = 4039,
		west = 4034
	}
})
Config.NewRoom({
	Id = 4039,
	Name = "The Base Of The Mountain",
	Desc = [[
   You find yourself standing at the bottom of a large mountain in
the mountain chain which begins at Mount Moria and stretches north
towards the top of the world.  A small path leads off through the
foothills towards the west, where you can see plains quite a ways
away.  To the east you spot a small worn trail leading up the side
of the mountain.
]],
	Exits = {
		east = 4040,
		west = 4038
	}
})
Config.NewRoom({
	Id = 4040,
	Name = "A Trail Up The Mountain",
	Desc = [[
   You stand partway up the mountainside on a narrow yet well worn
trail.  The trail curves its way up the side of the mountain towards
the top and westwards down the mountain into the foothills below.
]],
	Exits = {
		west = 4039,
		up = 4041
	}
})
Config.NewRoom({
	Id = 4041,
	Name = "The Mountain Top",
	Desc = [[
   You find yourself at what is essentially the summit of this mountain.
It certainly seemed taller from the ground didn't it?  The plateau you
stand on is close to thirty metres across and a small gouge in the north
side of it looks to lead to a small cavern.  A small trail leads down
towards a valley that was hidden away on the east side of the mountain.
]],
	Exits = {
		north = 4042,
		east = 4077,
		down = 4040
	}
})
Config.NewRoom({
	Id = 4042,
	Name = "The Lion's Den",
	Desc = [[
   Following the gouge down to the cave entrance, you clamber through
the small entranceway only to find yourself in what appears to be the
living den of a large carnivorous animal!
]],
	Exits = {
		south = 4041
	}
})
Config.NewRoom({
	Id = 4043,
	Name = "The Level Foothills",
	Desc = [[
   You continue to move through the foothills and notice that off in
the distance to the west, you can see a rather large cave entrance in
the side of a large hill.  The hill seems to jut up from the rest of
the foothills quite unnaturally.  A path leads off towards the east
as it seems to begin from nothing here.
]],
	Exits = {
		east = 4035,
		west = 4044
	}
})
Config.NewRoom({
	Id = 4044,
	Name = "The Cave Entrance",
	Desc = [[
   You stand in a large tunnel, much larger than it seemed from
the outside.  The ceiling is at least twenty feet above, and the
width of the tunnel runs at least fifteen feet.  You can feel the
fresh air coming from the east, and off to the west, it looks to
lead into darkness.
]],
	Exits = {
		east = 4043,
		west = 4045
	}
})
Config.NewRoom({
	Id = 4045,
	Name = "The Hill Giant Cave",
	Desc = [[
   You find yourself inside a rather large cavern.  The ceiling stands
at least twenty five feet above you, if not more.  The walls are so far
away, that the shadows of the room obscure them almost completely.  Out
of all of the grandeur in this cave however, nothing seems to catch your
eye quite as much as the enormous table standing in the middle of the
sandy floor.  It stands tall enough for you to walk under it without the
need to hunch over.  A large tunnel leads out of the eastern wall of the
cavern.
]],
	Exits = {
		east = 4044
	}
})
Config.NewRoom({
	Id = 4046,
	Name = "The Steep Trail",
	Desc = [[
   This trail leads up a steep hill to a point where it levels out as
it begins to pass between the mountains that surround you.  It continues
through the hills to the east and heads down to the valley to the west.
]],
	Exits = {
		east = 4047,
		west = 4032
	}
})
Config.NewRoom({
	Id = 4047,
	Name = "Between The Mountains",
	Desc = [[
   The trail between the mountains seems almost endless as you continue
to trek along it.  It continues to both the east and west.
]],
	Exits = {
		east = 4048,
		west = 4046
	}
})
Config.NewRoom({
	Id = 4048,
	Name = "The Foothills",
	Desc = [[
   After a long trek, you find yourself in the foothills again.  You spot
a narrow trail leading away to the northwest not too far distant to the
west.
]],
	Exits = {
		east = 4050,
		west = 4047
	}
})
Config.NewRoom({
	Id = 4049,
	Name = "The Foothills",
	Desc = [[
   A short trek through the foothills and you find yourself facing a
trail that leads between the mountains to the west.  The trail through
them looks to be very long and probably quite tiring.  You spot a narrow
trail leading away to the northwest not too far distant to the west.
]],
	Exits = {
		east = 4050,
		west = 4047
	}
})
Config.NewRoom({
	Id = 4050,
	Name = "The Foothills",
	Desc = [[
   You are at a point on the trail where it turns slowly from an
almost straight westwards trail into a trail meandering towards
the northwest. 
]],
	Exits = {
		north = 5629,
		west = 4049
	}
})
Config.NewRoom({
	Id = 4051,
	Name = "The Tunnel",
	Desc = [[
   You are at a bend in the tunnel here.  It turns from an eastwards
heading to a southwards one.  The walls are cold and seem to be damp
with moisture.  you can see some greenish moss growing up near the
roof of the passageway on the northern wall.
]],
	Exits = {
		east = 4052,
		south = 4054
	}
})
Config.NewRoom({
	Id = 4052,
	Name = "The Tunnel",
	Desc = [[
   Standing in this part of the tunnel, you notice that not only does
the tunnel get suddenly narrower, but the floor does not seem to be
nearly as smooth as it was before.  In fact, the floor drops almost
five feet in jagged steps as you look eastward.  The western path
seems to be quite smooth however.
]],
	Exits = {
		east = 4053,
		west = 4051
	}
})
Config.NewRoom({
	Id = 4053,
	Name = "The Tunnel",
	Desc = [[
   Continuing along the tunnel, you find that the floor has begun
to smooth itself out once more.  Looking about, you notice a small
spring of water bubbling up near the southern wall.
]],
	Exits = {
		east = 4101,
		west = 4052
	}
})
Config.NewRoom({
	Id = 4054,
	Name = "The Tunnel",
	Desc = [[
   You continue along the tunnel to find yourself at a right
angle turn.  The passage leads north and east from here.  The
way to the north seems to be a longer tunnel which continues
on through the gloom of the underearth.  The way to the east
is a fresh change from what would normally be found this far
underground in that the tunnel seems to open  up into a fairly
large and well lit cave.
]],
	Exits = {
		north = 4051,
		east = 4055
	}
})
Config.NewRoom({
	Id = 4055,
	Name = "The Light Cave",
	Desc = [[
   The cave you stand in now is lit by an eerie flickering light,
which probably comes from the enormous fire which is burning a
short distance to the south in what looks to be the middle of
the cave.  The flickering light creates some really strange and
almost frightening shadows on the walls, almost hiding the two
tunnels that lead away from here, one to the east and one to the
west.
]],
	Exits = {
		east = 4056,
		south = 4057,
		west = 4054
	}
})
Config.NewRoom({
	Id = 4056,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exit from here looks to be off to the west.
]],
	Exits = {
		west = 4055
	}
})
Config.NewRoom({
	Id = 4057,
	Name = "The Light Cave",
	Desc = [[
   The cave you stand in now is lit by an eerie flickering light,
which comes from the enormous fire which is burning right in
front of you in the middle of this large cave.  The fire gives
off more than enough light to see both the north and south ends
of the cave.
]],
	Exits = {
		north = 4055,
		south = 4062
	}
})
Config.NewRoom({
	Id = 4058,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the north and south.
]],
	Exits = {
		north = 4056,
		south = 4063
	}
})
Config.NewRoom({
	Id = 4059,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the south and west.
]],
	Exits = {
		south = 4064,
		west = 4058
	}
})
Config.NewRoom({
	Id = 4060,
	Name = "The Tunnel",
	Desc = [[
   You are standing in a tunnel deep inside the heart of Mount Moria.  A
small rivulet of water runs alongside the wall to the north as the tunnel
seems to lead slightly down towards the east.
   The tunnel continues on to the east as it plunges deeper into the earth,
and upwards a bit towards the west where the air seems to be quite damp.
]],
	Exits = {
		east = 4061,
		west = 4025
	}
})
Config.NewRoom({
	Id = 4061,
	Name = "The Tunnel",
	Desc = [[
   You stand in a section of this small tunnel which seems to be
almost level.  There is a small pool of water collecting beside
the north wall indicating perhaps a low spot on the floor.  The
pool is being fed by a small rivulet which is coursing along the
northern wall from the west, but yet the water level in the pool
does not seem to be changing.
   Looking either way down the tunnel, you can see that the tunnel
climbs to the west, and to the east, a strange flickering light
shows that the tunnel opens up into a cave of sorts.
]],
	Exits = {
		east = 4062,
		west = 4060
	}
})
Config.NewRoom({
	Id = 4062,
	Name = "The Light Cave",
	Desc = [[
   The cave you stand in now is lit by an eerie flickering light,
which probably comes from the enormous fire which is burning a
short distance to the north in what looks to be the middle of
the cave.  The flickering light creates some really strange and
almost frightening shadows on the walls, almost hiding the two
tunnels that lead away from here, one to the west and one to the
south.
]],
	Exits = {
		north = 4057,
		south = 4066,
		west = 4061
	}
})
Config.NewRoom({
	Id = 4063,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the east and west.
]],
	Exits = {
		east = 4064,
		west = 4062
	}
})
Config.NewRoom({
	Id = 4064,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the east and north.
]],
	Exits = {
		north = 4059,
		east = 4065
	}
})
Config.NewRoom({
	Id = 4065,
	Name = "The Tunnel",
	Desc = [[
   You stand in a small chamber beneath the earth.  The chamber
closes down to tunnel size to the west as the only obvious exit
leads away in that direction.  Before heading off that way, you
decide to look around the cave.  The walls are slightly damp to
the touch, and the ceiling is very smooth.  Almost right in the
centre of the ceiling, a well rounded hole has been made.
]],
	Exits = {
		west = 4064,
		up = 4021
	}
})
Config.NewRoom({
	Id = 4066,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the east and north.  To the north,
you can see the entrance to what looks to be a large and well lit cave.
]],
	Exits = {
		north = 4062,
		east = 4067
	}
})
Config.NewRoom({
	Id = 4067,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the east, south, and north.  To the
south, the tunnel looks to open up into a cavern.
]],
	Exits = {
		north = 4063,
		east = 4068,
		south = 4070
	}
})
Config.NewRoom({
	Id = 4068,
	Name = "The Maze",
	Desc = [[
   You stand in yet another small and damp tunnel.  The ceiling hangs
quite low overhead and the passage twists off into darkness.  The only
exits from here look to be off to the west and north.
]],
	Exits = {
		north = 4064,
		west = 4067
	}
})
Config.NewRoom({
	Id = 4069,
	Name = "The Large Cave",
	Desc = [[
   You find yourself in what is perhaps the largest cave you
have ever been in.  It stretches through the darkness to the
east and south.  The cave is nigh filled with echoes created
by the sound of your breathing.  Stalactites and stalagmites
hang down from the ceiling and climb upwards from the ground
of the cavern respectively.
]],
	Exits = {
		east = 4070,
		south = 4071
	}
})
Config.NewRoom({
	Id = 4070,
	Name = "The Large Cave",
	Desc = [[
   You find yourself in what is perhaps the largest cave you
have ever been in.  It stretches through the darkness to the
west and south.  The cave is nigh filled with echoes created
by the sound of your breathing.  Stalactites and stalagmites
hang down from the ceiling and climb upwards from the ground
of the cavern respectively.  A narrow tunnel leads away from
the cave to the north.
]],
	Exits = {
		north = 4067,
		south = 4072,
		west = 4069
	}
})
Config.NewRoom({
	Id = 4071,
	Name = "The Large Cave",
	Desc = [[
   You find yourself in what is perhaps the largest cave you
have ever been in.  It stretches through the darkness to the
east and north.  The cave is nigh filled with echoes created
by the sound of your breathing.  Stalactites and stalagmites
hang down from the ceiling and climb upwards from the ground
of the cavern respectively.
]],
	Exits = {
		north = 4069,
		east = 4072
	}
})
Config.NewRoom({
	Id = 4072,
	Name = "The Large Cave",
	Desc = [[
   You find yourself in what is perhaps the largest cave you
have ever been in.  It stretches through the darkness to the
west and south.  The cave is nigh filled with echoes created
by the sound of your breathing.  Stalactites and stalagmites
hang down from the ceiling and climb upwards from the ground
of the cavern respectively.  A narrow tunnel leads away from
the cave to the east.
]],
	Exits = {
		north = 4070,
		east = 4073,
		west = 4071
	}
})
Config.NewRoom({
	Id = 4073,
	Name = "The Tunnel",
	Desc = [[
   You stand in a narrow tunnel.  It makes a turn from east to south
here as it heads through the rock of the mountain.  The western wall
of the tunnel looks to have broken through a small, natural crack in
the rock to lead into what appears to be a fairly large cave.
]],
	Exits = {
		east = 4074,
		south = 4075,
		west = 4072
	}
})
Config.NewRoom({
	Id = 4074,
	Name = "The End Of The Tunnel",
	Desc = [[
   The tunnel comes to a sudden halt here.  How very bizarre.  The
only exit is back to the west, where the tunnel leads back through
the mountain.  There is absolutely nothing of any interest down at
the end of this passageway either.  How odd.
]],
	Exits = {
		west = 4073
	}
})
Config.NewRoom({
	Id = 4075,
	Name = "The Hole",
	Desc = [[
   You are at a small hole in the floor.  Alas, you can only leave
north because to leave down into the unknown, you must be able to
fit through the hole, which is far too small for you!
]],
	Exits = {
		north = 4073,
		down = 0
	}
})
Config.NewRoom({
	Id = 4076,
	Name = "The Copse Of Trees",
	Desc = [[
   Standing in this copse of trees gives you an eerie feeling.  Off to
the east you can see the plains, and just to the north a strange shadow
seems to be changing shape constantly and almost seems to beckon you to
enter it. 
]],
	Exits = {
		north = 2501,
		east = 4037
	}
})
Config.NewRoom({
	Id = 4077,
	Name = "On A Mountain Trail",
	Desc = [[
   You find yourself on a mountain trail twisting down towards a small
hidden valley located in the shadow of another mountain a short distance
to the east.  The trail is fairly rough going and looks to dip down into
the small valley before climbing up the side of the other mountain.  As
you look at the valley from a closer vantage point, you realize that it
is much smaller than you had expected, being maybe thirty feet long.  It
is quite surprising how deceptive distances can be this high up in the
mountains, isn't it?
]],
	Exits = {
		west = 4041,
		down = 4078
	}
})
Config.NewRoom({
	Id = 4078,
	Name = "In The Hidden Valley",
	Desc = [[
   This valley seems to be a complete waste of a climb down the
mountainside.  Of course, there is always the carefully hidden
trail that you just noticed on the eastern side of the valley,
leading up the eastern mountain that is blocking most of the sky
from you.
]],
	Exits = {
		east = 6401,
		up = 4077
	}
})
Config.NewRoom({
	Id = 4079,
	Name = "In The Hidden Valley",
	Desc = [[
   This small valley is hidden away in the shadow of the large
mountain to the east.  The trail leading up it to the east seems
to vanish before your eyes, but you are quickly able to find it
once again.  A trail leads up the mountain to the west as well.
]],
	Exits = {
		east = 6401,
		up = 4077
	}
})
Config.NewRoom({
	Id = 4101,
	Name = "The Tunnel",
	Desc = [[
   As you continue along this tunnel which heads deeper and deeper into
the earth, you notice that the tunnel must be a lot steeper than you
previously expected as there is a small rivulet of water gushing down
the one side of the tunnel.  The tunnel appears to extend straight to
the east for quite some distance.
]],
	Exits = {
		east = 4102,
		west = 4053
	}
})
Config.NewRoom({
	Id = 4102,
	Name = "The Long Tunnel",
	Desc = [[
   The tunnel seems to be slightly sloped here as it continues in its
east-west direction.  The tunnel walls are far apart, almost allowing
for four people to travel abreast with ease.  The walls do not seem to
be very damp, but there is a small rivulet running along the northern
wall of the tunnel.
]],
	Exits = {
		east = 4103,
		west = 4101
	}
})
Config.NewRoom({
	Id = 4103,
	Name = "The Long Tunnel",
	Desc = [[
   As you travel along this long tunnel, you begin to wonder just
how long it is.  The walls are fairly far apart, but you can see
that they begin to close in rather rapidly to the east.  In fact,
the manner in which they come together almost reminds you of a
funnel.
]],
	Exits = {
		east = 4104,
		west = 4102
	}
})
Config.NewRoom({
	Id = 4104,
	Name = "The Long Tunnel",
	Desc = [[
   You are standing in a long east-west tunnel.  It is not all that
wide at this point, perhaps wide enough for two people to stand side
by side without impeding each other.  Off to the west it appears that
the tunnel opens up some more while to the east it dives further down
into the earth, and you can see a small hole about two feet in diameter
about waist height in the southern wall.
]],
	Exits = {
		east = 4105,
		south = 4107,
		west = 4103
	}
})
Config.NewRoom({
	Id = 4105,
	Name = "The Long Tunnel",
	Desc = [[
   You find yourself in a small bulbous cavern ending.  The somewhat
circular 'room' is about thirty feet in diameter and you can see one
exit from it; a tunnel leading sharply upwards from the western wall.
The walls of this cavern are quite indistinct and you cannot see any
moss or dampness on them whatsoever.
]],
	Exits = {
		west = 4104
	}
})
Config.NewRoom({
	Id = 4106,
	Name = "The Golden Cave",
	Desc = [[
   You are standing in what appears to be the north-east corner of
this large cavern.  The cave is lit by the eerie, soft, golden light
which looks to be emanating from the walls themselves.  The cave
itself is enormous, extending quite a distance to the west and south.
]],
	Exits = {
		south = 4109,
		west = 4107
	}
})
Config.NewRoom({
	Id = 4107,
	Name = "The Golden Cave",
	Desc = [[
   You are standing in what appears to be the north-west corner of
this large cavern.  The cave is lit by the eerie, soft, golden light
which looks to be emanating from the walls themselves.  The cave
itself is enormous, extending quite a distance to the east and south.
There is a hole in the northern wall, about two feet in diameter.
All that can be seen through the hole is darkness.
]],
	Exits = {
		north = 4104,
		east = 4106,
		south = 4110
	}
})
Config.NewRoom({
	Id = 4108,
	Name = "The Passage",
	Desc = [[
   You are standing at the elbow turn of a small passageway.  It turns
quite sharply to the south and west.  To the south, it appears that the
passage continues, but to the west you can see what almost appears to
be a golden light.
]],
	Exits = {
		south = 4114,
		west = 4109
	}
})
Config.NewRoom({
	Id = 4109,
	Name = "The Golden Cave",
	Desc = [[
   You are standing in what appears to be the south-east corner of
this large cavern.  The cave is lit by the eerie, soft, golden light
which looks to be emanating from the walls themselves.  The cave
itself is enormous, extending quite a distance to the west and north.
A crack in the wall to the east appears to lead into a passageway of
sorts.
]],
	Exits = {
		north = 4106,
		east = 4108,
		west = 4110
	}
})
Config.NewRoom({
	Id = 4110,
	Name = "The Golden Cave",
	Desc = [[
   You are standing in what appears to be the middle of the western
wall of this large cavern.  The cave is lit by the eerie, soft, golden
light which looks to be emanating from the walls themselves.  The cave
itself is enormous, extending quite a distance to the east, south,
and north.
]],
	Exits = {
		north = 4107,
		east = 4109,
		south = 4115
	}
})
Config.NewRoom({
	Id = 4111,
	Name = "The Hole",
	Desc = [[
   You find yourself standing in a small alcove as the tunnel comes to
a somewhat sudden end.  Looking about you suddenly notice a rather big
hole in the floor of the tunnel.  In fact, it seems that another step
forward and you would have fallen into it.
   The tunnel itself leads to the west, and looking down into the hole
in the floor reveals little beyond the fact that it seems to be very
deep and very dark.  There is a very strange smell emanating from the
hole, it almost smells like something down there is rotting.
]],
	Exits = {
		west = 4112,
		down = 0
	}
})
Config.NewRoom({
	Id = 4112,
	Name = "The Tunnel",
	Desc = [[
   The walls of this small tunnel are almost completely covered in a
strange orange moss that flakes off to the touch.  The tunnel leads
in an east-west direction and the air within is very damp and very
stagnant.  There is no detectable breeze at all but a strange smell
emanates from the east.  There is a small, almost unnoticed hole in
the southern wall.
]],
	Exits = {
		east = 4111,
		south = 4127,
		west = 4113
	}
})
Config.NewRoom({
	Id = 4113,
	Name = "The Tunnel",
	Desc = [[
   The tunnel in which you currently stand is fairly wide (very wide
relative to almost all the other tunnels around here it seems) and
yet the air is quite damp.  The walls have a thin coating of moisture
upon them which looks and feels somewhat oiley.  The tunnel leads in
an east-west direction.
]],
	Exits = {
		east = 4112,
		west = 4114
	}
})
Config.NewRoom({
	Id = 4114,
	Name = "The Passage",
	Desc = [[
   This north-south passageway looks to be a natural creation, except
that the walls looks to have been roughly hewn in order to smooth them
a somewhat to make passage easier.  The walls still meander as the
passage makes its way deeper into the bowels of the earth.  A bizarre
shadow in the eastern wall leads you to suspect that a small passage
meets the tunnel there.
]],
	Exits = {
		north = 4108,
		east = 4113,
		south = 4117
	}
})
Config.NewRoom({
	Id = 4115,
	Name = "The Golden Cave",
	Desc = [[
   You are standing in what appears to be the south-west corner of
this large cavern.  The cave is lit by the eerie, soft, golden light
which looks to be emanating from the walls themselves.  The cave
itself is enormous, extending quite a distance to the north and a
strange shadow formation seems to indicate a passage entrance to the
west.
]],
	Exits = {
		north = 4110,
		west = 4116
	}
})
Config.NewRoom({
	Id = 4116,
	Name = "The Dark Passage",
	Desc = [[
   You find yourself in a small passage ending.  It is quite dark in here.
As you look about the damp walls, you notice that the passageway almost
appears to curve upwards towards the ceiling.  Looking up, you notice that
there is a small hole, just large enough to pass through.  Looking closely
at the curved part of the wall, it appears that someone (or something) has
carved small handholds into the wall to ease passage upwards.  The tunnel
itself leads off to the east.
]],
	Exits = {
		east = 4115,
		up = 4022
	}
})
Config.NewRoom({
	Id = 4117,
	Name = "The Passage",
	Desc = [[
   You find yourself in quite an ordinary passageway which leads north
and south.  It looks to be wide enough for two people to walk side by
side with plenty of room.  The passage appears to be almost rectangular
in form.  Far off to the south you can see the pinpoint of a light.
]],
	Exits = {
		north = 4114,
		south = 4121
	}
})
Config.NewRoom({
	Id = 4118,
	Name = "The Secret Tunnel",
	Desc = [[
   You are currently standing in a narrow passageway that does not seem
to have been heavily visited at any time.  It leads northwards towards
a lit room and south towards what appears to be a chamber.
]],
	Exits = {
		north = 4115,
		south = 4123
	}
})
Config.NewRoom({
	Id = 4119,
	Name = "The Cave",
	Desc = [[
   This rather large cave is surprisingly very well lit.  There are
about twenty torches spread about the room set in sconces which hang
several feet above your head.  The dancing shadows created by the
flickering flames catch your eyes for a few minutes and threaten to
hold you entranced.
   Looking about the cave, it appears to continue to the west and
south.  In the north wall a strange vertical crack looks as if it may
lead somewhere.
]],
	Exits = {
		north = 4127,
		south = 4124,
		west = 4120
	}
})
Config.NewRoom({
	Id = 4120,
	Name = "The Cave",
	Desc = [[
   This rather large cave is surprisingly very well lit.  There are
about twenty torches spread about the room set in sconces which hang
several feet above your head.  The dancing shadows created by the
flickering flames catch your eyes for a few minutes and threaten to
hold you entranced.
   Looking about the cave, it appears to continue to the east and
south.
]],
	Exits = {
		east = 4119,
		south = 4125,
		west = 4122
	}
})
Config.NewRoom({
	Id = 4121,
	Name = "The Passage",
	Desc = [[
   You stand in a fairly normal passage, slightly wider than is
necessary for one person, but not quite wide enough for two.  The
ceiling dips here rather surprisingly, or wait, is that because the
floor climbs upwards toward it?  The tunnel seems to narrow slightly
more as you look to the south, and widens up somewhat as you look
northward.  The light to the south continues to flicker.
]],
	Exits = {
		north = 4117,
		south = 4126
	}
})
Config.NewRoom({
	Id = 4122,
	Name = "The Secret Tunnel",
	Desc = [[
   You stand in a very unnatural hallway, about ten feet across and
about ten or twelve feet up.  The passageway funnels down towards 
the west where it leads to a doorway that looks to be about five feet
across.  The east end of the tunnel comes to a sudden end at a very
smooth rock wall.
]],
	Exits = {
		east = 4120,
		west = 4123
	}
})
Config.NewRoom({
	Id = 4123,
	Name = "The Secret Chamber",
	Desc = [[
   You stand in a small chamber that you never would have thought
could exist.  This small, almost perfectly round cave does not
appear to be a natural formation at all, since the walls are far
too smooth and the doorways to the north and east are both almost
exactly five feet wide and eleven feet tall.
]],
	Exits = {
		north = 4118,
		east = 4122
	}
})
Config.NewRoom({
	Id = 4124,
	Name = "The Cave",
	Desc = [[
   This rather large cave is surprisingly very well lit.  There are
about twenty torches spread about the room set in sconces which hang
several feet above your head.  The dancing shadows created by the
flickering flames catch your eyes for a few minutes and threaten to
hold you entranced.
   Looking about the cave, it appears to continue to the west and
north.
]],
	Exits = {
		north = 4119,
		west = 4125
	}
})
Config.NewRoom({
	Id = 4125,
	Name = "The Cave",
	Desc = [[
   This rather large cave is surprisingly very well lit.  There are
about twenty torches spread about the room set in sconces which hang
several feet above your head.  The dancing shadows created by the
flickering flames catch your eyes for a few minutes and threaten to
hold you entranced.
   Looking about the cave, it appears to continue to the east and
north.  There is a passageway leading out of the western wall of the
cave which looks to turn northwards.
]],
	Exits = {
		north = 4120,
		east = 4124,
		west = 4126
	}
})
Config.NewRoom({
	Id = 4126,
	Name = "The Passage",
	Desc = [[
   You are at the end of a narrow passage which leads away from
here to the north.  The southern wall is bare and almost seems to
dance with the shadows created by the flickering light emanating
from the cave to the east.
]],
	Exits = {
		north = 4121,
		east = 4125
	}
})
Config.NewRoom({
	Id = 4127,
	Name = "The Crawlway",
	Desc = [[
   You are in a very narrow crawlway.  To back out of it, you would have
to move carefully in order to not catch anything on the jutting rocks of
the ceiling and walls.  The diameter of the crawlway is about two feet,
and is a rather tight squeeze.  You'd better hope that there aren't any
worms or similar creatures down this way since it might be difficult to
defend yourself in here.
]],
	Exits = {
		north = 4112,
		south = 4119
	}
})
