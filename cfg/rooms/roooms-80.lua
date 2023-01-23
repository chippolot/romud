Config.NewRoom({
	Id = 7901,
	Name = "Outside Redferne's Residence",
	Desc = [[   A huge cloud forms the plateau on which you are now standing.  The
wind here is absolutely quiet and the sun is shining warmly upon you.
From under the cloud you can hear the faint sounds of Midgaard.  Right
before you to the north lies the grand Mansion of Naris.]],
	Exits = {
		north = 7902,
		down = 7919
	}
})
Config.NewRoom({
	Id = 7902,
	Name = "The Southern End Of The Hall",
	Desc = [[   You are standing in a vast hall that is dimly lit, but wherever the
light comes from, is a mystery.  The walls seem to radiate warmth and
give the pleasent feeling of being welcome here.  A large portrait is
hanging on one of the walls.  A large wooden staircase leads up into
the tower.  To the east there is a high passage away from the hall.
This ends shortly after by a tall oak door.  The enormous hall extends
further north from here.  To the south you can see a huge, and VERY 
heavy-looking iron-wrought door.  It looks like this is the only exit
from this magnificent old house.]],
	Exits = {
		north = 7905,
		east = 7911,
		south = 7901,
		west = 7903,
		up = 7910
	}
})
Config.NewRoom({
	Id = 7903,
	Name = "Redferne's Library",
	Desc = [[   This is truly a magnificent place!  Books and scrolls lie together
on every shelf.  A large globe, with the map of the world upon it,
stands in the dimly lit north-western corner of the room.  Two large
and comfortable looking leather armchairs adorn the center of the
library together with a huge oak desk.  Dim light radiates from an
enormous crystal chandelier hanging down from the ceiling approximately
10 feet off the floor.  To the east there is a great old ashen door.  A
large glass window is set in the west wall.]],
	Exits = {
		east = 7902
	}
})
Config.NewRoom({
	Id = 7904,
	Name = "The Artifact Room Of Naris",
	Desc = [[   This is gloomy and dark room with only a faint light radiating from the
walls.  A bunch of funny-looking items fill the center of the room.  There
is no furniture here what-so-ever.  The only way out seems to be west,
through the low steel door.]],
	Exits = {
		west = 7911
	}
})
Config.NewRoom({
	Id = 7905,
	Name = "The Northern End Of The Hall",
	Desc = [[   You are standing in the northern end of the huge hall.  This part is
under the grand wooden staircase so the light seems to be a little less
bright here, but this doesn't affect your sight at all.  To the north
lies the kitchen.  To the south lies the southern end of the hall.  To
the east there is a huge metal door.  To the west there is a large
aspenwood door.]],
	Exits = {
		north = 7907,
		east = 7914,
		south = 7902,
		west = 7906
	}
})
Config.NewRoom({
	Id = 7906,
	Name = "The Sitting Room Of Naris",
	Desc = [[   You are standing in the middle of a really comfortable place.  The
walls are decorated with paintings of smiling Kings and Queens.  The
most attractive picture is one of a Prince in shining armour.  By one
of the walls there is an old armchair.  The only exit is through the
aspenwood door to the east.]],
	Exits = {
		east = 7905
	}
})
Config.NewRoom({
	Id = 7907,
	Name = "The Kitchen Of Naris",
	Desc = [[   This must be the place of food and drink.  You can hear the faint noise
of rats feasting on meat and bread from somewhere undeterminable.  The sound
makes you feel the agony of HUNGER.  The only visible exit is south to the
Northern end of the hall.]],
	Exits = {
		north = 7908,
		east = 7909,
		south = 7905
	}
})
Config.NewRoom({
	Id = 7908,
	Name = "The Larder",
	Desc = [[   You can see food all over.  Among the heaps of food you notice HUGE rats
scuttling around, nibbling pieces off the heaps here and there.]],
	Exits = {
		south = 7907
	}
})
Config.NewRoom({
	Id = 7909,
	Name = "The Fridge",
	Desc = "   This place is LOADED with drink, water and booze.",
	Exits = {
		west = 7907
	}
})
Config.NewRoom({
	Id = 7910,
	Name = "On The Stairs",
	Desc = [[   You can see up and down the stairway.  It seems to take forever, either
going up OR down.  It is just a seemingly insurmountable climb, either way.
Up is the bedroom of Redferne, and down leads to the southern end of the
hall.]],
	Exits = {
		up = 7912,
		down = 7902
	}
})
Config.NewRoom({
	Id = 7911,
	Name = "The Treasure Room",
	Desc = [[   This place is gloomy.  A HUGE safe is cemented into the west wall.  The
only visible exit is west, through the oak door.]],
	Exits = {
		east = 7904,
		west = 7902
	}
})
Config.NewRoom({
	Id = 7912,
	Name = "Redferne's Bedroom",
	Desc = [[   This is a snugly set bedroom with all the necessities for a romantic
evening.  A large fireplace adorns the east wall, and sizzling away is
the wood that is ablaze within.  The bed is enormous, covering at least
HALF of this great room.  The room stretches at least 140 feet, so can
you imagine the BED?  A large staircase leads down to the hall.  A couple
of doors open up to a broad balcony to the south.]],
	Exits = {
		south = 7913,
		down = 7910
	}
})
Config.NewRoom({
	Id = 7913,
	Name = "Redferne's Balcony",
	Desc = [[   You see a splendid of the most of this world.  The valleys stretch as
far as the eye reaches to the south from here.  Down below you can see
the entrance of this magnificent building.  To the north are the doors
to Redferne's bedroom.]],
	Exits = {
		north = 7912,
		down = 0
	}
})
Config.NewRoom({
	Id = 7914,
	Name = "The Monster Pen",
	Desc = [[   This looks like the cage in which a large carnivore is being kept.
Judging by the state the walls are in, this could very well be a large
AGGRESSIVE animal.  This makes you pretty insecure, this stating your
feeling about the place quite mildly.]],
	Exits = {
		west = 7905
	}
})
Config.NewRoom({
	Id = 7915,
	Name = "On The Huge Chain",
	Desc = [[   This place has quite a good view over Midgaard.  Your possibilities of
movement seem to extend only to the up and down directions.  Unless you
want to let go of the secure and seemingly unmovable chain, then those are
the directions you should take from here.]],
	Exits = {
		up = 7916,
		down = 3121
	}
})
Config.NewRoom({
	Id = 7916,
	Name = "The Chain Where It Is Too Windy",
	Desc = [[   Hanging on to the chain you figure out that there is no way of leaving
down from here.  The wind pulls you from left to right and back.  This
seems like a totally impossible task.  The ascend is the only way ahead
for you.  Otherwise you would risk death by falling to the hard ground
below.  DO NOT DESCEND NOW OR YOU WILL SURELY DIE!!!!]],
	Exits = {
		up = 7917,
		down = 7921
	}
})
Config.NewRoom({
	Id = 7917,
	Name = "On The Great Chain Of Naris",
	Desc = [[   You are approximately on the middle of the treacherous Chain.  One false
step and death will come and collect you quickly.  The chain leads upwards
and down.  No way are you going to descend now... You've only just begun
your climb.  Besides it could cost you your life.  Look down and you'll
see why.]],
	Exits = {
		up = 7919,
		down = 7916
	}
})
Config.NewRoom({
	Id = 7918,
	Name = "The Chain",
	Desc = [[   As you descend, the chain seems to absorb all weather around it, making
it swing less and less in the very powerful wind tearing at it.  The Chain
seems to chuckle quietly, and as you descend further you hear a soft whisper
originating from within the Chain *ITSELF*.  It says 'Welcome back some
other time, stranger.  Your company is always... hmmm... interesting.  God
Speed.'  The chain extends further down through the now spreading clouds.]],
	Exits = {
		up = 0,
		down = 7915
	}
})
Config.NewRoom({
	Id = 7919,
	Name = "The Mighty Chain Of Naris",
	Desc = [[   This place truly a splendid view of the WHOLE COUNTRY SIDE!  A magnificent
light shines upon you and the way up through the clouds is opened.  Up there
you can now see the Mansion of Naris, Residence of the Greater God Redferne.
The chain beneath you seems to evaporate in the mustering clouds that
surround you by now.]],
	Exits = {
		up = 7901,
		down = 7918
	}
})
Config.NewRoom({
	Id = 7921,
	Name = "The Free Fall From The Chain",
	Desc = [[   This is probably the third worst place to be in this entire MUD right
now.  You fall
.  
.
.
and fall
.
.
.
and fall
.
.
.
and HIT THE GROUND WITH SUCH A *SPLUTCH* that you die horribly, but instantly.
Good-bye cruel world.]],
	Exits = {
		north = 7915,
		east = 7916,
		south = 7917,
		west = 7918,
		up = 7919,
		down = 3121
	}
})
