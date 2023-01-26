Config.NewRoom({
	Id = 5301,
	Name = "The Great Eastern Desert",
	Desc = [[
   A vast desert stretches for miles, the sands constantly shifting around
you.  Rising out of the sand to the north you see a mighty pyramid.
]],
	Exits = {
		north = 5302,
		east = 5041,
		south = 5051,
		west = 5036
	}
})
Config.NewRoom({
	Id = 5302,
	Name = "At The Base Of The Pyramid",
	Desc = [[
   The mighty pyramid towers above you out of the hot desert sands, made
from huge blocks of stone that have been coated over with a rough sandy
plaster-like substance.  The face of the pyramid is steep, but you think
you might be able to climb it.
]],
	Exits = {
		south = 5301,
		up = 5303
	}
})
Config.NewRoom({
	Id = 5303,
	Name = "Climbing The Great Pyramid",
	Desc = [[
   Hot air rises off the sides of the pyramid, and the wind chokes you with
a flurry of sand and dust.  So far you have made it halfway up the side.  The
walls of the pyramid are quite steep.
]],
	Exits = {
		north = 5304,
		south = 5305,
		up = 5308,
		down = 5302
	}
})
Config.NewRoom({
	Id = 5304,
	Name = "Climbing The Great Pyramid",
	Desc = [[
   Hot air rises off the sides of the pyramid, and the wind chokes you with
a flurry of sand and dust.  The walls of the pyramid are quite steep, and
you are having trouble keeping from sliding down into the sands below.
]],
	Exits = {
		east = 5306,
		west = 5303,
		up = 5308,
		down = 5308
	}
})
Config.NewRoom({
	Id = 5305,
	Name = "Climbing The Great Pyramid",
	Desc = [[
   Hot air rises off the sides of the pyramid, and the wind chokes you with
a flurry of sand and dust.  The walls of the pyramid are quite steep, and
you are having trouble keeping from sliding down into the sands below.
]],
	Exits = {
		east = 5306,
		west = 5303,
		up = 5308,
		down = 5308
	}
})
Config.NewRoom({
	Id = 5306,
	Name = "Climbing The Great Pyramid",
	Desc = [[
   Here on the eastern side of the pyramid there is a little more shelter
from the heat and wind.  The stone side is not nearly so slippery smooth
from the ravages of time, and you think you may be able to even reach the
top from here.
]],
	Exits = {
		north = 5304,
		south = 5305,
		up = 5307,
		down = 5308
	}
})
Config.NewRoom({
	Id = 5307,
	Name = "The Apex Of The Great Pyramid",
	Desc = [[
   Bathed in sweat, you have managed to reach the summit of the great
pyramid.  The four sides of the pyramid slope sharply down into the
hot sands in all four cardinal directions.
A plaque has been set into the sandy stones beneath your feet.
]],
	Exits = {
		north = 5308,
		east = 5306,
		south = 5308,
		west = 5308,
		down = 5309
	}
})
Config.NewRoom({
	Id = 5308,
	Name = "On The Dangerous Stones",
	Desc = [[
   Here the elements have carved away at the sides of the pyramid quite a 
bit.  You aren't so sure of your footing anymore...

Suddenly the wind picks up, and you lose your balance!
You tumble down the side of the pyramid, and fall to your death!

SPLAT.

Ouch.
]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 5309,
	Name = "A Ladder",
	Desc = [[
   You are climbing an ancient ladder that leads down into the depths of
the pyramid.  The air around is thick with layers of dust and a strange
musty smell.  Above you you see tiny beams of light coming through the
stones of the ceiling.
]],
	Exits = {
		up = 5307,
		down = 5310
	}
})
Config.NewRoom({
	Id = 5310,
	Name = "A Musty Chamber",
	Desc = [[
   You are standing in a dank, musty chamber just inside the pyramid. 
Footprints and other strange marks are set into the dusty floor here.
It would seem that some of the tenants of this monument are still alive.
Exits lead in all directions.   The door to the west is covered with
inscriptions.
]],
	Exits = {
		north = 5313,
		east = 5340,
		south = 5325,
		west = 5311,
		up = 5309
	}
})
Config.NewRoom({
	Id = 5311,
	Name = "The Fire Pool",
	Desc = [[
   This room is dominated by a massive raised pool that is filled with
not water but flames of intense heat.  The multicoloured flames lick out
at you, searching for things to burn.  The pool proceeds to the east into
a small chamber.
]],
	Exits = {
		east = 5310,
		west = 5312
	}
})
Config.NewRoom({
	Id = 5312,
	Name = "The Chamber Of The Efreet",
	Desc = [[
   You make your way across the fire pool, and into a small stone chamber.
Here the flames are nearly as high as your head, singeing your face and 
evaporating your sweat instantaneously.
]],
	Exits = {
		east = 5311
	}
})
Config.NewRoom({
	Id = 5313,
	Name = "A Tiny Crawlway",
	Desc = [[
   You have to go down onto your hands and knees to fit inside this tiny
space.  The crawlway is thick with sand and dust, and markings of the
passage of other creatures.
]],
	Exits = {
		north = 5314,
		south = 5310,
		up = 5338
	}
})
Config.NewRoom({
	Id = 5314,
	Name = "A Tiny Crawlway",
	Desc = [[
   You are on your hands and knees, inside a small crawlway that winds
through the inside of the pyramid.  The crawlway is thick with sand, dust, 
and markings of the passage of other creatures.
]],
	Exits = {
		south = 5313,
		west = 5315
	}
})
Config.NewRoom({
	Id = 5315,
	Name = "A Tiny Crawlway",
	Desc = [[
   You are on your hands and knees, inside a small crawlway that winds
through the inside of the pyramid.  The crawlway is thick with sand, dust, 
and markings of the passage of other creatures.
]],
	Exits = {
		east = 5314,
		west = 5316
	}
})
Config.NewRoom({
	Id = 5316,
	Name = "A Tightening In The Crawlway",
	Desc = [[
   Here you are forced to slide on your belly through a particularly tight
section of the crawlway, as the stones of the pyramid close together about
you.  Below you is a small, slippery-looking hole that plummets into
blackness.
]],
	Exits = {
		east = 5315,
		south = 5317,
		down = 5318
	}
})
Config.NewRoom({
	Id = 5317,
	Name = "The Crawlway's End",
	Desc = [[
   The crawlway shrinks away to nothing as the sandy stones of the pyramid
close together into a space through which only a snake could fit.   There is
barely enough space to turn around and make your way back through the tiny
crawlway to the north.
]],
	Exits = {
		north = 5316
	}
})
Config.NewRoom({
	Id = 5318,
	Name = "A Slippery Hole",
	Desc = [[
   The sides of this hole are slippery-smooth.  You lower yourself in, and 
proceed to move downward... when suddenly you lose your purchase!

You fall for what seems like an eternity, and smash into the stones below...



Under The Hole
   You are in a small chamber underneath the slippery hole, far below
the pyramid now.   The floor is strewn with bones.  To the south is a
small rocky crevasse.
]],
	Exits = {
		south = 5320,
		up = 0
	}
})
Config.NewRoom({
	Id = 5319,
	Name = "Under The Hole",
	Desc = [[
   You are in a small chamber underneath the slippery hole, far below
the pyramid now.   The floor is strewn with bones.  To the south is a
small rocky crevasse.
]],
	Exits = {
		south = 5320,
		up = 0
	}
})
Config.NewRoom({
	Id = 5320,
	Name = "A Rough Crevasse",
	Desc = [[
   You are now exploring deep within a strange rocky crevasse that plunges
down into the rock on which the pyramid was constructed.  To the south you
see the flickering light of a fire, and the crevasse proceeds downward.
]],
	Exits = {
		north = 5319,
		south = 5321,
		down = 5322
	}
})
Config.NewRoom({
	Id = 5321,
	Name = "A Small Fire",
	Desc = [[
   Here a small fire burns in a nook in the rocks, providing some warmth and
comforting light in the cold, dark, dry air.
Standing here is a strange-looking old man, who stares at you balefully.
]],
	Exits = {
		north = 5320
	}
})
Config.NewRoom({
	Id = 5322,
	Name = "Down The Crevasse",
	Desc = [[
   The crevasse proceeds downward into the dark depths of the earth.
The air about you is now cold and quite dry, and your light source
gutters in a cool breeze that wafts up from below.
]],
	Exits = {
		up = 5320,
		down = 5323
	}
})
Config.NewRoom({
	Id = 5323,
	Name = "At The Crevasse's End",
	Desc = [[
   Here the crevasse comes to an abrupt end.  A chilling wind howls
at your face from a black shape to the south, but the light from your
source is too dim to see exactly what it is.
]],
	Exits = {
		south = 5324,
		up = 5322
	}
})
Config.NewRoom({
	Id = 5324,
	Name = "The Vault Of The Lamp",
	Desc = [[
   The jaws of the massive stone tiger part wide to reveal a great vault.
An arched ceiling lies far above your head... and all about you is a low
guttural rumbling noise and a chill wind.
Giant heaps of ancient treasure, gold coins, and valuables surround you
on all sides.
]],
	Exits = {
		north = 5323
	}
})
Config.NewRoom({
	Id = 5325,
	Name = "A Crack In The Wall",
	Desc = [[
   You exhale, and squeeze yourself into the narrow crack in the wall.
Dust fills your eyes as you disturb it, and chunks of mortar and stone
mixed with a touch of sand fall on you as you scrape your way through.
]],
	Exits = {
		north = 5310,
		south = 5326
	}
})
Config.NewRoom({
	Id = 5326,
	Name = "A Looted Tomb",
	Desc = [[
  The floor of this small tomb is littered with the lids of 
smashed sarcophagi, bits of treasure dropped by thieves and
looters, and corpses pulled from their resting places.
]],
	Exits = {
		north = 5325,
		east = 5334,
		west = 5327
	}
})
Config.NewRoom({
	Id = 5327,
	Name = "A Demolished Tomb",
	Desc = [[
  This tomb has been utterly destroyed by thieves and looters in search of
the treasures of the pharoahs.  Nothing of interest remains in this room,
except a large stone coffin that leans against the western wall.
]],
	Exits = {
		east = 5326,
		west = 5328
	}
})
Config.NewRoom({
	Id = 5328,
	Name = "A Stairway",
	Desc = [[
   You stand now at the head of a stairway that goes down into darkness.
The steps and walls are smooth sandy stone, covered with a thick layer
of dust.  Some inscriptions are carved into the wall here.
]],
	Exits = {
		east = 5327,
		down = 5329
	}
})
Config.NewRoom({
	Id = 5329,
	Name = "A Stairway",
	Desc = [[
   You are on a stairway that disappears into darkness in both directions.
The smooth, uneven steps of the stairway have not been travelled in what
appears to be centuries.
]],
	Exits = {
		up = 5328,
		down = 5330
	}
})
Config.NewRoom({
	Id = 5330,
	Name = "A Stairway",
	Desc = [[
   You stand now at the base of the uneven stairway.  The walls, floor,
and ceiling of this small landing are covered with strange hieroglyphics.
]],
	Exits = {
		south = 5331,
		up = 5329
	}
})
Config.NewRoom({
	Id = 5331,
	Name = "The Ancient Hall",
	Desc = [[
   Here the air is deathly still, motes of dust thickly obscuring your
vision.  Several stone statues line the walls of the hall, depicting the 
gods of an ancient society.  Strange glyphs and sigils cover the walls, a 
peculiar pictorial form of written language that you don't understand.
   Some steps lead to a raised dais to the south.
]],
	Exits = {
		north = 5330,
		south = 5332
	}
})
Config.NewRoom({
	Id = 5332,
	Name = "A Raised Dais",
	Desc = [[
   You are at the southern end of the ancient hall, the dust and darkness
absorbing your light so that you cannot see past the steps of the dais.
A low pedestal rests here.  You see something written into the face of it.
]],
	Exits = {
		north = 5331,
		down = 5333
	}
})
Config.NewRoom({
	Id = 5333,
	Name = "The Tomb Of Ramses",
	Desc = "   You stand in an empty tomb, a cubicle no more then ten feet to a side.",
	Exits = {
		up = 5332
	}
})
Config.NewRoom({
	Id = 5334,
	Name = "A Ransacked Tomb",
	Desc = [[
  This tomb has been completely ransacked and destroyed by the actions
of pyramid thieves and looters.  The floor is littered with junk.
]],
	Exits = {
		east = 5335,
		west = 5326
	}
})
Config.NewRoom({
	Id = 5335,
	Name = "A Tunnel",
	Desc = "   The low-ceilinged tunnel runs east-west.",
	Exits = {
		east = 5336,
		west = 5334
	}
})
Config.NewRoom({
	Id = 5336,
	Name = "A Fork In The Tunnel",
	Desc = [[
   Here the tunnel forks off through a gaping hole down in the
southern wall, continuing onward to the east and west as well.
]],
	Exits = {
		east = 5337,
		south = 0,
		west = 5335,
		down = 5347
	}
})
Config.NewRoom({
	Id = 5337,
	Name = "A Tunnel",
	Desc = [[
   The low-ceilinged tunnel makes a turn to the west and ends
to the north as it spills out into a dusty hallway.
]],
	Exits = {
		north = 5343,
		west = 5336
	}
})
Config.NewRoom({
	Id = 5338,
	Name = "A Dank Chamber",
	Desc = [[
   This chamber has a dank, dusty, musty smell to it.  Small footprints
in the dust betray the recent passage of some sort of creatures.  A hole 
in the floor lies to the west and a stairway is to the east.
]],
	Exits = {
		east = 5339,
		west = 5313
	}
})
Config.NewRoom({
	Id = 5339,
	Name = "A Spiral Stairway",
	Desc = [[
   Some dusty, broken stone stairs here spiral slowly in a constricted
space down towards a dusty hallway.
]],
	Exits = {
		up = 5338,
		down = 5342
	}
})
Config.NewRoom({
	Id = 5340,
	Name = "A Dust-Covered Hallway",
	Desc = [[
   This hallway is covered with dust that has accumulated over the
centuries that the pyramid has stood.  Small markings and footprints
in the dust betray the recent passage of others -- perhaps thieves?
]],
	Exits = {
		east = 5341,
		west = 5310
	}
})
Config.NewRoom({
	Id = 5341,
	Name = "A Smelly Chamber",
	Desc = [[
   This small chamber has a sickly putrescent smell to it, the
smell of formaldehyde and other ointments used to preserve the
corpses of those who died ages ago.
]],
	Exits = {
		east = 5342,
		west = 5340
	}
})
Config.NewRoom({
	Id = 5342,
	Name = "A Dust-Covered Hallway",
	Desc = [[
   This hallway is covered with a thick, choking dust that rises
up to obscure your light source and sting your eyes.  Small marks
and footprints in the dust betray the recent passage of others.
]],
	Exits = {
		east = 5343,
		west = 5341,
		up = 5339
	}
})
Config.NewRoom({
	Id = 5343,
	Name = "A Turn In The Hallway",
	Desc = [[
   You are standing in an elbow turn in a dust-covered stone hallway,
that dead ends to the north and continues on to the west.  To the south
the stones of the pyramid have been torn asunder by thieves, making
a low-ceilinged tunnel.
]],
	Exits = {
		north = 5344,
		south = 5337,
		west = 5342
	}
})
Config.NewRoom({
	Id = 5344,
	Name = "A Dead End",
	Desc = [[
   The dust-covered hallway has come to an abrupt end at a stony,
featureless wall.  Here and there are signs of the recent passage
of others in the dust.
]],
	Exits = {
		south = 5343,
		down = 5345
	}
})
Config.NewRoom({
	Id = 5345,
	Name = "The Tomb Entrance",
	Desc = [[
   You are in a small, dark chamber that has stood undisturbed for
many years.  To the north stands a massive stone tomb, which is
covered in hieroglyphics and gold-lined carvings that mark it as the
final resting place of the mighty pharoahs of this land.
]],
	Exits = {
		north = 5346,
		up = 5344
	}
})
Config.NewRoom({
	Id = 5346,
	Name = "The Tomb Of The Pharoahs",
	Desc = [[
   Great golden sarcophogai line the walls of this massive tomb.  It has
withstood the passage of time intact, untouched by the hands of thieves
and looters.  The treasures taken by the pharoahs to their graves still
lie before your feet.
]],
	Exits = {
		south = 5345
	}
})
Config.NewRoom({
	Id = 5347,
	Name = "A Rubble-Strewn Hallway",
	Desc = [[
   This hallway formerly had a beautiful arch to the ceiling, now
collapsed under the weight of the slowly settling stones of the
pyramid.  Now, a massive pile of rubble leads up into a hole high 
in the northern portion of the hallway.  To the south, through the 
rubble and fallen stones you see a sandstone crypt.
]],
	Exits = {
		south = 5348,
		up = 5336
	}
})
Config.NewRoom({
	Id = 5348,
	Name = "A Sandstone Crypt",
	Desc = [[
   This small crypt is lit by a hole in the wall to the south, through
which sand pours from the desert outside.  A hot wind blows in from the
desert, drying your skin instantly.  To the east and north the arched
hallway continues.
]],
	Exits = {
		north = 5347,
		east = 5349,
		south = 5354
	}
})
Config.NewRoom({
	Id = 5349,
	Name = "An Arched Hall",
	Desc = [[
   This hallway has a beautiful arch to it, formed painstakingly and
exquisitely out of the sandy stones of the pyramid.  The dust that
covers most of the rest of the pyramid interior is not present here,
scoured away by the blowing of the desert winds that howl about
your ears.
]],
	Exits = {
		east = 5350,
		west = 5348
	}
})
Config.NewRoom({
	Id = 5350,
	Name = "An Arched Hall",
	Desc = [[
   This hallway has a beautiful arch to it, formed painstakingly and
exquisitely out of the sandy stones of the pyramid.  To the east is
a small, golden-coloured crypt, and the hall proceeds to the south
and north.
]],
	Exits = {
		north = 5349,
		east = 5351,
		south = 5352
	}
})
Config.NewRoom({
	Id = 5351,
	Name = "A Golden Crypt",
	Desc = [[
   You stand inside a small crypt with walls and ceiling made of
golden bricks that obscure the large sandy stones of the pyramid.
Small rugs and tapestries are scattered about the floor here, and
they appear to have been used recently.
]],
	Exits = {
		west = 5350
	}
})
Config.NewRoom({
	Id = 5352,
	Name = "An Arched Hall",
	Desc = [[
   This hallway has a beautiful arch to it, formed painstakingly and
exquisitely out of the sandy stones of the pyramid.  The arched
hall proceeds to the north and ends to the south in a small vault.
]],
	Exits = {
		north = 5350,
		south = 5353
	}
})
Config.NewRoom({
	Id = 5353,
	Name = "A Shining Vault",
	Desc = [[
   The stones of the pyramid here take on a strange, twinkling quality,
almost seeming to shine with an internal light.  As you look closer you
see tiny glass-like glittery particles within the stones, that reflect
the light from your light source so perfectly that they seem to shine.
]],
	Exits = {
		north = 5352
	}
})
Config.NewRoom({
	Id = 5354,
	Name = "A Massive Sand Dune",
	Desc = [[
   You stand now on a massive sand dune on the southern side of
the pyramid.  At the foot of the sand dune to the north you see a
small hole where the stones of the pyramid have collapsed.  Not
far to the south is a massive roiling sandstorm; the wind from the
storm howls and bites at your face even here.
]],
	Exits = {
		north = 5348,
		south = 5355
	}
})
Config.NewRoom({
	Id = 5355,
	Name = "A Swirling Sandstorm",
	Desc = [[
   You are caught in the midst of a massive sandstorm.  Howling winds
buffet you from all sides, and the sand tears at your skin, blinding
you and choking you.  You have lost all sense of direction.
]],
	Exits = {
		north = 5354,
		east = 5355,
		south = 5356,
		west = 5355
	}
})
Config.NewRoom({
	Id = 5356,
	Name = "A Swirling Sandstorm",
	Desc = [[
   You are caught in the midst of a massive sandstorm.  Howling winds
buffet you from all sides, and the sand tears at your skin, blinding
you and choking you.  You have lost all sense of direction.
]],
	Exits = {
		north = 5355,
		east = 5356,
		south = 5357,
		west = 5356
	}
})
Config.NewRoom({
	Id = 5357,
	Name = "A Swirling Sandstorm",
	Desc = [[
   You are caught in the midst of a massive sandstorm.  Howling winds
buffet you from all sides, and the sand tears at your skin, blinding
you and choking you.  You have lost all sense of direction.
]],
	Exits = {
		north = 5356,
		east = 5357,
		south = 5358,
		west = 5357
	}
})
Config.NewRoom({
	Id = 5358,
	Name = "A Swirling Sandstorm",
	Desc = [[
   You are caught in the midst of a massive sandstorm.  Howling winds
buffet you from all sides, and the sand tears at your skin, blinding
you and choking you.  You have lost all sense of direction.
]],
	Exits = {
		north = 5357,
		east = 5358,
		south = 5359,
		west = 5358
	}
})
Config.NewRoom({
	Id = 5359,
	Name = "A Massive Sand Dune",
	Desc = [[
   Somehow you managed to make your way through the howling winds
of the sandstorm, and clamber up on this sand dune.  You can see the
storm to the north of you, and presumably the pyramid is somewhere
beyond it.  Nothing but flat, featureless, open dunes of sand lie in
every other direction.
]],
	Exits = {
		north = 5358,
		south = 5360
	}
})
Config.NewRoom({
	Id = 5360,
	Name = "Through The Hole In The Sand",
	Desc = [[
   You squeeze through the small hole in the sand and land in a small
white chamber.  Above you is a small hole, reachable by climbing up
the small sandy slope down which you slid.
]],
	Exits = {
		up = 5359
	}
})
