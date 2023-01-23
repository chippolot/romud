Config.NewRoom({
	Id = 6201,
	Name = "In The Forest",
	Desc = [[   The trail ends here where the mountains begin abruptly.
Looking up, you note that the climb would be rough,
hazardous, and probably not worth the effort; the energy
barrier continues up the mountain side out of sight.  The
only exit is back to the east.]],
	Exits = {
		east = 6202
	}
})
Config.NewRoom({
	Id = 6202,
	Name = "In The Forest",
	Desc = [[   To the west the mountains rise high up, rocky and
lifeless.  The trail you are walking on heads west
to the end of the forest, and back east.  Each way the
strange energy barrier stands just to the north,
inscrutable, magical, and impenetrable.]],
	Exits = {
		east = 6203,
		west = 6201
	}
})
Config.NewRoom({
	Id = 6203,
	Name = "In The Forest",
	Desc = [[   This trail runs parallel to the energy barrier to your
north, seemingly all the way up to the mountains to the
west that form the boundries of this valley.  Walking
along, you scare a small squirrel, which leaps through
the barrier without a second thought!  Your hand is still
repulsed by the magical field, however.]],
	Exits = {
		east = 6204,
		west = 6202
	}
})
Config.NewRoom({
	Id = 6204,
	Name = "In The Forest",
	Desc = [[   The northern pathway stops abruptly here, halted by
some sort of glowing energy barrier running through the
woods.  A game trail, seemingly well traveled, runs east-
west along the magical barrier's length.  Very strange.]],
	Exits = {
		east = 6205,
		south = 6140,
		west = 6203
	}
})
Config.NewRoom({
	Id = 6205,
	Name = "In The Forest",
	Desc = [[   The energy barrier runs through the woods on its east-
west course here, just north of the trail you are walking
on.  A faint humming seems to eminate from the glowing
field, pushing the normal sounds of the forest into the
background.  For a short moment, you wonder if the field
is keeping something in, or you out.  It makes you
wonder...]],
	Exits = {
		east = 6206,
		west = 6204
	}
})
Config.NewRoom({
	Id = 6206,
	Name = "In The Forest",
	Desc = [[   The energy field makes a sudden ninety-degree turn
here, running to the north and west out of sight through
the thickening woods.  The trail you are on curves to
skirt the edge of the magical barrier in either direction.
Curious... who or what is keeping this field in place,
and for what purpose?]],
	Exits = {
		north = 6207,
		west = 6205
	}
})
Config.NewRoom({
	Id = 6207,
	Name = "In The Forest",
	Desc = [[   The woods thicken here, and surpisingly, you see a tree
completely cut in half by the magical barrier running
north-south here.  The tree looks healthy and unaffected
by the energy field passing right through its center.
Odd...]],
	Exits = {
		north = 6208,
		south = 6206
	}
})
Config.NewRoom({
	Id = 6208,
	Name = "In The Forest",
	Desc = [[   The magical energy barrier runs straight north-south,
unaffected by dips in the grounds, intervening rocks and
trees, everything.  From the north, you hear a faint
rushing noise above the humming of the field.  The trail
you are on continues to the north and south, only a few
feet away from the barrier it follows.]],
	Exits = {
		north = 6209,
		south = 6207
	}
})
Config.NewRoom({
	Id = 6209,
	Name = "In The Forest",
	Desc = [[   Here the field changes color, becoming almost
transparent.  Beyond, you think you can make out a few
shapes, but nothing too terribly distinct.  From the north
comes the rushing sound of water, and through the trees
you believe you can see a river cutting through the
forest.  The trail you are on leads north-south through
the woods, following the energy barrier all along its
length.]],
	Exits = {
		north = 6210,
		south = 6208,
		west = 6211
	}
})
Config.NewRoom({
	Id = 6210,
	Name = "The River's Edge",
	Desc = [[   A river flows through the forest here, its water clean
and clear.  The energy barrier runs right out into the
middle of the river, and then makes another ninety-degree
turn to the west.  The water seems to have no problem
penetrating the magical field, however.
   The river seems too wide and too swift to cross here.
It appears the only way to go is back to the south.]],
	Exits = {
		south = 6209
	}
})
Config.NewRoom({
	Id = 6211,
	Name = "Just Passing Through...",
	Desc = [[   The energy barrier seems to push against you
ineffectively as you shove your way through it.  All your
hairs stick up on your body from the static electricity,
and electric shocks sting your body from every metallic
piece of equipment you are carrying.  You think with a
final shove, you can break through to the other side...]],
	Exits = {
		east = 6209,
		west = 6212
	}
})
Config.NewRoom({
	Id = 6212,
	Name = "By The Barrier",
	Desc = [[   To the west the magical energy barrier crackles and
hums to itself, almost looking harmless.  Almost -- all
around on the ground are charred corpses and bodies.
Several poles with skulls on top face to the west, warning
travellers on the forest paths away from here.  The air
smells of death and decay, and the air is very still.  You
feel uncomfortable.]],
	Exits = {
		east = 6211,
		west = 6213
	}
})
Config.NewRoom({
	Id = 6213,
	Name = "A Clearing In The Forest",
	Desc = [[   Several trails in the forest intersect here in a small
clearing.  The dirt seems matted down, and you see many
footprints in the soil.   Nearby you hear a bird's chirp
abruptly cut off in a loud squawk, and then silence.  The
paths seem well-traveled, the undergrowth matted down and
the foilage hacked away to leave plenty of room or a
traveller to pass in every cardinal direction, excepting
the west path seems fairly overgrown...
   You feel watched.]],
	Exits = {
		north = 6214,
		east = 6212,
		south = 6218,
		west = 6229
	}
})
Config.NewRoom({
	Id = 6214,
	Name = "A Forest Trail",
	Desc = [[   The northern trail winds through the trees, heading
from a forest clearings to the south to where there appears
to be a river's edge to the north.  This trail appears to
be well-used and you spot many tracks in the earth.  Again
the hairs on the back of your neck stand up, and you wonder
if you're being spied upon.]],
	Exits = {
		north = 6215,
		south = 6213
	}
})
Config.NewRoom({
	Id = 6215,
	Name = "The River's Edge",
	Desc = [[   A beautiful river flows swiftly by, the current looking
quite dangerous in fact.  Out in the center of the river
you spot the energy barrier enclosure... no way out here.
Looking up, you see a bird fly right through the barrier
overhead and wonder as to the force field's nature.  This
path leads south into the forest, and westwards along the
river's edge.]],
	Exits = {
		south = 6214,
		west = 6216
	}
})
Config.NewRoom({
	Id = 6216,
	Name = "The River's Edge",
	Desc = [[   The river flows on its course, unhampered by the energy
barrier passing right down its center for as far as you
can see in both directions.  The path you are on travels
along the length of the river to the east and west
inbetween the water and the forest's edge.  Once again you
shiver and feel that unmistakeable sense that you are
being watched.  Disturbing.]],
	Exits = {
		east = 6215,
		west = 6217
	}
})
Config.NewRoom({
	Id = 6217,
	Name = "The River's Edge",
	Desc = [[   A large out-cropping of rock blocks this path along the
river to the west, and you don't spot any way around it; 
the woods are too thick to the south, the river too swift 
to the north, the magical barrier above you.  This is a 
nice area, however, as evidenced by the amount of traffic
this path gets.  From the marks in the grass, you guess 
that this is a favored resting spot.]],
	Exits = {
		east = 6216
	}
})
Config.NewRoom({
	Id = 6218,
	Name = "A Forest Trail",
	Desc = [[   This well-used forest trail leads south.  Among the 
foot-tracks in the dirt, you spot a few animal tracks as 
well, leading you to believe that these trails are used by
hunters.  Why would they be enclosed in this manner, 
however?
   There is a clearing to the north, and the path
continues to the south.]],
	Exits = {
		north = 6213,
		south = 6220
	}
})
Config.NewRoom({
	Id = 6219,
	Name = "A Forest Trail",
	Desc = [[   This trail leads north-south... obviously a gaming
trail.  The woods, mostly deciduous trees with the
accompanying ground foilage, crowd in to either side.
A shrub to your left shows a fresh cutting wound...
looks like a sharp object like a knife or machete did
the damage.
   A crackle in the leaves spins you around, to see
nothing.  Something is watching you, you feel it.
Where?]],
	Exits = {
		north = 6234,
		south = 6227
	}
})
Config.NewRoom({
	Id = 6220,
	Name = "A Forest Trail",
	Desc = [[   The trail changes direction here, turning to the north 
and west.  A large tree to your south bears an interesting
artifact; a rusty arrowhead embedded in the wood.  It 
looks as if the arrow had been  broken off at the head, 
the wood scratched at, and the arrowhead left behind.  
Otherwise, there doesn't seem to be much of interest in 
this particular section of the woods.]],
	Exits = {
		north = 6218,
		west = 6221
	}
})
Config.NewRoom({
	Id = 6221,
	Name = "A Forest Trail",
	Desc = [[   This is a winding east-west path through the thickening
forest.  The grass along the path is matted down from 
frequent traffic.  The path continues to the east, and 
there seems to be a small clearing to the west.
   A faint noise makes you stand stock still.  You could 
have sworn you heard a voice nearby.  Whatever it was, it 
wasn't speaking common.]],
	Exits = {
		east = 6220,
		west = 6222
	}
})
Config.NewRoom({
	Id = 6222,
	Name = "A Small Clearing",
	Desc = [[   In the middle of this small clearing in the forest is a
fairly large rock sticking up out of the ground.  Paths 
lead away to the east, west, and south from here.  The 
trees above block out the sky fairly effectively, also
blotting out the glowing energy barrier above your head.]],
	Exits = {
		east = 6221,
		south = 6223,
		west = 6228
	}
})
Config.NewRoom({
	Id = 6223,
	Name = "A Forest Trail",
	Desc = [[   A smaller northern path leads away from the main east-
west trail here towards a clearing.  The main path leads 
windingly around the trees to the east and west, the woods
blocking out whatever may be ahead.  Again you get that 
strange feeling of being watched.]],
	Exits = {
		north = 6222,
		east = 6224,
		west = 6226
	}
})
Config.NewRoom({
	Id = 6224,
	Name = "A Forest Trail",
	Desc = [[  The trail leads east and west here through the forest.  
To the west you spot an area where a smaller path breaks 
off from the main track.  Eastwards seems to be another 
small clearing that seems to be well used; there are many
tracks leading in that direction.]],
	Exits = {
		east = 6225,
		west = 6223
	}
})
Config.NewRoom({
	Id = 6225,
	Name = "The Dead End",
	Desc = [[   The ground has been cleared of vegetation in this small
clearing, and several large, man-made salt licks lie on
the ground and stand on poles here.  There are many animal
tracks in the earth -- the salt licks must attract 
wildlife for miles around.  You think this would be a good
place to hide and wait for dinner if you were a hunter...]],
	Exits = {
		west = 6224
	}
})
Config.NewRoom({
	Id = 6226,
	Name = "A Forest Trail",
	Desc = [[   This trail leads east-west through the forest foilage,
around the trees and up and down the slight rises.  The
area is quiet and serene, except for the energy barrier
keeping you in to the south.  For just a moment, you wonder
if you're still being watched...]],
	Exits = {
		east = 6223,
		west = 6227
	}
})
Config.NewRoom({
	Id = 6227,
	Name = "A Forest Trail",
	Desc = [[   The trail bends here, leading away to the north and 
east.  Far off the the distance you hear the squawk of a 
large bird-of-prey searching the skies for a meal.  The 
ferns around you rustle gently in the light breeze.  
Somehow, the threatening aura that pervades over the rest
of the area seems absent here.  You feel almost relaxed...]],
	Exits = {
		north = 6219
	}
})
Config.NewRoom({
	Id = 6228,
	Name = "A Forest Trail",
	Desc = [[   A bend in the forest trail allows you to go east and
north here.  To the east you spot a small clearing, while
northwards this trail seems to join a much larger one 
leading through the woods.  On the ground is half of a 
broken knife handle, made of bone and dried leather,
useless now.  You wonder if the owner is watching you 
now -- something certainly is.]],
	Exits = {
		north = 6233,
		east = 6222
	}
})
Config.NewRoom({
	Id = 6229,
	Name = "A Forest Trail",
	Desc = [[   This path leads from the main clearing to the west to 
intersect with a north-south path just to the east.  A 
small sapling on the north side of the trail has a rope 
tied around one of its top branches; an unused snare 
evidently.  You still feel as if you're being watched in 
the back of your mind, and adrenaline pumps into your
brain like a lightning fuzz.]],
	Exits = {
		east = 6213,
		west = 6230
	}
})
Config.NewRoom({
	Id = 6230,
	Name = "A Forest Trail",
	Desc = [[   A north-south trail leads through the woods here, with 
a small side trail leading off to the east.  The trees 
provide adequate cover from the sky, but through a few 
holes in the foilage you spot the magical barrier above 
you, keeping you from escaping by flight.  You feel 
slightly captured.]],
	Exits = {
		east = 6229,
		south = 6231
	}
})
Config.NewRoom({
	Id = 6231,
	Name = "A Forest Trail",
	Desc = [[   Two trails come together here, a large northern path 
heading away from tracks leading to the east and west.  
The western path seems to be the most traveled, and the 
east hardly at all.  There seems to be less trees around 
here... it seems as if many have been cut down by some
sort of crude tools.  This land clearing appears to be 
especially true to the east.]],
	Exits = {
		north = 6230,
		east = 6232,
		west = 6233
	}
})
Config.NewRoom({
	Id = 6232,
	Name = "A Clearing",
	Desc = [[   The trees have been cut down around here, and many of 
the trunks hollowed out with sharp stones and lined with 
treated leather to make almost-waterproof tubs.  A foul 
smelling brown fluid, tannin evidently, fills many of 
these, soaking into various bits and pieces of animal 
hides.  Crude, but workable.]],
	Exits = {
		west = 6231
	}
})
Config.NewRoom({
	Id = 6233,
	Name = "A Forest Trail",
	Desc = [[   The trail is widening to the west, where the path leads
all the way up to the side of the mountains that enclose 
this valley.  Many of the trees have been cut down around
here, and it definitely looks as if the forest is ending.
Eastwards the trail leads on into the thick of the forest.
A small split off trail leads away to the south here.]],
	Exits = {
		east = 6231,
		south = 6228,
		west = 6234
	}
})
Config.NewRoom({
	Id = 6234,
	Name = "A Forest Trail",
	Desc = [[   The ground is growing more rocky here.  The trees and 
other foilage in the forest grow sparse here, finding it 
hard to find purchase in the soil.   The forest ends just 
to the west, with the trail you are on leading right on up
to the side of the mountains.  A side trail leads south 
here, and the trail also leads back into the thick of the 
forest to the east.]],
	Exits = {
		east = 6233,
		south = 6219,
		west = 6235
	}
})
Config.NewRoom({
	Id = 6235,
	Name = "A Rocky Trail",
	Desc = [[   The ground is getting very rocky here, causing the 
trees of the woods to become more sparse.  Several bushes 
have found purchase in the soil, but not near enough to 
block free movement in this area.  The trail leads on up 
to what appears to be a cave in the side of the mountain 
to the west, and a side trail runs along the forest's edge
to the north.  To the east, the trail runs deep into the 
forest out of sight.]],
	Exits = {
		north = 6242,
		east = 6234,
		west = 6243
	}
})
Config.NewRoom({
	Id = 6236,
	Name = "A Forest Trail",
	Desc = [[   The trail you are on bends around a large double-
trunked tree and leads away to the north and west.  The 
green canopy of leaves overhead make this area fairly dark
and ominous, and that creepy 'watched' feeling returns to
hit you with full force.]],
	Exits = {
		south = 6230,
		west = 6237
	}
})
Config.NewRoom({
	Id = 6237,
	Name = "A Forest Trail",
	Desc = [[   The trail continues here to the east and west, with a 
small trail splitting off towards a large clearing to the
south.  Two wooden poles with skulls on top warn you away
from the south, and succeed in making you feel quite
uncomfortable.  Strange...]],
	Exits = {
		east = 6236,
		south = 6238,
		west = 6239
	}
})
Config.NewRoom({
	Id = 6238,
	Name = "A Large Clearing",
	Desc = [[   The earth has been upturned many times here, and
several white rocks stick up from the ground in odd
positions.
   Graveyard.
   This must be where they bury their dead -- just dig a
hole and throw the corpse inside, ignoring any previous
occupants in the ground.  How uncivilized... you hope you
aren't taken care of in this matter when your time
comes...]],
	Exits = {
		north = 6237
	}
})
Config.NewRoom({
	Id = 6239,
	Name = "A Forest Trail",
	Desc = [[   The trail splits here, one fork heading north towards 
the rushing sounds of a river, and west where the forest 
seems to be thinning out a lot.  A sudden motion out of 
the corner of your eye catches your eyes, and you turn 
your head.  Nothing, there's nothing there at all.
   You wonder if you're being stalked.]],
	Exits = {
		north = 6240,
		east = 6237,
		west = 6242
	}
})
Config.NewRoom({
	Id = 6240,
	Name = "A River's Edge",
	Desc = [[   The river flows swiftly on its course to the north.
The trail you are on leads on by the water's edge to the
west, and back into the forest to the south.  A large
boulder is just to the west, blocking all travel in that
direction.  Out in the center of the river, the 'roof' of
the energy field meets the northern 'wall'.  The water
passes right on through the magical barrier, however...
the barrier is obviously porous to some materials.]],
	Exits = {
		south = 6239,
		west = 6241
	}
})
Config.NewRoom({
	Id = 6241,
	Name = "A River's Edge",
	Desc = [[   The river pours down the side of the mountains to the 
west, originating from a large hole in the face of one of 
the sheer rock protuberances.  The energy barrier climbs 
right up the mountain, and seals off any means of escape 
by that means.  The trail you are on runs by the side of 
the river to the east, and a path leads by the forest side
to the south.]],
	Exits = {
		east = 6240,
		south = 6242
	}
})
Config.NewRoom({
	Id = 6242,
	Name = "A Rocky Trail",
	Desc = [[   The forest is just to your west, with a side trail 
leading deep inside from here.  The main trail you are on,
however, heads north towards the river, and south near 
where a trail leads up to a cave in the mountain side.  
There doesn't seem to be a whole lot to capture your 
attention here...]],
	Exits = {
		north = 6241,
		east = 6239,
		south = 6235
	}
})
Config.NewRoom({
	Id = 6243,
	Name = "A Cave Entrance",
	Desc = [[   You are half blinded by the differences of the outdoors
illumination and the pure darkness of the cave.  A deep,
cloying stench flows out from the cave mouth; the smells
of decay, unwashed bodies, and sickness in one roiling 
odor.  Your stomach turns involuntarily, and you wonder 
about going back down the hill to the east, instead of 
going even further down the western tunnel.]],
	Exits = {
		east = 6235,
		west = 6244
	}
})
Config.NewRoom({
	Id = 6244,
	Name = "A Tunnel Forking",
	Desc = [[   The tunnel forks here, one branch leading north, the 
other west.  Additionally, you can head back outside to 
the east, which seems like a very good idea to your 
tortured nasal passages.  Your eyes water from the stench,
and you clench your left hand tightly to keep control of 
your bile.
   Forcing your eyes open, you notice the warning signs
painted around the tunnel to the north.]],
	Exits = {
		north = 6256,
		east = 6243,
		west = 6245
	}
})
Config.NewRoom({
	Id = 6245,
	Name = "A Tunnel",
	Desc = [[   The floor is slick with the humidity that boils out of
the lower reaches of this cave, bringing that most awful 
smell with it.  Again, you consider saving your nose the 
trip west and down the tunnel, and heading back east to 
the cave entrance.]],
	Exits = {
		east = 6244,
		west = 6246
	}
})
Config.NewRoom({
	Id = 6246,
	Name = "A Tunnel",
	Desc = [[   The tunnel takes a deep dip here, and opens up into a 
largish cave to the west.  There seems to be a few faint 
lights from inside, and you hear some heavy breathing and 
low grunts from that direction.  The cave entrance to the 
east seems far too far away for your comfort...]],
	Exits = {
		east = 6245,
		west = 6252
	}
})
Config.NewRoom({
	Id = 6247,
	Name = "A Cave",
	Desc = [[    Heaps of rotting meat and cups of near-drinkable water
sit here; the orc food stores.  You stand here and wonder
in near-disbelief at how the orcs could find this stuff
palatable.  They're orcs; its their nature and their
stomachs you guess.  Oddly enough, you don't even care to 
catalog what they have available -- there's no chance you're 
going to take any of this...]],
	Exits = {
		east = 6248,
		south = 6250
	}
})
Config.NewRoom({
	Id = 6248,
	Name = "A Cave",
	Desc = [[   A single corpse lies here, well away from a pile of 
similars to the east.  There are several sharpened stakes 
and rocks sitting about conveniently.  The way the corpse 
is lying, the stone next to its hand... this is a suicide 
area!  You look down upon the orc and comprehend its 
suffering in its twisted form.  How sad.]],
	Exits = {
		east = 6249,
		south = 6251,
		west = 6247
	}
})
Config.NewRoom({
	Id = 6249,
	Name = "A Cave",
	Desc = [[   There are bodies here... corpses.  Orcs, the lot of 
them, every single one of them horribly disfigured in 
some senseless way; one whose arms were removed, another 
who lacks anything that could sensibly be called a face. 
A few twitch feebly with the last remains of life, the 
rest just decompose.  The dim sense of horror budding in 
your head blossoms as you realize the pile in the corner 
consists of dead orc children awaiting burial.]],
	Exits = {
		south = 6252,
		west = 6248
	}
})
Config.NewRoom({
	Id = 6250,
	Name = "A Cave",
	Desc = [[   A few sleeping pallets, made of moldy straw and 
stinking furs are arranged around a small firepit here.  
A wooden cup, carved by a crude tool and cruder hands 
sits near the ashes filled with water you consider 
undrinkable.  Somewhere to the east you hear an orc 
child's whining cry, and a voice hushes it urgently.  
Beware, orcs!  Adventurers are here!  Hide your children!]],
	Exits = {
		north = 6247,
		east = 6251,
		south = 6253
	}
})
Config.NewRoom({
	Id = 6251,
	Name = "A Cave",
	Desc = [[   Several grass sleeping pallets are here, clustered 
around the remains of an old fire.  The sloping of the 
cave's ceiling allow for smoke ventilation towards the 
surface in here you note, lucky for the orcs.  A few 
strings of burnt meat still hang over the fire, untended 
and uneaten.  On the floor near your feet you spy a small, 
twisted piece of wire... one orc's idea of a treasured ring, 
no doubt.  Kicking the trinket away, you try to push the 
pity out of your heart for these wretches.]],
	Exits = {
		north = 6248,
		east = 6252,
		south = 6254,
		west = 6250
	}
})
Config.NewRoom({
	Id = 6252,
	Name = "A Cave",
	Desc = [[   You are standing just inside a largish cave, about a 
hundred feet in diameter.  A few dim make-shift lanterns 
burning animal fat illuminate the area, just enough so you
can see the rotted food on the floor, and a few bodies 
sprawled throughout the whole area.  Your disgust quickly 
turns to horror as you see a horrible creature, half...
well, half something and half orc dash between two 
stalagmites.]],
	Exits = {
		north = 6249,
		east = 6246,
		south = 6255,
		west = 6251
	}
})
Config.NewRoom({
	Id = 6253,
	Name = "A Cave",
	Desc = [[   This must be the orc chief's area.  There's an old 
prize -- a stolen timeworn human armchair sitting near 
the south wall as a throne.  A mammoth sleeping pallet 
made of piled furs is nearby.  Next to that is the pile 
of orc treasure; a pile of well-polished coppers.  You 
look at the pile of worthless coins and wonder at the 
image of orcish raiders.
   These orcs aren't raiders, they are victims.]],
	Exits = {
		north = 6250,
		east = 6254
	}
})
Config.NewRoom({
	Id = 6254,
	Name = "A Cave",
	Desc = [[   Many sleeping pallets are arranged near the walls, each
made of heavy fur padding for comfort and warmth.  Many 
are covered with blood and other, unidentifiable 
substances.  Looking around, your only coherent thought 
is, 'Don't want to know... don't want to know...']],
	Exits = {
		north = 6251,
		east = 6255,
		west = 6253
	}
})
Config.NewRoom({
	Id = 6255,
	Name = "A Cave",
	Desc = [[   This area of the cave is one vast orc sickroom.  
Mutated and mangled orcs lie on the floor, seeming quiet, 
lifeless.  They're not even worth your time, you think, 
unless you've the mercy to put them out of their misery.
   You look at the corruption of nature's design and 
wonder what forces are at work here... the barrier, the 
orcs...  What's going on here?]],
	Exits = {
		north = 6252,
		west = 6254
	}
})
Config.NewRoom({
	Id = 6256,
	Name = "A Tunnel",
	Desc = [[   This forking off from the mail tunnel seems odd; the 
walls are strangely smooth, as if they were carved out by 
forces unknown.  The end is abrupt and short, but there is
a steel door inset in the wall of the west side of the 
tunnel.  The smell from the lower tunnel doesn't seem 
nearly as bad here... this might be a good place to rest
and catch your breath.]],
	Exits = {
		south = 6244,
		west = 6257
	}
})
Config.NewRoom({
	Id = 6257,
	Name = "A Tunnel",
	Desc = [[   This section of man-made tunnel heads north from here,
doors on either side.  A few glowing spots on the ceiling 
illuminate the area to almost a daylight level.  From the 
north you hear some horrible cries of pain and anguish 
that make you cringe inside and think twice about heading 
in that direction.]],
	Exits = {
		north = 6259,
		east = 6256,
		west = 6258
	}
})
Config.NewRoom({
	Id = 6258,
	Name = "A Bedroom",
	Desc = [[   This is a bedroom, catered to someone with a definite 
sense of taste.  There's a chest of drawers made of a 
solid section of oak tree.  In fact, most of the furniture
here has that 'natural look' about it.  The bed is filled 
with soft down with an ornate table lamp close by.  Nice 
place.]],
	Exits = {
		east = 6257
	}
})
Config.NewRoom({
	Id = 6259,
	Name = "A Tunnel",
	Desc = [[   This tunnel opens up into a large room to the north, 
and to the south, leads towards a set of doors.  The light
is crisp and bright, clearly showing the lack of tool 
marks on the hewn walls... magic?  The room just ahead is 
large, and also well-lighted, giving it an almost clinical
atmosphere.  Somewhere in the recesses of that room 
something cries out in a horrible crackling voice.  Not 
good.]],
	Exits = {
		north = 6267,
		south = 6257
	}
})
Config.NewRoom({
	Id = 6260,
	Name = "The Laboratory",
	Desc = [[   A full fledge operating table is set up here, outfitted
with a full set of restraints.  A ledge nearby has a whole
array of sterile medical equipment on it, covered over by 
a clear lid.  There's a drain in the floor with gradients 
leading to it to carry away the blood.  For some reason, 
you don't imagine this as a voluntary operating theatre...]],
	Exits = {
		east = 6261,
		south = 6263
	}
})
Config.NewRoom({
	Id = 6261,
	Name = "The Laboratory",
	Desc = [[   Another table is set up will all sorts of alchemical 
apparatus here, vials and beakers, distillation equipment 
and et cetera.  The stuff looks expensive, but bulky and 
fragile; not good treasure to cart away with you at all.]],
	Exits = {
		east = 6262,
		south = 6264,
		west = 6260
	}
})
Config.NewRoom({
	Id = 6262,
	Name = "A Cage",
	Desc = [[   This is a small, dirty cage, with only a bucket for 
wastes, another bucket for food, and a dirty towel for a 
bed.  The whole room has a terrible stench about it. ]],
	Exits = {
		west = 6261
	}
})
Config.NewRoom({
	Id = 6263,
	Name = "The Laboratory",
	Desc = [[   Some small cages sit here, containing many different 
types of rodents.  Leaning down to look better, you are 
very surprised as a tiny, common garden mouse growls at 
you and tries to rip your face off through the bars.  
There are some bulges on its back, and it doesn't seem to 
be in a very good mood.  It quivers some, not fully in
control of its motor functions.  Poor thing.]],
	Exits = {
		north = 6260,
		east = 6264,
		south = 6266
	}
})
Config.NewRoom({
	Id = 6264,
	Name = "The Laboratory",
	Desc = [[   A rack stands near the cages on the eastern wall, 
filled with shackles and manacles, bullwhips and worse.  
They all look well-used.  You give a shiver, and carry on.]],
	Exits = {
		north = 6261,
		east = 6265,
		south = 6267,
		west = 6263
	}
})
Config.NewRoom({
	Id = 6265,
	Name = "A Cage",
	Desc = [[   This is a small, dirty cage, with only a bucket for 
wastes, another bucket for food, and a dirty towel for a 
bed.  The whole room has a terrible stench about it. ]],
	Exits = {
		west = 6264
	}
})
Config.NewRoom({
	Id = 6266,
	Name = "The Laboratory",
	Desc = [[   This is the southwest corner of the lab.  There's no 
equipment here, merely several pairs of heavy steel 
shackles on the southern wall.  There's also some a few 
small bloodstains on the floor beneath the shackles.]],
	Exits = {
		north = 6263,
		east = 6267
	}
})
Config.NewRoom({
	Id = 6267,
	Name = "The Laboratory",
	Desc = [[   This is a fairly roomy laboratory that extends to the 
north, with cages set on the east side of the room.  A 
metal table here is empty, although you can see some 
outlines in the dust that suggest books had laid here 
once.]],
	Exits = {
		north = 6264,
		east = 6268,
		south = 6259,
		west = 6266
	}
})
Config.NewRoom({
	Id = 6268,
	Name = "A Cage",
	Desc = [[   This is a small, dirty cage, with only a bucket for 
wastes, another bucket for food, and a dirty towel for a 
bed.  The whole room has a terrible stench about it.]],
	Exits = {
		west = 6267
	}
})
