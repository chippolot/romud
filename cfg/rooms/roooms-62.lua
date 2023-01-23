Config.NewRoom({
	Id = 6101,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a narrow trail winding its way between the enormous, grey
trunks.  The crowns of the trees must be very dense, as they leave the
forest floor in utter darkness.  The trail leads east and west.]],
	Exits = {
		north = 6065,
		east = 6005,
		west = 6102
	}
})
Config.NewRoom({
	Id = 6102,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way east-west between huge,
ancient trees whose grey trunks remind you of ancient pillars in a
enormous, deserted hall.  To the south, a frail path leads away from
the trail.]],
	Exits = {
		east = 6101,
		south = 6105,
		west = 6103
	}
})
Config.NewRoom({
	Id = 6103,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way east-west between huge,
ancient trees that stand close on all sides.  Not a sound is to be
heard - everything is ominously quiet.]],
	Exits = {
		east = 6102,
		west = 6104
	}
})
Config.NewRoom({
	Id = 6104,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are where the dusty trail bends, as to avoid conflict with a
colossal trunk to the west.  Not a sound is to be heard - everything
is ominously quiet.  The trail leads east and south and there is a
small path leading off the trail to the north.]],
	Exits = {
		north = 6151,
		east = 6103,
		south = 6109
	}
})
Config.NewRoom({
	Id = 6105,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  You
feel as if the ancient trees observe you in watchful silence.  The path
continues north and south.]],
	Exits = {
		north = 6102,
		south = 6106
	}
})
Config.NewRoom({
	Id = 6106,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Ancient
grey trees loom all around you.  The path continues north and west.]],
	Exits = {
		north = 6105,
		west = 6107
	}
})
Config.NewRoom({
	Id = 6107,
	Name = "A Junction In The Deep, Dark Forest",
	Desc = [[   You are by a junction where three paths meet.  Ancient grey trees tower
above you on all sides.  Paths lead east, south and west.]],
	Exits = {
		east = 6106,
		south = 6118,
		west = 6108
	}
})
Config.NewRoom({
	Id = 6108,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Ancient
grey trees loom all around you.  The path continues north and east.]],
	Exits = {
		north = 6109,
		east = 6107
	}
})
Config.NewRoom({
	Id = 6109,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way between huge, ancient trees
standing close on all sides.  The trail leads north and west and to the
south, a frail path leads away from the trail.]],
	Exits = {
		north = 6104,
		south = 6108,
		west = 6110
	}
})
Config.NewRoom({
	Id = 6110,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way east-west between huge, ancient
trees that stand close on all sides.  Not a sound is to be heard - everything
is ominously quiet.]],
	Exits = {
		east = 6109,
		west = 6111
	}
})
Config.NewRoom({
	Id = 6111,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way between huge, ancient trees that
stand close on all sides.  The trail leads east and south.  To the west, a
narrow path leads away from the trail.]],
	Exits = {
		east = 6110,
		south = 6112,
		west = 6131
	}
})
Config.NewRoom({
	Id = 6112,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way north-south between huge, ancient
trees that loom ominously above you.]],
	Exits = {
		north = 6111,
		south = 6113
	}
})
Config.NewRoom({
	Id = 6113,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way between huge, ancient trees
standing close on all sides.  The trail leads north and west and to the
east, a frail path leads away from the trail.]],
	Exits = {
		north = 6112,
		east = 6114,
		west = 6128
	}
})
Config.NewRoom({
	Id = 6114,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Ancient
grey trees loom in all directions.  The path continues south and west.]],
	Exits = {
		south = 6115,
		west = 6113
	}
})
Config.NewRoom({
	Id = 6115,
	Name = "A Junction In The Deep, Dark Forest",
	Desc = [[   You are by a junction where three paths meet.  Ancient grey trees tower
above you on all sides.  Paths lead north, east and west.]],
	Exits = {
		north = 6114,
		east = 6116,
		west = 6123
	}
})
Config.NewRoom({
	Id = 6116,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  You feel
as if the ancient trees observe you in watchful silence.  The path continues
north and west.]],
	Exits = {
		north = 6117,
		west = 6115
	}
})
Config.NewRoom({
	Id = 6117,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Giant,
grey trees loom ominously on all sides.  The path continues east and south.]],
	Exits = {
		east = 6118,
		south = 6116
	}
})
Config.NewRoom({
	Id = 6118,
	Name = "A Junction In The Deep, Dark Forest",
	Desc = [[   You are by a junction where three paths meet.  Ancient, grey trees seem
to observe you silently you from all sides.  Paths lead north, east and west.]],
	Exits = {
		north = 6107,
		east = 6119,
		west = 6117
	}
})
Config.NewRoom({
	Id = 6119,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Ancient,
grey trees loom everywhere.  The path continues south and west.]],
	Exits = {
		south = 6120,
		west = 6118
	}
})
Config.NewRoom({
	Id = 6120,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Huge,
ancient trees are on all sides.  The path continues north and south.]],
	Exits = {
		north = 6119,
		south = 6121
	}
})
Config.NewRoom({
	Id = 6121,
	Name = "On The River Bank In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  To the
south a fast river is flowing westward through the forest.  Ancient grey
trees loom on both banks.  The path continues north and west.]],
	Exits = {
		north = 6120,
		south = 902,
		west = 6122
	}
})
Config.NewRoom({
	Id = 6122,
	Name = "A Dead End Path On The River Bank In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  The
ancient trees stand so close that the path disappears between the dusty
roots.  To the south a dark river flows from east to west.  The only exit
appears to be east.]],
	Exits = {
		east = 6121
	}
})
Config.NewRoom({
	Id = 6123,
	Name = "A Small Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  Giant,
grey trees loom ominously all around.  The path continues east and south.]],
	Exits = {
		east = 6115,
		south = 6124
	}
})
Config.NewRoom({
	Id = 6124,
	Name = "A Junction On The River Bank In The Deep, Dark Forest",
	Desc = [[   You are by a junction where three paths meet.  Ancient, grey trees seem
to observe you silently you from all around.  To the south a dark river
flows from east to west through the forest.  Paths lead north, east and west.]],
	Exits = {
		north = 6123,
		east = 6125,
		west = 6126
	}
})
Config.NewRoom({
	Id = 6125,
	Name = "A Dead End Path In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.  The
ancient trees stand so close that the path disappears between the dusty
roots.  To the south a dark river flows from east to west.  The only exit
appears to be west.]],
	Exits = {
		west = 6124
	}
})
Config.NewRoom({
	Id = 6126,
	Name = "A Small Path On The River Bank In The Deep, Dark Forest",
	Desc = [[   You are on a narrow path leading through the deep, dark forest.
Ancient grey trees loom everywhere.  To the south a dark river flows
westward through the forest.  The path continues north and east.]],
	Exits = {
		north = 6127,
		east = 6124
	}
})
Config.NewRoom({
	Id = 6127,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way between huge, ancient trees
standing close on all sides.  The trail leads north and west, and to the
south a frail path leads away from the trail.]],
	Exits = {
		north = 6128,
		south = 6126,
		west = 6129
	}
})
Config.NewRoom({
	Id = 6128,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way between huge, ancient trees
standing close on all sides.  The trail leads east and south.]],
	Exits = {
		east = 6113,
		south = 6127
	}
})
Config.NewRoom({
	Id = 6129,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way east-west between huge, ancient
trees that stand close on all sides.  Not a sound is to be heard - everything
is ominously quiet.]],
	Exits = {
		east = 6127,
		west = 6130
	}
})
Config.NewRoom({
	Id = 6130,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way east-west between huge, ancient
trees that stand close on all sides.  Not a sound is to be heard - everything
is ominously quiet.]],
	Exits = {
		east = 6129,
		west = 6136
	}
})
Config.NewRoom({
	Id = 6131,
	Name = "A Narrow Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail winding its way westward between huge, ancient
trees that stand close on all sides.  The tree trunks seem to be covered in
some sticky substance which gets much stickier towards the west!  Beware!]],
	Exits = {
		east = 6111,
		west = 6132,
		up = 6133
	}
})
Config.NewRoom({
	Id = 6132,
	Name = "The Deadly Spider Web",
	Desc = [[   You are walking along the narrow path, ducking under the sticky ropes
as you advance...

>
A huge, poisonous spider drops from above!
A huge, poisonous spider drops from above!
A huge, poisonous spider drops from above!

>
The huge, poisonous spider stings you!  You resist the poison!
The huge, poisonous spider stings you!  You are poisoned!
The huge, poisonous spider stings you!  You are poisoned!

You are dead.]],
	Exits = {
		east = 6131,
		west = 6135,
		up = 6134
	}
})
Config.NewRoom({
	Id = 6133,
	Name = "Up In The Tree",
	Desc = [[   You are hanging on the outside of a huge tree trunk covered in a sticky
substance.  Directly to the west is an immense spider web suspended between
numerous of the giant trees including the one you are hanging on.  To the
north is what looks like a large webbed entrance.]],
	Exits = {
		north = 6302,
		west = 6134,
		down = 6131
	}
})
Config.NewRoom({
	Id = 6134,
	Name = "On The spider web",
	Desc = [[   You are balancing carefully on the giant sticky threads that holds the
giant web in place.  To the east is a giant tree trunk and to the west is
an entrance to a cave-like structure made from many layers of spider web.]],
	Exits = {
		east = 6133,
		west = 6135
	}
})
Config.NewRoom({
	Id = 6135,
	Name = "The Den Of The Queen Spider",
	Desc = [[   You are inside a cave-like structure that seems to be made entirely
from countless layers of spider web.  Temperature and humidity is very
high making it hard to breathe the foul air that lingers here.  The walls
are covered with open cocoons.]],
	Exits = {
		east = 6134
	}
})
Config.NewRoom({
	Id = 6136,
	Name = "A Dusty Trail In The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail leading through the deep, dark forest.  Ancient
grey trees loom all around you.  The trail continues north and east.]],
	Exits = {
		north = 6137,
		east = 6130
	}
})
Config.NewRoom({
	Id = 6137,
	Name = "A Dusty Trail In The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail leading through the deep, dark forest.  Ancient,
grey trees loom everywhere.  The trail continues south and west.  A broad
irregular path leads eastward away from the trail.]],
	Exits = {
		east = 6143,
		south = 6136,
		west = 6138
	}
})
Config.NewRoom({
	Id = 6138,
	Name = "At The End Of The Trail Through The Deep, Dark Forest",
	Desc = [[   You are on a dusty trail leading through the deep, dark forest.  Ancient
grey trees loom all around you.  A small trail leads northwards and the only
other exit is east, along the main trail.]],
	Exits = {
		north = 6139,
		east = 6137
	}
})
Config.NewRoom({
	Id = 6139,
	Name = "On The Narrow Trail",
	Desc = [[   The trail continues to the north and south as it leads through
the heavy underbrush of this part of the Haon-Dor Forest.  Ancient
grey trees loom all around you.  The brush seems to be bending
closely over the path in a somewhat ominous manner, but you easily
shrug it off.  The trail looks to open up somewhat a short distance
to the south.]],
	Exits = {
		north = 6140,
		south = 6138
	}
})
Config.NewRoom({
	Id = 6140,
	Name = "On The Narrow Trail",
	Desc = [[   The trail continues to the north and south as it leads through
the heavy underbrush of this part of the Haon-Dor Forest.  The
trail looks surprisingly well trodden along this part.  The brush
seems to be bending closely over the path in a somewhat ominous
manner, but you easily shrug it off.]],
	Exits = {
		north = 6204,
		south = 6139
	}
})
Config.NewRoom({
	Id = 6143,
	Name = "Outside A Cave In The Deep, Dark Forest",
	Desc = [[   You are at the end of a broad, irregular path.  To the north is a very
large ominous-looking cave opening.  The trees here have many marks as if
something with huge claws has been tearing at them in rage.]],
	Exits = {
		north = 6144,
		west = 6137
	}
})
Config.NewRoom({
	Id = 6144,
	Name = "The Cave Of The Green Dragon",
	Desc = [[   You are in a big natural cave.  The floor is littered with bones of
all sorts and the stench is so massive that you could cut it with a
knife.  The only exit is to the south.]],
	Exits = {
		south = 6143
	}
})
Config.NewRoom({
	Id = 6151,
	Name = "The Narrow Trail",
	Desc = [[   This trail looks much spookier than any other that's you have seen.  The
usual animal claw marks and bites on the trees are becoming few and far
between.  The trail continues north.]],
	Exits = {
		north = 6152,
		south = 6104
	}
})
Config.NewRoom({
	Id = 6152,
	Name = "The Narrow Trail",
	Desc = [[   This area of the trail is also very peculiar.  You can see no signs of
animal life what so ever.  The structure of the surrounding trees forces
the path to make a sharp turn to the east.]],
	Exits = {
		east = 6153,
		south = 6151
	}
})
Config.NewRoom({
	Id = 6153,
	Name = "The Circle Of Trees",
	Desc = [[   The trees here seem to form a circle around the enormous tree in
the center.  You notice a wooden door carved into the huge tree to
the east.  The trail that you followed to get here seems to end at
the base of the tree.]],
	Exits = {
		east = 6154,
		west = 6152
	}
})
Config.NewRoom({
	Id = 6154,
	Name = "Inside The Great Tree",
	Desc = [[   You have stepped inside of this hollowed tree.  From here steps lead down
into darkness or you can exit the tree by going west.]],
	Exits = {
		west = 6153,
		down = 6155
	}
})
Config.NewRoom({
	Id = 6155,
	Name = "The Underground Hallway",
	Desc = [[   This hallway is apparently one of the roots of the tree hollowed out.
The hall leads south to a room where you hear strange noises or you can
go up the steps.]],
	Exits = {
		south = 6156,
		up = 6154
	}
})
Config.NewRoom({
	Id = 6156,
	Name = "The Cultist Temple",
	Desc = [[   This temple, built to a god you don't worship, is a nice place to
visit but you feel very uncomfortable about spending any amount of
time here.  The wooden altar seems to almost glow as you enter the
room.  The only exit is the way you came in.]],
	Exits = {
		north = 6155
	}
})
