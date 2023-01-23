Config.NewRoom({
	Id = 6501,
	Name = "The Path To The Dwarven Village",
	Desc = [[   You are walking down a path that leads to the dwarven village.  Above
you, you can see the Turning Point, and to the north the path continues 
toward the mountains.]],
	Exits = {
		north = 6502,
		up = 3503
	}
})
Config.NewRoom({
	Id = 6502,
	Name = "The Path At The Base Of The Mountain",
	Desc = [[   Now you are at the bottom of a rugged mountain.  The forest around you
is very dense, and it seems very dark to the north.]],
	Exits = {
		north = 6503,
		south = 6501
	}
})
Config.NewRoom({
	Id = 6503,
	Name = "The Path At The Middle Of The Mountain",
	Desc = [[   Standing on the middle of the mountain, you can easily see the city to
the south, and the top of the mountain is very near to the north.]],
	Exits = {
		north = 6504,
		south = 6502
	}
})
Config.NewRoom({
	Id = 6504,
	Name = "The Top Of The Mountain",
	Desc = [[   You are now on the top of the mountain.  To the south you see a path
leading down the mountain.  To the east and west you see entrances to
what seems like mines.]],
	Exits = {
		east = 6541,
		south = 6503,
		west = 6506
	}
})
Config.NewRoom({
	Id = 6505,
	Name = "The Narrow Path",
	Desc = [[   This is a narrow path leading to the Dwarven Kingdom.  It looks less
travelled than the others, and it is very creepy.  The path opens up to 
the south, and continues to the north.]],
	Exits = {
		north = 6507,
		south = 6541
	}
})
Config.NewRoom({
	Id = 6506,
	Name = "The Entrance To The Mountain",
	Desc = [[   Here is an entrance to the mountain.  The door looks very well built,
and you can hear noise coming from within.]],
	Exits = {
		east = 6504,
		west = 6514
	}
})
Config.NewRoom({
	Id = 6507,
	Name = "A Bend In The Narrow Path",
	Desc = [[  This is a narrow path that bends to the east here.  The trees hang
over the path, and it is very overgrown.  The narrow path continues to
the south and to the east.]],
	Exits = {
		east = 6508,
		south = 6505
	}
})
Config.NewRoom({
	Id = 6508,
	Name = "The Narrow Path",
	Desc = "   This path is very narrow, and it continues to the north and west.",
	Exits = {
		north = 6509,
		west = 6507
	}
})
Config.NewRoom({
	Id = 6509,
	Name = "The Narrow North-South Path",
	Desc = [[   This path leads to the north and south.  To the north you can see a
door, and to the south the path continues.]],
	Exits = {
		north = 6510,
		south = 6508
	}
})
Config.NewRoom({
	Id = 6510,
	Name = "The Door To The Kingdom",
	Desc = [[   Here the path turns to the west.  You can see a door in front of you,
and the path continues to the west and south.]],
	Exits = {
		north = 6511,
		south = 6509,
		west = 6523
	}
})
Config.NewRoom({
	Id = 6511,
	Name = "On The Path To The Castle",
	Desc = [[   You are on a path that will eventually lead to the castle.  It
continues north to the castle, and there is a door in the southern
wall.]],
	Exits = {
		north = 6512,
		south = 6510
	}
})
Config.NewRoom({
	Id = 6512,
	Name = "Still On The Path To The Castle",
	Desc = [[   You are still on the path to the castle, or back to the Dwarven
village, whichever way you wish to go.  The path continues to the
north and south.]],
	Exits = {
		north = 6513,
		south = 6511
	}
})
Config.NewRoom({
	Id = 6513,
	Name = "The Door To The Castle",
	Desc = [[   Here there is a door to the castle to the east.  The castle is 
elegantly designed, and looks much like a roll of toilet paper
standing  on its end.  There is a sign which says:

              ******************************************
              *  WELCOME TO THE CASTLE OF STRANGELOVE  *
              *      Here, celibacy is uninvited       *
              ******************************************
]],
	Exits = {
		east = 6526,
		south = 6512
	}
})
Config.NewRoom({
	Id = 6514,
	Name = "Inside The Entrance",
	Desc = [[   Everything here is covered in soot and very grimy.  The path continues
to the east and north, and there is a door to the west.]],
	Exits = {
		north = 6515,
		east = 6506,
		west = 6527
	}
})
Config.NewRoom({
	Id = 6515,
	Name = "The Path",
	Desc = [[   You are on a path in the dwarven village which leads north to the shops
and south to the corner of the area.]],
	Exits = {
		north = 6516,
		south = 6514
	}
})
Config.NewRoom({
	Id = 6516,
	Name = "A Turn In The Road",
	Desc = [[   You are on a path that leads to the Hide & Tooth shop to the west, and
the path continues to the south.]],
	Exits = {
		south = 6515,
		west = 6517
	}
})
Config.NewRoom({
	Id = 6517,
	Name = "The Hide & Tooth Shop",
	Desc = [[   You are in the Hide & Tooth shop.  Here you may buy the finest in Dwarven
weapons and armors.  The path continues to the north and east.]],
	Exits = {
		north = 6518,
		east = 6516
	}
})
Config.NewRoom({
	Id = 6518,
	Name = "The Path To The North Of The Shop",
	Desc = [[   You are on a path to the north of the Hide & Tooth shop.  The path 
continues to the north, and there is Granite Head's bakery to the west.]],
	Exits = {
		north = 6519,
		south = 6517,
		west = 6536
	}
})
Config.NewRoom({
	Id = 6519,
	Name = "North Of The Shops",
	Desc = [[   Here the path bends to the east towards the barracks. To the south
you can see the shops.]],
	Exits = {
		east = 6520,
		south = 6518
	}
})
Config.NewRoom({
	Id = 6520,
	Name = "A Path By The Hospital",
	Desc = [[   Here the path passes by the Hospital to the north.  It continues
to the east to the barracks, and to the west.]],
	Exits = {
		north = 6535,
		east = 6521,
		west = 6519
	}
})
Config.NewRoom({
	Id = 6521,
	Name = "A Path Next To The Barracks",
	Desc = "   Here the path continues west, and east to the barracks.",
	Exits = {
		east = 6522,
		west = 6520
	}
})
Config.NewRoom({
	Id = 6522,
	Name = "The Entrance To The Barracks",
	Desc = [[   Here there is an entrance to the barracks to the south, and the path 
continues to the west.]],
	Exits = {
		south = 6524,
		west = 6521
	}
})
Config.NewRoom({
	Id = 6523,
	Name = "A Guard House",
	Desc = [[   You are in the guard house to the west of the entrance to the castle.  
There are nudie posters covering the walls.]],
	Exits = {
		east = 6510
	}
})
Config.NewRoom({
	Id = 6524,
	Name = "The First Barrack Room",
	Desc = [[   Here is the first of two main rooms of barracks.  The barracks
continue to the south, and you can leave the room to the north.]],
	Exits = {
		north = 6522,
		south = 6525
	}
})
Config.NewRoom({
	Id = 6525,
	Name = "The Back Of The Barracks",
	Desc = [[   Here is the back of the dwarven barracks.  There are rows of beds 
here, and there is a stench that is unbearable.]],
	Exits = {
		north = 6524
	}
})
Config.NewRoom({
	Id = 6526,
	Name = "Inside Of Castle Strangelove",
	Desc = [[   You are just inside the castle.  It is very tubular in shape,
and it is very featureless.  There is a set of stairs that lead
up, and the door leads out of the castle to the west.]],
	Exits = {
		west = 6513,
		up = 6529
	}
})
Config.NewRoom({
	Id = 6527,
	Name = "A Store Room",
	Desc = [[   There is a layer of dust on the floor at least 3 inches thick!  It is
probable that not many people have been in here for many months.]],
	Exits = {
		east = 6514,
		down = 6528
	}
})
Config.NewRoom({
	Id = 6528,
	Name = "The Wine Cellar",
	Desc = [[   This room smells like wine, and you can only assume it used to be
a wine cellar at one time.]],
	Exits = {
		up = 6527
	}
})
Config.NewRoom({
	Id = 6529,
	Name = "On The Stairs In Castle Strangelove",
	Desc = "   The stairs continue to circle up and down here.",
	Exits = {
		up = 6530,
		down = 6526
	}
})
Config.NewRoom({
	Id = 6530,
	Name = "On The Stairs",
	Desc = [[   You are still circling around on the stairs.  You are starting to
get dizzy from going around and around and around and around and
around.  The stairs continue up and down.]],
	Exits = {
		up = 6531,
		down = 6529
	}
})
Config.NewRoom({
	Id = 6531,
	Name = "At The Top Of The Stairs",
	Desc = [[   You are at the top of the stairs in the castle.  There is an exit
to the east, and the stairs lead down.]],
	Exits = {
		east = 6532,
		down = 6530
	}
})
Config.NewRoom({
	Id = 6532,
	Name = "The Queen's Waiting Room",
	Desc = [[   This is the Queen's waiting room.  Here the men literally
'wait' for the queen.  You've heard that the queen really
likes to get to 'know' her people, in the biblical sense.
   The Queen's bedroom is to the north, and you can see stairs
to the west.]],
	Exits = {
		north = 6533,
		west = 6531
	}
})
Config.NewRoom({
	Id = 6533,
	Name = "The Queen's Bedroom",
	Desc = [[   This is the Queen's bedroom.  The bed is all ruffled, and there
is a stack of dirty sheets piled in the corner.  There is a ladder
that leads down, out of the castle, and you can leave the room
to the south.  There is also a small wooden door to the west.
There is a sign that says:

      -------------------------
      |  I'm busy right now,  |
      |  and don't know when  |
      |  Ill be back, but if  |
      |  there is a key here  |
      |  take it and PLEASE,  |
      |  try to get my birth  |
      |  control pills back!  |
      |  I've heard they can  |
      |  be found somewhere,  |
      |  deep in the mines..  |
      -------------------------
]],
	Exits = {
		south = 6532,
		west = 6555,
		down = 6534
	}
})
Config.NewRoom({
	Id = 6534,
	Name = "The North Side Of Castle Strangelove",
	Desc = [[   You are standing on the north side of Castle Strangelove.  You
notice that you are no longer inside the mountain anymore either.
Along the southern horizon you see towering mountains.
   The only exit, however, is back up the ladder into the Queen's
Bedroom.]],
	Exits = {
		up = 6533
	}
})
Config.NewRoom({
	Id = 6535,
	Name = "The Hospital",
	Desc = [[   You are inside the Dwarven Hospital.  It smells like rubbing
alcohol, and there is blood all over the walls.]],
	Exits = {
		south = 6520
	}
})
Config.NewRoom({
	Id = 6536,
	Name = "Granite Head's Bakery",
	Desc = [[   The aroma coming from this room is astonishing.  You can almost taste
the pastries dissolving in your mouth.]],
	Exits = {
		east = 6518
	}
})
Config.NewRoom({
	Id = 6541,
	Name = "The Dark Path",
	Desc = [[   This path is very well worn, and there is an entrance to the mines to the
east, while the path continues to the north and west.]],
	Exits = {
		north = 6505,
		east = 6542,
		west = 6504
	}
})
Config.NewRoom({
	Id = 6542,
	Name = "The Mine Entrance",
	Desc = [[   The little path here leads down toward the mines, while the worn path
continues to the west.]],
	Exits = {
		west = 6541,
		down = 6543
	}
})
Config.NewRoom({
	Id = 6543,
	Name = "At The Bottom Of The Mineshaft",
	Desc = [[   You are at the bottom of the mineshaft.  The air here is very sooty, and
it is very hard to breath.  The mineshaft leads up and east.]],
	Exits = {
		east = 6544,
		up = 6542
	}
})
Config.NewRoom({
	Id = 6544,
	Name = "On The Path Inside The Mine",
	Desc = [[   You are deep inside the mine, and you feel very uncomfortable.  The
path continues to the east, and leads to the mineshaft to the west.]],
	Exits = {
		east = 6545,
		west = 6543
	}
})
Config.NewRoom({
	Id = 6545,
	Name = "The Mine Crossroad",
	Desc = [[   You are at a crossroad in the mine.  There is a door to the north,
and the path continues to the south, east, and west.]],
	Exits = {
		north = 6547,
		east = 6546,
		south = 6552,
		west = 6544
	}
})
Config.NewRoom({
	Id = 6546,
	Name = "The Coal Room",
	Desc = [[   You are inside the storage area for the raw materials that are
found down here.  The room is very unsturdy as the supports are
very rickety.]],
	Exits = {
		west = 6545
	}
})
Config.NewRoom({
	Id = 6547,
	Name = "The Mine Maze",
	Desc = [[   You have entered the maze of the mines.  To the east you can see
some inscriptions, and you can exit to the south.]],
	Exits = {
		east = 6548,
		south = 6545
	}
})
Config.NewRoom({
	Id = 6548,
	Name = "At The Maze Inscription",
	Desc = [[   You are inside the maze, but not far enough in that you could
get lost.  There is an enscription on the wall which says:

          1    3    2    4
          N    W    N    S

This isn't too tough, so don't take it so rough.]],
	Exits = {
		north = 6549,
		east = 6545,
		west = 6547
	}
})
Config.NewRoom({
	Id = 6549,
	Name = "The Maze",
	Desc = "   You are in a maze.",
	Exits = {
		north = 6550,
		south = 6548,
		west = 6549
	}
})
Config.NewRoom({
	Id = 6550,
	Name = "The Maze",
	Desc = "   You are in a maze.",
	Exits = {
		north = 6549,
		south = 6549,
		west = 6551
	}
})
Config.NewRoom({
	Id = 6551,
	Name = "The Maze",
	Desc = "   You are in a maze.",
	Exits = {
		north = 6550,
		east = 6550,
		south = 6553,
		west = 6549
	}
})
Config.NewRoom({
	Id = 6552,
	Name = "The Mining Equipment Room",
	Desc = [[   This is the storage room for equipment used by the Dwarven miners.
It is very small, and you can tell that not many miners actually use 
equipment.]],
	Exits = {
		north = 6545
	}
})
Config.NewRoom({
	Id = 6553,
	Name = "The End Of The Maze",
	Desc = [[   You have solved the maze.  You can tell by the last few moves
that there is no way that a dumb worker could have figured that
out.  It seems pretty desolate here.  To the south is a bleak
room.  To the north, you see the maze.  There is a sign above
the south exit:

THOSE WHO ENTER, PLAN ON A TIMELY DEATH.
(ESPECIALLY IF YOU'RE LOYAL TO THE QUEEN)
]],
	Exits = {
		north = 6551,
		south = 6554
	}
})
Config.NewRoom({
	Id = 6554,
	Name = "The Mazekeeper's Room",
	Desc = [[   You have entered the Mazekeeper's room.  There are pictures of
the Queen with darts thrown at it.  Spraypainted on the wall are
things like 'the queen shall suffer' and 'Catholics Rule'.]],
	Exits = {
		north = 6553
	}
})
Config.NewRoom({
	Id = 6555,
	Name = "The Treasury",
	Desc = [[   This room appears to be the Queen's Treasury.  There is one
exit, back to the east.]],
	Exits = {
		east = 6533
	}
})
