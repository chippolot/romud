Config.NewRoom({
	Id = 6401,
	Name = "A Mountain Trail",
	Desc = [[
   This trail leads up, up, up into the mountains.  You
hope you don't fall down, because that would hurt, hurt,
hurt!  The trail continues to the east, and you can go
back down to the small hidden valley to the west.
]],
	Exits = {
		east = 6402,
		west = 4079
	}
})
Config.NewRoom({
	Id = 6402,
	Name = "A Mountain Trail",
	Desc = [[
   You're really high up now.  You can keep going even
farther up into the mountains to the east, or go back
down to the west.
]],
	Exits = {
		east = 6403,
		west = 6401
	}
})
Config.NewRoom({
	Id = 6403,
	Name = "A Mountain Trail",
	Desc = [[
   Wispy clouds are beginning to surround you now, and
your ears pop due to the altitude.  To the east, you see
the summit of the mountain, and from the way the nearby
mountains are arranged behind it, you believe you're
on your way to a big valley.  You can also go down
to the west.
]],
	Exits = {
		east = 6404,
		west = 6402
	}
})
Config.NewRoom({
	Id = 6404,
	Name = "Near The Mountain's Peak",
	Desc = [[
   The peak of this mountain is another couple hundred
feet above you, but here is where the trail leads down
into the valley...  What an odd valley!
   The valley seems to have been filled up by a hundreds
of feet of lava many years ago.  It gives the valley an
odd, 'flat' look and darkish ground.  The path leads
down east into the valley, and west back to civilization.
]],
	Exits = {
		east = 6405,
		west = 6403
	}
})
Config.NewRoom({
	Id = 6405,
	Name = "The Trail To The Valley",
	Desc = [[
   The trail leads down into the valley, where, by judging
by the height of the trees, the lava had cooled tens
of decades ago.  Down below you see the path lead into
the small forest in the valley, and disappear out of
sight.  East leads into the valley, West back to civilization.
]],
	Exits = {
		east = 6406,
		west = 6404
	}
})
Config.NewRoom({
	Id = 6406,
	Name = "In The Valley",
	Desc = [[
   The ground has taken on the texture of dirt on the top,
but this valley is far too flat and too rocky to disguise
the catastrophe that happened here so long ago.  Looking
up to the mountains ringing this area, you notice several
mountains look as if they had 'exploded', which is strange,
considering that they are not volcanos.
   The path leads into the woods to the east, and back up
the mountain to the west.
]],
	Exits = {
		east = 6407,
		west = 6405
	}
})
Config.NewRoom({
	Id = 6407,
	Name = "In A Clearing",
	Desc = [[
   You come to a small clearing now, after walking for several
minutes through the silent woods.  An odd block sticks up
here and there in   the ground... wait a minute.  These
stones seem a little too regular, and from the circle 
formation and size you could almost swear that they were...
crenellations?  Could some sort of building been buried
by the lava here?  A rusty ring sticks out of the earth
in the center... a trapdoor?  This is almost too good to
be true!
]],
	Exits = {
		west = 6406,
		down = 6408
	}
})
Config.NewRoom({
	Id = 6408,
	Name = "A Stairwell",
	Desc = [[
   This small room is the top of a stairwell leading down
deep into the tower.  A small trapdoor overhead leaks
the light of day around its edges.  To the south is a 
wooden door, preserved through the ages by means 
unknown.  To the west is a short hall.
]],
	Exits = {
		south = 6409,
		west = 6410,
		up = 6407,
		down = 6414
	}
})
Config.NewRoom({
	Id = 6409,
	Name = "A Linen Closet",
	Desc = [[
   This small room holds many types of linen on shelves 
along the walls.  They are undoubtedly preserved by
magic against the toil of the ages, since they seem
freshly washed and folded.  You wonder what sort of
mage could wield so much power to waste on such little
things.
]],
	Exits = {
		north = 6408
	}
})
Config.NewRoom({
	Id = 6410,
	Name = "A Corridor",
	Desc = [[
   This is only a clean corridor, that leads back to the 
stairwell to the east, and has doors leading to other
rooms to the north and south.
]],
	Exits = {
		north = 6412,
		east = 6408,
		south = 6411
	}
})
Config.NewRoom({
	Id = 6411,
	Name = "A Bathroom",
	Desc = [[
   This is some sort of bathroom, like you've never seen
before...  Water appliances leading from nowhere deliver
hot and cold running water to basins that drain to...
where?  How strange!
]],
	Exits = {
		north = 6410
	}
})
Config.NewRoom({
	Id = 6412,
	Name = "The Master Bedroom",
	Desc = [[
   This is an opulent room, decorated in silks and gold.
There is an ebony desk against one wall, cooled lava rock
spilling over its surface from the window it once looked
out at.  A nice, spacious closet is filled with clothes
just cleaned and pressed.
]],
	Exits = {
		south = 6410
	}
})
Config.NewRoom({
	Id = 6413,
	Name = "The Library",
	Desc = [[
   A great mages' library is contained on this floor of 
the tower.  You feel you could learn anything you wanted
to if you only looked and read long enough.  A door
opens up back on the stairwell to the east.
]],
	Exits = {
		east = 6414,
		west = 6415
	}
})
Config.NewRoom({
	Id = 6414,
	Name = "The Stairwell",
	Desc = [[
   This stairwell continues up and down, and there is
a door to the west.
]],
	Exits = {
		west = 6413,
		up = 6408,
		down = 6416
	}
})
Config.NewRoom({
	Id = 6415,
	Name = "A Hidden Hall",
	Desc = [[
   This is a small hidden hall with a secret entrance to the
library on the north end of the west wall, and a trapdoor 
on the south end.
]],
	Exits = {
		east = 6413,
		down = 6417
	}
})
Config.NewRoom({
	Id = 6416,
	Name = "A Stairwell",
	Desc = [[
   This stairwell continues up and down, and there is a door
to the west opening up onto this level.
]],
	Exits = {
		west = 6418,
		up = 6414,
		down = 6423
	}
})
Config.NewRoom({
	Id = 6417,
	Name = "The Hidden Treasure Room",
	Desc = "   Jackpot!  A small room filled with treasure chests!  Go get them!",
	Exits = {
		up = 6415
	}
})
Config.NewRoom({
	Id = 6418,
	Name = "A Hallway",
	Desc = [[
   This hall runs through the tower.  There's more hall to
the west, and doors to your north and south.  A door to
the east leads back to the stairwell.
]],
	Exits = {
		north = 6420,
		east = 6416,
		south = 6419,
		west = 6421
	}
})
Config.NewRoom({
	Id = 6419,
	Name = "A Servant's Room",
	Desc = [[
   This seems to be a small servant's bedroom, sparsely
decorated and outfitted with a bed, nightstand, chair
and table, etc.  Nothing real important here.
]],
	Exits = {
		north = 6418
	}
})
Config.NewRoom({
	Id = 6420,
	Name = "A Servant's Room",
	Desc = [[
   This seems to be a small servant's bedroom, sparsely 
decorated and outfitted with a bed, nightstand, chair
and table, etc.  Nothing real important here.
]],
	Exits = {
		south = 6418
	}
})
Config.NewRoom({
	Id = 6421,
	Name = "A Hallway",
	Desc = [[
   This hallway continues to the east, and has a door to 
the north.  You could swear that the way this level is
arranged... nah, couldn't be.
]],
	Exits = {
		north = 6422,
		east = 6418
	}
})
Config.NewRoom({
	Id = 6422,
	Name = "A Servant's Room",
	Desc = [[
   This seems to be a small servant's bedroom, sparsely
decorated and outfitted with a bed, nightstand, chair
and a table, etc.  Nothing real important here.
]],
	Exits = {
		south = 6421
	}
})
Config.NewRoom({
	Id = 6423,
	Name = "The Stairwell",
	Desc = [[
   This stairwell leads up and down, and there is a big
open room to your west.
]],
	Exits = {
		west = 6424,
		up = 6416,
		down = 6426
	}
})
Config.NewRoom({
	Id = 6424,
	Name = "The Dining Hall",
	Desc = [[
   This is a large dining hall, with a long table that runs
down the length of it.  Chairs are set up along the sides
to accomodate approximately 10 people.  There are paintings
and tapestries on the walls, adding color to the stonework,
The cooled lava that had poured in the windows makes the place 
seem eerie somehow .  There is a door to the north, and
the stairwell is to the east.
]],
	Exits = {
		north = 6425,
		east = 6423
	}
})
Config.NewRoom({
	Id = 6425,
	Name = "The Kitchen Area",
	Desc = [[
   This is a well-stocked kitchen, the larders still fresh
and full as if by magic.  Perhaps this would be a good
place to take a break.
]],
	Exits = {
		south = 6424
	}
})
Config.NewRoom({
	Id = 6426,
	Name = "The Stairwell",
	Desc = [[
   The stairwell leads up and down here, and there is a hall
you can enter to the west.
]],
	Exits = {
		west = 6427,
		up = 6423,
		down = 6430
	}
})
Config.NewRoom({
	Id = 6427,
	Name = "A Hall",
	Desc = [[
   This area of the tower seems dank and oppressive.  The
hall runs north-south, and there is an empty cell to your
west.  The stairwell is to your east.
]],
	Exits = {
		north = 6428,
		east = 6426,
		south = 6429
	}
})
Config.NewRoom({
	Id = 6428,
	Name = "A Hall",
	Desc = [[
   This is the northern end of the hall.  There are cells to
your right and left, empty and awaiting occupants.
]],
	Exits = {
		south = 6427
	}
})
Config.NewRoom({
	Id = 6429,
	Name = "A Hall",
	Desc = [[
   This is the southern end of the hall.  There are cells to
your right and left, empty and awaiting occupants.
]],
	Exits = {
		north = 6427
	}
})
Config.NewRoom({
	Id = 6430,
	Name = "A Stairwell",
	Desc = [[
   The stairwell continues up and down here.  A large room
opens up to the west.
]],
	Exits = {
		west = 6431,
		up = 6426,
		down = 6432
	}
})
Config.NewRoom({
	Id = 6431,
	Name = "A Mage's Office",
	Desc = [[
   A small desk here is cluttered with magically preserved
papers and documents.  None seem of value, except perhaps
to a historian.  This place seems vaguely uninteresting...
]],
	Exits = {
		east = 6430
	}
})
Config.NewRoom({
	Id = 6432,
	Name = "The Stairwell",
	Desc = [[
   The stairs go up and down here, and there is a room to the
west...
]],
	Exits = {
		west = 6433,
		up = 6430,
		down = 6434
	}
})
Config.NewRoom({
	Id = 6433,
	Name = "A Sitting Room",
	Desc = [[
   This is a simply furnished room, with chairs all about.
A fireplace is inset into an inner wall, the chimney
undoubtedly directed by magic...
   This would be a nice place to rest awhile...
]],
	Exits = {
		east = 6432
	}
})
Config.NewRoom({
	Id = 6434,
	Name = "The Stairwell",
	Desc = [[
    This is where the stairwell finally ends.  There is a hall
to your west.
]],
	Exits = {
		west = 6435,
		up = 6432
	}
})
Config.NewRoom({
	Id = 6435,
	Name = "A Hallway",
	Desc = [[
   This small hallway on the former 'ground floor' ran north-
south.  To the east is the stairwell that leads up into 
the shadowy recesses of the tower.  To the west is the
entrance way to the tower.  The north is completely blocked
off by lava, and the way south is still clear.
]],
	Exits = {
		east = 6434,
		south = 6438,
		west = 6436
	}
})
Config.NewRoom({
	Id = 6436,
	Name = "The Entranceway",
	Desc = [[
   This is a grand chamber with giant double-doors to the
west.  To the east is the main floor of the tower.  This
room is arranged highly attractively and very impressively,
with sculptures and tapistries everywhere.  The doors seem
impenetrable... you don't think you'd be able to get through
them if you really had to...
]],
	Exits = {
		east = 6435,
		west = 6437
	}
})
Config.NewRoom({
	Id = 6437,
	Name = "The Doorway",
	Desc = [[
   This was the entrance to the tower.  Now lava has blocked
it up completely.  However:
   It seems when the lava came down a man was outside the
doors.  He was blasted into the doors, and died instantly,
but his skeleton still clutches a staff in perfect 
condition...
]],
	Exits = {
		east = 6436
	}
})
Config.NewRoom({
	Id = 6438,
	Name = "The Hallway",
	Desc = [[
    This is the southern part of the hallway.  There is 
a door to the west, barred with gleaming bands of lights.
To the north is more hallway.
]],
	Exits = {
		north = 6435,
		west = 6439
	}
})
Config.NewRoom({
	Id = 6439,
	Name = "The Stairs",
	Desc = [[
   Stairs lead down here into the tower's basement, or you
can head east into the main floor of the tower.
]],
	Exits = {
		east = 6438,
		down = 6440
	}
})
Config.NewRoom({
	Id = 6440,
	Name = "The Stairs",
	Desc = [[
   Stairs lead up here to the main level, or you can go east
to the basement of the tower.
]],
	Exits = {
		east = 6441,
		up = 6439
	}
})
Config.NewRoom({
	Id = 6441,
	Name = "An Alcove",
	Desc = [[
   This alcove leads into a huge room to your north, and
to stairs leading down to the east, and stairs going 
up to your west.
]],
	Exits = {
		north = 6442,
		east = 6443,
		west = 6440
	}
})
Config.NewRoom({
	Id = 6442,
	Name = "The Laboratory",
	Desc = [[
   This laboratory has lots of stuff in it.  Beakers,
flasks, burners, tongs, mortars and pestles, jars filled
with normal things, jars filled with abnormal things, jars
filled with things you'd rather not think about...
A search could reveal many things...
]],
	Exits = {
		south = 6441
	}
})
Config.NewRoom({
	Id = 6443,
	Name = "The Stairs",
	Desc = [[
   Stairs lead down here to the second level of the basement,
or back west to the alcove.
]],
	Exits = {
		west = 6441,
		down = 6444
	}
})
Config.NewRoom({
	Id = 6444,
	Name = "The Stairs",
	Desc = [[
   Stairs lead up here to the first level of the basement, or
you can go east to another big room.
]],
	Exits = {
		east = 6445,
		up = 6443
	}
})
Config.NewRoom({
	Id = 6445,
	Name = "The Summoning Room",
	Desc = [[
   This room is darkly lit by a giant glowing pentagram in
the center of the room.  Bands of force encircle some
sort of being trapped inside.  You think that going
inside would be an EXTREMELY BAD idea...
]],
	Exits = {
		north = 6446,
		west = 6444
	}
})
Config.NewRoom({
	Id = 6446,
	Name = "Inside A Pentagram",
	Desc = [[
   The small god entrapped by the wizard looks at you with
an insane expression.  Four hundred years of imprisonment
doesn't do much for one's...

   OOPS!

   He killed you!
   You are dead, R.I.P.
]],
	Exits = {
		south = 6445
	}
})
