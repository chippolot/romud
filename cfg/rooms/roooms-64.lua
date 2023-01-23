Config.NewRoom({
	Id = 6302,
	Name = "The Webbed Entrance",
	Desc = [[
   Sticky, sticky, sticky!  The ground is cluttered with leaves,
decayed remains of webbed crickets, beetle, rats, dogs, and even
humans.  You begin to wonder about what lies ahead.  The air is
damp here, and even the little light that shines through the
canopy seems to be absorbed into the webbing.
]],
	Exits = {
		north = 6303,
		south = 6133
	}
})
Config.NewRoom({
	Id = 6303,
	Name = "The Webby Passage",
	Desc = [[
   You find that footing here is very good, almost too good.  The
limbs are coated with cobwebs and seem unusually strong for tree
branches.  Paths lead in four directions.  The eastward path goes
down a bit.
]],
	Exits = {
		north = 6305,
		east = 6306,
		south = 6302,
		west = 6304
	}
})
Config.NewRoom({
	Id = 6304,
	Name = "The Wasp Hive",
	Desc = [[
   Drones scuttle about in this room.  The cells on the walls are
honeycomb in shape and many of the maggots and wasps you see have
fang-marks on their bodies.  You sense some order in their markings.
]],
	Exits = {
		east = 6303
	}
})
Config.NewRoom({
	Id = 6305,
	Name = "The Webby Passage",
	Desc = [[
   Another webby passage, all sticky and wet.  Tiny ballooning
spiders fill the air.  It seems that these young ones are newborns.
]],
	Exits = {
		east = 6306,
		south = 6303
	}
})
Config.NewRoom({
	Id = 6306,
	Name = "Beneath The Busy Path",
	Desc = [[
   You here the sounds of crawling arachnids above.  The rhythms of
the footsteps suggest a primitive order in there movement.  The light
seems brighter upwards.
]],
	Exits = {
		west = 6305,
		up = 6307
	}
})
Config.NewRoom({
	Id = 6307,
	Name = "On The Busy Path",
	Desc = [[
   Spiders, spiders, everywhere!  It is almost ant-like in efficiency
with one big difference.  The spiders here are carrying ant-corpses,
as well as rats, wolves, and humans.
]],
	Exits = {
		south = 6308,
		down = 6306
	}
})
Config.NewRoom({
	Id = 6308,
	Name = "On The Busy Path",
	Desc = [[
   Spiders, spiders, everywhere!  It is almost ant-like in efficiency
with one big difference.  The spiders here are carrying ant-corpses,
as well as cats, wolves, and humans.  
]],
	Exits = {
		north = 6307,
		east = 6309
	}
})
Config.NewRoom({
	Id = 6309,
	Name = "On The Busy Path",
	Desc = [[
   Spiders, spiders, everywhere!  It is almost ant-like in efficiency
with one big difference.  The spiders here are carrying ant-corpses,
as well as cats, dogs, and humans.
]],
	Exits = {
		north = 6308,
		east = 6307,
		south = 6306,
		west = 6310
	}
})
Config.NewRoom({
	Id = 6310,
	Name = "A Split In The Path",
	Desc = [[
   As always, there is a split in the road.  One road is strewn with
cricket feelers.  The other is well-kept and suitable for smooth
travelling.  The webbing that was prevalent in earlier rooms is almost
non-existant now.
]],
	Exits = {
		north = 6311,
		east = 6309,
		south = 6321
	}
})
Config.NewRoom({
	Id = 6311,
	Name = "A Fuzzy Tree Limb",
	Desc = [[
   You are on a 'fuzzy' tree limb.  Interesting, since the branches
seem to have 'hairs' sprouting from its bark.  As you look closer
you see millions of aphids covering each limb.
]],
	Exits = {
		south = 6310,
		west = 6312
	}
})
Config.NewRoom({
	Id = 6312,
	Name = "The Tree Trunk",
	Desc = [[
   You feel that you can rest here safely.  There is evidence of
webbing here, but it is of a finer quality.
]],
	Exits = {
		east = 6311,
		south = 6313
	}
})
Config.NewRoom({
	Id = 6313,
	Name = "The Tree Lair Entrance",
	Desc = [[
   It seems the inhabitant of this place does not web her victims,
as evidenced by the remains before you.  The area is cluttered with
desiccated corpses, apparently bitten but unwebbed, and drained of
their life juices.
]],
	Exits = {
		north = 6312,
		west = 6314
	}
})
Config.NewRoom({
	Id = 6314,
	Name = "The Wolf Spider Lair",
	Desc = [[
   Very dark, as all lairs of spiders are.  Not much of furnishings
save an exit.  The wolf spider keeps no corpses here, but rather
throws them out at her leisure.
]],
	Exits = {
		east = 6313
	}
})
Config.NewRoom({
	Id = 6321,
	Name = "The Webless Path",
	Desc = [[
   Strange.  No webbing here.  In fact, no sounds whatsoever.  
The path continues northward, where you find that you may have
to tightrope your way across a ravine.
]],
	Exits = {
		north = 6310,
		west = 6322
	}
})
Config.NewRoom({
	Id = 6322,
	Name = "Above The Ravine",
	Desc = [[
   Stranger still.  Your feet get a real firm grip on the spiderline.
You are above a deep ravine.  This line connects you between two trees.
Below you can see a prismatic web with lots of animal bones caught in it:
some bear and small deer bones in fact.  No human skeletons are visible 
(yet).
]],
	Exits = {
		east = 6321,
		south = 6324,
		down = 6323,
		up = 6322
	}
})
Config.NewRoom({
	Id = 6323,
	Name = "The Rainbow Web",
	Desc = [[
   This is the rainbow web -- each strand, each link, a hue of violently
sharp colors and contrasts.  The resident here seems to have a command
of light as well.
]],
	Exits = {
		up = 6322
	}
})
Config.NewRoom({
	Id = 6324,
	Name = "The Web Forest",
	Desc = [[
   The trees here take on a different appearance -- they are not trees
anymore, but disjointed make-shift silken made shafts, sticky to the
touch, and webby in texture.  This is another world it would appear.
]],
	Exits = {
		north = 6322,
		down = 6325
	}
})
Config.NewRoom({
	Id = 6325,
	Name = "The Slave Pit",
	Desc = [[
   You have entered the slave pit.  A voice blares in the distance,
'Get back to work, maggots!'  Rails upon rails of mined gold and silver
clutter the trail beneath you.
]],
	Exits = {
		north = 6326,
		up = 6324
	}
})
Config.NewRoom({
	Id = 6326,
	Name = "The Tether Path",
	Desc = [[
   Another tether path just like the rest of them.  Surprisingly
well-lit by the golden orbs that hang from the sides, you can see
the paths become finer and finer in quality.
]],
	Exits = {
		east = 6327,
		west = 6325
	}
})
Config.NewRoom({
	Id = 6327,
	Name = "A Road Crossing",
	Desc = "   Another shifty little strand of webs, almost ethereal in nature.",
	Exits = {
		west = 6326,
		up = 6328
	}
})
Config.NewRoom({
	Id = 6328,
	Name = "A Leader Strand",
	Desc = [[
   This strand is weightier, more sturdy.  It shimmers as you step on
it.  You are definitely not in the Midgaardian realms anymore.  Just
where you are you can't tell.  It feels like you're moving through
ether.  You can still get back down to more surer lands.
]],
	Exits = {
		north = 6329,
		down = 6327
	}
})
Config.NewRoom({
	Id = 6329,
	Name = "The Entrance Of The Ethereal Web",
	Desc = [[
   You are at the entrance to ethereal web.  Flickering in and out,
in and out, each strand reveals a different hue from black to green 
to blue.
]],
	Exits = {
		south = 6332
	}
})
Config.NewRoom({
	Id = 6331,
	Name = "The Young Wormkin's Crib",
	Desc = [[
   A playpen of sorts, with maggots of wasps and other baby
vermin lying about.  You feel that humans have been played with
here too, and eaten later.  You sense that the maker of this
place has an appetite for dragon meat, and uses this room as a
breeding area.
]],
	Exits = {
		up = 6332
	}
})
Config.NewRoom({
	Id = 6332,
	Name = "The Base Of The Web",
	Desc = [[
   Large strands connect at this point.  The node shimmers and
flickers within the ether.  You see many flying creatures --
insects, pegasi, and dragon wormkins -- navigate the dangerous
passages of the web.  Exits go in many directions.
]],
	Exits = {
		north = 6331,
		east = 6333,
		south = 6334,
		west = 6335
	}
})
Config.NewRoom({
	Id = 6333,
	Name = "Through The Trees",
	Desc = [[
   This part of the web intersects through the branches of some
trees.  Various leaves and other debris that the many drones have
not picked up yet lie here.
]],
	Exits = {
		east = 6332,
		south = 6336,
		west = 6334
	}
})
Config.NewRoom({
	Id = 6334,
	Name = "Above The Clouds",
	Desc = [[
   You can see all of Midgaard in this ethereal web.  Many
of the larger dragons that do wish to fly seem to fly away
from the sticky strands of the web.
]],
	Exits = {
		east = 6332,
		south = 6335,
		west = 6336
	}
})
Config.NewRoom({
	Id = 6335,
	Name = "On A Cloud",
	Desc = [[
   This cloud is rather thick in consistency.  You suddenly realize
this is not a typical cloud, but it might be the nest of an aerial
creature.
]],
	Exits = {
		down = 6332
	}
})
Config.NewRoom({
	Id = 6336,
	Name = "A Link In The Ethereal Web",
	Desc = [[
   This is another link in the ethereal web.  Various creatures seem
to get caught (or hypnotized) by its sticky strands.
]],
	Exits = {
		east = 6337,
		west = 6332
	}
})
Config.NewRoom({
	Id = 6337,
	Name = "The Tenuous Strand",
	Desc = [[
   Very windy here since it goes up into the sky somewhat.  Still, it
is safe enough to move around.
]],
	Exits = {
		south = 6341,
		west = 6342,
		down = 6332
	}
})
Config.NewRoom({
	Id = 6341,
	Name = "The Elder Wormkin's Room",
	Desc = [[
   A more mature wormkin it seems resides here.  Various tomes
of arcane lore clutter the area, along with shards of armor and
weaponry.
]],
	Exits = {
		down = 6332
	}
})
Config.NewRoom({
	Id = 6342,
	Name = "Another Tree Limb",
	Desc = [[
   Once again the web crosses another tree limb.  To the side you
see the possible entrance to another creature's lair.
]],
	Exits = {
		east = 6343,
		south = 6335,
		west = 6346
	}
})
Config.NewRoom({
	Id = 6343,
	Name = "The Bird Spider's Lair",
	Desc = [[
   This is a big game hunter among most spiders.  Crushed
jewels and weapons suggest the inhabitant must have powerful
jaws.  Beware!
]],
	Exits = {
		down = 6332
	}
})
Config.NewRoom({
	Id = 6346,
	Name = "A Link In The Ethereal Web",
	Desc = [[
   This is another link in the ethereal web.  Various creatures
seem to get caught (or hypnotized) by its sticky strands.
]],
	Exits = {
		south = 6351,
		west = 6347,
		up = 6346
	}
})
Config.NewRoom({
	Id = 6347,
	Name = "The Quiet Tree Top",
	Desc = [[
   This is a quiet tree top.  Downwards you can see a familiar path
that may lead back to Midgaard.
]],
	Exits = {
		east = 6346,
		west = 6348,
		down = 6133,
		east = 6347,
		south = 6356,
		down = 6332
	}
})
Config.NewRoom({
	Id = 6348,
	Name = "On The Web",
	Desc = [[
   RRRRRRRRRRROOOOOOOOOOOOOAAAAAAAAAAAAAARR!  You hear the roar
of a powerful beast.  Dragon, you think.  You shiver in your boots
as you tiptoe along this section of the web.
]],
	Exits = {
		east = 6347,
		south = 6356,
		down = 6332
	}
})
Config.NewRoom({
	Id = 6351,
	Name = "The Ki-Rin Chamber",
	Desc = [[
   A wise ki-rin was entrapped here many years ago.  It is from her
that the ruler of this realm draws magical strength.
]],
	Exits = {
		north = 6348
	}
})
Config.NewRoom({
	Id = 6356,
	Name = "A Link In The Ethereal Web",
	Desc = [[
   This is another link in the ethereal web.  Various creatures
seem to get caught (or hypnotized) by its sticky strands.  To
the north you sense the heavy breathing of a fiery animal.
]],
	Exits = {
		north = 6361,
		south = 6366
	}
})
Config.NewRoom({
	Id = 6361,
	Name = "Yevaud's Lair",
	Desc = [[
   Yevaud, the Usurper of Midgaard, resides here.  A voice cries
out, 'BEWARE, the Usurper of Midgaard lives here!  FLEE while you can!'
But even Yevaud has his master... or so you deduce.
]],
	Exits = {
		south = 6356
	}
})
Config.NewRoom({
	Id = 6366,
	Name = "A Link In The Ethereal Web",
	Desc = [[
   This is another link in the ethereal web.  Various creatures
seem to get caught (or hypnotized) by its sticky strands.  A
single spider line lies to the north, while ghastly seemings are
due southward.  The grim entrance of Arachnos' Lair is downward.
]],
	Exits = {
		north = 6372,
		east = 6332,
		south = 6367,
		down = 6391
	}
})
Config.NewRoom({
	Id = 6367,
	Name = "The Entrance To The Donjonkeep",
	Desc = [[
   A dark path at the end of the web strand, you see ahead
a torch lit chamber where the souls of unavenged adventurers
come and gnash their teeth.  The howls and screams of many
echo through the hall ways.  You see one definite path ahead.
]],
	Exits = {
		north = 6368
	}
})
Config.NewRoom({
	Id = 6368,
	Name = "The Guardian's Room",
	Desc = [[
   A chair sits here for a tireless guardian who ensures that no
soul escapes.  Other than that, the room is undecorated.
]],
	Exits = {
		north = 6369
	}
})
Config.NewRoom({
	Id = 6369,
	Name = "The Realm Of The Hopeless",
	Desc = [[
   Here you see many misguided souls who think they still live.
They search for those who killed them without warrant, and seek
the free souls of living beings to inhabit and perhaps adventure
once more.
]],
	Exits = {
		north = 6370
	}
})
Config.NewRoom({
	Id = 6370,
	Name = "The Realm Of The Hopeless",
	Desc = [[
   Here you see many misguided souls who think they still live.
They search for those who killed them without warrant, and seek
the free souls of living beings to inhabit and perhaps adventure
once more.
]],
	Exits = {
		north = 6369,
		south = 6371
	}
})
Config.NewRoom({
	Id = 6371,
	Name = "The Donjonkeep",
	Desc = [[
   No souls have ever lived in this place.  The wails of slaves and
the howls of wolves are the only way you can describe the sounds you
hear.  The walls are thin and wispy.  The only light you receive is
the shimmering from the strand of the ethereal web you used to get
here.  
]],
	Exits = {
		east = 6372
	}
})
Config.NewRoom({
	Id = 6372,
	Name = "The Single Spider Line",
	Desc = [[
   A single spider line supports you once more.  As you look across
the ether you seen a single shack up ahead with a light in the window.
You sense a great evil coming from the north and feel inclined to go
back on the ethereal web and take your chances there.
]],
	Exits = {
		north = 6332,
		south = 6373
	}
})
Config.NewRoom({
	Id = 6373,
	Name = "The Single Spider Line",
	Desc = [[
   A single spider line supports you once more.  The shack comes
closer into view and you are even more inclined to go back now.
]],
	Exits = {
		north = 6372,
		south = 6374
	}
})
Config.NewRoom({
	Id = 6374,
	Name = "The Hermit's Corner",
	Desc = [[
   Here you see evidence of a vagrant's abode.  The shack is to the
north, if you dare enter it.  You get the sneaking feeling you should
go back now.  The skies above you darken and roar with the laughter
of thunder.
]],
	Exits = {
		north = 6373,
		south = 6381
	}
})
Config.NewRoom({
	Id = 6381,
	Name = "Mahatma's Inescapable Trap",
	Desc = [[
   Mahatma, that silly thief, is here, and he steals everything you
have.  He says 'Here, have a quick trip to the Temple of Midgaard.'
He plunges a black dagger into your back...
]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 6391,
	Name = "The Entrance To The Arachnos' Lair",
	Desc = [[
   All strands inevitably lead here, the center of the web, the
entrance to Arachnos' Lair.
]],
	Exits = {
		east = 6392
	}
})
Config.NewRoom({
	Id = 6392,
	Name = "The Sticky Chamber",
	Desc = [[
   You can still bail out since your knees are shaking from the
anticipation (or is it fear?).  The sky is clear on this strand of 
web, surprisingly unsticky.  The strand does not vibrate like the 
others.  A few ballooning spiders pass by, cackling 'You're gonna
die, you're gonna fry.  Good bye!'
]],
	Exits = {
		east = 6393,
		down = 6332
	}
})
Config.NewRoom({
	Id = 6393,
	Name = "The Great Door",
	Desc = [[
   Before you you see a large, web-like door.  Various designs
of ancient runes and names of Midgaard heroes are etched into
the webwork.  Perhaps lists of victims?  You can't tell.  
]],
	Exits = {
		north = 6400,
		west = 6392
	}
})
Config.NewRoom({
	Id = 6400,
	Name = "The Lair Of Arachnos",
	Desc = [[
   This is the lair of the Empress Spider, Arachnos.  You can
see a lavishly adorned rainbow web, her lair allows her to move
to any universe she wishes by using her magical strands to the
Prime Material Plane.  Coffers upon coffers of gold, magical
jewels and gems await.  Unfortunately Arachnos is a baggy spider
too, and webs all her treasures to her beautiful silken body.
]],
	Exits = {
		south = 6393
	}
})
