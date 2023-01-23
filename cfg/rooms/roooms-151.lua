Config.NewRoom({
	Id = 15001,
	Name = "The King's Road",
	Desc = [[   You stand at the beginning of the actual King's Road.  The road is wide
enough for several horses to ride along side by side with room to spare.
The stones which make up the road have been put into place with such skill
that the road seems to be perfectly smooth and perfectly straight.
   You spot a small trail leading to the south through the undergrowth which
surrounds the road at this point.
A traveller passes by and waves cheerfully at you.]],
	Exits = {
		east = 15002,
		south = 15062,
		west = 3503
	}
})
Config.NewRoom({
	Id = 15002,
	Name = "The King's Road",
	Desc = [[   You stand in the center of the great King's Road.  The road is very well
built, and goes in a straight line due east-west.]],
	Exits = {
		east = 15003,
		west = 15001
	}
})
Config.NewRoom({
	Id = 15003,
	Name = "The King's Road",
	Desc = [[   You stand on the King's Road, which leads east and west.  The
skill of the builders is apparent, since it is impossible to notice
any turn or irregularity in the road.]],
	Exits = {
		east = 15004,
		west = 15002
	}
})
Config.NewRoom({
	Id = 15004,
	Name = "On The King's Road Outside A Castle",
	Desc = [[   You are standing on the King's Road.  Before you is a large
Castle, evidently built not so much for strength as for beauty.
It is not totally without defences, though, for it is surrounded
by a deep moat, and its windows are just narrow slits for archers
to shoot through.  To the north there is a drawbridge across the
moat.]],
	Exits = {
		north = 15005,
		west = 15003
	}
})
Config.NewRoom({
	Id = 15005,
	Name = "On The Drawbridge",
	Desc = [[   You have arrived at the drawbridge leading into the Castle.  Before
you is a huge, double-doored gate.  It seems very strong.  You see some
whirls in the moat.]],
	Exits = {
		north = 15008,
		south = 15004
	}
})
Config.NewRoom({
	Id = 15006,
	Name = "The Kitchen",
	Desc = [[   You are in the Kitchen.  Lots of helpers hurry to do the Chief Cook's
bidding, and there is a wonderful smell that makes you feel very hungry.
All around the room, there are shelves with different kinds of cooking 
gear stacked on them.  There is an exit to the north, and one to the east;
both leading to small passages.]],
	Exits = {
		north = 15011,
		east = 15007
	}
})
Config.NewRoom({
	Id = 15007,
	Name = "A Small Passage",
	Desc = [[   You are standing in a small passage, that is clearly intended mostly
for the servants of the Castle.  It is only dimly lit and quite narrow.
The passage leads west, and to the east there is a small door.]],
	Exits = {
		east = 15008,
		west = 15006
	}
})
Config.NewRoom({
	Id = 15008,
	Name = "The Entrance Hall",
	Desc = [[   You are standing in the impressive Entrance Hall of the Castle.
To the north is an exit into the Great Hall.  There is also an exit
east, and a small door to the west.]],
	Exits = {
		north = 15013,
		east = 15009,
		south = 15005,
		west = 15007
	}
})
Config.NewRoom({
	Id = 15009,
	Name = "The Guard Room",
	Desc = [[   You are in a small room, evidently meant for guards currently
not on duty.  There is only one exit, back to the entrance hall.]],
	Exits = {
		west = 15008
	}
})
Config.NewRoom({
	Id = 15010,
	Name = "Under The Tower",
	Desc = [[   You are below one the three mighty towers of the Castle.  There are
no guards here, and you sense that this part of the Castle is largely
unused.  There are stairs going up to the tower, and there is also an
exit to the north.]],
	Exits = {
		north = 15015,
		up = 15035
	}
})
Config.NewRoom({
	Id = 15011,
	Name = "The Small Passage",
	Desc = [[   You are standing in a small passage, that is clearly intended 
mainly for the servants of the Castle.  The passage leads north
and south.]],
	Exits = {
		north = 15016,
		south = 15006
	}
})
Config.NewRoom({
	Id = 15012,
	Name = "The Great Hall",
	Desc = [[   You are standing in the south-west end of the Great Hall. It 
is truly vast; the roof is so high above your head, that it seems no
closer than the clouds outside.  The roof is beautifully painted, by
someone who must have been a true master.  The hall is very large,
and could easily seat several hundred people at a banquet.]],
	Exits = {
		north = 15017,
		east = 15013
	}
})
Config.NewRoom({
	Id = 15013,
	Name = "The Great Hall",
	Desc = [[   You are standing in the southern end of the Great Hall.  It
is truly vast; the roof is so high above your head, that it seems no
closer than the clouds outside.  The roof is beautifully painted, by
someone who must have been a true master.  The hall is very large,
and could easily seat several hundred people at a banquet.  To your
north, you see King Welmar's great throne, and to the south is the
Castle Entrance.]],
	Exits = {
		north = 15018,
		east = 15014,
		south = 15008,
		west = 15012
	}
})
Config.NewRoom({
	Id = 15014,
	Name = "The Great Hall",
	Desc = [[   You are standing in the south-east end of the Great Hall.  It
is truly vast; the roof is so high above your head, that it seems no
closer than the clouds outside.  The roof is beautifully painted, by
someone who must have been a true master.  The hall is very large,
and could easily seat several hundred people at a banquet.]],
	Exits = {
		north = 15019,
		west = 15013
	}
})
Config.NewRoom({
	Id = 15015,
	Name = "A Passage",
	Desc = [[   You are standing in a passage, that leads north and south.  To the south
it leads towards one of towers.]],
	Exits = {
		north = 15020,
		south = 15010
	}
})
Config.NewRoom({
	Id = 15016,
	Name = "The Passage",
	Desc = [[   You are in a passage, that leads north and south. To the east there
is an exit to the Great Hall.]],
	Exits = {
		north = 15021,
		east = 15017,
		south = 15011
	}
})
Config.NewRoom({
	Id = 15017,
	Name = "The Great Hall",
	Desc = [[   You are standing in the north-west end of the Great Hall.  It 
is truly vast; the roof is so high above your head, that it seems no
closer than the clouds outside.  The roof is beautifully painted, by
someone who must have been a true master.  The hall is very large,
and could easily seat several hundred people at a banquet.  To your
east, you see King Welmar's great throne, and to the west there is
an exit to a passage.]],
	Exits = {
		east = 15018,
		south = 15012,
		west = 15016
	}
})
Config.NewRoom({
	Id = 15018,
	Name = "By The Throne In The Great Hall",
	Desc = [[   You are standing by the King's huge ivory throne.  The throne is, to
an even greater degree than the Hall itself, a masterpiece.  It is
intricately and beautifully carved, and it seems to be made out of a 
single block of ivory, though you shiver at the thought of meeting
the animal that died to yield a piece of that size.  The Hall continues
to the east, west and south.]],
	Exits = {
		east = 15019,
		south = 15013,
		west = 15017
	}
})
Config.NewRoom({
	Id = 15019,
	Name = "The Great Hall",
	Desc = [[   You are standing in the north-east end of the Great Hall.  It
is truly vast; the roof is so high above your head, that it seems no
closer than the clouds outside.  The roof is beautifully painted, by
someone who must have been a true master.  The hall is very large,
and could easily seat several hundred people at a banquet.  To your
west, you see King Welmar's great throne, and to the east there is
an exit to a small passage.]],
	Exits = {
		east = 15020,
		south = 15014,
		west = 15018
	}
})
Config.NewRoom({
	Id = 15020,
	Name = "The Small Passage",
	Desc = [[   You are standing in a small passage, that leads north and south.
To the west, there is an exit into the Great Hall.]],
	Exits = {
		north = 15025,
		south = 15015,
		west = 15019
	}
})
Config.NewRoom({
	Id = 15021,
	Name = "The Passage",
	Desc = [[   You are standing in a north-south leading passage.  There is a door
to the east.]],
	Exits = {
		east = 15022,
		south = 15016
	}
})
Config.NewRoom({
	Id = 15022,
	Name = "The Servants' Corridor",
	Desc = [[   You are standing in a corridor, that stretches further to the east.
There are doors to the north and west.  The corridor itself is mainly
used by servants, and lacks some of the beauty of the rest of the
castle.]],
	Exits = {
		north = 15027,
		east = 15023,
		west = 15021
	}
})
Config.NewRoom({
	Id = 15023,
	Name = "The End Of The Servants' Corridor",
	Desc = [[   The corridor leads only west from here, but there is a door to
the north.]],
	Exits = {
		north = 15028,
		west = 15022
	}
})
Config.NewRoom({
	Id = 15024,
	Name = "The Training Room",
	Desc = [[   This is the Training Room of the men of the Castle guard.  It is
very large, with weapons standing in racks by all the walls.  Most
of the weapons seem to be intended for training only, with blunt
edges and the like, but there are some that might be useful for
real fighting.  There is a door to the north.]],
	Exits = {
		north = 15029,
		east = 15025
	}
})
Config.NewRoom({
	Id = 15025,
	Name = "The Small Passage",
	Desc = [[   You are standing in a small passage leading north and south.  There
is also an exit to the west, from which grunts, cheers and heavy blows
can be heard.]],
	Exits = {
		north = 15030,
		south = 15020,
		west = 15024
	}
})
Config.NewRoom({
	Id = 15026,
	Name = "The Stair Room",
	Desc = [[   You are standing below a great staircase, that leads up to the
second floor of the Castle.  The stairs are made of marble, and there
are pillars carved in the likenesses of trees with little animals
running up and down the trunks.]],
	Exits = {
		south = 15021,
		up = 15050
	}
})
Config.NewRoom({
	Id = 15027,
	Name = "The Servants' Quarters",
	Desc = [[   You are standing in a large room, that seems to house many of the
servants.  The room is full of comfortable-looking beds.  There is also
a large chest, probably containing some of the servants' belongings.]],
	Exits = {
		south = 15022
	}
})
Config.NewRoom({
	Id = 15028,
	Name = "The Butler's Quarters",
	Desc = [[   You see at once that this must be the butler's room, for it lies
in the servants' wing, and still it is large and comfortable; almost
luxurious, in fact.  There is a large bed and a drawer in the room.
The only exit is via the door to the south.]],
	Exits = {
		south = 15023
	}
})
Config.NewRoom({
	Id = 15029,
	Name = "The Guards' Barracks",
	Desc = [[   You are standing in a very large room with bunks all over.  It is
obvious, that this is where the guards off duty spend most of their
time, drinking and gambling or, probably, mostly sleeping.]],
	Exits = {
		south = 15024
	}
})
Config.NewRoom({
	Id = 15030,
	Name = "The Stairs",
	Desc = [[   You are standing by a staircase leading down.  As you look down,
you notice that for the first time since you entered the castle,
things are not aesthetically made.  Instead it looks more functional
and prison-like.]],
	Exits = {
		south = 15025,
		down = 15056
	}
})
Config.NewRoom({
	Id = 15031,
	Name = "At A Bend In The Corridor",
	Desc = "   You are standing at a place where the corridor bends from east to north.",
	Exits = {
		north = 15036,
		east = 15032
	}
})
Config.NewRoom({
	Id = 15032,
	Name = "The Corridor",
	Desc = [[   You are standing in a long corridor, decorated with tapestries
depicting old times and old heroes.  It leads east and west.]],
	Exits = {
		east = 15033,
		west = 15031
	}
})
Config.NewRoom({
	Id = 15033,
	Name = "The Corridor",
	Desc = [[   You are standing in a long corridor, decorated with tapestries
depicting old times and old heroes.  It leads east and west.]],
	Exits = {
		east = 15034,
		west = 15032
	}
})
Config.NewRoom({
	Id = 15034,
	Name = "The Corridor",
	Desc = [[   You are standing in a long corridor, decorated with tapestries
depicting old times and old heroes.  The corridor continues west,
and to the north you see the luxurious guest wing.]],
	Exits = {
		north = 15039,
		west = 15033
	}
})
Config.NewRoom({
	Id = 15035,
	Name = "In The South-East Tower",
	Desc = [[   This part of the tower is fairly uninteresting, but it leads further
upwards...]],
	Exits = {
		up = 15053,
		down = 15010
	}
})
Config.NewRoom({
	Id = 15036,
	Name = "The Corridor",
	Desc = [[   You are standing in a long corridor, decorated with tapestries
depicting old times and old heroes.  It leads north and south.  There
is also an exit to the east here.]],
	Exits = {
		north = 15041,
		east = 15037,
		south = 15031
	}
})
Config.NewRoom({
	Id = 15037,
	Name = "By The Treasure Room",
	Desc = [[   You are standing by a great iron door.  The door is very large, and
seems very solid indeed.  There is a sign posted by it. ]],
	Exits = {
		east = 15038,
		west = 15036
	}
})
Config.NewRoom({
	Id = 15038,
	Name = "The Great Treasury",
	Desc = [[   As you enter this room, you are astonished by the riches that
are stowed away here; not so much in gold, but paintings, tapestries,
skillful carvings and sculptures all over the vast room.  You realise,
however, that most of these things are too well known to be sold
anywhere, without branding yourself as a thief, and condemning yourself
to instant death at the hands of the Royal Guard.]],
	Exits = {
		west = 15037
	}
})
Config.NewRoom({
	Id = 15039,
	Name = "The Guest Wing",
	Desc = [[   You have arrived at the part of the Castle where prominent
guests are housed.  To the east there is a large, ornamented
door, and a somewhat smaller one leads north. ]],
	Exits = {
		north = 15044,
		east = 15040,
		south = 15034
	}
})
Config.NewRoom({
	Id = 15040,
	Name = "The Guest Suite",
	Desc = [[   This must be where only the most highly regarded guests stay, since
it is luxurious beyond your wildest imagination.  This is only the living
room of the suite, but it is huge and tastefully decorated.  All the
furniture is not only beautiful, but also made for comfort.  To the
north, there is an exit to the bedroom, and there is a door to the west.]],
	Exits = {
		north = 15045,
		west = 15039
	}
})
Config.NewRoom({
	Id = 15041,
	Name = "The Corridor",
	Desc = [[   You are standing in a long corridor, decorated with tapestries
depicting old times and old heroes.  It leads north and south.]],
	Exits = {
		north = 15046,
		south = 15036
	}
})
Config.NewRoom({
	Id = 15042,
	Name = "The Ball Room",
	Desc = [[   You are standing in the great Ball Room.  It is a truly large room,
with a stage for an orchestra in the south-east end.]],
	Exits = {
		north = 15047,
		east = 15043
	}
})
Config.NewRoom({
	Id = 15043,
	Name = "By The Stage",
	Desc = [[   Before you you see the stage.  It is large enough for some 40 
musicians to play on at the same time.  The Ball Room continues
to the west and north.]],
	Exits = {
		north = 15048,
		west = 15042
	}
})
Config.NewRoom({
	Id = 15044,
	Name = "A Guest Room",
	Desc = [[   You are standing in a large room.  Although it is comfortable enough,
you can tell it is not meant for any of the most illustrious guests,
since it lacks that extreme luxury found elsewhere in the Castle.]],
	Exits = {
		south = 15039
	}
})
Config.NewRoom({
	Id = 15045,
	Name = "The Bedroom",
	Desc = [[   This room is dominated by the huge four-poster bed, that stands
against the northern wall.  The room is large and cosy, and the bed
virtually begs you to lie down in it and sleep.]],
	Exits = {
		south = 15040
	}
})
Config.NewRoom({
	Id = 15046,
	Name = "The Corridor",
	Desc = [[   You are standing in a long corridor, decorated with tapestries
depicting old times and old heroes.  It leads north and south.  There
is an exit to the east, that leads to a large room.]],
	Exits = {
		north = 15050,
		east = 15047,
		south = 15041
	}
})
Config.NewRoom({
	Id = 15047,
	Name = "The Ball Room",
	Desc = [[   You are standing in the great Ball Room.  It is a truly large room,
with a stage for an orchestra in the south-east end.]],
	Exits = {
		east = 15048,
		south = 15042,
		west = 15046
	}
})
Config.NewRoom({
	Id = 15048,
	Name = "The Ball Room",
	Desc = [[   You are standing in the great Ball Room.  It is a truly large room,
with a stage for an orchestra in the south-east end.]],
	Exits = {
		east = 15049,
		south = 15043,
		west = 15047
	}
})
Config.NewRoom({
	Id = 15049,
	Name = "In The Tower",
	Desc = [[   You are standing in the north-eastern of the three great watch-
towers of the Castle.  To the west, you can enter the Ball Room and
there are stairs leading up into the Tower.]],
	Exits = {
		west = 15048,
		up = 15055
	}
})
Config.NewRoom({
	Id = 15050,
	Name = "The Grand Staircase",
	Desc = [[   You are standing on a great staircase, that leads up and down.  To 
the east, there is a large oak door, and a corridor leads south.]],
	Exits = {
		east = 15051,
		south = 15046,
		up = 15054,
		down = 15026
	}
})
Config.NewRoom({
	Id = 15051,
	Name = "The Cosy Room",
	Desc = [[   You have entered a large, cosy living room.  There is a fireplace
with a fire burning, and a few comfortable chairs around a little
table.  There is a door to the west, and also an exit to the east.]],
	Exits = {
		east = 15052,
		west = 15050
	}
})
Config.NewRoom({
	Id = 15052,
	Name = "King Welmar's Bedroom",
	Desc = [[   This is a large room, with a wonderful view.  To one side of the
room, stands a large four-poster bed.  All around the room there are
massive bookshelves, filled with all kinds of books.  The titles include
works such as: 'A Treatise on the History of Midgaard and surrounding
areas', 'Magic - A Beginner's Introduction' and many others.  There is
an exit to the west.]],
	Exits = {
		west = 15051
	}
})
Config.NewRoom({
	Id = 15053,
	Name = "Up In The Tower",
	Desc = [[   After a long climb, you finally reach the top of the tower.  This
room is small, and the only light source is a flickering candle, on
a cluttered table, in the middle of the room.  The only obvious exit
is back down the stairs.]],
	Exits = {
		down = 15035
	}
})
Config.NewRoom({
	Id = 15054,
	Name = "The Top Of The Tower",
	Desc = [[   You have arrived at the top of the tower.  This tower is pretty
uninteresting, and seems made purely for reasons of defence and 
guarding.  The windows are slits for bowmen, very narrow on the 
outward side and broad inwards to allow a wide shooting angle.
The only evident exit is down the stairs again.]],
	Exits = {
		down = 15050
	}
})
Config.NewRoom({
	Id = 15055,
	Name = "The Top Of The Tower",
	Desc = [[   This is the highest of all the towers, and is obviously used for
lookout purposes.  The view is splendid in all four directions.  All
around you, the rich countryside spreads out to the horizon.  To the
north and east you see a vast mountain range, and far to the west
a beautiful lake.  A bit closer, the town of Midgaard lies at the
end of the King's Road.  The only exit you can see is down again.]],
	Exits = {
		north = 0,
		east = 0,
		south = 0,
		west = 0,
		down = 15049
	}
})
Config.NewRoom({
	Id = 15056,
	Name = "The Bottom Of The Stairs",
	Desc = [[   The stairs lead down to a damp part of the castle, you can hear
water dripping somewhere around you.  The area is lit by a single
torch flickering in the room which this staircase is built off of.
   The stairs lead upwards and they open up onto a fairly small
room to the east.]],
	Exits = {
		east = 15057,
		up = 15030
	}
})
Config.NewRoom({
	Id = 15057,
	Name = "The Guard Room",
	Desc = [[   You are at a loss to explain why someone would want to spend all
day down here.  The only explanation that seems even remotely logical
to you is that there must be an important prisoner kept in one of the
cells through the south door.
   The decorations of the room are sparse, merely a table, a chair,
and a deck of cards.  A stairwell has been built into the western wall
and it leads upwards. ]],
	Exits = {
		south = 15058,
		west = 15056
	}
})
Config.NewRoom({
	Id = 15058,
	Name = "The Prison",
	Desc = [[   This small passage is about thirty feet long and is well lit by the
torches on each wall.  The torches have been locked inside small metal
cages to ensure that they are not removed.  The strangest thing about
the torches however, is the manner in which they burn, they have what
appears to be a constant flame in that it does not flicker whatsoever,
and does not give off any smoke.  Perhaps they have been magicked to
burn forever...
   There are three cells along this passage way, one on each side of
the corridor right near the north end and one isolated at the south
end of the corridor with a small metal plaque located over the door
in the keystone of the archway.]],
	Exits = {
		north = 15057,
		east = 15061,
		south = 15060,
		west = 15059
	}
})
Config.NewRoom({
	Id = 15059,
	Name = "A Cell",
	Desc = [[   This cell is in a shambles.  There is a small hole in the
western wall where something has broken through the stones
into the cell.  There is a cell door in the eastern wall.]],
	Exits = {
		east = 15058
	}
})
Config.NewRoom({
	Id = 15060,
	Name = "Ergan's Cell",
	Desc = [[   This large cell is almost like a living quarters with a cot
in one corner serving as a bed, a small table built out of the
wall in another corner.  There is even a rug in the center of
the floor to keep some warmth.  It seems that the prisoner kept
here is treated quite well, almost too well for a murderer of
an entire town...]],
	Exits = {
		north = 15058
	}
})
Config.NewRoom({
	Id = 15061,
	Name = "A Cell",
	Desc = [[   This small cell is damp and dark and looks like noone and nothing
has lived in it for quite some time.  A small cell door is located in
the west wall.]],
	Exits = {
		west = 15058
	}
})
Config.NewRoom({
	Id = 15062,
	Name = "An Overgrown Trail",
	Desc = [[   Moving off of the King's Road, you find yourself on a small
fading trail which appears to have been so little used that it
has almost completely grown over with vegitation from the woods
here.  Sounds of the forest can be heard all round and you feel
a peaceful feeling come over you as you realize that mankind
has not passed this way for some time.
   The faded trail appears to lead north and south.]],
	Exits = {
		north = 15001,
		south = 15063
	}
})
Config.NewRoom({
	Id = 15063,
	Name = "An Overgrown Trail",
	Desc = [[   Continuing through the heavy undergrowth, you find yourself
in the middle of the forest.  The sounds of the forest can be
heard all round and you feel a peaceful feeling come over you
as you realize that mankind has not passed this way for some
time.
   The fading trail you are on appears to have been so little
used that it has almost completely grown over with vegitation
from the woods here.  
   The faded trail appears to lead north and east.]],
	Exits = {
		north = 15062,
		east = 15064
	}
})
Config.NewRoom({
	Id = 15064,
	Name = "An Overgrown Trail",
	Desc = [[   Continuing through the heavy undergrowth, you find yourself
in the middle of the forest.  The sounds of the forest can be
heard all round and you feel a peaceful feeling come over you
as you realize that mankind has not passed this way for some
time.
   The fading trail you are on appears to have been so little
used that it has almost completely grown over with vegitation
from the woods here.  
   The faded trail appears to lead west and south.  To the south
a strange eerie silence seems to hang in the air, almost blocking
out all the sounds that you can hear from the north and east.]],
	Exits = {
		south = 15065,
		west = 15063
	}
})
Config.NewRoom({
	Id = 15065,
	Name = "A Dirt Road",
	Desc = [[   As you leave the forest to the north, you find yourself at
what appears to be the beginning of a dirt road and a small
village.  Upon first laying eyes on this place you realize
that there is something funny about this settlement... there
is no sound other that the whistling wind here.  You would have
expected to hear people going about their regular business, but
the village is silent.  You cannot see any movement around the
village either.  It is almost as still and silent as the woods
to the north.
There is a small sign lying by the side of the road here.]],
	Exits = {
		north = 15064,
		south = 15066,
		west = 15069
	}
})
Config.NewRoom({
	Id = 15066,
	Name = "A Small Intersection",
	Desc = [[   Continuing along the dirt road, you find yourself at a place where
a small path splits away from the main road and leads off to the west.
The woods around the village seem to be pressing inwards towards you
as if the village hides a secret which they do not want to be spread
about.
   There is another house standing on the east side of the road.  ]],
	Exits = {
		north = 15065,
		east = 15070,
		south = 15067,
		west = 15073
	}
})
Config.NewRoom({
	Id = 15067,
	Name = "A Dirt Road",
	Desc = [[   This section of the dirt road is quiet, but there is an awful stench
in the air.  It brings to mind rotting corpses and raw sewage.  The woods
contiue to press closely about you, and almost totally surround the small
building to the west with a thatched roof.  There is a blackened shell of
a building to the east with a small sign hanging out front from a black
and charred chain.
   The dirt road continues north and south.]],
	Exits = {
		north = 15066,
		east = 15072,
		south = 15068,
		west = 15071
	}
})
Config.NewRoom({
	Id = 15068,
	Name = "A Large Pit",
	Desc = [[   The dirt road ends at the edge of a large pit here and you now
realize where the awful smell was coming from.  This pit appears
to be a mass grave for the citizens of the village.  There are
bones and corpses lying all over the place.  A lot of the corpses
look too recent to be from the Townsbridge murders of almost a
decade ago, but the village seems to have been empty for almost
that long.
   The dirt road leads away from the carnage to the north.]],
	Exits = {
		north = 15067
	}
})
Config.NewRoom({
	Id = 15069,
	Name = "A House",
	Desc = [[   This house is a wreck, furniture has been strewn all about
the room, and it looks like a tornado landed right in the middle
of the room.  The destruction that has taken place in this room
is almost beyond belief.  The oddest part of it all though, is
how it all seems so recent, since there are no cobwebs, and there
is no dust on anything.
   The dirt road can be seen to the east through the doorway.]],
	Exits = {
		east = 15065
	}
})
Config.NewRoom({
	Id = 15070,
	Name = "A House",
	Desc = [[   This darkened room is barely lit by the outdoor light, but what
you can see of it gives you the creeps.  There are cobwebs dangling
from everything, a thick layer of dust begins to rise up at your
passage, and a strange howl comes from somewhere around you.  The
furniture in this house is old and of a type that hasn't been seen
around these lands for some time.  If it was in better shape, you
might be able to sell it as antique.
   The meager light of the road shines through the doorway to the
west.]],
	Exits = {
		west = 15066
	}
})
Config.NewRoom({
	Id = 15071,
	Name = "A Small Cottage",
	Desc = [[   This cottage looks to have been left in exactly the same shape as
it was in quite some time ago.  It looks as if the residents left one
day and haven't returned home yet.  Oddly enough, the furniture is
dust free and the food on the table still looks fresh.  This house is
really strange, perhaps it wuld be in your best interests to leave as
soon as humanly possible.
   The road is back through the open doorway to the east.]],
	Exits = {
		east = 15067
	}
})
Config.NewRoom({
	Id = 15072,
	Name = "The Burned Shop",
	Desc = [[   As you enter this small building, you notice that that blackened
walls are due to a fire that seemed to burn here unattended for quite
some time.  There is almost nothing left of the roof that would have
once covered this building, and the north and east walls have been
burnt to almost half the height of the other two walls.  There are
some burnt goods around on the ground and the remains of a counter
near what is left of the north wall seems to indicate that this was
once a shop.
   The road lies to the west through the blackened wall.]],
	Exits = {
		west = 15067
	}
})
Config.NewRoom({
	Id = 15073,
	Name = "A Dark Path",
	Desc = [[   As you move away form the open air into the darkness of the path
and the sinister looking woods around you, you get a feeling of awe
and something almost akin to horror.  The wood around is completely
silent, not even the rustling of leaves or the cracking of branches
breaks the silence.  The final thing you notice is that the darkness
all around you seems to be almost contrived, and doesn't seem natural
for this kind of vegitation.
   The path continues west and you can see light to the east.]],
	Exits = {
		east = 15066,
		west = 15074
	}
})
Config.NewRoom({
	Id = 15074,
	Name = "A Dark Path",
	Desc = [[   This narrow path leads through the overhanging trees in the unnatural
darkness.  It seems almost as if the trees are crowding in on you here,
as if they didn't want to feel your presence.  The wood is almost totally
silent and you wonder silently to yourself why this could be.
   The path appears to continue east and west.]],
	Exits = {
		east = 15073,
		west = 15075
	}
})
Config.NewRoom({
	Id = 15075,
	Name = "The Circle Of Stones",
	Desc = [[   You are at the edge of a circle of seven large monolith-like stones.
Each stone towers over your head and appears to be at least double your
height.  The stones are made of a dark black material, almost black in
colour.
   In the center of the ring of stones, you can see a black circular
mirror-like disk on the ground.  The surface is highly reflective and
almost appears to be rippling.  The trees surrounding the circle tower
far above your heads blocking out the sky.
   A strange glow seems to be emanating from each stone, almost green
in colour.  This glow provides enough light for you to see with even
though the sky above has been blotted out.]],
	Exits = {
		east = 15074,
		up = 0
	}
})
