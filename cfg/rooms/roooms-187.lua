Config.NewRoom({
	Id = 18601,
	Name = "The Entrance To The Newbie Zone",
	Desc = [[   Ahhh... the entrance to the newbie zone!  Just the place you have
been looking for.  Well, when you've readied yourself you can enter
to the north.]],
	Exits = {
		north = 18602,
		west = 3062
	}
})
Config.NewRoom({
	Id = 18602,
	Name = "The Beginning Of The Passage",
	Desc = [[   You find yourself entering a long corridor.  You can hear the sound
of creatures roaming about, but you can't tell where the sound emanates
from exactly.
   Exits lead to the east along the hallway, and south back to the
entrance.]],
	Exits = {
		east = 18603,
		south = 18601
	}
})
Config.NewRoom({
	Id = 18603,
	Name = "The Dirty Hallway",
	Desc = [[   You continue wandering down the hallway.  Nothing much different here,
but you are positive you here noises behind the door to the south, and
coming from the east.  The walls are a bit slimy and moldy here... yeech,
couldn't they hire someone to clean this place?  What will the newbies
think?  Oh well, you can continue along the hallway to the east or west.]],
	Exits = {
		east = 18604,
		south = 18607,
		west = 18602
	}
})
Config.NewRoom({
	Id = 18604,
	Name = "A Nexus",
	Desc = [[   Well... you've reached an intersection of two passages, to the north
and east, the passage brightens, while the darker hallway continues to
the south.]],
	Exits = {
		north = 18645,
		east = 18647,
		south = 18608,
		west = 18603
	}
})
Config.NewRoom({
	Id = 18605,
	Name = "A Narrow Passage",
	Desc = [[   The thin passage is plain and undecorated, but still clean.  It
ends abruptly to the south at a small oak door, behind which you here
movement...]],
	Exits = {
		north = 18648,
		south = 18613
	}
})
Config.NewRoom({
	Id = 18606,
	Name = "The Dark Pit",
	Desc = [[   Ick... a dark damp dirty pit.  Even worse, what is that dark damp
dirty thing looking at you from the corner?  Ewww... maybe you should
go back up where it is a bit safer, unless you think you can tackle
that thing in the corner.]],
	Exits = {
		up = 18607
	}
})
Config.NewRoom({
	Id = 18607,
	Name = "A Small Room",
	Desc = [[   Hmmm... this is an interesting little room.  Ack, and there is
an interesting little creature staring at you too.  He looks a bit
surprised at your intrusion.  You can leave via the doors north or
east, or you can stay and annoy him a bit more.  There also appears
to be some type of well down here also, but it has a rather secure
grate covering it.]],
	Exits = {
		north = 18603,
		east = 18608,
		down = 18606
	}
})
Config.NewRoom({
	Id = 18608,
	Name = "More Of The Hallway",
	Desc = [[   Oh joy!  More of this annoying passage.  Perhaps there is something
more exciting through that door to the west?  Or you can keep searching
the hallways to the north or south.]],
	Exits = {
		north = 18604,
		south = 18612,
		west = 18607
	}
})
Config.NewRoom({
	Id = 18609,
	Name = "An Open Field By The Great Field",
	Desc = [[   Finally, you are in an open field... it is so nice to breathe fresh air
again!  You can return to that dank, smelly place to the east, or take the
exit to the north which appears to lead into a large field.]],
	Exits = {
		north = 3062,
		east = 18610
	}
})
Config.NewRoom({
	Id = 18610,
	Name = "The End Of The Passage",
	Desc = [[    Ahhh... at last, the end of the hallway... you can exit into open
air to the west,or return to the east and make sure you didn't miss
anything.]],
	Exits = {
		east = 18611,
		west = 18609
	}
})
Config.NewRoom({
	Id = 18611,
	Name = "A Brighter Hallway",
	Desc = [[   The hallway continues on in a east-west direction... and it seems to
be brightening up to the west.]],
	Exits = {
		east = 18612,
		west = 18610
	}
})
Config.NewRoom({
	Id = 18612,
	Name = "Another Corner",
	Desc = [[   Another corner of the passage, and just as untidy as the rest of
this place (maybe more so?).  There is a door to the east though...
wonder where that leads?  Oh, and the hallway continues west and
north.]],
	Exits = {
		north = 18608,
		east = 18613,
		west = 18611
	}
})
Config.NewRoom({
	Id = 18613,
	Name = "The Alchemist's Room",
	Desc = [[   Lots of bottles and flasks lie about this room, but it all looks like
worthless clutter.  It appears whatever alchemist has been working here
is really very adept at his art.  There are a lot of formulae and spells
written on the walls too... couldn't he buy some paper?  There is a door
to the north, and also a dark stairway in the corner leading down, with a
large sign next to it that you probably should read...]],
	Exits = {
		north = 18605,
		west = 18612,
		down = 18633
	}
})
Config.NewRoom({
	Id = 18621,
	Name = "A Turn In The Passage",
	Desc = [[   This corner is much like all the others... except you see a strange
glow coming from the south.  Could be an exit... you hope.]],
	Exits = {
		east = 18622,
		south = 18630
	}
})
Config.NewRoom({
	Id = 18622,
	Name = "A T-Intersection In The Passage",
	Desc = [[   This is an intersection of a long east-west passage with a corridor
leading south.  The air seems a bit clearer here though, as if you were
approaching an exit.]],
	Exits = {
		east = 18623,
		south = 18634,
		west = 18621
	}
})
Config.NewRoom({
	Id = 18623,
	Name = "Another Corner",
	Desc = [[   The passage turns from north to west here.  The walls are still
covered with the same disgusting green fungus you have seen all
along, and you hear sounds of creatures moving all around you...]],
	Exits = {
		south = 18629,
		west = 18622
	}
})
Config.NewRoom({
	Id = 18624,
	Name = "A Corner In The Hallway",
	Desc = [[   You can hear creatures moving all around you... and it is not
a comforting sound at all.  The furnishing is nothing to speak of
either, plain grey brick walls with green fungus (or something)
growing on them.]],
	Exits = {
		east = 18625,
		south = 18628
	}
})
Config.NewRoom({
	Id = 18625,
	Name = "Another Turn",
	Desc = [[   Hmmm... the passage turns south here.  You beginning to realize you
can easily lose your bearings if you aren't careful, and you don't think
you would like spending too much time here...]],
	Exits = {
		south = 18631,
		west = 18624
	}
})
Config.NewRoom({
	Id = 18626,
	Name = "A Large Room",
	Desc = [[   The passage opens into a large oval room.  There really isn't much of
interest here though.]],
	Exits = {
		east = 18627,
		south = 18632
	}
})
Config.NewRoom({
	Id = 18627,
	Name = "A Long East-West Passage",
	Desc = [[   This is a long, narrow passage leading east and west.  The walls are
damp and covered with mildew and fungus.  There is a very unhealthy air
about this place and you're beginning to want out of here... soon.]],
	Exits = {
		east = 18628,
		west = 18626
	}
})
Config.NewRoom({
	Id = 18628,
	Name = "A Crossing Of Corridors",
	Desc = [[   Here a narrow east-west passage crosses with a wider passage to the
north and south.  The air is dank, and has an odor of decay and debris.
Not a nice place at all really...]],
	Exits = {
		north = 18624,
		east = 18629,
		south = 18633,
		west = 18627
	}
})
Config.NewRoom({
	Id = 18629,
	Name = "A Corner Room",
	Desc = [[   This room is hardly more than a crossing of passages.  You do sense a
slight breeze wafting down the passage to the north though, but it smells
altogether bad...]],
	Exits = {
		north = 18623,
		west = 18628
	}
})
Config.NewRoom({
	Id = 18630,
	Name = "The Red Room",
	Desc = [[   It takes you a moment to realize that the red glow here is coming
from a round portal on the floor.  It looks almost as if someone had
painted a picture of a dirt running through a field on the floor of
this room.  Oddly enough, it is so realistic you can feel the wind in
the field coming out of the picture.]],
	Exits = {
		north = 18621,
		east = 18631,
		down = 3062
	}
})
Config.NewRoom({
	Id = 18631,
	Name = "A Branching Passage",
	Desc = [[   The north-south passage branches to the east here.  There is a queer red
glow coming from that way as well, along with a faint breeze.]],
	Exits = {
		north = 18625,
		south = 18635,
		west = 18630
	}
})
Config.NewRoom({
	Id = 18632,
	Name = "A Passage",
	Desc = [[   Ick... this place is just disgusting.  You try and stay clear of the
walls, but the passage is so narrow you keep bumping them anyway.  You
are almost convinced that the fungus coating the walls is grabbing at
you too.]],
	Exits = {
		north = 18626,
		east = 18633,
		south = 18639
	}
})
Config.NewRoom({
	Id = 18633,
	Name = "The Entrance",
	Desc = [[   It is dark, dank, disgusting and cold up here.  Plus you here the
sounds of creatures all around you... and somehow they don't sound
friendly.  It is probably wise to exercise some degree of caution
here... no telling what you may run into here.]],
	Exits = {
		north = 18628,
		south = 18636,
		west = 18632,
		up = 18613
	}
})
Config.NewRoom({
	Id = 18634,
	Name = "Another Corner",
	Desc = [[   Well... what is there to say.  More fungus, more weird sounds, and a
slight breeze from the north.  Bet you want to sign a lease, don't ya...]],
	Exits = {
		north = 18622,
		east = 18635
	}
})
Config.NewRoom({
	Id = 18635,
	Name = "An Intersection Of Passages",
	Desc = [[   Cold, smelly, and coated with green fungus... just like last week's
left-overs.  Furthermore you want nothing to do with either, you just
want out right now.]],
	Exits = {
		north = 18631,
		south = 18638,
		west = 18634
	}
})
Config.NewRoom({
	Id = 18636,
	Name = "A Turn In The Passage",
	Desc = [[   This place is just plain nauseating... it certainly smells as if
something (or someone) died in here.  You hope you aren't next, but
from the sounds you hear all around you, it seems as if something has
other ideas about that.]],
	Exits = {
		north = 18633,
		east = 18637
	}
})
Config.NewRoom({
	Id = 18637,
	Name = "A Branch To The South",
	Desc = [[   The east-west passage branches of to the south here.  All around you
is the odour of death.  Actually, the mold and fungus on the walls is
doing great, but otherwise... well... you don't want to think about what
else lives here.]],
	Exits = {
		east = 18638,
		south = 18640,
		west = 18636
	}
})
Config.NewRoom({
	Id = 18638,
	Name = "Yet Another Corner",
	Desc = [[   The passage turns here and heads north.  You sense something up ahead
that way, but you aren't sure what.  You aren't sure if you want to know
what either at this point.]],
	Exits = {
		north = 18635,
		west = 18637
	}
})
Config.NewRoom({
	Id = 18639,
	Name = "A Large Room",
	Desc = [[   You almost stumble as you enter this room... the sudden feeling of no
walls on either side of you makes you a bit nervous.  Suddenly you are
vulnerable on all sides.  You can't even tell how big a room this is,
because it extends to the east farther than you light will reach...]],
	Exits = {
		north = 18632,
		east = 18640
	}
})
Config.NewRoom({
	Id = 18640,
	Name = "A Large Room",
	Desc = [[   As you enter, you light glints of the wall to the east.  There appears
to be words scrawled on the wall, and a crude picture.  To the west the
room extends beyond the reach of your light, and the dark shadows make you
paranoid... anything could be hiding there.  You are painfully aware of
how exposed you are without walls around you.]],
	Exits = {
		north = 18637,
		west = 18639
	}
})
Config.NewRoom({
	Id = 18641,
	Name = "The Statue's Room",
	Desc = [[   Here, the passage enters a small room.  Exits lead to the east and south,
and you notice a wonderful, large (and tastefully done) statue to the north.]],
	Exits = {
		east = 18642,
		south = 18645
	}
})
Config.NewRoom({
	Id = 18642,
	Name = "The Hallway",
	Desc = [[   As you continue wandering down the hallway, you notice banners,
pictures, and other fine decorations adorning the walls all along
this passage.  It seems very different from the dismal passage where
you entered.]],
	Exits = {
		east = 18643,
		west = 18641
	}
})
Config.NewRoom({
	Id = 18643,
	Name = "The North Stairs",
	Desc = [[   Here, the hall opens into a wide room, with a high domed roof.  Now that
that you have come clear of the enclosed passage, you can see that the stair
leads upward to an open air balcony overlooking the area.  To the south the
room continues, and another stair is visible matching the one in front of
you.]],
	Exits = {
		south = 18648,
		west = 18642,
		up = 18644
	}
})
Config.NewRoom({
	Id = 18644,
	Name = "The Balcony",
	Desc = [[   Here you can look out and observe the world around.  Constructed in a
semi-circle around the dome of the room, the balcony allows you to look
out in almost any direction.  Wandering to the north end, you can see that
the Great Fields north of Midgaard continue off towards the Dragonhelm
Mountains to the north.]],
	Exits = {
		south = 18646,
		down = 18643
	}
})
Config.NewRoom({
	Id = 18645,
	Name = "A Bright Hallway",
	Desc = [[   Wow!  What a change from the dismal passage to the south.  Whoever
keeps this room up must really like newbies.  The walls and floor are
clean, and tastefully decorated.  You also notice an interesting design
on the floor.]],
	Exits = {
		north = 18641,
		south = 18604
	}
})
Config.NewRoom({
	Id = 18646,
	Name = "The Balcony",
	Desc = [[   Here you can look out and observe the world around.  Constructed in a
semi-circle around the dome of the room, the balcony allows you to look out
in almost any direction.  Wandering to the south end, you can see the great
city of Midgaard off to the south-west.]],
	Exits = {
		north = 18644,
		down = 18648
	}
})
Config.NewRoom({
	Id = 18647,
	Name = "A Bright Hallway",
	Desc = [[   Wow!  What a change from the dismal passage to the west.  Whoever keeps
this  room up must really like newbies.  The walls and floor are clean, and
tastefully decorated.  You also notice an interesting design on the floor.]],
	Exits = {
		east = 18648,
		west = 18604
	}
})
Config.NewRoom({
	Id = 18648,
	Name = "The South Stairs",
	Desc = [[   Here, the hall opens into a wide room, with a high domed roof.  Now that
that you have come clear of the enclosed passage, you can see that the stair
leads upward to an open air balcony overlooking the area.  to the north the
room continues, and another stair is visible matching the one in front of
you.]],
	Exits = {
		north = 18643,
		south = 18605,
		west = 18647,
		up = 18646
	}
})
