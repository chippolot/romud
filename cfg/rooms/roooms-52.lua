Config.NewRoom({
	Id = 5101,
	Name = "The City Entrance",
	Desc = [[   You are at the entrance to a small underground city.  A great adamantite
gate lies open to the west allowing entrance into the city.]],
	Exits = {
		west = 5102,
		up = 5012
	}
})
Config.NewRoom({
	Id = 5102,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate street going north-south.  A large gate
lies to the east while a building lies to the west.]],
	Exits = {
		north = 5124,
		east = 5101,
		south = 5103,
		west = 5123
	}
})
Config.NewRoom({
	Id = 5103,
	Name = "A City Street",
	Desc = "   You walk along a highly ornate city street going north and west.",
	Exits = {
		north = 5102,
		west = 5104
	}
})
Config.NewRoom({
	Id = 5104,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street going east-west.  A large house
stands to the south.]],
	Exits = {
		east = 5103,
		south = 5105,
		west = 5107
	}
})
Config.NewRoom({
	Id = 5105,
	Name = "The 3rd House",
	Desc = [[   You stand inside the 3rd house of the city; it is fairly well decorated
by drow standards having a few statues, murals and such.  A door leads to the 
south.]],
	Exits = {
		north = 5104,
		south = 5106
	}
})
Config.NewRoom({
	Id = 5106,
	Name = "The Throne Room",
	Desc = [[   The throne room of the 3rd house is about as decorated as the inner
courtyard except with a blood covered altar in the center of the room.]],
	Exits = {
		north = 5105
	}
})
Config.NewRoom({
	Id = 5107,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street going east-west.  To the north
is a large building.]],
	Exits = {
		north = 5119,
		east = 5104,
		west = 5108
	}
})
Config.NewRoom({
	Id = 5108,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street leading north and east.  To the
south is an extremely large house.]],
	Exits = {
		north = 5111,
		east = 5107,
		south = 5109
	}
})
Config.NewRoom({
	Id = 5109,
	Name = "The 2nd House",
	Desc = [[   You stand inside the 2nd house of the city.  The room is highly decorated
with statues of spiders and murals everywhere.]],
	Exits = {
		north = 5108,
		west = 5110
	}
})
Config.NewRoom({
	Id = 5110,
	Name = "The Throne Room",
	Desc = [[   The throne room of the 2nd house is just a little more decorative than
the inner courtyard having an altar in the center of the room.]],
	Exits = {
		east = 5109
	}
})
Config.NewRoom({
	Id = 5111,
	Name = "The Main Gate",
	Desc = [[   You are at the entrance to the 1st house of the city.  A large gate,
almost as big and elegant as the one at the entrance to the city, stands
here.]],
	Exits = {
		north = 5115,
		south = 5108,
		west = 5112
	}
})
Config.NewRoom({
	Id = 5112,
	Name = "The 1st House",
	Desc = [[   You stand in the inner courtyard of the 1st and largest house in the city.
The room is extremely large and decorative.  Mural and paintings hang on the 
walls depicting some battles and a spider queen.]],
	Exits = {
		east = 5111,
		west = 5113
	}
})
Config.NewRoom({
	Id = 5113,
	Name = "The Throne Room",
	Desc = [[   The throne room of the 1st house is in one word...awesome.  It is so
horrifying it is almost beautiful.]],
	Exits = {
		north = 5114,
		east = 5112
	}
})
Config.NewRoom({
	Id = 5114,
	Name = "The Main Chamber",
	Desc = [[   This is the council chamber for the Matron Mother herself.  A huge table
and chairs surrounding it sits in the center of the room.]],
	Exits = {
		south = 5113
	}
})
Config.NewRoom({
	Id = 5115,
	Name = "A City Street",
	Desc = "   You walk along a highly ornate city street leading north-south and east.",
	Exits = {
		north = 5116,
		east = 5118,
		south = 5111
	}
})
Config.NewRoom({
	Id = 5116,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street leading south.  A building is
to the west.]],
	Exits = {
		south = 5115,
		west = 5117
	}
})
Config.NewRoom({
	Id = 5117,
	Name = "The Clerics' Academy",
	Desc = "   This is the most lavish of the academies being that it is for the clerics.",
	Exits = {
		east = 5116
	}
})
Config.NewRoom({
	Id = 5118,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street going east-west.  To the north
is a giant temple.]],
	Exits = {
		north = 5120,
		east = 5122,
		west = 5115
	}
})
Config.NewRoom({
	Id = 5119,
	Name = "The Warriors' Academy",
	Desc = "   This looks more like a barracks than a school.",
	Exits = {
		south = 5107
	}
})
Config.NewRoom({
	Id = 5120,
	Name = "The Entrance To The Temple Of Lloth",
	Desc = [[   The temple is the largest building in the city.  Even its doors are beyond
imagination.  Inside of the temple entrance, the walls are made of gold and 
adamantite.]],
	Exits = {
		south = 5118,
		down = 5127
	}
})
Config.NewRoom({
	Id = 5121,
	Name = "The Mages' Academy",
	Desc = [[   The Mages' Academy is fairly well decorated and you can see that the
drow prefer magic over physical power greatly.]],
	Exits = {
		south = 5122
	}
})
Config.NewRoom({
	Id = 5122,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street going eastward.  To the north
is a building.]],
	Exits = {
		north = 5121,
		east = 5124,
		west = 5118
	}
})
Config.NewRoom({
	Id = 5123,
	Name = "The Slave Chamber",
	Desc = [[   The room is in shambles.  Straw is strewn all about the room as beds for
the unfortunate creatures who have fallen prey to drow imperialism.]],
	Exits = {
		east = 5102
	}
})
Config.NewRoom({
	Id = 5124,
	Name = "A City Street",
	Desc = [[   You walk along a highly ornate city street leading west and south.  To
the north is a relatively small house.]],
	Exits = {
		north = 5125,
		south = 5102,
		west = 5122
	}
})
Config.NewRoom({
	Id = 5125,
	Name = "The 4th House",
	Desc = [[   You stand inside the 4th house of the city.  Its inner courtyard is rather 
dull by drow standards and rather small as well.]],
	Exits = {
		east = 5126,
		south = 5124
	}
})
Config.NewRoom({
	Id = 5126,
	Name = "The Throne Room",
	Desc = [[   The throne room is basically similar to the inner courtyard in regards
to decor.  there is a small throne behind the altar but that is about it.]],
	Exits = {
		west = 5125
	}
})
Config.NewRoom({
	Id = 5127,
	Name = "The Entrance Hall",
	Desc = [[   You stand in the entrance way to the temple which opens up to the north
into a large hallway going east and west.  Small statues os spiders line the
entrance way's walls.]],
	Exits = {
		north = 5128,
		up = 5120
	}
})
Config.NewRoom({
	Id = 5128,
	Name = "A Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.
To the north is a obsidian stairway.]],
	Exits = {
		north = 5136,
		south = 5127,
		east = 5129,
		west = 5132
	}
})
Config.NewRoom({
	Id = 5129,
	Name = "A Long Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.]],
	Exits = {
		east = 5130,
		west = 5128
	}
})
Config.NewRoom({
	Id = 5130,
	Name = "A Long Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.
To the north is a door.]],
	Exits = {
		north = 5151,
		east = 5131,
		west = 5129
	}
})
Config.NewRoom({
	Id = 5131,
	Name = "A Long Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.]],
	Exits = {
		east = 5135,
		west = 5130
	}
})
Config.NewRoom({
	Id = 5132,
	Name = "A Long Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.]],
	Exits = {
		east = 5128,
		west = 5133
	}
})
Config.NewRoom({
	Id = 5133,
	Name = "A Long Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.
To the south is a door.]],
	Exits = {
		east = 5132,
		south = 5134,
		west = 5135
	}
})
Config.NewRoom({
	Id = 5134,
	Name = "The Warriors' Barracks",
	Desc = [[   The room is a complete mess.  None of the beds are made, clothes and other
items have been left all about the room.  Well drow warriors never were known
for neatness.]],
	Exits = {
		north = 5132
	}
})
Config.NewRoom({
	Id = 5135,
	Name = "A Long Hallway",
	Desc = [[   You are in a long hallway lined with adamantite.  The walls are engraved
with pictures of elves and spiders.  The hallway continues east and west.  As
you look down the hallway you can make out one or two figures moving away from
you.]],
	Exits = {
		east = 5133,
		west = 5131
	}
})
Config.NewRoom({
	Id = 5136,
	Name = "The Grand Stairway",
	Desc = [[   You are standing at the bottom of a giant obsidian and adamantite 
stairway.  The edges are trimmed with gold.]],
	Exits = {
		south = 5128,
		up = 5137
	}
})
Config.NewRoom({
	Id = 5137,
	Name = "The Grand Hallway",
	Desc = [[   You are standing in the middle of a grand hallway.  The walls are 
of the purest adamantite with gold trim.  Mosaics line the walls.]],
	Exits = {
		north = 5139,
		east = 5138,
		down = 5136
	}
})
Config.NewRoom({
	Id = 5138,
	Name = "The Mages' Barracks",
	Desc = [[   The mage's living quarters is rather clean with the exception of a few
used component containers.  It is rather well decorated as well.  Cots line
the floor for the mages to sleep on.  The only door is to the west.]],
	Exits = {
		west = 5137
	}
})
Config.NewRoom({
	Id = 5139,
	Name = "The Grand Hallway",
	Desc = [[   You are walking down a grand hallway, heavily decorated with adamantite
and gold.  To the north the hall goes down a flight of stairs while a door is 
to the west.]],
	Exits = {
		south = 5137,
		west = 5140,
		down = 5141
	}
})
Config.NewRoom({
	Id = 5140,
	Name = "The Clerics' Barracks",
	Desc = [[   The bed chamber is brightly decorated with spider shaped statues, murals
and the like.  Large beds line the floor making this a comfortable room to
live in.]],
	Exits = {
		east = 5139
	}
})
Config.NewRoom({
	Id = 5141,
	Name = "The Grand Stairway",
	Desc = [[   You are climbing a set of obsidian stairs surrounded by adamantite walls.
To the north are a set of large golden doors.]],
	Exits = {
		north = 5142,
		up = 5139
	}
})
Config.NewRoom({
	Id = 5142,
	Name = "The Main Chamber",
	Desc = [[   This is the south side of a large auditorium used for services by the
drow priestesses.  In the center is a large sacrificial pit and beyond that
is an altar.]],
	Exits = {
		east = 5143,
		south = 5141,
		west = 5145
	}
})
Config.NewRoom({
	Id = 5143,
	Name = "The Eastern Side Of The Main Chamber",
	Desc = [[   You are on the eastern side of the chamber overlooking the pit.  To the
east is a door while to the north is an altar.]],
	Exits = {
		north = 5146,
		east = 5147,
		south = 5142
	}
})
Config.NewRoom({
	Id = 5144,
	Name = "The Sacrificial Pit",
	Desc = [[   As you climb down into the pit, thousands of spiders cover you, tearing
your fragile body to shreds.  
 
Lloth thanks you for your sacrifice.
]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 5145,
	Name = "The Western Side Of The Main Chamber",
	Desc = [[   You are on the western side of the main chamber overlooking a sacrificial
pit.  To the north is an altar.]],
	Exits = {
		north = 5146,
		south = 5142
	}
})
Config.NewRoom({
	Id = 5146,
	Name = "The Altar",
	Desc = [[   You are standing in front of a highly and freshly bloodstained altar.  
Engraved on the top of the altar is a giant spider with a human head.  Looking 
down from the altar you see a large sacrificial pit with thousands of swarming
spiders looking for their next meal!]],
	Exits = {
		north = 5149,
		east = 5143,
		west = 5145,
		down = 5144
	}
})
Config.NewRoom({
	Id = 5147,
	Name = "The Slave Cells",
	Desc = [[   This is the main room to the cell chambers for the slaves to be 
sacrificed.  You notice there are no guards around.]],
	Exits = {
		north = 5148,
		west = 5143
	}
})
Config.NewRoom({
	Id = 5148,
	Name = "The Slave Pen",
	Desc = [[   Rotten meat and breads lie about the floor while shackles hang from the 
walls.  The room reeks of death.  You almost become nauseous and decide to
leave the room since you were obviously too late to save the slave.]],
	Exits = {
		south = 5147
	}
})
Config.NewRoom({
	Id = 5149,
	Name = "The Dias",
	Desc = [[   You stand upon a dias behind the altar.  Above you is a enormous illusion
of a female drow turning into a giant spider and back again.  There is a door 
to the west.]],
	Exits = {
		south = 5146,
		west = 5150
	}
})
Config.NewRoom({
	Id = 5150,
	Name = "The Treasury",
	Desc = [[   This is obviously only a temporary storage place for the collected 
treasure being rather bare.]],
	Exits = {
		east = 5149
	}
})
Config.NewRoom({
	Id = 5151,
	Name = "The Weaponsmaster's Chamber",
	Desc = [[   This one-person bedchamber is very elegant.  The owner must be held in
high regard to get this kind of treatment.]],
	Exits = {
		south = 5130
	}
})
