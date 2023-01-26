Config.NewRoom({
	Id = 1201,
	Name = "The Meeting Room Of The Gods",
	Desc = [[
   The meeting room is plain and very simple.  A circular table sits
in the middle of the room, lit by some unseen light source.  There
are many chairs around the table, all empty.  The Immortal Board Room
is to the north.
]],
	Exits = {
		north = 1205
	}
})
Config.NewRoom({
	Id = 1202,
	Name = "The Inn Of The Gods",
	Desc = [[
   The Inn of the Gods is a small room, holding only a shelf with many
small precious stones on it.  When a God comes to rent his belongings,
his essence is stored in the stones.  The Immortal Board Room is to
the south.
]],
	Exits = {
		south = 1205
	}
})
Config.NewRoom({
	Id = 1203,
	Name = "The Ice Box Of The Gods",
	Desc = [[
   The Ice Box is for little boys and girls that cannot play nice. Be good
and maybe someone will come and get you.
]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 1204,
	Name = "The Gods' Mortal Board Room",
	Desc = [[
   Here the Gods have magically created an exact copy of the mortal board
room.  Any God can easily post and read messages from the mortal board room
without being seen by any mortals.  The Immortal Board Room is to the west.
]],
	Exits = {
		west = 1205
	}
})
Config.NewRoom({
	Id = 1205,
	Name = "The Immortal Board Room",
	Desc = [[
   The main hang out of the Gods, the Immortal Board Room is the place to
be.  Gods exchange messages here most every day.  The mortal board room is
to the east and the meeting room for the gods is to the south.  To the north
is the Gods' Inn and to the west is a post office for Gods.  There is a large
staircase leading down to the main temple in the city of Midgaard.  In the
northeast corner you spot a small staircase leading upwards.
]],
	Exits = {
		north = 1202,
		east = 1204,
		south = 1201,
		west = 1206,
		up = 1207,
		down = 3002
	}
})
Config.NewRoom({
	Id = 1206,
	Name = "The Post Office Of The Gods",
	Desc = [[
   The Post Office Of The Gods is the same as most Post Offices except that
it is not as slow.  Even the Postal service knows not to anger the Gods.
Piles of junk mail line the walls.  I guess even Gods get on mailing lists.
The Immortal Board Room is to the east.
]],
	Exits = {
		east = 1205
	}
})
Config.NewRoom({
	Id = 1207,
	Name = "The Social Gathering Room",
	Desc = [[
   This elegantly decorated room has one simple purpose.  To socialize with
everyone else around in one central location.
]],
	Exits = {
		down = 1205
	}
})
