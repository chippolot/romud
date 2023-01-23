Config.NewRoom({
	Id = 3501,
	Name = "The Plains",
	Desc = [[   You are standing on the plains.  This is a vast desolate place where
the wind can howl undisturbed since nothing but you bars its way.  However
you are not the first to wander here.  Before you somebody has left a small
path.  The path looks rather bewildered and is not the kind of path to lead
to anywhere significant or important but it seems to have made up its mind
to enter the hills far away north.  A narrow trail scars its way off to the
east as it leads up towards a hillside.]],
	Exits = {
		north = 4001,
		east = 3301,
		south = 3502
	}
})
Config.NewRoom({
	Id = 3502,
	Name = "The Lane",
	Desc = [[   You are strolling along a pleasant, shady lane.  The road is lined on both
sides by tall, stately trees which lend the scene with a sense of quiet
serenity.
   You can follow the road north or south.]],
	Exits = {
		north = 3501,
		south = 3503
	}
})
Config.NewRoom({
	Id = 3503,
	Name = "The Laneway",
	Desc = [[   The trees stand close here, and the tall, bushy undergrowth prevents you
from seeing far in any direction save east, where a broad lane continues off
into the distance; and west, where the same lane continues towards what looks
like a fairly large city.  The muted sounds of city commotion reach your ears
from a distance; stray dogs barking, children crying, and street salesmen
shouting.
   A steep path leads down from here to the northeast towards the Dwarven
Village, and a small trail leads through the trees towards the hills to the
north.]],
	Exits = {
		north = 3502,
		east = 15001,
		west = 3504,
		down = 6501
	}
})
Config.NewRoom({
	Id = 3504,
	Name = "The City Entrance",
	Desc = [[   You stand on the outskirts of a large city - Midgaard; the capital of
this land.  The road leads east into the peace and quiet - and dangers -
of the forest; and to the west it becomes the main street of the town;
surrounded by a confusion of shops, bars, and market places.]],
	Exits = {
		east = 3503,
		west = 3054
	}
})
Config.NewRoom({
	Id = 3505,
	Name = "The South Gate",
	Desc = [[   You are standing on a small, dusty path leading away from the south
gate of Midgaard, to the forest of Miden'Nir (Goblinic for 'Green Blood').
You can still see the city to the east, but if you go south, there is
fresh air and greenery.]],
	Exits = {
		east = 3128,
		south = 3506
	}
})
Config.NewRoom({
	Id = 3506,
	Name = "The Trail To Miden'Nir",
	Desc = [[   You are in a light forest.  A path leads south, but the passage to
the east is easy enough.  To the west, smoke can be seen rising above
the treetops.  The sprawl of Midgaard lies north of here.]],
	Exits = {
		north = 3505,
		east = 3507,
		south = 3508,
		west = 3571
	}
})
Config.NewRoom({
	Id = 3507,
	Name = "The Miden'nir",
	Desc = [[   You are in a dark forest.  To the east, mountains block passage.  From
here, only the lighter forest to the west or south offer a way to travel.]],
	Exits = {
		east = 3551,
		south = 3510,
		west = 3506
	}
})
Config.NewRoom({
	Id = 3508,
	Name = "The Miden'nir",
	Desc = [[   The forest is deep here and the wind blows through the trees and
through your hair.  To the north, the forest gets lighter.  However,
the southern and western paths place you even deeper in the wood.]],
	Exits = {
		north = 3506,
		south = 3511,
		west = 3509
	}
})
Config.NewRoom({
	Id = 3509,
	Name = "On a Small Path",
	Desc = [[   A path is here, leading east and south through the dark woods of
Miden'nir.  Mountains slash the scenery to the west of here.]],
	Exits = {
		east = 3508,
		south = 3512
	}
})
Config.NewRoom({
	Id = 3510,
	Name = "The Miden'nir",
	Desc = [[   The trees of Miden'nir are lush and green, hiding the evil that lurks
in these woods.  The trees become too thick to the west, but you may go
north, south or travel toward the mountains that lie east of here.]],
	Exits = {
		north = 3507,
		east = 3513,
		south = 3515
	}
})
Config.NewRoom({
	Id = 3511,
	Name = "A Crossroads",
	Desc = [[   Here footworn paths meet leading north, south and east.  The trees
seem to be closing in on you at this point, and you can barely see
the sky through the thick branches above your head.]],
	Exits = {
		north = 3508,
		east = 3515,
		south = 3517
	}
})
Config.NewRoom({
	Id = 3512,
	Name = "The Trail",
	Desc = [[   You are on a north-south trail through the woods.  To the west,
impassable mountains glare at you, and the thick woods and undergrowth
prevent any movement westward.]],
	Exits = {
		north = 3509,
		south = 3516
	}
})
Config.NewRoom({
	Id = 3513,
	Name = "The Miden'nir",
	Desc = [[   The trees of Miden'nir are lush and green, hiding the evil that lurks
in these woods.  You can go north toward the mountains, or west to the
forest, but the steep mountains prevent any movement east.]],
	Exits = {
		north = 3551,
		south = 3514,
		west = 3510
	}
})
Config.NewRoom({
	Id = 3514,
	Name = "The Miden'nir",
	Desc = [[   The forest is dark, and becomes even darker west.  You sense
that there is something evil hidden in these woods.  The forest
gets lighter to the north.  The wind kicks up as you ponder your
options.]],
	Exits = {
		north = 3513,
		west = 3515
	}
})
Config.NewRoom({
	Id = 3515,
	Name = "The Deep Forest",
	Desc = [[   It is quite dark here, forest surrounds you.  With each step, the
forest seems to close around you, and get darker and more foreboding.
It might just be time to head back to somewhere safe.]],
	Exits = {
		north = 3510,
		east = 3514,
		south = 3518,
		west = 3511
	}
})
Config.NewRoom({
	Id = 3516,
	Name = "The Light Forest",
	Desc = [[   The forest is light here and you can easily pick your way through the 
trail.  To the east, the forest becomes thick and darker.  South, the
trail continues.]],
	Exits = {
		north = 3512,
		east = 3517,
		south = 3519
	}
})
Config.NewRoom({
	Id = 3517,
	Name = "Some Muddy Ground",
	Desc = [[   The ground is quite muddy here and puddles are all around.  Your
boots make a disgusting SQUISH as you walk here.  You can go in any
of the four cardinal directions from here.  Hopefully, it will be
dryer.]],
	Exits = {
		north = 3511,
		east = 3518,
		south = 3520,
		west = 3516
	}
})
Config.NewRoom({
	Id = 3518,
	Name = "Near The Mountains",
	Desc = [[   The most prominent feature here is the mountains that lie to the
east.  You can only go north and west from here as the rocks stop all
other movement.]],
	Exits = {
		north = 3515,
		west = 3517
	}
})
Config.NewRoom({
	Id = 3519,
	Name = "The Fading Trail",
	Desc = [[   The trail becomes nearly unpassable here.  You can go north
as the forest is relatively light.  To the south, you can see a
path.]],
	Exits = {
		north = 3516,
		east = 0,
		south = 3523
	}
})
Config.NewRoom({
	Id = 3520,
	Name = "The Dark Path",
	Desc = [[   You are hemmed in by trees on either side of you.  The path
continues north and south, and while is much to thick to explore
west, you can head off into the woods to the west.]],
	Exits = {
		north = 3517,
		east = 3521,
		south = 3522,
		west = 0
	}
})
Config.NewRoom({
	Id = 3521,
	Name = "The Dark Forest",
	Desc = [[   You stomp your way through the underbrush.  The dark forest of
Miden'nir get pretty thick here, and the branches high above your
head are so thick that they block out all direct sunlight.  While
it is much too thick to go further east, you might be able to make
your way though the forest to the south and west.]],
	Exits = {
		south = 3524,
		west = 3520
	}
})
Config.NewRoom({
	Id = 3522,
	Name = "The Carnage",
	Desc = [[   Here, you see a gruesome sight.  Blood is everywhere... on the trees and
soaked into the ground.  Two carcasses lie in front of you, seeming to look
up at you.  The forest is impassible to the south, but the other directions
look ok.]],
	Exits = {
		north = 3520,
		east = 3524,
		west = 3523
	}
})
Config.NewRoom({
	Id = 3523,
	Name = "Deep In The Forest Of Miden'nir",
	Desc = [[   There is a sickening stench here.  It smells of blood and death.
To the north, you catch glimpses of daylight.  To the east, you
simply cannot see.  The trees are close and stifling.]],
	Exits = {
		north = 3519,
		east = 3522
	}
})
Config.NewRoom({
	Id = 3524,
	Name = "The Dark Forest",
	Desc = [[   The branches above you block out all direct sunlight, making the forest
in this area rather dark.  The forest continues east, where it meets the
mountains.  The air is still and stuffy - a stench comes from the west and
an ugly feeling causes the hair to rise on the back of your neck!]],
	Exits = {
		north = 3521,
		east = 3552,
		west = 3522
	}
})
Config.NewRoom({
	Id = 3551,
	Name = "At The Foot Of The Mountains",
	Desc = [[   You find yourself at the foot of the mountains, where it is much
to steep to continue north or east.  You see the lush, green forest
of Miden'nir to the south and west.]],
	Exits = {
		south = 3513,
		west = 3507
	}
})
Config.NewRoom({
	Id = 3552,
	Name = "Deep In The Forest Of Miden'nir",
	Desc = [[   The branches above you block out all direct sunlight, making
the forest in this area very dark.  The forest continues west,
but mountains block further exploration in all other directions,
except south, where you notice a small tunnel dug into the
mountainside.]],
	Exits = {
		south = 3553,
		west = 3524
	}
})
Config.NewRoom({
	Id = 3553,
	Name = "A Tunnel In The Mountains",
	Desc = [[   The walls of this tunnel were carved out many years ago by the goblins
of this forest.  The floor is well worn, and continues south, into the
mountain, or back north out into the forest.]],
	Exits = {
		north = 3552,
		south = 3554
	}
})
Config.NewRoom({
	Id = 3554,
	Name = "A Tunnel In The Mountains",
	Desc = [[   The tunnel gets lighter to the north, presumably leading out, while to
the south the passage gets smaller and smaller.  A small alcove has been
carved into the east wall.]],
	Exits = {
		north = 3553,
		east = 3555,
		south = 3556
	}
})
Config.NewRoom({
	Id = 3555,
	Name = "A Small Alcove",
	Desc = [[   A small alcove has been carved out here.  There are a bunch of twigs
and leaves thrown into a pile here, probably serving as a bed.]],
	Exits = {
		west = 3554
	}
})
Config.NewRoom({
	Id = 3556,
	Name = "A Tunnel In The Mountains",
	Desc = [[   As you explore further into the mountainside, the tunnel gets smaller
and smaller to the south.  You almost have to hunch over to make your way
through this area.  A small archway to the south leads into a large chamber.]],
	Exits = {
		north = 3554,
		south = 3557
	}
})
Config.NewRoom({
	Id = 3557,
	Name = "The Goblin HeadQuarters",
	Desc = [[   The tunnel widens into a large (well, large for goblins) cavern that
serves as the living quarters for the goblins of Miden'nir.  The bones of
numbers woodland creatures are strewn about the room, the remanents of a
recent meal.]],
	Exits = {
		north = 3556
	}
})
Config.NewRoom({
	Id = 3571,
	Name = "The Front Of The Inn",
	Desc = [[   You are standing on a well-worn path which opens into a clearing.
An old, wooden building is here with smoke billowing from its
chimney.  A painted sign is visible on the porch to the west.  You
could go north or south around the building or leave this place and
return to the forest.]],
	Exits = {
		north = 3572,
		east = 3506,
		south = 3573,
		west = 3575
	}
})
Config.NewRoom({
	Id = 3572,
	Name = "North Of The Inn",
	Desc = [[   You are standing north of the Inn.  Things don't look much different
from this angle.  The air here is filled with smells of smoke and cooking.
South, the front porch is waiting for you... or you can see if there is
a back door.]],
	Exits = {
		south = 3571
	}
})
Config.NewRoom({
	Id = 3573,
	Name = "South Of The Inn",
	Desc = [[   You are standing south of the Inn.  You could easily go north and enter
through the front door, or west and to the rear of the establishment.  You
here some muffled cries from a tiny trail leading south of here.]],
	Exits = {
		north = 3571,
		south = 3576,
		west = 3574
	}
})
Config.NewRoom({
	Id = 3574,
	Name = "Behind The Inn",
	Desc = [[   You now stand behind the Inn.  The smell here is not so pleasant as
the keeper and his help throw a good deal of garbage here.  A couple of
piles of rubbish are to the west, but you will smell the worse for
meddling there.  As a clean alternative, you can go north or east around
the Inn.]],
	Exits = {
		east = 3573,
		west = 3579
	}
})
Config.NewRoom({
	Id = 3575,
	Name = "The Woodsman Inn",
	Desc = [[   You are in the common room of the Woodsman Inn.  A thin haze of smoke
sits in the air here.  The Inn is often empty, as the forest has become
overrun by goblins as of late, and it is no longer safe in these parts.
The bar is just north of here.  If you'd rather have your own table, one
is empty to the south.]],
	Exits = {
		north = 3577,
		east = 3571,
		south = 3580,
		west = 3578
	}
})
Config.NewRoom({
	Id = 3576,
	Name = "The Ambush Point",
	Desc = [[   This is a overgrown foot-trail south of the Inn.  It leads west, but you
would be hard pressed to follow it far.  A number of bushes are trampled on
and some medium sized branches have been knocked down.  Obviously there has
been a battle here rather recently.]],
	Exits = {
		north = 3573,
		west = 3582
	}
})
Config.NewRoom({
	Id = 3577,
	Name = "The Bar",
	Desc = [[   This is where people use to come and enjoy the food, drink and
hospitality of the Innkeeper, but as of late, he only serves the
few adventurers that manage to survive a trip through the forest.
You can leave south and return to the common room.]],
	Exits = {
		south = 3575
	}
})
Config.NewRoom({
	Id = 3578,
	Name = "The Bard's Table",
	Desc = [[   You are in a darker corner in the Inn.  A large round table with a few
wooden chairs sits here.  There is a large stain on the table, the remnants
of a spilled drink.]],
	Exits = {
		east = 3575
	}
})
Config.NewRoom({
	Id = 3579,
	Name = "The Garbage Dump",
	Desc = [[You stand knee deep in garbage.  YECCH!!!  It smells terrible and who knows
what vermin live in these piles of filth...]],
	Exits = {
		east = 3574
	}
})
Config.NewRoom({
	Id = 3580,
	Name = "A Quieter Section Of The Inn",
	Desc = [[There seems to be no one in this end of the Woodsman, probably a safe place
to rest and lick your wounds...]],
	Exits = {
		north = 3575
	}
})
Config.NewRoom({
	Id = 3582,
	Name = "On The Trail Of The Horsemen",
	Desc = [[   The path continues east and west of here.  You notice fresh tracks in
the soft ground that show the horsemen fled to the west.]],
	Exits = {
		east = 3576,
		west = 3583
	}
})
Config.NewRoom({
	Id = 3583,
	Name = "On The Trail Of The Horsemen",
	Desc = [[   The path continues east and south.  You notice fresh tracks in the
soft ground that show the horsemen turned, and fled south.]],
	Exits = {
		east = 3582,
		south = 3584
	}
})
Config.NewRoom({
	Id = 3584,
	Name = "On The Trail Of The Horsemen",
	Desc = [[   The trail of the horsemen continues east and north along this path
through the forest.  The tracks are still fresh, so they must be near.]],
	Exits = {
		north = 3583,
		west = 3585
	}
})
Config.NewRoom({
	Id = 3585,
	Name = "A Dead End Trail",
	Desc = [[   The path comes to an abrupt end here, as the trees close around you and
make any further exploration impossible.  Fresh tracks cover the ground, and
end right here.  The horsemen must be nearby.]],
	Exits = {
		east = 3584
	}
})
