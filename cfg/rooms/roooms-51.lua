Config.NewRoom({
	Id = 5002,
	Name = "A Long Tunnel",
	Desc = [[   You encounter some rapids as you enter this tunnel cut out of
the mountains by the river.]],
	Exits = {
		east = 5003,
		west = 3206
	}
})
Config.NewRoom({
	Id = 5003,
	Name = "A Long Tunnel",
	Desc = "   The tunnel branches off north.",
	Exits = {
		north = 5009,
		east = 5004,
		west = 5002
	}
})
Config.NewRoom({
	Id = 5004,
	Name = "A Long Tunnel",
	Desc = "   The tunnel branches off south.",
	Exits = {
		east = 5005,
		south = 5018,
		west = 5003
	}
})
Config.NewRoom({
	Id = 5005,
	Name = "A Tunnel Intersection",
	Desc = "   The tunnel branches off to the north and south.",
	Exits = {
		north = 5644,
		east = 5006,
		south = 5019,
		west = 5004
	}
})
Config.NewRoom({
	Id = 5006,
	Name = "An Underground Lake",
	Desc = [[   You are floating on a jet-black underground lake fed by dripping
water and lime from above.  The tunnel continues to the east and the
river leads back west.  Leading upwards to the northwest is a roughly
hewn hallway.]],
	Exits = {
		north = 5672,
		east = 5007,
		south = 5024,
		west = 5005
	}
})
Config.NewRoom({
	Id = 5007,
	Name = "A Long Narrow Tunnel",
	Desc = [[   The tunnel rises sharply to the east.  Another narrow tunnel
leads away to the north.]],
	Exits = {
		north = 5017,
		east = 5008,
		west = 5006
	}
})
Config.NewRoom({
	Id = 5008,
	Name = "A Wide Tunnel",
	Desc = [[   The tunnel continues east and west.  To the east the tunnel dives
down into a bright light.  A small passage way opens to the north.]],
	Exits = {
		east = 5027,
		west = 5007
	}
})
Config.NewRoom({
	Id = 5009,
	Name = "The Cave-In",
	Desc = [[   You stand at the edge of a large pile of rubble created from the last
rockslide.]],
	Exits = {
		south = 5003,
		down = 5010
	}
})
Config.NewRoom({
	Id = 5010,
	Name = "At The Foot Of The Rubble",
	Desc = [[   You are at the bottom of a large pile of rubble.  A tunnel branches
off to the north and east.]],
	Exits = {
		north = 5011,
		east = 5013,
		up = 5009
	}
})
Config.NewRoom({
	Id = 5011,
	Name = "A Cave Entrance",
	Desc = [[   You stand in the middle of a large and beautiful cave.  A path leads
deeper into the darkness.]],
	Exits = {
		south = 5010,
		down = 5012
	}
})
Config.NewRoom({
	Id = 5012,
	Name = "A Giant Cave",
	Desc = [[   This cavern overwhelms you.  The walls and ceiling seem miles away.
Bones of previous adventurers lie strewn on the cavern floor.  There is
a passage that spirals downwards in the northeast corner of the cavern.]],
	Exits = {
		up = 5011,
		down = 5101
	}
})
Config.NewRoom({
	Id = 5013,
	Name = "A Narrow Bend",
	Desc = "   The tunnel turns to the south and west.",
	Exits = {
		south = 5014,
		west = 5010
	}
})
Config.NewRoom({
	Id = 5014,
	Name = "A Large Cave",
	Desc = "   You are standing in a large cave.  Many furs are spread out on the floor.",
	Exits = {
		north = 5013,
		east = 5015
	}
})
Config.NewRoom({
	Id = 5015,
	Name = "A Damp Hallway",
	Desc = "   The walls here are extremely damp, as well as the floor.",
	Exits = {
		east = 5016,
		west = 5014
	}
})
Config.NewRoom({
	Id = 5016,
	Name = "An Underground Pool",
	Desc = "   You are wading in a knee deep pool of lime-water.",
	Exits = {
		east = 5017,
		west = 5015
	}
})
Config.NewRoom({
	Id = 5017,
	Name = "A Damp Hallway",
	Desc = [[   The walls of the tunnel are extremely damp here.  The tunnel
leads sharply upwards to the south as it starts to get narrow.]],
	Exits = {
		south = 5007,
		west = 5016
	}
})
Config.NewRoom({
	Id = 5018,
	Name = "A Narrow Crawlway",
	Desc = [[   This crawlway is just big enough for a human to crawl through or a
halfling to walk through.]],
	Exits = {
		north = 5004,
		east = 5019,
		south = 5020
	}
})
Config.NewRoom({
	Id = 5019,
	Name = "A Large Cavern",
	Desc = [[   You have entered a very large cavern.  The rock formations would amaze
almost any dwarf.]],
	Exits = {
		north = 5005,
		west = 5018
	}
})
Config.NewRoom({
	Id = 5020,
	Name = "A Fungus Patch",
	Desc = [[   As you walk through the fungus patch, you are shot at by many millions of
spores.  You can hardly breathe.]],
	Exits = {
		north = 5018,
		east = 5021
	}
})
Config.NewRoom({
	Id = 5021,
	Name = "The Fungus Path",
	Desc = [[   As you walk along the path, millions of spores are shot at you.  It is
difficult to breathe.]],
	Exits = {
		south = 5022,
		west = 5020
	}
})
Config.NewRoom({
	Id = 5022,
	Name = "The Fungus Temple",
	Desc = [[   You find yourself standing inside of a giant mushroom.  The inside
is decorated in the fashion of a temple.]],
	Exits = {
		north = 5021,
		east = 5023
	}
})
Config.NewRoom({
	Id = 5023,
	Name = "A Sloping Passage",
	Desc = "   You follow a path sloping down from the fungus temple.",
	Exits = {
		north = 5024,
		south = 5022
	}
})
Config.NewRoom({
	Id = 5024,
	Name = "A Sloping Passage",
	Desc = "   You are on a path that gently slopes up from the underground pool.",
	Exits = {
		north = 5006,
		south = 5023
	}
})
Config.NewRoom({
	Id = 5025,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sand constantly shifting around
you.  A pyramid lies to the east and a snow-capped mountain range to the 
west.]],
	Exits = {
		north = 5031,
		east = 5035,
		south = 5026
	}
})
Config.NewRoom({
	Id = 5026,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the east and a snow-capped mountain range to the 
west.]],
	Exits = {
		north = 5025,
		east = 5032,
		south = 5027
	}
})
Config.NewRoom({
	Id = 5027,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the east and a snow-capped mountain range to the
west.  The hole which you tumbled out of is too high for you to reach.]],
	Exits = {
		north = 5026,
		east = 5037,
		south = 5028
	}
})
Config.NewRoom({
	Id = 5028,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the east and a snow-capped mountain range to the
west.]],
	Exits = {
		east = 5034,
		south = 5029
	}
})
Config.NewRoom({
	Id = 5029,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-east and a snow-capped mountain range to
the west.  You spy a narrow dirt trail leading away to the west into the
foothills.]],
	Exits = {
		north = 5028,
		east = 5034,
		south = 5030,
		west = 12069
	}
})
Config.NewRoom({
	Id = 5030,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-east and a snow-capped mountain range to
the west.]],
	Exits = {
		north = 5029,
		east = 5038,
		south = 5045
	}
})
Config.NewRoom({
	Id = 5031,
	Name = "A Small Oasis",
	Desc = [[   You stand beside a small pool of crystal-blue water bathed in the
shade of a few scarce palm trees.  To the north you see a small
encampment stopped for the day.]],
	Exits = {
		north = 5057,
		east = 5037,
		south = 5033,
		west = 5026
	}
})
Config.NewRoom({
	Id = 5032,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the east.]],
	Exits = {
		north = 5032,
		east = 5032,
		south = 5033,
		west = 5025
	}
})
Config.NewRoom({
	Id = 5033,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the east.]],
	Exits = {
		north = 5036,
		east = 5037,
		south = 5034,
		west = 5033
	}
})
Config.NewRoom({
	Id = 5034,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-east.]],
	Exits = {
		north = 5038,
		east = 5038,
		south = 5044,
		west = 5029
	}
})
Config.NewRoom({
	Id = 5035,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the south-east.]],
	Exits = {
		north = 5039,
		east = 5036,
		south = 5035,
		west = 5036
	}
})
Config.NewRoom({
	Id = 5036,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the east, it looks enormous, even from this distance.]],
	Exits = {
		north = 5040,
		east = 5301,
		south = 5033,
		west = 5035
	}
})
Config.NewRoom({
	Id = 5037,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-east.]],
	Exits = {
		north = 5036,
		east = 5042,
		south = 5033,
		west = 5031
	}
})
Config.NewRoom({
	Id = 5038,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-east.]],
	Exits = {
		north = 5049,
		east = 5034,
		south = 5043,
		west = 5034
	}
})
Config.NewRoom({
	Id = 5039,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the south.]],
	Exits = {
		north = 5047,
		east = 5046,
		south = 5041,
		west = 5035
	}
})
Config.NewRoom({
	Id = 5040,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting
around you.  A pyramid lies to the south.  The gates of a city lie a
short distance off to the north.]],
	Exits = {
		north = 5412,
		east = 5040,
		south = 5049,
		west = 5040
	}
})
Config.NewRoom({
	Id = 5041,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  You are standing near a gigantic pyramid located a couple hundred
meters west of you.  From here you can sense the great evil which resides
within the massive structure.]],
	Exits = {
		north = 5037,
		east = 5050,
		south = 5042,
		west = 5301
	}
})
Config.NewRoom({
	Id = 5042,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north.]],
	Exits = {
		north = 5041,
		east = 5049,
		south = 5042,
		west = 5038
	}
})
Config.NewRoom({
	Id = 5043,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north.]],
	Exits = {
		north = 5050,
		east = 5056,
		south = 5044,
		west = 5042
	}
})
Config.NewRoom({
	Id = 5044,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north.]],
	Exits = {
		north = 5043,
		east = 5056,
		south = 5045,
		west = 5034
	}
})
Config.NewRoom({
	Id = 5045,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north and a ruined city to the west.]],
	Exits = {
		north = 5051,
		east = 5056,
		south = 5030,
		west = 5201
	}
})
Config.NewRoom({
	Id = 5046,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the south.]],
	Exits = {
		north = 5046,
		east = 5053,
		south = 5046,
		west = 5039
	}
})
Config.NewRoom({
	Id = 5047,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the south-west.]],
	Exits = {
		north = 5039,
		east = 5048,
		south = 5048,
		west = 5040
	}
})
Config.NewRoom({
	Id = 5048,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the west.]],
	Exits = {
		north = 5047,
		east = 5052,
		south = 5054,
		west = 5041
	}
})
Config.NewRoom({
	Id = 5049,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the west.]],
	Exits = {
		north = 5040,
		east = 5049,
		south = 5054,
		west = 5042
	}
})
Config.NewRoom({
	Id = 5050,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-west.]],
	Exits = {
		north = 5054,
		east = 5055,
		south = 5051,
		west = 5043
	}
})
Config.NewRoom({
	Id = 5051,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north.]],
	Exits = {
		north = 5301,
		east = 5055,
		south = 5045,
		west = 5043
	}
})
Config.NewRoom({
	Id = 5052,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the south-west and a deep canyon to the east.]],
	Exits = {
		north = 5052,
		south = 5053,
		west = 5048
	}
})
Config.NewRoom({
	Id = 5053,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the south-west and a deep canyon to the east.  Just
below you can make out a tiny ledge.]],
	Exits = {
		north = 5052,
		south = 5054,
		west = 5046,
		down = 5064
	}
})
Config.NewRoom({
	Id = 5054,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the west and a deep canyon to the east.]],
	Exits = {
		north = 5053,
		east = 5063,
		south = 5055,
		west = 5050
	}
})
Config.NewRoom({
	Id = 5055,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the west and a deep canyon to the east.]],
	Exits = {
		north = 5054,
		south = 5056,
		west = 5051
	}
})
Config.NewRoom({
	Id = 5056,
	Name = "The Great Eastern Desert",
	Desc = [[   A vast desert stretches for miles, the sands constantly shifting around  
you.  A pyramid lies to the north-west and a deep canyon to the east.]],
	Exits = {
		north = 5055,
		south = 5056,
		west = 5044
	}
})
Config.NewRoom({
	Id = 5057,
	Name = "A Nomad Camp",
	Desc = [[   This small group of desert nomads has stopped for the day to rest
and refresh themselves beside this beautiful oasis.  Three tents and some
camels make up the party.  From within two of the tents you hear muffled
voices, obviously surprised at your visit.]],
	Exits = {
		north = 5059,
		east = 5058,
		south = 5031,
		west = 5026
	}
})
Config.NewRoom({
	Id = 5058,
	Name = "Inside A Small Tent",
	Desc = [[   This is a small and simple tent with few possessions in sight.  Lying
here and there are young-looking men and women, possibly slaves to the
leader of this band.]],
	Exits = {
		west = 5057
	}
})
Config.NewRoom({
	Id = 5059,
	Name = "Beside The Camels",
	Desc = [[   Here stand about ten camels, all hitched to some stakes plugged into 
the ground.  To the east you see a small tent while to the north you see a 
larger, fancier tent.]],
	Exits = {
		north = 5061,
		east = 5060,
		south = 5057,
		west = 5025
	}
})
Config.NewRoom({
	Id = 5060,
	Name = "The Warriors' Tent",
	Desc = [[   This tent has a few furnishings, but mainly it holds the band's 
protectors.  They all stare at you coldly as you enter.]],
	Exits = {
		west = 5059
	}
})
Config.NewRoom({
	Id = 5061,
	Name = "The Main Tent",
	Desc = [[   This tent is as lavishly decorated on the inside as it is on the
outside.  A fancy carpet lies on the sand and numerous baskets line the
walls.]],
	Exits = {
		east = 5062,
		south = 5059
	}
})
Config.NewRoom({
	Id = 5062,
	Name = "The Main Tent",
	Desc = [[   This is where the leader of this band of nomads resides.  He is 
definitely rich as you inspect the tapestries, baskets, and a few
paintings as well.]],
	Exits = {
		west = 5061
	}
})
Config.NewRoom({
	Id = 5063,
	Name = "The Rickety Rope Bridge",
	Desc = [[   You carefully begin to walk across the bridge, but suddenly the rope
breaks and you fall...
                     ... and fall
                            and fall
                               and fall
                                    ... to your death on the rocks below.]],
	Exits = {
		west = 5054
	}
})
Config.NewRoom({
	Id = 5064,
	Name = "The Wind-Swept Ledge",
	Desc = [[   Being very careful not to lose your balance, you look around and
find that this canyon is about a half a kilometer deep.  To the west is
a dark cave leading under the desert sands and above you a rope bridge
spans the gap.]],
	Exits = {
		west = 5065,
		up = 5053
	}
})
Config.NewRoom({
	Id = 5065,
	Name = "The Cave Mouth",
	Desc = [[   The air in here is MUCH cooler than outside.  From the west you hear 
strange sounds, but can see nothing.  The cave slopes down into the 
darkness.]],
	Exits = {
		east = 5064,
		west = 5066
	}
})
Config.NewRoom({
	Id = 5066,
	Name = "The Mysterious Lair",
	Desc = [[   You have stumbled upon the home of something.  From the treasure
haphazardly strewn about and the rotting carcasses, you would guess
that this is a dragon's lair.  As to what type, you can't really say.
The cave narrows out into a tunnel to the west.]],
	Exits = {
		east = 5065,
		west = 5067
	}
})
Config.NewRoom({
	Id = 5067,
	Name = "A Wide Tunnel",
	Desc = [[   This tunnel seems to go on forever into the darkness.  You carefully
feel your way along the walls.]],
	Exits = {
		east = 5066,
		west = 5068
	}
})
Config.NewRoom({
	Id = 5068,
	Name = "A Narrower Tunnel",
	Desc = [[   The tunnel becomes very narrow and you fight to squeeze your way through.
The floor seems to level off a little.]],
	Exits = {
		east = 5067,
		south = 5069
	}
})
Config.NewRoom({
	Id = 5069,
	Name = "A Narrow Crack",
	Desc = [[   This part of the tunnel is the hardest to move through as the walls
move in to meet you.]],
	Exits = {
		north = 5068,
		west = 5070
	}
})
Config.NewRoom({
	Id = 5070,
	Name = "A Small Cavern",
	Desc = [[   It is dark and damp and bats hang from the ceiling.  A narrow crack is
in the east wall.  The floor now slopes upwards.]],
	Exits = {
		east = 5069,
		west = 5071
	}
})
Config.NewRoom({
	Id = 5071,
	Name = "A Small Shaft",
	Desc = [[   From within this shaft you can see a narrow hole in the roof just
large enough for one person.  Back east is the cavern.]],
	Exits = {
		east = 5070,
		up = 5010
	}
})
