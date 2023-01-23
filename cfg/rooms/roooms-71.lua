Config.NewRoom({
	Id = 7001,
	Name = "The Fissure Under The Ledge",
	Desc = [[   This is a small fissure in the solid rock.  Under you lies the deep dark
pool.  The water trickles quietly down from the ledge above you.  The water
smells like the water in a sewer.]],
	Exits = {
		up = 7071,
		down = 7101
	}
})
Config.NewRoom({
	Id = 7002,
	Name = "The Muddy Sewer",
	Desc = [[   You are standing in mud to your knees.  This is not the kind of place
for a picnic.  The muddy sewer stretches further into the south.]],
	Exits = {
		south = 7003
	}
})
Config.NewRoom({
	Id = 7003,
	Name = "The Muddy Sewer Junction",
	Desc = [[   The muddy sewer stretches into the dark to the south.  It looks as if 
no person has ever put his foot here before.  It is too muddy for that
anyway.  The sewer leads north, south and east from here.]],
	Exits = {
		north = 7002,
		south = 7004,
		east = 7008
	}
})
Config.NewRoom({
	Id = 7004,
	Name = "The Mudhole",
	Desc = [[   You stand in mud all the way up to your thighs and it is not too 
comfortable since you are used to a somewhat different environment.
The sewer leads to the north of here.  In the middle you can just
make out an enormous drainpipe leading down.]],
	Exits = {
		north = 7003,
		down = 7102
	}
})
Config.NewRoom({
	Id = 7005,
	Name = "The Dark Pit",
	Desc = [[   You are standing by the edge of a dark pit that leads down into even
deeper darkness.  >BWWAAADDRR< - The smell from down there is unbearable.
The sewer stretches into the darkness to the east.]],
	Exits = {
		east = 7010,
		down = 7103
	}
})
Config.NewRoom({
	Id = 7006,
	Name = "The Muddy Sewer",
	Desc = [[   You are standing in the middle of a bend of the sewer pipe.  It is very
dark around here and the mud is sticking to your legs, not very pleasant.
The pipe leads east and south from here.]],
	Exits = {
		east = 7012,
		south = 7007
	}
})
Config.NewRoom({
	Id = 7007,
	Name = "The Muddy Sewer",
	Desc = [[   You are standing in something that reminds you very much of porridge,
this has the advantage that it is not hot, it is rather cold actually.
The pipe bends to the north and east.]],
	Exits = {
		east = 7013,
		north = 7006
	}
})
Config.NewRoom({
	Id = 7008,
	Name = "The Muddy Sewer Bend",
	Desc = [[   This isn't your idea of a place to stay too long.  You're in up to
your knees in something that resembles mud, but you're not quite sure.
The bend in which you stand leads west and south.]],
	Exits = {
		west = 7003,
		south = 7009
	}
})
Config.NewRoom({
	Id = 7009,
	Name = "A Muddy Intersection",
	Desc = [[   You have both your feet safely stuck in mud.  It isn't the mud that is
wrong it is the smell, the sounds, the total darkness that surrounds you.
Everything here is so depressing.  The pipe leads on with a trail of thick
mud to the north, east and south.]],
	Exits = {
		north = 7008,
		east = 7015,
		south = 7010
	}
})
Config.NewRoom({
	Id = 7010,
	Name = "The Sewer Junction",
	Desc = [[   You stand in the middle of a huge junction of sewer pipes right under
what you'd think was an air shaft.  The sewer pipes lead to the north,
south, east and west.  It look quite impossible to force your way up.]],
	Exits = {
		north = 7009,
		east = 7018,
		south = 7011,
		west = 7005
	}
})
Config.NewRoom({
	Id = 7011,
	Name = "A Bend In The Sewer Pipe",
	Desc = [[   You are in a bend in the sewer pipe.  A strong smell seeps in from the
north.  The sewer goes north and east.]],
	Exits = {
		north = 7010,
		east = 7019
	}
})
Config.NewRoom({
	Id = 7012,
	Name = "The Muddy Sewer Pipe",
	Desc = [[   You have entered a kind of tube intersection that leads south, west
and east.  Your legs are covered in mud up to the knees.  REAL yucky!  ]],
	Exits = {
		east = 7025,
		south = 7022,
		west = 7006
	}
})
Config.NewRoom({
	Id = 7013,
	Name = "The Bend In The Muddy Sewer",
	Desc = [[   This is not your idea of a holiday.  You stand in mud up to your knees.
It is absolutely inconceivable how all this mud could have been placed
here.  The pipe leads to the west and south.]],
	Exits = {
		south = 7014,
		west = 7007
	}
})
Config.NewRoom({
	Id = 7014,
	Name = "A Muddy Intersection",
	Desc = [[   You wouldn't want to know the true feeling of standing in this mud up to
your hips.  >BWAADR<.  All that fills your mind right now is the dream of
a hot bath.  This is NOT very clean mud you know, remember you're in the
sewer!  The pipes leads north, south and east.]],
	Exits = {
		north = 7013,
		east = 7027,
		south = 7015
	}
})
Config.NewRoom({
	Id = 7015,
	Name = "The Muddy Sewer",
	Desc = [[   You stand in a bend of the pipe system of the sewer with mud up to your
thighs.  Contemplating a higher level of existence here would be utterly
inappropriate, as the smell would keep any intelligent creature from even
thinking of anything but getting away from this foul end of the WORLD.
The bend goes from north to west.]],
	Exits = {
		north = 7014,
		west = 7009
	}
})
Config.NewRoom({
	Id = 7016,
	Name = "The Old Well",
	Desc = [[   You are standing by an old and worn well from before this century.  The
sewer leads to the east from here and the well leads down into darkness.
Metal bars implanted in the side of the well lead down as a ladder.]],
	Exits = {
		east = 7029,
		down = 7106
	}
})
Config.NewRoom({
	Id = 7017,
	Name = "The Ordinary Bend",
	Desc = [[   You are in the middle of a bend in the pipe system of the sewer system, 
WHAT a place!!!  The pipe leads to the south and the east.]],
	Exits = {
		south = 7018,
		east = 7022
	}
})
Config.NewRoom({
	Id = 7018,
	Name = "The Sewer Junction",
	Desc = "   You are in a junction that leads north, west and south.",
	Exits = {
		north = 7017,
		west = 7010,
		south = 7019
	}
})
Config.NewRoom({
	Id = 7019,
	Name = "The Ordinary Junction",
	Desc = [[   This looks like an ordinary junction, actually it seems very quiet
here.  The pipelines lead west, east and north.]],
	Exits = {
		north = 7018,
		east = 7032,
		west = 7011
	}
})
Config.NewRoom({
	Id = 7022,
	Name = "A Quiet Pipe Junction",
	Desc = [[   This is the kind of place to rest, though the smell could be a LOT
better than this.  The sewer goes east, north and west from here.]],
	Exits = {
		north = 7012,
		east = 7030,
		west = 7017
	}
})
Config.NewRoom({
	Id = 7023,
	Name = "The Odd Room With Smooth Walls",
	Desc = [[   As you enter you hear a loud click from one of the walls... and you fall
and fall and fall...
.
.
.
.
... And come to an abrupt end.  THIS is strange indeed.  There is an arched
entryway leading down.]],
	Exits = {
		down = 7113
	}
})
Config.NewRoom({
	Id = 7025,
	Name = "The Sewer",
	Desc = [[   You are standing in mud up to your ankles.  This is an intersection with 
sewer pipes leading east, south and west.]],
	Exits = {
		east = 7038,
		south = 7026,
		west = 7012
	}
})
Config.NewRoom({
	Id = 7026,
	Name = "Another Intersection",
	Desc = [[   You have never seen anything so BORING... This is an intersection with
pipes leading north, south and east.]],
	Exits = {
		north = 7025,
		east = 7039,
		south = 7027
	}
})
Config.NewRoom({
	Id = 7027,
	Name = "A Junction",
	Desc = [[   This one seems interesting, a big difference from all the other junctions.
It seems cleaner than the rest of them.  Weird.  Something that looks like 
an air shaft leads upwards, but it looks far too slippery to climb.
The pipes lead to the south, west and north.]],
	Exits = {
		north = 7026,
		south = 7029,
		west = 7014
	}
})
Config.NewRoom({
	Id = 7029,
	Name = "The Sewer Junction",
	Desc = "   You stand in a junction of sewer pipes leading north, east and west.",
	Exits = {
		north = 7027,
		east = 7035,
		west = 7016
	}
})
Config.NewRoom({
	Id = 7030,
	Name = "The Triple Junction",
	Desc = [[   You stand in the middle of a huge junction of concrete sewer pipes.  The 
pipes lead into three different directions: east, south and west.]],
	Exits = {
		east = 7036,
		south = 7031,
		west = 7022
	}
})
Config.NewRoom({
	Id = 7031,
	Name = "The Quadruple Junction Under The Dump",
	Desc = [[   You are standing in something that reminds you of an entry to an ant hive.
There are enormous concrete pipes leading north, south, east and west.  
There is also a metal ladder built into the concrete wall leading up through
a layer of garbage.  ]],
	Exits = {
		north = 7030,
		east = 7037,
		south = 7032,
		west = 7023,
		up = 3031
	}
})
Config.NewRoom({
	Id = 7032,
	Name = "A Triple Junction",
	Desc = "   You stand in a junction with pipes leading west, north and east.",
	Exits = {
		north = 7031,
		east = 7045,
		west = 7019
	}
})
Config.NewRoom({
	Id = 7035,
	Name = "A Bend In The Sewer Pipe",
	Desc = "   You can look in two directions where the pipe leads: south and west.",
	Exits = {
		west = 7029,
		south = 7036
	}
})
Config.NewRoom({
	Id = 7036,
	Name = "The Sewer Pipe Bend",
	Desc = [[   You can look in two different directions where the pipe goes: west and 
north.]],
	Exits = {
		west = 7030
	}
})
Config.NewRoom({
	Id = 7037,
	Name = "The Pit",
	Desc = [[   You stand in a section of a pipe that leads to a dead end.  In the floor
there is a pit leading down.  There are bars set in the side of the pit
wall functioning as a ladder.]],
	Exits = {
		west = 7031,
		down = 7123
	}
})
Config.NewRoom({
	Id = 7038,
	Name = "The Round Room",
	Desc = [[   As you enter the room it starts rotating - at first slowly, then faster
and faster - You get totally confused as to where up and down is, but
you are certain that the doorway is in the opposite direction of what
it was when you entered.  It now leads east.  There is only this one
exit.]],
	Exits = {
		east = 7051
	}
})
Config.NewRoom({
	Id = 7039,
	Name = "The Three Way Junction",
	Desc = "   You are standing in a junction of pipes that lead west, east and south.",
	Exits = {
		east = 7046,
		south = 7040,
		west = 7026
	}
})
Config.NewRoom({
	Id = 7040,
	Name = "The Sewer Store Room",
	Desc = [[   You stand in a small room lit by a single torch set in the wall.  The only 
way out of here is to the north.]],
	Exits = {
		north = 7039
	}
})
Config.NewRoom({
	Id = 7042,
	Name = "The Shaft",
	Desc = [[   You are standing by the edge of a deep, dark shaft leading down.  A single
ladder is your tool to work your way down if you so wish.  The sewer pipe
leads south from here.]],
	Exits = {
		south = 7044,
		down = 7124
	}
})
Config.NewRoom({
	Id = 7044,
	Name = "The Sewer Entrance",
	Desc = [[   You stand in the middle of a pipe that leads from north to south.  Above
you an air shaft leads up into sunlight.  It seems totally impossible to go
up that way.]],
	Exits = {
		north = 7042,
		south = 7045
	}
})
Config.NewRoom({
	Id = 7045,
	Name = "The Junction Going Three Ways",
	Desc = [[   You are in a passageway in the pipes of the sewer system leading north,
east and west.]],
	Exits = {
		north = 7044,
		east = 7050,
		west = 7032
	}
})
Config.NewRoom({
	Id = 7046,
	Name = "The Sewer Room",
	Desc = [[   You are standing in a large room with chairs set in the walls.  You have
the feeling of being watched.  To the south there is an entrance to a
larger room.  The room is lit by five torches, also set in the walls.  To
the west there is a doorway leading out to the sewers.]],
	Exits = {
		south = 7047,
		west = 7039
	}
})
Config.NewRoom({
	Id = 7047,
	Name = "The Sewer Room",
	Desc = [[   This is a Room with walls that glitters like gold though not quite like
it. This is strange as it looks as if the glitter lights the whole room.
It looks very bright.  To the south the floor is covered with yucky water.
The north leads to a sort of a guard room.]],
	Exits = {
		south = 7048
	}
})
Config.NewRoom({
	Id = 7048,
	Name = "The Pool In The Sewer",
	Desc = [[   You stand in water to your waist.  To the north is the entrance to this
room.  A single door leads east.]],
	Exits = {
		north = 7047,
		east = 7054
	}
})
Config.NewRoom({
	Id = 7049,
	Name = "The Sewers",
	Desc = [[   You stand in a dead end of the sewer.  The only way out is south.
You can see a shaft leading up but it looks too difficult to go up
that way.]],
	Exits = {
		south = 7050
	}
})
Config.NewRoom({
	Id = 7050,
	Name = "The Junction",
	Desc = "   You stand in a junction leading north, west and east.",
	Exits = {
		east = 7061,
		west = 7045
	}
})
Config.NewRoom({
	Id = 7051,
	Name = "The Small Room",
	Desc = [[   The only thing in this room of interest is a chair, and that appears
to have been bolted to the rock floor.  A doorway leads south and another
leads east into darkness.]],
	Exits = {
		east = 7056,
		south = 7052
	}
})
Config.NewRoom({
	Id = 7052,
	Name = "The Sewer Pipe",
	Desc = [[   You are in what reminds you of a foul sewer, as if you liked being here!  
You can see two exits leading either north or south.]],
	Exits = {
		north = 7051,
		south = 7053
	}
})
Config.NewRoom({
	Id = 7053,
	Name = "The Grand Sewer",
	Desc = [[   You are in a grand sewer pipe.  This stretches toward the south.  It is
large indeed!  A doorway leads to the east from here.]],
	Exits = {
		north = 7052,
		east = 7057,
		south = 7054
	}
})
Config.NewRoom({
	Id = 7054,
	Name = "The South End Of The Grand Pipe",
	Desc = [[   You stand in water to your knees.  A doorway leads west from here.  The
pipe stretches north.]],
	Exits = {
		north = 7053,
		west = 7048
	}
})
Config.NewRoom({
	Id = 7056,
	Name = "The Edge Of The Water Sewer",
	Desc = [[   You stand in a room where half of the floor is covered in water.  The
water leads east and a doorway leads west.]],
	Exits = {
		east = 7062,
		west = 7051
	}
})
Config.NewRoom({
	Id = 7057,
	Name = "The Dark Hallway",
	Desc = [[   You can't see much of this, even with a light.  The hallway goes into a
passageway to the south.  A doorway leads west.]],
	Exits = {
		south = 7058,
		west = 7053
	}
})
Config.NewRoom({
	Id = 7058,
	Name = "The Dark Passageway",
	Desc = [[   You can't see anything but the ground where you put your feet.  The 
passageway seems to continue south and north.]],
	Exits = {
		north = 7057,
		south = 7059
	}
})
Config.NewRoom({
	Id = 7059,
	Name = "The Dark Passageway",
	Desc = [[   You can't see anything but the ground where you put your feet.  The
passageway seems to continue south and north.]],
	Exits = {
		north = 7058,
		south = 7060
	}
})
Config.NewRoom({
	Id = 7060,
	Name = "The Dark Passageway",
	Desc = [[   You can't see anything but the ground where you put your feet.  The
passageway seems to continue south and north.]],
	Exits = {
		north = 7059,
		south = 7061
	}
})
Config.NewRoom({
	Id = 7061,
	Name = "The Dark Passageway",
	Desc = [[   You can't see anything but the ground where you put your feet.
The passageway seems to continue west and north.  To the east there
is water covering the floor and that leads through an arched entry
to a watery sewer.]],
	Exits = {
		north = 7060,
		east = 7069,
		west = 7050
	}
})
Config.NewRoom({
	Id = 7062,
	Name = "The Watery Sewer Bend",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to bend and lead south and west.]],
	Exits = {
		south = 7063,
		west = 7056
	}
})
Config.NewRoom({
	Id = 7063,
	Name = "The Watery Sewer",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to lead south and north.]],
	Exits = {
		north = 7062,
		south = 7064
	}
})
Config.NewRoom({
	Id = 7064,
	Name = "The Watery Sewer",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to lead south and north.]],
	Exits = {
		north = 7063,
		south = 7065
	}
})
Config.NewRoom({
	Id = 7065,
	Name = "The Watery Sewer Junction",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to lead into a junction going south, north and east.]],
	Exits = {
		north = 7064,
		east = 7070,
		south = 7066
	}
})
Config.NewRoom({
	Id = 7066,
	Name = "The Watery Sewer",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to lead south and north.]],
	Exits = {
		north = 7065,
		south = 7067
	}
})
Config.NewRoom({
	Id = 7067,
	Name = "The Watery Sewer Junction",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to lead into a junction that goes north, south and east.]],
	Exits = {
		north = 7066,
		east = 7071,
		south = 7068
	}
})
Config.NewRoom({
	Id = 7068,
	Name = "The Watery Sewer",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to lead south and north.]],
	Exits = {
		north = 7067,
		south = 7069
	}
})
Config.NewRoom({
	Id = 7069,
	Name = "The Watery Sewer Bend",
	Desc = [[   You can't see anything but the water you're in up to your hips.  The sewer
seems to bend and lead west and north.]],
	Exits = {
		north = 7068,
		west = 7061
	}
})
Config.NewRoom({
	Id = 7070,
	Name = "A Ledge By A Dark Pool",
	Desc = [[   You can't see much here but the echo tells you that there is quite a drop
down.  You can just make out a huge dark pool out there in the darkness, 
mostly because of the trickling of water.  The water from the sewer actually
washes over this ledge and makes it quite slippery.  From here it drops, 
like a waterfall, into the pool far down.]],
	Exits = {
		south = 7071,
		west = 7065
	}
})
Config.NewRoom({
	Id = 7071,
	Name = "A Ledge By A Dark Pool",
	Desc = [[   You can't see much here but the echo tells you that there is quite a drop
down.  You can just make out a huge dark pool out there in the darkness,
mostly because of the trickling of water.  The water from the sewer actually
washes over this ledge and makes it quite slippery.  From here it drops,
like a waterfall, into the pool far down.  Under you there is a small fissure
in the rock.  It seems big enough to contain a few people.]],
	Exits = {
		north = 7070,
		west = 7067,
		down = 7001
	}
})
