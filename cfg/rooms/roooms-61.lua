Config.NewRoom({
	Id = 6001,
	Name = "The Edge Of The Forest",
	Desc = [[   You are standing at the end of a dusty road, near the eastern edge of the
large forest of Haon-Dor.  To the east you see the road heading back to the
walled city, Midgaard, and to the west is a narrow trail leading through the
forest.]],
	Exits = {
		east = 6091,
		west = 6002
	}
})
Config.NewRoom({
	Id = 6002,
	Name = "A Trail Through The Light Forest",
	Desc = [[   You are on a trail leading through the forest.  There seems to be a small
path leading north into the shadows.  To the east is the forest edge and to
the west the trail leads further into the forest.]],
	Exits = {
		north = 6061,
		east = 6001,
		west = 6003
	}
})
Config.NewRoom({
	Id = 6003,
	Name = "A Trail Through The Light Forest",
	Desc = [[   You are on a narrow trail winding east and west through the forest.  To the
west, the forest gradually becomes more dense.  A small forest path leads off
to the south.]],
	Exits = {
		east = 6002,
		south = 6012,
		west = 6004
	}
})
Config.NewRoom({
	Id = 6004,
	Name = "A Trail Through The Dense Forest",
	Desc = [[   You are on a trail winding east and west through the dense forest.  To
the east, the forest gradually seems to become lighter.]],
	Exits = {
		east = 6003,
		west = 6005
	}
})
Config.NewRoom({
	Id = 6005,
	Name = "A Trail Through The Dense Forest",
	Desc = [[   You are on a trail winding east and west through the dense forest.  To the
west, the trees are so huge and their crowns so dense that forest remains in
total darkness.  A small path leads south through the trees.]],
	Exits = {
		east = 6004,
		south = 6006,
		west = 6101
	}
})
Config.NewRoom({
	Id = 6006,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues north and south.]],
	Exits = {
		north = 6005,
		south = 6007
	}
})
Config.NewRoom({
	Id = 6007,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues north and east.]],
	Exits = {
		north = 6006,
		east = 6008
	}
})
Config.NewRoom({
	Id = 6008,
	Name = "An Intersection In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The forest
gradually lightens to the east.  Paths lead east, west and south.]],
	Exits = {
		east = 6009,
		south = 6013,
		west = 6007
	}
})
Config.NewRoom({
	Id = 6009,
	Name = "The Forest Clearing",
	Desc = [[   You are in a clearing in the forest.  Lots of fresh stumps of varying sizes
protrude from the ground and heavy logs are stacked neatly in a big pile
supported by stakes set into the ground.  Paths lead north, east and west.]],
	Exits = {
		north = 6012,
		east = 6010,
		west = 6008
	}
})
Config.NewRoom({
	Id = 6010,
	Name = "Outside A Small Cabin In The Forest",
	Desc = [[   You are outside a small cabin built entirely from heavy logs.  There is a
wooden door to the north and small paths lead west and south through the trees.]],
	Exits = {
		north = 6011,
		south = 6015,
		west = 6009
	}
})
Config.NewRoom({
	Id = 6011,
	Name = "Inside The Cabin",
	Desc = [[   You are inside a small one-room cabin made entirely from heavy logs.
It is very sparsely furnished, containing only the most basic housekeeping
equipment, such as a bed, a chair and a table.]],
	Exits = {
		south = 6010
	}
})
Config.NewRoom({
	Id = 6012,
	Name = "A Small Path Through The Light Forest",
	Desc = [[   You are on a small path leading through the forest.  The trees are tall and
slender.  Paths lead north and south.]],
	Exits = {
		north = 6003,
		south = 6009
	}
})
Config.NewRoom({
	Id = 6013,
	Name = "An Intersection In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of the
old trees leave the forest floor in an unreal twilight illumination.  Paths
lead north, east and south.]],
	Exits = {
		north = 6008,
		east = 6014,
		south = 6022
	}
})
Config.NewRoom({
	Id = 6014,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues east and west.]],
	Exits = {
		east = 6015,
		west = 6013
	}
})
Config.NewRoom({
	Id = 6015,
	Name = "An Intersection In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The forest
gradually lightens to the north.  Paths lead north, east and west.]],
	Exits = {
		north = 6010,
		east = 6016,
		west = 6014
	}
})
Config.NewRoom({
	Id = 6016,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues south and west.]],
	Exits = {
		south = 6017,
		west = 6015
	}
})
Config.NewRoom({
	Id = 6017,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues north, south and east.]],
	Exits = {
		north = 6016,
		east = 6029,
		south = 6018
	}
})
Config.NewRoom({
	Id = 6018,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are at a turn on a small path leading through the dense forest.  The
forest seems to become lighter to the west.  The path continues north and west.]],
	Exits = {
		north = 6017,
		west = 6019
	}
})
Config.NewRoom({
	Id = 6019,
	Name = "An Intersection In The Light Forest",
	Desc = [[   You are on a small path leading through the forest.  A path leads north to
a small field and other paths lead east and west into the dense forest.]],
	Exits = {
		north = 6024,
		east = 6018,
		west = 6020
	}
})
Config.NewRoom({
	Id = 6020,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The forest seems
to become lighter to the east.  The path continues north and east.]],
	Exits = {
		north = 6021,
		east = 6019
	}
})
Config.NewRoom({
	Id = 6021,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues south and west.]],
	Exits = {
		south = 6020,
		west = 6022
	}
})
Config.NewRoom({
	Id = 6022,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  To the west
you see a dark cave entrance, leading into a small hillside.  The path
continues north and east.]],
	Exits = {
		north = 6013,
		east = 6021,
		west = 6023
	}
})
Config.NewRoom({
	Id = 6023,
	Name = "Inside The Cave",
	Desc = [[   You are in a natural cave.  Various sorts of debris cover the stone floor,
emitting a rather unpleasant smell that makes the air thick and hard to
breathe.  The only obvious exit is east.]],
	Exits = {
		east = 6022
	}
})
Config.NewRoom({
	Id = 6024,
	Name = "A Grassy Field",
	Desc = [[   You are in a grass covered field somewhere in the forest.  The tall grass
nearly reaches your waist, and the surrounding oaks and beeches form an almost
wall-like thicket on the east side of the field.  To the northeast you can see
a small lake.  A small path leads south through the trees, and the field opens
up to the north and west.]],
	Exits = {
		north = 6027,
		east = 6025,
		south = 6019
	}
})
Config.NewRoom({
	Id = 6025,
	Name = "The Lower Part Of The Grassy Field",
	Desc = [[   You are in a lower part of the grassy field, south of a small lake.  The
grass here has been trampled by the many animals coming here for water, leaving
the ground covered in tracks of different types.  To the west you see a break
in the wall of trees surrounding the field, and to the north is a small lake.]],
	Exits = {
		north = 6026,
		west = 6024
	}
})
Config.NewRoom({
	Id = 6026,
	Name = "Beside The Lake In A Grassy Field",
	Desc = [[   The grass stops shortly before the lake, replaced by mud covered in tracks
from the local animals.  When you come close many animals scatter into the tall
grass and some even into the forest.  To the west you see birds circling in the
high in the air, and to the north you see a small lake, surrounded by tall
reeds.  The field continues to the south, and the forest blocks passage to the
east.]],
	Exits = {
		north = 6028,
		south = 6025,
		west = 6027
	}
})
Config.NewRoom({
	Id = 6027,
	Name = "The Northern Section Of A Grassy Field",
	Desc = [[   As you come close, scavenging animals and birds of all sorts scatter,
leaving only the boldest and stupidest encircling the corpse of a large boar.
Carrion birds circle overhead, and smaller animals stare out of the tall grass
at you.  The grass here has been trampled, and a large area around the corpse
is stained by blood.  A trail leads down the sloping field to a lake, and to
the south you see the path back to the forest.]],
	Exits = {
		east = 6026,
		south = 6024
	}
})
Config.NewRoom({
	Id = 6028,
	Name = "On The Lake",
	Desc = [[   You are in the middle of a small lake, fed from a small stream coming
through the forest from the northwest.  The water is not that clear, but
you can see fish swimming around below you.  The bank is clear to the
south, providing a safe place to get back to the field.]],
	Exits = {
		south = 6026
	}
})
Config.NewRoom({
	Id = 6029,
	Name = "A Small Path In The Dense Forest",
	Desc = [[   You are on a small path leading through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues to the west and south.]],
	Exits = {
		south = 6030,
		west = 6017
	}
})
Config.NewRoom({
	Id = 6030,
	Name = "Near A Large Tree In The Dense Forest",
	Desc = [[   You are at the end of a small path leading through the dense forest.  The
crowns of the old trees leave the forest in an unreal twilight illumination.
This rough clearing is dominated by a very large oak tree, probably the
largest in this part of the forest.  The path leads back to the north.]],
	Exits = {
		north = 6029,
		up = 6031
	}
})
Config.NewRoom({
	Id = 6031,
	Name = "In The Lower Branches Of A Large Oak",
	Desc = [[   You are in a huge oak, about one third of the way to the top.  The branches
above you block out much of the light, but enough filters through for you to
see.  Small animals and birds scatter at your approach, rustling the leaves
all about you.  You could easily climb back down to the ground, or continue up
the tree.  One large branch juts outward to the west, possibly providing a
third choice of exit.]],
	Exits = {
		west = 6032,
		up = 6033,
		down = 6030
	}
})
Config.NewRoom({
	Id = 6032,
	Name = "Out On A Limb In A Large Oak",
	Desc = [[   This sturdy branch hangs far out over a path to the west, which you might
be able to jump down to.  Several squirrels scamper into hiding as you
approach, leaving you alone and swaying slightly with the wind.  To your north
you can see a small log cabin through the trees, and to the southeast there
seems to be some sort of clearing, with many birds circling above it.]],
	Exits = {
		east = 6031,
		down = 6017
	}
})
Config.NewRoom({
	Id = 6033,
	Name = "Midway To The Top Of The Large Oak",
	Desc = [[   You are in a huge oak, about midway to the top.  The branches above you
block out much of the light, but enough filters through for you to see.  A few
birds have remained to watch you from the fringe branches, well out of your
reach.  Scratches mar the tree here, and torn bark is scattered near you on the
branch.  It would seem some large forest cat lives nearby, so you had better be
careful!  You can continue a bit farther up the tree, or descend to limbs that
don't sway so much.]],
	Exits = {
		up = 6034,
		down = 6031
	}
})
Config.NewRoom({
	Id = 6034,
	Name = "High In The Large Oak",
	Desc = [[   The tree top gently sways in the wind, and you think you are as high as
you can safely go in the tree.  The limbs here show evidence of a small battle,
with ripped bark and loose feathers scattered everywhere.  Looking around, you
can see the forest stretching out below you in all directions.  To the east you
see Midgaard, and to the south the river runs through a deep chasm.  North and
west of here you can see another small village, and on the western horizon you
see a large mountain.]],
	Exits = {
		down = 6033
	}
})
Config.NewRoom({
	Id = 6061,
	Name = "A Shaded Path Through The Forest",
	Desc = [[   You are on a small shaded path leading through the trees.  The forest
gradually lightens to the east.  The path continues to the north, and to the
south you see the main trail.]],
	Exits = {
		north = 6066,
		south = 6002
	}
})
Config.NewRoom({
	Id = 6062,
	Name = "A Shaded Path Through The Forest",
	Desc = [[   You are at a turn on a small shadowed path leading through the forest.  The
forest seems to become lighter to the west.  The path continues north and west.]],
	Exits = {
		north = 6067,
		west = 6063
	}
})
Config.NewRoom({
	Id = 6063,
	Name = "A Shaded Path Through The Dense Forest",
	Desc = [[   You are on a small shaded path leading through the dense forest.  The
crowns of the old trees leave the forest floor in an unreal twililght
illumination.  To the north you see a small clearing.  Paths lead east and
west.]],
	Exits = {
		north = 6068,
		east = 6062,
		west = 6064
	}
})
Config.NewRoom({
	Id = 6064,
	Name = "A Shaded Path Through The Dense Forest",
	Desc = [[   You are on a small shaded path through the dense forest.  The crowns of
the old trees leave the forest in an unreal twilight illumination.  The path
continues north and east.]],
	Exits = {
		north = 6069,
		east = 6063
	}
})
Config.NewRoom({
	Id = 6065,
	Name = "A Shadowy Path Through The Dense Forest",
	Desc = [[   You are on a small shadowy path leading through the dense forest.  The
crowns of the old trees leave the forest in an unreal twilight illumination.
The path continues north and south.]],
	Exits = {
		north = 6070,
		south = 6101
	}
})
Config.NewRoom({
	Id = 6066,
	Name = "A Shaded Path Through The Forest",
	Desc = [[   You are at a turn on a small shaded path winding through the trees.  The
forest gradually becomes more dense to the west.  The path continues west and
south from here.]],
	Exits = {
		south = 6061,
		west = 6067
	}
})
Config.NewRoom({
	Id = 6067,
	Name = "A Fork On The Shaded Path Through The Forest",
	Desc = [[   You are at a fork in the small shaded path winding through the trees.  The
forest gradually becomes more dense to the west.  The path branches to the
north and south here, and also continues to the east.]],
	Exits = {
		north = 6072,
		east = 6066,
		south = 6062
	}
})
Config.NewRoom({
	Id = 6068,
	Name = "At The Fallen Tree",
	Desc = [[   You are standing in a small clearing, beside a large fallen tree.  A large
amount of the tree has already decomposed, but some pieces remain, scattered
about the clearing.  Paths border the clearing to the north and south.]],
	Exits = {
		north = 6073,
		south = 6063
	}
})
Config.NewRoom({
	Id = 6069,
	Name = "An Intersection On The Shaded Path",
	Desc = [[   You are on a small shaded path leading through the dense forest.  The
crowns of the old trees leave the forest in an unreal twilight illumination.
The path continues north, south, and west.]],
	Exits = {
		north = 6074,
		south = 6064,
		west = 6070
	}
})
Config.NewRoom({
	Id = 6070,
	Name = "A Shadowy Path Through The Dense Forest",
	Desc = [[   You are on a small shadowy path leading through the dense forest.  The
crowns of the old trees leave the forest in an unreal twilight illumination.
The path continues south and east.]],
	Exits = {
		east = 6069,
		south = 6065
	}
})
Config.NewRoom({
	Id = 6071,
	Name = "Off Of The Path In The Shaded Forest",
	Desc = [[   You are wandering amongst the trees in the light forest, without the aid
of a path or trail.  More sunlight trickles through the treetops here, making
your travel a bit easier.  Small animals scurry away as you approach.  You
are no longer on a path, so you may go whichever way you please.]],
	Exits = {
		north = 6079,
		east = 6071,
		south = 6062,
		west = 6073
	}
})
Config.NewRoom({
	Id = 6072,
	Name = "A Shaded Path Through The Forest",
	Desc = [[   You are on a small shaded path leading in between the trees.  The forest
gradually lightens to the east.  Paths lead west and south, and you think you
see a small path leading eastward.]],
	Exits = {
		east = 6071,
		south = 6067,
		west = 6073
	}
})
Config.NewRoom({
	Id = 6073,
	Name = "A Shaded Path Though The Forest",
	Desc = [[   You are on a small shaded path leading between the trees.  The forest
gradually becomes more dense to the west.  Paths lead north and east, and you
see a small clearing to the south.]],
	Exits = {
		north = 6076,
		east = 6072,
		south = 6068
	}
})
Config.NewRoom({
	Id = 6074,
	Name = "A Shadowy Path Through The Dense Forest",
	Desc = [[   You are on a small shadowy path leading through the dense forest.  To the
north the terrain becomes quite hilly and rough.  The crowns of the old trees
leave the forest in an unreal twilight illumination.  The path continues north
and south.]],
	Exits = {
		north = 6077,
		south = 6069
	}
})
Config.NewRoom({
	Id = 6075,
	Name = "A Small Trail Through The Forest",
	Desc = [[   You have just left the shaded path, and you are now standing at the head of
a very short trail.  It looks like someone begin clearing away the underbrush
here, but didn't get finished.  You may leave in any direction, but the path
is to the west.]],
	Exits = {
		north = 6075,
		east = 6071,
		south = 6071,
		west = 6076
	}
})
Config.NewRoom({
	Id = 6076,
	Name = "A Shaded Path Through The Forest",
	Desc = [[   You are on a small shaded path leading between the trees.  The forest
gradually becomes more dense to the west, and to the northwest the terrain
is quite hilly.  The path continues north and south.  To the east you see a
trail winding through the younger section of the forest.]],
	Exits = {
		north = 6079,
		east = 6075,
		south = 6073
	}
})
Config.NewRoom({
	Id = 6077,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are standing among tightly packed trees between several hills.  You
lost track of the path long ago, and now must rely on your instincts to guide
you.  The ground is very rough and rocky here, and only the most hardy plants
survive.  The crowns of the old trees leave the hills in an unreal twilight
illumination.]],
	Exits = {
		north = 6082,
		east = 6078,
		south = 6077,
		west = 6074
	}
})
Config.NewRoom({
	Id = 6078,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are standing among tightly packed trees between several hills.  You
lost track of the path long ago, and now must rely on your instincts to guide
you.  The ground is very rough and rocky here, and only the most hardy plants
survive.  The crowns of the old trees leave the hills in an unreal twilight
illumination.]],
	Exits = {
		north = 6082,
		east = 6077,
		south = 6080,
		west = 6078
	}
})
Config.NewRoom({
	Id = 6079,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are at the end of a small shaded path leading between the trees.  The
forest is quite thick here, and the ground is very rough and hilly, halting
your progress.  The path lies to the south.]],
	Exits = {
		south = 6076
	}
})
Config.NewRoom({
	Id = 6080,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are standing among tightly packed trees between several hills.  You
lost track of the path long ago, and now must rely on your instincts to guide
you.  The ground is very rough and rocky here, and only the most hardy plants
survive.  The crowns of the old trees leave the hills in an unreal twilight
illumination.]],
	Exits = {
		north = 6082,
		east = 6079,
		south = 6074,
		west = 6081
	}
})
Config.NewRoom({
	Id = 6081,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are standing among tightly packed trees between several hills.  You
lost track of the path long ago, and now must rely on your instincts to guide
you.  The ground is very rough and rocky here, and only the most hardy plants
survive.  The crowns of the old trees leave the hills in an unreal twilight
illumination.]],
	Exits = {
		north = 6082,
		east = 6083,
		south = 6077,
		west = 6082
	}
})
Config.NewRoom({
	Id = 6082,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are standing among tightly packed trees between several hills.  You
lost track of the path long ago, and now must rely on your instincts to guide
you.  The ground is very rough and rocky here, and only the most hardy plants
survive.  The crowns of the old trees leave the hills in an unreal twilight
illumination.]],
	Exits = {
		north = 6079,
		east = 6078,
		south = 6077,
		west = 6074
	}
})
Config.NewRoom({
	Id = 6083,
	Name = "In The Dense Forest Between The Hills",
	Desc = [[   You are standing among tightly packed trees on a medium sized hill. The
dense forest spreads out all around you, and the crowns of the old trees leave
the hills in an unreal twilight illumination.]],
	Exits = {
		north = 6082,
		east = 6080,
		south = 6077
	}
})
Config.NewRoom({
	Id = 6091,
	Name = "A Road Through The Plains",
	Desc = [[   You are on a dust covered east-west road through the western plains.  An
occasional hunter or adventurer can be seen, heading to or from the forest.
To the east is the walled city, Midgaard, and to the west the road ends at
the head of a narrow trail into a large forest.]],
	Exits = {
		east = 6092,
		west = 6001
	}
})
Config.NewRoom({
	Id = 6092,
	Name = "A Road Through The Plains",
	Desc = [[   You are on a dust covered east-west road through the western plains.  An
occasional hunter or adventurer can be seen, heading to or from the forest.
To the east is the walled city, Midgaard, and to the west the road continues 
towards a large forest.]],
	Exits = {
		east = 6093,
		west = 6091
	}
})
Config.NewRoom({
	Id = 6093,
	Name = "A Road Through The Plains",
	Desc = [[   You are on a dust covered east-west road crossing the grassy plains between
Midgaard the forest of Haon-Dor.  An occasional hunter or adventurer can be 
seen, heading to or from the forest.  To the east is the walled city, Midgaard, 
and to the west the road continues towards a large forest.]],
	Exits = {
		east = 3053,
		west = 6092
	}
})
