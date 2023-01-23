Config.NewRoom({
	Id = 7201,
	Name = "The Treasury",
	Desc = [[   You are in a small but well equipped treasury.  You can see some writing
on the wall.  The ceiling has a funny glow, which enables you to see.  You
can get back into the inner lair through the stone door which is east.]],
	Exits = {
		east = 7202
	}
})
Config.NewRoom({
	Id = 7202,
	Name = "The Inner Lair",
	Desc = [[   You are in a octagonal room with smooth purple stone walls.  The floor is 
made from black stone.  In the western wall you see a large black stone door.]],
	Exits = {
		south = 7203,
		west = 7201
	}
})
Config.NewRoom({
	Id = 7203,
	Name = "The Lair",
	Desc = [[   On the floor you see a lot of human decay, like bones and skulls.  You
also see a lot of slime.  On the wall is a torch sitting in its sconce.  To
the north is a wooden door.]],
	Exits = {
		north = 7202,
		east = 7206,
		south = 7204
	}
})
Config.NewRoom({
	Id = 7204,
	Name = "The Lair",
	Desc = [[   On the floor you see a lot of human decay, like bones and skulls.  You
also see a lot of slime.  On the wall is a torch sitting in its sconce.]],
	Exits = {
		north = 7203,
		east = 7207,
		south = 7205
	}
})
Config.NewRoom({
	Id = 7205,
	Name = "The Lair",
	Desc = [[   On the floor you see a lot of human decay, like bones and skulls.  You
also see a lot of slime.  On the wall is a torch sitting in its sconce.]],
	Exits = {
		north = 7204,
		east = 7208,
		south = 7209
	}
})
Config.NewRoom({
	Id = 7206,
	Name = "The Lair",
	Desc = [[   On the floor you see a lot of human decay, like bones and skulls.  You
also see a lot of slime.  On the wall is a torch sitting in its sconce.]],
	Exits = {
		south = 7207,
		west = 7203
	}
})
Config.NewRoom({
	Id = 7207,
	Name = "The Lair",
	Desc = [[   On the floor you see a lot of human decay, like bones and skulls.  You
also see a lot of slime.  On the wall is a torch sitting in its sconce.]],
	Exits = {
		north = 7206,
		south = 7208,
		west = 7204
	}
})
Config.NewRoom({
	Id = 7208,
	Name = "The Lair",
	Desc = [[   On the floor you see a lot of human decay, like bones and skulls.  You
also see a lot of slime.  On the wall is a torch sitting in its sconce.]],
	Exits = {
		north = 7207,
		west = 7205
	}
})
Config.NewRoom({
	Id = 7209,
	Name = "The Lair Entrance",
	Desc = [[   You are in a dry part of the sewer.  To the north is a wooden door,
you can see some slime at the lower part of the door.  You also see
some skulls and some broken bones.]],
	Exits = {
		north = 7205,
		east = 7210
	}
})
Config.NewRoom({
	Id = 7210,
	Name = "The Crawlway",
	Desc = "   You are in a narrow crawlway.  It is rather boring here.",
	Exits = {
		east = 7211,
		west = 7209
	}
})
Config.NewRoom({
	Id = 7211,
	Name = "The Four-Way Junction",
	Desc = [[   You are in a sewer junction.  To the north is a small hole, to the west
is a narrow crawlway and to the east and south the sewer continues.]],
	Exits = {
		south = 7216,
		west = 7210
	}
})
Config.NewRoom({
	Id = 7212,
	Name = "The Small Cave",
	Desc = "   You are in a collapsed sewer drain, which now is more like a small cave.",
	Exits = {
		south = 7211
	}
})
Config.NewRoom({
	Id = 7213,
	Name = "The Sewer Drain",
	Desc = "   You are in a dry sewer drain which bends to the north.",
	Exits = {
		north = 7214,
		west = 7211
	}
})
Config.NewRoom({
	Id = 7214,
	Name = "The Sewer Drain",
	Desc = "   You are in a dry sewer drain which bends to the east.",
	Exits = {
		east = 7215,
		south = 7213
	}
})
Config.NewRoom({
	Id = 7215,
	Name = "The End Of The Drain",
	Desc = [[   You are at the end of the drain around you the sewer has collapsed, the
only exit is west.]],
	Exits = {
		west = 7214
	}
})
Config.NewRoom({
	Id = 7216,
	Name = "The Half-Wet Drain",
	Desc = [[   You are in a sewer drain where the floor is covered with water.  To
the north it looks more dry, south however the drain runs down into
some water.]],
	Exits = {
		north = 7211,
		south = 7217
	}
})
Config.NewRoom({
	Id = 7217,
	Name = "Under Water In The Sewer",
	Desc = [[   You are swimming in some dirty water and are holding your breath.  You'd
better continue onwards before you drown.  It is a good thing that you can
hold your light above the water-level.]],
	Exits = {
		south = 7218
	}
})
Config.NewRoom({
	Id = 7218,
	Name = "The Half-Dry Drain",
	Desc = [[   You are in a half-dry sewer drain.  To the north the drain runs a little
bit downwards into some water to the east you can see a small hole.  To the
west you see another drain.]],
	Exits = {
		north = 7217,
		east = 7219,
		west = 7220
	}
})
Config.NewRoom({
	Id = 7219,
	Name = "The Very Small Room",
	Desc = "   You are in a very small room, it is pretty uninteresting.",
	Exits = {
		west = 7218
	}
})
Config.NewRoom({
	Id = 7220,
	Name = "A Dry Sewer Drain",
	Desc = [[   You are in a dry but dirty sewer drain.  The drain continues east and
south.]],
	Exits = {
		east = 7218,
		south = 7221
	}
})
Config.NewRoom({
	Id = 7221,
	Name = "A Boring Drain",
	Desc = "   You are in yet another sewer drain.",
	Exits = {
		north = 7220,
		east = 7222
	}
})
Config.NewRoom({
	Id = 7222,
	Name = "The Sewer Drain",
	Desc = [[   You are in a sewer drain, there is nothing special in here, except for a 
loud echo.]],
	Exits = {
		east = 7223,
		west = 7221,
		up = 7130
	}
})
Config.NewRoom({
	Id = 7223,
	Name = "The Sewer Drain",
	Desc = "   You are in a drain, with some slimy water on the floor.",
	Exits = {
		east = 7224,
		west = 7222
	}
})
Config.NewRoom({
	Id = 7224,
	Name = "The Sewer Bend",
	Desc = [[   You find yourself in an ordinary sewer bend, which bends from west to
north.]],
	Exits = {
		north = 7225,
		west = 7223
	}
})
Config.NewRoom({
	Id = 7225,
	Name = "The Sewer Junction",
	Desc = [[   You stand in a junction of three sewer drains.  You see some odd
scratches on the pipe wall, as if from a gigantic rat.  North and
south the sewer continues as usual, but west it looks a little
strange.]],
	Exits = {
		south = 7224,
		west = 7230
	}
})
Config.NewRoom({
	Id = 7226,
	Name = "The Sewer",
	Desc = [[   You are in a sewer, where the slimy water runs down through a tiny hole.
You see some odd scratches on the pipe wall, as from a gigantic rat.  There 
is a sewer drain south.]],
	Exits = {
		south = 7225
	}
})
Config.NewRoom({
	Id = 7230,
	Name = "The Strange Sewer",
	Desc = [[   You are in a very strange sewer indeed, there are some odd scratches on
the pipe wall, as from a gigantic rat.  And you can see a lot of organic
decay like bones from animals AND humans.  West the drain runs slightly
upwards.]],
	Exits = {
		east = 7225,
		west = 7231
	}
})
Config.NewRoom({
	Id = 7231,
	Name = "The Damp Sewer",
	Desc = [[   You are in a sewer drain with a funny damp substance on the floor, in the 
substance you see a lot of decay.  You see some odd scratches on the wall,
as if from a gigantic rat.  Both to the east and west the pipe seems to run
down.]],
	Exits = {
		east = 7230,
		west = 7232
	}
})
Config.NewRoom({
	Id = 7232,
	Name = "The Strange Sewer",
	Desc = [[   You are in an ordinary sewer except for a lot of scratches on the sewer
wall, and a lot of debris on the floor.]],
	Exits = {
		east = 7231,
		west = 7233
	}
})
Config.NewRoom({
	Id = 7233,
	Name = "The Sewer",
	Desc = [[   You are in a sewer with more scratches on the walls.  And of course a whole
lot of decay.  The drain runs east and north.]],
	Exits = {
		north = 7234,
		east = 7232
	}
})
Config.NewRoom({
	Id = 7234,
	Name = "The Sewer Drain",
	Desc = [[   You stand in a sewer drain, you are able to see some kind of cave-like
room.  You see some odd scratches on the drain wall, as if from a gigantic
rat.  The sewer leads south.]],
	Exits = {
		east = 7235,
		south = 7233
	}
})
Config.NewRoom({
	Id = 7235,
	Name = "The Rat's Lair",
	Desc = [[   You are in a little cave.  You are able to see quite a lot of debris on
the floor.  There is a sewer drain west of here.]],
	Exits = {
		west = 7234
	}
})
Config.NewRoom({
	Id = 7280,
	Name = "The Wall Of The Abyss",
	Desc = [[   You hang onto some steps leading down into utter darkness.  There is an
exit leading up as well, though you'll have to open the tiny rock again to
do so.]],
	Exits = {
		up = 7112,
		down = 7300
	}
})
Config.NewRoom({
	Id = 7281,
	Name = "The Entrance",
	Desc = [[   You are in a very dark room.  You notice that some faces are staring at
you from inside the walls.  In the middle of the room there is a small altar.
To the north there is a small round door.]],
	Exits = {
		north = 7282,
		up = 7117
	}
})
Config.NewRoom({
	Id = 7282,
	Name = "The Corridor",
	Desc = [[   The corridor is glowing oppressively in a red hue.  You can hear wailing
through an open black hole to the east.  To the south there is a round door.]],
	Exits = {
		east = 7283,
		south = 7281
	}
})
Config.NewRoom({
	Id = 7283,
	Name = "The Realm Of Lost Souls",
	Desc = [[   You are standing in nothing.  All around you there are stars.
Sometimes a shadow flies closely by you, wailing very loudly.  To
the north there is a small bright hole.  To the west there is a
small red hole.]],
	Exits = {
		north = 7284,
		west = 7282
	}
})
Config.NewRoom({
	Id = 7284,
	Name = "The T-Crossing",
	Desc = [[   You are in a small hallway.  There are doors to the east and to
the west.  To the south there are a black hole.  There is writing
in the wall.  Wails can be heard from the south.]],
	Exits = {
		east = 7287,
		south = 7283,
		west = 7285
	}
})
Config.NewRoom({
	Id = 7285,
	Name = "The Firedeath",
	Desc = [[   This room is very hot.  There are flames surrounding you.  You can
see no exits at all!  Skeletons are lying all over the floor.]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 7286,
	Name = "The Torture Room",
	Desc = [[   You are standing in a middle of a square room.  Along the walls skeletons 
are hanging in rusty chains.  In the middle of the room there is a big metal 
box, covered with dust.  To the south you can just make out a small exit.]],
	Exits = {
		south = 7287
	}
})
Config.NewRoom({
	Id = 7287,
	Name = "The Hell Yard",
	Desc = [[   You are standing in a lot of mud.  A disgusting smell surrounds
the place, and makes you feel sick.  Small flames sometimes shoot
up from the hot mud.  To the west there is a small door.  To the 
north you can see an iron door.]],
	Exits = {
		north = 7286,
		west = 7284
	}
})
Config.NewRoom({
	Id = 7300,
	Name = "On The Walls Of The Abyss",
	Desc = [[   You are clutching the steps on the wall so that you don't fall to the
ground down below.  You cannot see anymore handholds below you and thus
this stops your journey down, as the only exit is up.]],
	Exits = {
		up = 7280
	}
})
Config.NewRoom({
	Id = 7301,
	Name = "Cave Entrance",
	Desc = [[   You are standing in the cave entrance.  It is very dark down here.  There
is writing on the wall.  There is an exit to the north.  A stairway leads up.]],
	Exits = {
		north = 7302,
		up = 7103
	}
})
Config.NewRoom({
	Id = 7302,
	Name = "Cave Tunnel",
	Desc = [[   You are walking in a tunnel.  It is very cold.  You can feel the presence
of a living thing... SOMEWHERE.]],
	Exits = {
		north = 7303,
		south = 7301
	}
})
Config.NewRoom({
	Id = 7303,
	Name = "Cave Room",
	Desc = "   You are standing in a room.  It is much cooler now.  The walls are glowing.",
	Exits = {
		east = 7304,
		south = 7302,
		west = 7322
	}
})
Config.NewRoom({
	Id = 7304,
	Name = "The Cave T-Cross",
	Desc = [[   You are standing in a mudlike substance.  The smell here is awful, it is
rotten.  To the west you can see some light.]],
	Exits = {
		east = 7305,
		south = 7309,
		west = 7303
	}
})
Config.NewRoom({
	Id = 7305,
	Name = "The Cave Turning-Point",
	Desc = [[   The mud is getting deeper.  You are wondering, 'Would it be an idea to
leave, before I disappear?'.  To the south you notice a flat round stone
is blocking the way.  To the west you can see mud.]],
	Exits = {
		south = 7306,
		west = 7304
	}
})
Config.NewRoom({
	Id = 7306,
	Name = "The Secret Room",
	Desc = [[   There is dust all over the place.  It looks like nobody has been here
for ages.  In the middle of the room you see a socket with a crystal globe.
The globe glows with a pulsing light.  To the north you see a stone door.
To the south you see a grey block.]],
	Exits = {
		north = 7305,
		south = 7307
	}
})
Config.NewRoom({
	Id = 7307,
	Name = "The Mudhole",
	Desc = [[   You are standing in a lot of mud.  The mud goes to your chest.  You feel
the presence of something IN the mud.  The only obvious exit is to the west.]],
	Exits = {
		north = 7306,
		west = 7308
	}
})
Config.NewRoom({
	Id = 7308,
	Name = "A Tunnel",
	Desc = "   The mud goes to your knees.  Otherwise the tunnel looks very normal.",
	Exits = {
		north = 7309,
		east = 7307,
		south = 7310
	}
})
Config.NewRoom({
	Id = 7309,
	Name = "The Long Tunnel",
	Desc = [[   Here there is almost no mud, as you stand at the top of a small rock.  Just
beside you there are a sign which says 'WARNING!  The worms are dangerous!']],
	Exits = {
		north = 7304,
		south = 7308
	}
})
Config.NewRoom({
	Id = 7310,
	Name = "The Hot Room",
	Desc = [[   You are very surprised, as this room for a change are hot instead of
cold.  To the north it goes downwards into some mud.  There are also an
exit to the west.]],
	Exits = {
		north = 7308,
		west = 7311
	}
})
Config.NewRoom({
	Id = 7311,
	Name = "The Small Room",
	Desc = [[   As you look around you notice a small statue.  There are exits to the west
and to the east.]],
	Exits = {
		east = 7310,
		west = 7312
	}
})
Config.NewRoom({
	Id = 7312,
	Name = "The Stalagmite Cave",
	Desc = [[   You are standing in a stalagmite cave.  Water is dripping from the walls.
It is very cold in here.]],
	Exits = {
		north = 7315,
		east = 7311,
		south = 7313
	}
})
Config.NewRoom({
	Id = 7313,
	Name = "The Stalagmite Tunnel",
	Desc = [[   You has entered a small tunnel.  Here it is quite dry.  Maybe it would be a
good idea to rest here.]],
	Exits = {
		north = 7312,
		west = 7314
	}
})
Config.NewRoom({
	Id = 7314,
	Name = "The Spongy Room",
	Desc = [[   You definitely do NOT like this area.  It is very dank, and most of the
room is wet.]],
	Exits = {
		east = 7313,
		west = 7346
	}
})
Config.NewRoom({
	Id = 7315,
	Name = "The Stalagmite T-Cross",
	Desc = [[   You are standing in a cross.  To the north you can see some light.
Otherwise it is dark.]],
	Exits = {
		north = 7318,
		east = 7316,
		south = 7312
	}
})
Config.NewRoom({
	Id = 7316,
	Name = "The Blind End Room",
	Desc = [[   This room is obviously a blind end.  To the north you see a primitive
picture.]],
	Exits = {
		north = 7317,
		west = 7315
	}
})
Config.NewRoom({
	Id = 7317,
	Name = "The Treasure Room",
	Desc = [[   This room is richly ornamented.  The walls have been carved to show
people dancing around a moon which is drawn on the floor.  It looks very
old, and it is very dusty.  To the south you see the back side of a secret
door.]],
	Exits = {
		south = 7316
	}
})
Config.NewRoom({
	Id = 7318,
	Name = "The Square Lair",
	Desc = [[   You are standing in the south-east part of the lair.  You can see a skeleton
lying in the corner.]],
	Exits = {
		north = 7319,
		west = 7321,
		south = 7315
	}
})
Config.NewRoom({
	Id = 7319,
	Name = "The Square Lair",
	Desc = [[   You are standing in the north-east part of the lair.
You see a sign on the wall.]],
	Exits = {
		east = 7322,
		south = 7318,
		west = 7320
	}
})
Config.NewRoom({
	Id = 7320,
	Name = "The Square Lair",
	Desc = [[   You are standing in the north-west part of the lair.  Here there is another
sign.  There is an exit from the lair to the north.]],
	Exits = {
		north = 7323,
		east = 7319,
		south = 7321
	}
})
Config.NewRoom({
	Id = 7321,
	Name = "The Lair End",
	Desc = [[   You can see a table in front of you.  It is very dusty.  Five skeletons are
sitting around the table.  Exits are north and east.]],
	Exits = {
		north = 7320,
		east = 7318
	}
})
Config.NewRoom({
	Id = 7322,
	Name = "The East Tunnel",
	Desc = [[   You are standing in dark tunnel, the exits are east and west.  To the west
you see a wooden door.]],
	Exits = {
		west = 7319,
		east = 7303
	}
})
Config.NewRoom({
	Id = 7323,
	Name = "The North Tunnel",
	Desc = "   You are standing in a dark tunnel, it leads upwards.",
	Exits = {
		north = 7324,
		south = 7320,
		west = 7337
	}
})
Config.NewRoom({
	Id = 7324,
	Name = "The L-Shaped Room",
	Desc = [[   You are standing in deep darkness.  To the south there is a small exit.
To the east you can see a gaping hole.]],
	Exits = {
		east = 7325,
		south = 7323
	}
})
Config.NewRoom({
	Id = 7325,
	Name = "The Circular Hall",
	Desc = [[   You are standing in round hall.  To the north, east and south you can see
a stone head hanging on the walls.]],
	Exits = {
		north = 7325,
		east = 7326,
		south = 7325,
		west = 7324
	}
})
Config.NewRoom({
	Id = 7326,
	Name = "A Dusty Tunnel",
	Desc = [[   You are standing in dust.  This place has not been touched for a long time. 
Otherwise it is quite boring here, looks like a place to rest!  To the west
you see the outline of a door.  A tunnel leads to the east.]],
	Exits = {
		east = 7327,
		west = 7325
	}
})
Config.NewRoom({
	Id = 7327,
	Name = "The Crossing",
	Desc = [[   You are standing in a crossing of hallways.  You can leave this place
in every direction, except up and down.  In the dust you notice strange
footprints.]],
	Exits = {
		north = 7332,
		east = 7331,
		south = 7328,
		west = 7326
	}
})
Config.NewRoom({
	Id = 7328,
	Name = "The L-Shaped Room",
	Desc = [[   You are standing in a L-shaped room.  You can hear noises from the long
tunnel to the east.  You feel very afraid!
A sign is hanging on the wall.]],
	Exits = {
		north = 7327,
		east = 7329
	}
})
Config.NewRoom({
	Id = 7329,
	Name = "The Dragon's Lair",
	Desc = [[   You can see burned walls, the floorstones are fiery red.  All kinds
of bones are scattered all over the floor.  On the walls you can see
some burned shapes.  You smell burnt flesh.  Two creatures are half
melted into the floor.]],
	Exits = {
		north = 7330,
		west = 7328
	}
})
Config.NewRoom({
	Id = 7330,
	Name = "The Burnt Room",
	Desc = [[   You are in a room, which once has at one time been quite burnt.  There
is writing on the wall.]],
	Exits = {
		south = 7329,
		west = 7331
	}
})
Config.NewRoom({
	Id = 7331,
	Name = "The Windy Tunnel",
	Desc = "   You are standing in a tunnel.  Above you, you can feel a breeze.",
	Exits = {
		east = 7330,
		west = 7327
	}
})
Config.NewRoom({
	Id = 7332,
	Name = "The Glittering Room",
	Desc = [[   This room is very bright.  On the walls you can see some silver.  Exits
are west, east and south.]],
	Exits = {
		east = 7333,
		south = 7327,
		west = 7334
	}
})
Config.NewRoom({
	Id = 7333,
	Name = "The Secret Passageway",
	Desc = "   You have entered a tiny room.  There is only an exit to the west.",
	Exits = {
		west = 7332
	}
})
Config.NewRoom({
	Id = 7334,
	Name = "The End Of Long Tunnel",
	Desc = [[   You are at a end of a long tunnel.  Right in front of you, you can see a
grey mass.  To the east you can see a tremendously long tunnel, but you know
that, you were just there.]],
	Exits = {
		east = 7332,
		west = 7335
	}
})
Config.NewRoom({
	Id = 7335,
	Name = "The Stair-Room",
	Desc = [[   You are standing in a small room.  Drawings of faces in pain are on the
walls.  You can feel that darkness is ruling the place.  There is one exit:
south.]],
	Exits = {
		south = 7336
	}
})
Config.NewRoom({
	Id = 7336,
	Name = "A Dark Tunnel",
	Desc = [[   You are standing in a dark tunnel.  It continues to the north and to the
south.  Bones are spread on the floor.]],
	Exits = {
		north = 7335,
		south = 7337
	}
})
Config.NewRoom({
	Id = 7337,
	Name = "The Entrance To The Lair",
	Desc = [[   The smell here is awful.  To the south you can see some smoke.  A tunnel
leads north and east.]],
	Exits = {
		north = 7336,
		south = 7338,
		east = 7323
	}
})
Config.NewRoom({
	Id = 7338,
	Name = "The North-Eastern Part Of The Basilisk's Cave",
	Desc = [[   It is hard to see here because of the smoke.  To the north you can barely
see a small tunnel.  Other exits are to the south and to the west.]],
	Exits = {
		north = 7337,
		south = 7339,
		west = 7340
	}
})
Config.NewRoom({
	Id = 7339,
	Name = "The South-Eastern Part Of The Basilisk's Cave",
	Desc = [[   There is a very small hole in wall from which the smoke is coming from. 
Otherwise it is pitch black.  Exits are north and west.]],
	Exits = {
		north = 7338,
		west = 7341
	}
})
Config.NewRoom({
	Id = 7340,
	Name = "The North-Western Part Of The Basilisk's Cave",
	Desc = [[   You can see some hay spread on the floor.  The smell is awful here, and it
makes you feel sick.  This place where the Basilisk sleeps.  Watch out...
maybe it is not far from here...]],
	Exits = {
		east = 7338,
		south = 7341
	}
})
Config.NewRoom({
	Id = 7341,
	Name = "The South-Western Part Of The Basilisk's Cave",
	Desc = "   You can see nothing but smoke.  ",
	Exits = {
		east = 7339,
		south = 7342
	}
})
Config.NewRoom({
	Id = 7342,
	Name = "The Small Cave",
	Desc = [[   You are standing in small cave.  You can see some light at the end.  Exits
are north and south.]],
	Exits = {
		north = 7341,
		south = 7343
	}
})
Config.NewRoom({
	Id = 7343,
	Name = "The Northern End Of The Pool",
	Desc = [[   You have wet feet, you are standing in water.  The water looks calm.  You
can see that it is a big lake.  Light seeps from the water.]],
	Exits = {
		north = 7342,
		east = 7344,
		south = 7345
	}
})
Config.NewRoom({
	Id = 7344,
	Name = "The Pool",
	Desc = [[   You are swimming in water.  It is getting deep here.  It is also dark in
this end.]],
	Exits = {
		south = 7346
	}
})
Config.NewRoom({
	Id = 7345,
	Name = "The South End Of The Pool",
	Desc = "   You standing in water up to your neck!  You can only see water.",
	Exits = {
		east = 7346
	}
})
Config.NewRoom({
	Id = 7346,
	Name = "The Pool",
	Desc = "   You are swimming in DARKNESS.  You feel something touching your right leg.",
	Exits = {
		east = 7314,
		west = 7345
	}
})
