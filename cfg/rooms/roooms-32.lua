Config.NewRoom({
	Id = 3101,
	Name = "The Northwest End Of The Concourse",
	Desc = [[
   You are at the concourse, the city wall is just west.  A small promenade
goes east, and the bridge is just north of here.  The concourse continues
south along the city wall.
]],
	Exits = {
		north = 3052,
		east = 3102,
		south = 3128
	}
})
Config.NewRoom({
	Id = 3102,
	Name = "The Promenade",
	Desc = [[
   The river gently flows westwards just north of here.  The promenade
continues further east and to the west you see the city wall.  Park Road
leads south from here.
]],
	Exits = {
		east = 3103,
		south = 3132,
		west = 3101
	}
})
Config.NewRoom({
	Id = 3103,
	Name = "The Promenade",
	Desc = [[
   The river gently flows westwards just north of here.  The promenade
continues both east and west.  South of here you see the entrance to
the park, and a small building seems to be just west of the entrance.
]],
	Exits = {
		east = 3104,
		south = 3106,
		west = 3102
	}
})
Config.NewRoom({
	Id = 3104,
	Name = "The Promenade",
	Desc = [[
   The river gently flows westwards just north of here.  The promenade
continues both east and west.  A small path leads south.  Looking across
the river you see the levee.
]],
	Exits = {
		east = 3105,
		south = 3133,
		west = 3103
	}
})
Config.NewRoom({
	Id = 3105,
	Name = "The Northeast End Of The Concourse",
	Desc = [[
   You are at the Concourse.  The city wall is just east and a small
promenade goes west.  Looking across the river you see a building that
resembles a warehouse.  The Concourse continues south along the city
wall.
]],
	Exits = {
		south = 3131,
		west = 3104
	}
})
Config.NewRoom({
	Id = 3106,
	Name = "The Park Entrance",
	Desc = [[
   You are standing just inside the small park of Midgaard.  To the north is
the promenade and a small path leads south into the park.  To your east is
the famous Park Cafe.
]],
	Exits = {
		north = 3103,
		east = 3107,
		south = 3109
	}
})
Config.NewRoom({
	Id = 3107,
	Name = "Park Cafe",
	Desc = [[
   You are inside Park Cafe, a very cozy place with many tables and
seats where you can relax and enjoy the view.  To the east you can
see the entrance to the park.
]],
	Exits = {
		west = 3106
	}
})
Config.NewRoom({
	Id = 3108,
	Name = "A Small Path In The Park",
	Desc = [[
   You are walking along a small path through the park.  The path continues
south and east.
]],
	Exits = {
		east = 3109,
		south = 3114
	}
})
Config.NewRoom({
	Id = 3109,
	Name = "A Small Path In The Park",
	Desc = [[
   You are standing on a small path inside the park.  The park entrance is
just north of here, and Park Cafe is just east of the entrance.  The path
leads further east and west.
]],
	Exits = {
		north = 3106,
		east = 3110,
		west = 3108
	}
})
Config.NewRoom({
	Id = 3110,
	Name = "A Small Path In The Park",
	Desc = [[
   You are on a small path running through the park.  It continues west and
south and just north of here you see the southern wall of Park Cafe.
]],
	Exits = {
		south = 3116,
		west = 3109
	}
})
Config.NewRoom({
	Id = 3111,
	Name = "Cityguard HeadQuarters",
	Desc = "   You are inside a tidy office.",
	Exits = {
		east = 3112
	}
})
Config.NewRoom({
	Id = 3112,
	Name = "Park Road",
	Desc = [[
   The road continues north and south.  A building is just west of here, you
notice a sign on the door.  The park entrance is to the east.
]],
	Exits = {
		north = 3132,
		east = 3113,
		south = 3119,
		west = 3111
	}
})
Config.NewRoom({
	Id = 3113,
	Name = "The Western Park Entrance",
	Desc = [[
   You are standing at the western end of the park.  A small path leads east
into the park and going west through the entrance you will reach Park Road.
]],
	Exits = {
		east = 3114,
		west = 3112
	}
})
Config.NewRoom({
	Id = 3114,
	Name = "A Path In The Park",
	Desc = [[
   You are in the park.  The paths lead north and west.  Westward is the
park entrance and to the east you see a small pond.
]],
	Exits = {
		north = 3108,
		east = 3115,
		west = 3113
	}
})
Config.NewRoom({
	Id = 3115,
	Name = "The Pond",
	Desc = [[
   You are swimming around in the pond, feeling rather stupid.  You can get
back on the path from the eastern and western end of the pond.
]],
	Exits = {
		east = 3116,
		west = 3114
	}
})
Config.NewRoom({
	Id = 3116,
	Name = "A Path In The Park",
	Desc = [[
   You are in the park.  The paths lead north and east.  Eastward is the
park entrance and to the west you see a small pond.
]],
	Exits = {
		north = 3110,
		east = 3117,
		west = 3115
	}
})
Config.NewRoom({
	Id = 3117,
	Name = "The Eastern Park Entrance",
	Desc = [[
   You are standing at the eastern end of the park.  A small path leads west
into the park.  Going east through the entrance you will reach Emerald
Avenue.
]],
	Exits = {
		east = 3118,
		west = 3116
	}
})
Config.NewRoom({
	Id = 3118,
	Name = "Emerald Avenue",
	Desc = [[
   You are standing on the north end of Emerald Avenue.  To the north is the
promenade and to the west is the park entrance.  To the east is the not very
big Town Hall of Midgaard.
]],
	Exits = {
		north = 3133,
		east = 3138,
		south = 3120,
		west = 3117
	}
})
Config.NewRoom({
	Id = 3119,
	Name = "Park Road",
	Desc = "   You are on Park Road which leads north and south.",
	Exits = {
		north = 3112,
		south = 3136
	}
})
Config.NewRoom({
	Id = 3120,
	Name = "Emerald Avenue",
	Desc = [[
   You are standing at a bend on Emerald Avenue.  The road leads north and
west.
]],
	Exits = {
		north = 3118,
		west = 3134
	}
})
Config.NewRoom({
	Id = 3121,
	Name = "The Road Crossing",
	Desc = [[
   You are in the middle of the road cross.  Roads lead in all directions.
A huge black iron chain as thick as a tree trunk is fastened into the ground
at the center of the road cross.  Its other end leads directly upwards towards
the sky.
A road sign is here.
]],
	Exits = {
		north = 3134,
		east = 3137,
		south = 3135,
		west = 3136,
		up = 7915
	}
})
Config.NewRoom({
	Id = 3122,
	Name = "Emerald Avenue",
	Desc = [[
   You are standing at a bend on Emerald Avenue.  The road leads south and
east.
]],
	Exits = {
		east = 3135,
		south = 3126
	}
})
Config.NewRoom({
	Id = 3123,
	Name = "Park Road",
	Desc = [[
   You are on Park Road which leads south and north.  Elm Street is east of
here.
]],
	Exits = {
		north = 3137,
		east = 3124,
		south = 3127
	}
})
Config.NewRoom({
	Id = 3124,
	Name = "Elm Street",
	Desc = [[
   You are on Elm street.  Park Road is to the west and Elm Street continues
in eastward direction.
]],
	Exits = {
		east = 3125,
		west = 3123
	}
})
Config.NewRoom({
	Id = 3125,
	Name = "The End Of Elm Street",
	Desc = "   You are at the end of Elm Street.",
	Exits = {
		west = 3124
	}
})
Config.NewRoom({
	Id = 3126,
	Name = "Emerald Avenue",
	Desc = [[
   You are on Emerald Avenue which continues north.  The Concourse is south
of here.
]],
	Exits = {
		north = 3122,
		south = 3129
	}
})
Config.NewRoom({
	Id = 3127,
	Name = "Park Road",
	Desc = [[
   You are on Park Road which continues north.  The Concourse is south of
here.
]],
	Exits = {
		north = 3123,
		south = 3130
	}
})
Config.NewRoom({
	Id = 3128,
	Name = "On The Concourse",
	Desc = [[
   You are at the southwest corner of the city wall.  The Concourse leads
both north and east.
]],
	Exits = {
		north = 3101,
		east = 3129,
		west = 3505
	}
})
Config.NewRoom({
	Id = 3129,
	Name = "On The Concourse",
	Desc = [[
   The Concourse continues both east and west.  Emerald Avenue is north of
here.
]],
	Exits = {
		north = 3126,
		east = 3130,
		west = 3128
	}
})
Config.NewRoom({
	Id = 3130,
	Name = "On The Concourse",
	Desc = [[
   The Concourse continues both east and west.  Park Road is north of here
and an iron grate leads south to the graveyard.
]],
	Exits = {
		north = 3127,
		east = 3131,
		south = 3151,
		west = 3129
	}
})
Config.NewRoom({
	Id = 3131,
	Name = "On The Concourse",
	Desc = [[
   You are at the southeast corner of the city wall.  The Concourse leads
both north and west.
]],
	Exits = {
		north = 3105,
		west = 3130
	}
})
Config.NewRoom({
	Id = 3132,
	Name = "Park Road",
	Desc = "   You are at Park Road which continues north and south.",
	Exits = {
		north = 3102,
		south = 3112
	}
})
Config.NewRoom({
	Id = 3133,
	Name = "Emerald Avenue",
	Desc = [[
   You are at Emerald Avenue which continues north and south.  Penny Lane leads
east from here.
]],
	Exits = {
		north = 3104,
		east = 3140,
		south = 3118
	}
})
Config.NewRoom({
	Id = 3134,
	Name = "Emerald Avenue",
	Desc = [[
   You are standing at a bend on Emerald Avenue.  To the east the road goes on
and to the south is the Road Crossing.
]],
	Exits = {
		east = 3120,
		south = 3121
	}
})
Config.NewRoom({
	Id = 3135,
	Name = "Emerald Avenue",
	Desc = [[
   You are standing at a bend on Emerald Avenue.  To the west the road goes on
and to the north is the Road Crossing.
]],
	Exits = {
		north = 3121,
		west = 3122
	}
})
Config.NewRoom({
	Id = 3136,
	Name = "Park Road",
	Desc = [[
   You are at a bend on Park Road.  To the north the road goes on and to the
east is the Road Crossing.
]],
	Exits = {
		north = 3119,
		east = 3121
	}
})
Config.NewRoom({
	Id = 3137,
	Name = "Park Road",
	Desc = [[
   You are at a bend on Park Road.  To the south the road goes on and to the
west is the Road Crossing.
]],
	Exits = {
		south = 3123,
		west = 3121
	}
})
Config.NewRoom({
	Id = 3138,
	Name = "The Waiting Room",
	Desc = [[
   You are standing in the waiting room at the town hall.  Wooden chairs stand
along the walls and a long desk with a typewriter is placed in the middle of
the room.
]],
	Exits = {
		east = 3139,
		west = 3118
	}
})
Config.NewRoom({
	Id = 3139,
	Name = "The Mayor's Office",
	Desc = [[
   You are in the not very big office of the Mayor of Midgaard.  A large and
polished but completely empty desk is standing in front of an armchair that
looks so comfortable that it most of all resembles a bed with the head end
raised slightly.
]],
	Exits = {
		west = 3138
	}
})
Config.NewRoom({
	Id = 3140,
	Name = "Penny Lane",
	Desc = [[
   You are on Penny Lane.  Emerald Avenue is to the west and Penny Lane
continues in eastward direction.
]],
	Exits = {
		east = 3141,
		west = 3133
	}
})
Config.NewRoom({
	Id = 3141,
	Name = "Penny Lane",
	Desc = "   You are on Penny Lane.  The narrow road continues north and west.",
	Exits = {
		north = 3142,
		west = 3140
	}
})
Config.NewRoom({
	Id = 3142,
	Name = "The End Of Penny Lane",
	Desc = "   You are at the end of Penny Lane.  The only exit appears to be south.",
	Exits = {
		south = 3141
	}
})
Config.NewRoom({
	Id = 3151,
	Name = "A Gravel Road In The Graveyard",
	Desc = [[
   You are on a well-kept gravel road that leads north-south through the
graveyard.  On both sides of the road grow dark evergreen trees.  An iron
grate is to the north.
]],
	Exits = {
		north = 3130,
		south = 3152
	}
})
Config.NewRoom({
	Id = 3152,
	Name = "A Gravel Road In The Graveyard",
	Desc = [[
  You are on a well-kept gravel road that leads north-south through the
graveyard.  On both sides of the road grow dark evergreen trees.
]],
	Exits = {
		north = 3151,
		south = 3153
	}
})
Config.NewRoom({
	Id = 3153,
	Name = "A Gravel Road In The Graveyard",
	Desc = [[
  You are on a well-kept gravel road that leads north-south through the
graveyard.  On both sides of the road grow dark evergreen trees.
]],
	Exits = {
		north = 3152,
		south = 3154
	}
})
Config.NewRoom({
	Id = 3154,
	Name = "A Gravel Road In The Graveyard",
	Desc = [[
  You are on a well-kept gravel road that leads north-south through the
graveyard.  On both sides of the road grow dark evergreen trees.
]],
	Exits = {
		north = 3153,
		south = 3155
	}
})
Config.NewRoom({
	Id = 3155,
	Name = "In Front Of The Chapel",
	Desc = [[
   You are on an open space before a small chapel.  A gravel road leads north
through the graveyard and the chapel entrance is to the south.
]],
	Exits = {
		north = 3154,
		south = 3156
	}
})
Config.NewRoom({
	Id = 3156,
	Name = "Inside The Chapel",
	Desc = [[
   You are in a small, dark chapel.  The dark brown glass in the tiny windows
do not let much light through.  A few rows of worn wooden benches stand here
and an ancient altar sits in the middle of the floor.
]],
	Exits = {
		north = 3155
	}
})
Config.NewRoom({
	Id = 3201,
	Name = "Under The Bridge",
	Desc = [[
   The arch under the bridge is covered by seaweed about a foot above the
surface of the river.  The water gently flows through an opening in the lower
part of the city wall.
]],
	Exits = {
		east = 3202,
		west = 901
	}
})
Config.NewRoom({
	Id = 3202,
	Name = "On The River",
	Desc = [[
   North of here you see the miserable buildings of Poor Alley.  The
river flows west towards the bridge.  The riverbanks are too steep to
climb.
]],
	Exits = {
		east = 3203,
		west = 3201
	}
})
Config.NewRoom({
	Id = 3203,
	Name = "On The River",
	Desc = [[
   North of here you see the dump.  The river flows from east to west.  The
riverbanks are too steep to climb.
]],
	Exits = {
		east = 3204,
		west = 3202
	}
})
Config.NewRoom({
	Id = 3204,
	Name = "On The River",
	Desc = [[
   The levee is directly north of here.  The river flows in an east west
direction.
]],
	Exits = {
		north = 3050,
		east = 3205,
		west = 3203
	}
})
Config.NewRoom({
	Id = 3205,
	Name = "On The River",
	Desc = [[
   You see the warehouse on the northern riverbank.  East of here you see the
city wall.  The river flows west towards the levee.
]],
	Exits = {
		east = 3206,
		west = 3204
	}
})
Config.NewRoom({
	Id = 3206,
	Name = "On The River",
	Desc = [[
   The river enters from a hole in the eastern city wall.  The hole has been
blocked by several vertically positioned iron bars set into the wall.
]],
	Exits = {
		east = 5002,
		west = 3205
	}
})
