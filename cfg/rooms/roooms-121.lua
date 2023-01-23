Config.NewRoom({
	Id = 12002,
	Name = "The Judging Booth",
	Desc = [[   You stand in the midst of a small room with windows on the east and south
walls.  These windows provide a complete view of the competition fields.
There are several scorecards, pencils and other items that are used by the
judges sitting on a table.  The only exit is a trapdoor leading down.]],
	Exits = {
		down = 12003
	}
})
Config.NewRoom({
	Id = 12003,
	Name = "Caesar's Private Box",
	Desc = [[   This is the best view in the house!  You can see gladiators fighting or
the chariot races with an unobstructed view.  The seats are upholstered in
red velvet and are in top-notch condition.  There is a rickety ladder leading
up and a marble staircase leading down.]],
	Exits = {
		up = 12002,
		down = 12004
	}
})
Config.NewRoom({
	Id = 12004,
	Name = "The West Side Of The Commoner's Seating Area",
	Desc = [[   This is the western side commoner's seating area.  There are row upon
row of rough wooden benches bolted to the floor.  There is stadium garbage
everywhere and the smell makes you want to puke.  Stairs lead up to Caesar's 
private box, a small ramp leads down to the playing field and a hallway 
leads south.]],
	Exits = {
		south = 12005,
		up = 12003,
		down = 12011
	}
})
Config.NewRoom({
	Id = 12005,
	Name = "The Southern Commoner's Seats",
	Desc = [[   This is the southeastern part of the common seating areas.  The benches
here are made of stone and are probably centuries old.  A few scratches on
one of the benches catch your eye.  An acrid smell is coming from the east
and a tunnel leads off to the north.]],
	Exits = {
		north = 12004,
		east = 12012
	}
})
Config.NewRoom({
	Id = 12006,
	Name = "The Abandoned Gate",
	Desc = [[   This used to be a gateway to and from western Rome.  There is an iron gate
blocking your way and judging by the amount of rust and foliage growing on the
bars, it hasn't been open for years.  Looking through the gate at the barren
landscape that lies beyond, you can see why.  A dirt road leads off to the 
east, and a store is directly south.]],
	Exits = {
		east = 12013,
		south = 12007,
		west = 0
	}
})
Config.NewRoom({
	Id = 12007,
	Name = "Swords 'R  Us",
	Desc = [[   Welcome to the weaponshop of Titus Andronicus!!  Rare halberds, whips,
swords and other instruments of death are proudly displayed on the walls
and in gleaming glass cases.  More common weapons are stacked like wood on
the floor.  To the north you can barely make out a gate.  There is a very
secure looking door to the south.]],
	Exits = {
		north = 12006,
		south = 12008
	}
})
Config.NewRoom({
	Id = 12008,
	Name = "The Back Room",
	Desc = [[   If you thought that there were a lot of weapons in the front of the store,
you haven't seen anything yet!!  There is barely enough room to walk amongst
the crates of armor and swords.  No wonder Rome will stand for a thousand
years.  The only exit is through a door to the north.]],
	Exits = {
		north = 12007
	}
})
Config.NewRoom({
	Id = 12009,
	Name = "Peanut Heaven",
	Desc = [[   You are now so high up that you begin to feel lightheaded and your nose
feels like it is going to start bleeding.  There aren't even benches to sit
on here; just bare dirty stone.  The view of the surrounding country is
spectacular.  Unfortunately you can barely see the playing field.  There is
a set of steps here, leading down.]],
	Exits = {
		down = 12016
	}
})
Config.NewRoom({
	Id = 12010,
	Name = "The Practice And Warm-up Area",
	Desc = [[   There are many gladiators, chariot drivers and their coaches here, warming
up in preparation for the games.  The dust rising from the parched earth makes
you want to sneeze.  A short tunnel leads east and the thunder of pounding
hooves and the clash of weapons can be heard coming from the south.]],
	Exits = {
		east = 12017,
		south = 12011
	}
})
Config.NewRoom({
	Id = 12011,
	Name = "The Jousting Arena",
	Desc = [[   This is a wide open grassy plane... LOOK OUT!!!!  You are almost
skewered by a gladiator's lance as he makes his charge.  A practicing
area is due north.]],
	Exits = {
		north = 12010,
		up = 12004
	}
})
Config.NewRoom({
	Id = 12012,
	Name = "The First-Aid Station",
	Desc = [[   This is the place to come to if one is overcome by the heat and gore.
(Or if a lion gets loose)  You see a jar of live leeches and other barbaric
medical apparati lying about here.  From the west comes the roar of the
crowd, and a hall leads east.  The healer will be with you shortly.]],
	Exits = {
		east = 12019,
		west = 12005
	}
})
Config.NewRoom({
	Id = 12013,
	Name = "A Dirt Road",
	Desc = [[   You are on a parched and dusty rural road which runs east and west.  There
is a structure lying to the south.]],
	Exits = {
		east = 12020,
		south = 12014,
		west = 12006
	}
})
Config.NewRoom({
	Id = 12014,
	Name = "The Commoner's House",
	Desc = [[   You are standing in the main living quarters of a common Roman citizen.
The furnishings are sparse and it is warm here.  A putrid odor is coming
from the east and passages lead north and south.]],
	Exits = {
		north = 12013,
		east = 12021,
		south = 12015
	}
})
Config.NewRoom({
	Id = 12015,
	Name = "The Bedchamber",
	Desc = [[   This is the bedroom.  There is a hard and lumpy bed in the far corner.
It looks like the commoner's wife has been shirking her duties lately, as
there is a big pile of soiled laundry here.  The only way out is from where
you came.]],
	Exits = {
		north = 12014
	}
})
Config.NewRoom({
	Id = 12016,
	Name = "The Noblemans' Box",
	Desc = [[  These are the 'better' seats used primarily by the upper class of Rome.
There is a large seating area to the east and a staircase leading up here.
The view of the chariot track is pretty good. ]],
	Exits = {
		east = 12023,
		up = 12009
	}
})
Config.NewRoom({
	Id = 12017,
	Name = "The Race Track",
	Desc = [[   This is a hard dirt track about a quarter of a mile long.  There are hoof
prints everywhere, and you see a large cloud of dust approaching.  You had
better move before you get run over.  A small tunnel leads west, you can see
the crowd to the east.  You can hear loud snarls and roars coming from below.]],
	Exits = {
		up = 12024,
		down = 12018
	}
})
Config.NewRoom({
	Id = 12018,
	Name = "The Lion Pit",
	Desc = [[   As you land at the bottom of this dirt-walled pit, the realization that a
pit full of lions is NOT a good thing to be hanging around in.  Several of
the gladiators gather around the edge of the pit to watch your demise.  You
look around you, and all you see is tawny fur and gaping jaws... it is too
late to run, too late to hide.
   Twelve lions rip you and your belongings into a gory mass of bloodied
leather, bronze, and bone.

   What's that old saying? 
   Cats killed the curious?  Something like that, I'm sure...
]],
	Exits = {
		up = 12011,
		down = 12017
	}
})
Config.NewRoom({
	Id = 12019,
	Name = "The South Entrance To The Coliseum",
	Desc = [[   You are standing at the south entrance to the Coliseum.  There are
citizens of Rome everywhere, apparently in a mad rush to get in.  A
statue of Caligula the Mad Emperor overlooks the area.  There are long
lines standing to the east, and an acrid smell is coming from the west.
A busy road lies to the south.]],
	Exits = {
		east = 12026,
		south = 12020,
		west = 12012
	}
})
Config.NewRoom({
	Id = 12020,
	Name = "The Main Highway",
	Desc = [[   This is a well built and heavily traveled road running from east to west
and there is a large structure built entirely of stone to the north.]],
	Exits = {
		north = 12019,
		east = 12027,
		west = 12013
	}
})
Config.NewRoom({
	Id = 12021,
	Name = "The Outhouse",
	Desc = [[   PEEEEEEEEEEEEEEEE-YEEEEEWWWWWWWW!!!!!  Boy does it stink in here!!!  You
taste bile in your mouth and your eyes begin to water.  As you wipe away your
tears, you see that this is a small room, in the far corner of which a hole
is dug.  The odor intensifies as you move closer and there is a roll of toilet
paper sitting on the ground.  The only exit is to the west and your nose and
stomach are strongly suggesting that you use it.]],
	Exits = {
		west = 12014
	}
})
Config.NewRoom({
	Id = 12022,
	Name = "The Slave Quarters",
	Desc = [[   This is where the slaves sleep.  There are hard boards set out for use
as beds and not much else.  The only exit is to the east.]],
	Exits = {
		east = 12028
	}
})
Config.NewRoom({
	Id = 12023,
	Name = "The Common Seating",
	Desc = [[   This is where many of the common Roman citizens are seated during the
games.  These are the cheapest seats in the house, as glare from the sun
is usually a problem during the afternoon.  Like the other common seating
areas, this place could stand extensive renovation and a thorough cleaning.
This area extends to the south and a much more elegant seating area can be
seen to the west.]],
	Exits = {
		west = 12016,
		south = 12024
	}
})
Config.NewRoom({
	Id = 12024,
	Name = "The Common Seating",
	Desc = [[   This is where many of the common Roman citizens are seated during the
games.  Like the other commoners' areas in the coliseum, it could use
extensive renovation and cleaning.  This area extends to the north and
lots of noise can be heard coming from the south.]],
	Exits = {
		north = 12023,
		south = 12025
	}
})
Config.NewRoom({
	Id = 12025,
	Name = "The East Entrance To The Coliseum",
	Desc = [[   You are standing at the east entrance to the Coliseum.  There are people 
everywhere, apparently in a mad rush to get in.  A statue of Tiberius, an 
Emperor of a time long since passed, stands here looking out over the crowd.  
There is a passage to the north, the ticket booth is to the south and a gate 
opening to the city lies to the east.]],
	Exits = {
		north = 12024,
		south = 12026,
		east = 12032
	}
})
Config.NewRoom({
	Id = 12026,
	Name = "The Ticket Booth",
	Desc = [[   Long lines are standing here, waiting to buy tickets.  There are three
vendors working furiously.  Ticket stubs litter the ground and you can see
that the people are getting very impatient.  There is a large, open cashbox
here.  Main entrances to the Coliseum are to the north and west.  ]],
	Exits = {
		north = 12025,
		west = 12019
	}
})
Config.NewRoom({
	Id = 12027,
	Name = "A Paved Road",
	Desc = [[   You are on a paved road that runs east to west.  You can see an elaborate
looking estate to the south and to the north-west, off in the distance, you
can see a very large stone structure.]],
	Exits = {
		south = 12028,
		west = 12020
	}
})
Config.NewRoom({
	Id = 12028,
	Name = "A Noble Estate",
	Desc = [[   You are on the grounds of a nobleman's estate which is hundreds of times
the size and splendor of anything that a common citizen of Rome would ever
hope to own.  Everything is lush and green.  The grass is perfectly manicured
and the trees are all bearing fruit.  Ornamental plants are in perfectly
situated to enhance and adorn the three statues of dedicated to gods Jupiter,
Venus and Neptune.  A tranquil path leads east and west, there is a paved road
to the north and an extravagant house lies to the south.]],
	Exits = {
		north = 12027,
		east = 12035,
		south = 12029,
		west = 12022
	}
})
Config.NewRoom({
	Id = 12029,
	Name = "An Opulent House",
	Desc = [[   You stand in a house, the size and splendor of which almost defies the
imagination.  The floor is done with hand crafted marble tile with silver
and jeweled inlays.  The light coming through the exquisitely crafted stained
glass windows bathes the room in splendor and the furniture looks as though
it was made by master craftsmen from all over the empire.  A path through the
estate is north of here.]],
	Exits = {
		north = 12028
	}
})
Config.NewRoom({
	Id = 12030,
	Name = "The Great North Gate",
	Desc = [[   This is the northern gateway to the city of Rome.  The huge gate appears
to be closed and locked against intrusion.  A large road muddy road runs
through the gate and into the countryside.  Nero Drive runs south from here.]],
	Exits = {
		north = 0,
		south = 12031
	}
})
Config.NewRoom({
	Id = 12031,
	Name = "Nero Drive",
	Desc = [[   You are walking on a paved road that runs south through the city of Rome.
A great gate is directly north of here.  The Roman citizens are very friendly
and tip their hats or say hello as you pass.]],
	Exits = {
		north = 12030,
		south = 12032,
		west = 12063
	}
})
Config.NewRoom({
	Id = 12032,
	Name = "Nero Drive",
	Desc = [[   You are walking on a great paved road that runs north and south through
the city.  People are hurrying from one place to another, but always stop
to say hello.  Most of the people are either coming from or going to the
town square.  Nero Drive continues to the north, and you can see a large
open area to the south.]],
	Exits = {
		north = 12031,
		south = 12033,
		west = 12025
	}
})
Config.NewRoom({
	Id = 12033,
	Name = "The Town Square",
	Desc = [[   You are standing in the middle of a large open area which is the common
area of Rome.  During the day, this place is alive with the hustle and
bustle of all of the citizens of Rome and everyone in the city is sure to
stop by at some time or another.  There are several street vendors peddling
their wares and the overall atmosphere is carnival-like in nature.  To the
southeast, off in the distance, you can see the aqueduct and the buildings
of the Roman government lie to the northwest.  Nero Drive leads north and
south from here and Clay Avenue runs east.]],
	Exits = {
		north = 12032,
		south = 12034,
		east = 12040
	}
})
Config.NewRoom({
	Id = 12034,
	Name = "Nero Drive",
	Desc = [[   You are walking on a paved road that runs north and south through the
city of Rome.  There are many people here, as polite as always.  Most of
them are either coming from or going to the town square which lies to the
north.  Nero Drive continues to the south.  There is an observation area
overlooking the aqueduct to the east and a paved road leads west.]],
	Exits = {
		north = 12033,
		east = 12041,
		south = 12035,
		west = 12027
	}
})
Config.NewRoom({
	Id = 12035,
	Name = "Nero Drive",
	Desc = [[   This is a busy paved road that runs north through the city.  The people
of Rome are very friendly and say hello as you pass.  A gate leading out of
the city lies to the south and a small path goes west towards a nobleman's
estate.  To the east, off in the distance, lies the great mountain.  It is
rumored that the Gods watch over and protect the empire from there.]],
	Exits = {
		north = 12034,
		south = 12036,
		west = 12028
	}
})
Config.NewRoom({
	Id = 12036,
	Name = "The South Gate",
	Desc = [[   This is the southern gateway to the city of Rome.  The bronze gate is
closed and locked.  Looking through the bars, you see a heavily traveled
road leading out of the city.  Nero Drive starts here and runs north and
a wizard's shop lies to the east.]],
	Exits = {
		north = 12035,
		east = 12043,
		south = 0
	}
})
Config.NewRoom({
	Id = 12037,
	Name = "The Emperor's Private Office",
	Desc = [[   You are standing in the Emperor's private office.  The room is richly
furnished with the finest of the loot brought back from conquests of far
away lands.  There is a massive, intricately carved desk here, upon which
are important documents, decrees and other paperwork involved in running
the empire.  On the far wall, there is a marble bookcase that is well
stocked with the works of Homer, Plato, Socrates and other wise men.
Further, it seems that the current Emperor likes flowers as there are
many potted and cut specimens throughout the room.  There is a french
door leading to the waiting room and a wooden door to the south.]],
	Exits = {
		east = 12044,
		south = 12038
	}
})
Config.NewRoom({
	Id = 12038,
	Name = "The Senate Chambers",
	Desc = [[   This is the working room where elected senators from all over the empire
gather to advise the Emperor.  An official seal of the Emperor is hanging on
the far wall.  There is a wooden door to the north and a bronze door to the
east and doublehung door to the south.]],
	Exits = {
		north = 12037,
		east = 12045,
		south = 12039
	}
})
Config.NewRoom({
	Id = 12039,
	Name = "The House Of Commons",
	Desc = [[   This is the lower house of the advising body to the Emperor.  Common men
from all parts of Rome work here to further assist the senators in advising
the Emperor on critical matters of state.  The seal of the Emperor is painted
on the far wall.  The only exit is to the north.]],
	Exits = {
		north = 12038
	}
})
Config.NewRoom({
	Id = 12040,
	Name = "Clay Avenue",
	Desc = [[   You are on a wide well traveled road running east and west through the
heart of Rome.  There are large crowds of people to the west and the road
continues to the east.  The aqueduct is directly south of here.]],
	Exits = {
		east = 12047,
		south = 12042,
		west = 12033
	}
})
Config.NewRoom({
	Id = 12041,
	Name = "The Observation Lookout",
	Desc = [[   You are on a platform overlooking a massive aqueduct.  There is a
telescope mounted to the railing that surrounds the area and you can
hear the gurgle of water as it is channeled into the city.  Off in
the distance, you can see the Mountain of the Gods.
There is a sign mounted to the railing and a ramp leads west.]],
	Exits = {
		west = 12034
	}
})
Config.NewRoom({
	Id = 12042,
	Name = "The Aqueduct",
	Desc = [[   You are in a massive stone structure that has been designed to channel
water into the city of Rome.  Due to the recent drought, the water level
is low, allowing passage without a boat.  The walls and floor are covered
with algae and slime producing treacherous footing conditions.  There are
exits to the north, south and east.]],
	Exits = {
		east = 12049,
		south = 12042,
		west = 12055
	}
})
Config.NewRoom({
	Id = 12043,
	Name = "The Mage's Shop",
	Desc = [[   You are standing in the mage's shop.  Magical ointments, charms and
potions are sitting on shelves and behind a glass counter.  There is a
dense neon blue fog hugging the floor here, making it impossible to see
below your knees.  You suddenly hear mutterings coming from the back
room, possibly from...
KKKKKAAAAAABBBBOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOMMMMMMMMMMMMMMMM!!!!!!
You are deafened by the noise from a tremendous explosion and the
concussion from the blast staggers you!  The shopkeeper seems to pay
no heed to this. The door to the back room opens and an older man,
wearing a pointed hat, whose face is smudged with soot sticks his head
out.  'Is everyone alright?  Sorry about that.  I was testing a new
spell.  I'll try to give advance notice next time.', he says.  The door
then closes.]],
	Exits = {
		east = 12050,
		west = 12036
	}
})
Config.NewRoom({
	Id = 12044,
	Name = "The Waiting Room",
	Desc = [[   You are standing in a very large room with a high ceiling and there
are a few people waiting here to see the Emperor on urgent matters.  The
master scheduler tells you to have a seat and sends a page to inform the
his highness of your arrival.  There are large doors to the east and west
and an exit leads south to the foyer.]],
	Exits = {
		east = 12051,
		south = 12045,
		west = 12037
	}
})
Config.NewRoom({
	Id = 12045,
	Name = "The Entrance Foyer",
	Desc = [[   You have just entered the main government building of the Roman Empire
and are standing in a massive room with an elaborately decorated domed roof.
There are many people here; messengers and senators being the most numerous.
There is a large, ornate door to the west, a hallway leads north and marble
stairs that lead out of the building are to the south.]],
	Exits = {
		north = 12044,
		west = 12038,
		down = 12046
	}
})
Config.NewRoom({
	Id = 12046,
	Name = "Outside The Capitol Building",
	Desc = [[   You stand on white marble steps that lead up and into the Capitol
Building.  There are several statues, none of any real significance,
at the entrance to the building.  The main entrance to the building
is at the top of the steps.]],
	Exits = {
		up = 12045,
		down = 12047
	}
})
Config.NewRoom({
	Id = 12047,
	Name = "Clay Avenue",
	Desc = [[  You are standing on a wide, heavily traveled road that runs east and
west through the heart of the city.  There are marble steps leading up.
To the south, off in the distance, you can see a large stone structure
and a mountain that is partially obscured by the haze.  There is a
general store to the north.]],
	Exits = {
		north = 12064,
		east = 12052,
		west = 12040,
		up = 12046
	}
})
Config.NewRoom({
	Id = 12048,
	Name = "The Summit Of The Mountain Of The Gods",
	Desc = [[   You are at the summit of a very high mountain and are standing above
the clouds.  The sun is shining brilliantly here and the clouds below
look like balls of cotton.  The path that you have been walking on is
damp and the scent of lilac is in the air.]],
	Exits = {
		down = 12053
	}
})
Config.NewRoom({
	Id = 12049,
	Name = "The Aqueduct",
	Desc = [[   You are in a massive stone structure that has been designed to channel
water into the city of Rome.  Due to the recent drought, the water level
is low, allowing passage without a boat.  The walls and floor are covered
with algae and slime, producing treacherous footing conditions.  There are
exits in all four cardinal directions.]],
	Exits = {
		north = 12058,
		east = 12042,
		south = 12042,
		west = 12049
	}
})
Config.NewRoom({
	Id = 12050,
	Name = "Froboz's Workshop",
	Desc = [[You are standing in the workshop of Froboz the Great, the most powerful and
famous mage that Rome has ever known.  Workbenches line the walls and are
covered with various test tubes, beakers, petri dishes and crucibles and
there is an odor in here that can best be described as a combination of old
sweat socks and burning tires.  The only exit is back through the door
through which you came.  In the middle of the room, you see a pile of ashes
that looks like it once was a body and Froboz is is busy making adjustments
on a new type of magic wand... possibly the one responsible for the explosion
a few minutes ago.  He removes a jeweler's loupe from his eye as he turns
around.  'How in the name of Merlin did you get in here??!!' he asks.  'Oh,
nevermind!  Since you are here, you can serve as witnesses to the final test
of the new mages' spell:  "ectowatt".'  With this he makes a magical gesture
and a paladin appears.  Crossing his fingers, Froboz waves the wand his
direction and what happens next is incredible!  The Paladin is enveloped in
what appears to be a small, well contained, thermonuclear explosion.  When
the smoke clears you can see that the paladin and all of equipment has been
reduced to a large pile of flaming cinders.  Froboz throws his head back and
cackles with insane glee.  'Now, my young friends, what can I do for you?',
he asks.]],
	Exits = {
		west = 12043
	}
})
Config.NewRoom({
	Id = 12051,
	Name = "The Courtroom",
	Desc = [[   You stand inside of a large courtroom in which common civil disputes and 
criminal matters are decided.  There is a judge's bench and a witness stand
on the far side of the room and a jury's box along side.  The Emperor's seal
is prominently displayed on the wall behind the judge's stand, reminding all
who enter that he is an extension of his highness.  There is a door, possibly 
leading to the judge's chambers, to the east and the waiting room is to the 
west.]],
	Exits = {
		east = 12056,
		south = 12061,
		west = 12044
	}
})
Config.NewRoom({
	Id = 12052,
	Name = "The East Gate Of Rome",
	Desc = [[   You are standing inside of the eastern gate of Rome.  There are two tall 
spires built into the city wall, from which the guards can see the whole 
eastern side of the city.  The gate is currently open and to the east, 
there is a heavily used road, made of packed clay, that leads out of Rome. 
Another road leads westward into the city.]],
	Exits = {
		east = 12065,
		west = 12047
	}
})
Config.NewRoom({
	Id = 12053,
	Name = "A Mountain Path",
	Desc = [[   You stand on a small trail that leads up and down.  It has recently been 
raining and there are small puddles everywhere.  You are just below the
clouds and the view of the surrounding countryside is breathtaking.  ]],
	Exits = {
		up = 12048,
		down = 12057
	}
})
Config.NewRoom({
	Id = 12055,
	Name = "The Aqueduct",
	Desc = [[   You are in a massive stone structure that has been designed to channel
water into the city of Rome.  Due to the recent drought, the water level
is low, allowing passage without a boat.  The walls and floor are covered
with algae and slime, producing treacherous footing conditions.  There are
exits in all four cardinal directions.]],
	Exits = {
		north = 12042,
		east = 12055,
		south = 12058,
		west = 12049
	}
})
Config.NewRoom({
	Id = 12056,
	Name = "The Judge's Chambers",
	Desc = [[   You are in a small room that is filled with legal tombs.  There is a
small desk here, literally buried under legal documents.  There is also
a small window overlooking the northern part of the city.]],
	Exits = {
		west = 12051
	}
})
Config.NewRoom({
	Id = 12057,
	Name = "A Mountain Path",
	Desc = [[   You are standing on a small trail that leads through a grove of trees.
Every thing is lush and green here and it appears to have been raining
recently.  'This would be an ideal place for a picnic.' , you think to
yourself.]],
	Exits = {
		up = 12053,
		down = 12060
	}
})
Config.NewRoom({
	Id = 12058,
	Name = "The Aqueduct",
	Desc = [[   You are in a massive stone structure that has been designed to channel
water into the city of Rome.  Due to a recent drought, the water level is
low, allowing passage without a boat.  The walls and floor are covered
with algae and slime, producing treacherous footing conditions.  A valley
lies to the south and the other cardinal directions lead further into the
aqueduct.]],
	Exits = {
		north = 12055,
		east = 12055,
		south = 12059,
		west = 12042
	}
})
Config.NewRoom({
	Id = 12059,
	Name = "The Valley Of The Gods",
	Desc = [[   You stand in a tranquil valley at the base of a large mountain.  A quiet 
stream, with fruit trees growing along its banks, winds its way peacefully
through the valley and enters a large stone structure that lies to the west.
There are birds singing and every now and then a ripple breaks the surface
of the stream.  You can see a path leading through the trees to the up.]],
	Exits = {
		north = 12058,
		up = 12060
	}
})
Config.NewRoom({
	Id = 12060,
	Name = "A Mountain Path",
	Desc = [[   You are standing on a path that leads up through a stand of large trees.  
Everything is green and it seems like eternal spring - this is Mother Nature
at her finest.  It is possible to descend into a tranquil valley from here.]],
	Exits = {
		up = 12057,
		down = 12059
	}
})
Config.NewRoom({
	Id = 12061,
	Name = "The Holding Cells",
	Desc = [[   You are standing in the holding cell area, just off of the cortroom.  Those
who are recently convicted of serious crimes are brought here, pending torture
and execution.  The courtroom lies to the north and another exit goes east.]],
	Exits = {
		north = 12051,
		east = 12062
	}
})
Config.NewRoom({
	Id = 12062,
	Name = "The Torture Chamber",
	Desc = [[   You are standing in a very small room in which there are many tools
designed specifically for inflicting pain and suffering.  Some of them
are familiar, such as the rack and the iron maidens.  Others, you have
never seen before and they make you wonder about the kind of sadistic
mind that dreamt them up.  The only exit is to the west.]],
	Exits = {
		west = 12061
	}
})
Config.NewRoom({
	Id = 12063,
	Name = "The Roman Bakery",
	Desc = [[   You are standing in the bakery of Rome and your mouth waters at the
delicious aromas wafting from the kitchen.  The only exit is to the east.]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 12064,
	Name = "The General Store",
	Desc = [[   You are standing in the only general store of Rome.  The walls and shelves 
are covered with all of the various items required by Roman citizens and 
stalwart adventurers.  Clay Avenue lies to the south.]],
	Exits = {
		south = 12047
	}
})
Config.NewRoom({
	Id = 12065,
	Name = "Before Rome",
	Desc = [[   You travel upon an East-West road wide enough for 30 men to march
abreast.  It is packed hard through heavy use.  To the west stands the
Gates of Rome inviting you to enter and partake of all the glory and
splendor that is Rome.]],
	Exits = {
		east = 12066,
		west = 12052
	}
})
Config.NewRoom({
	Id = 12066,
	Name = "Clay Road",
	Desc = [[   You travel upon an East-West road wide enough for 30 men to march
abreast.  It is packed hard through heavy use.  To the west, your eyes
catch the splendors of a mighty city.]],
	Exits = {
		east = 12067,
		west = 12065
	}
})
Config.NewRoom({
	Id = 12067,
	Name = "Clay Road",
	Desc = [[   You travel upon an East-West road wide enough for 30 men to march
abreast.]],
	Exits = {
		east = 12068,
		west = 12066
	}
})
Config.NewRoom({
	Id = 12068,
	Name = "The End Of The Clay Road",
	Desc = [[   The mighty clay road turns into lesser, but still well traveled roads
here.  You feel a surge run through your body as you look East into the
lands that Rome turned into its mighty empire.]],
	Exits = {
		east = 12069,
		west = 12067
	}
})
Config.NewRoom({
	Id = 12069,
	Name = "A Small Dirt Trail",
	Desc = [[   This small dirt path seems to be a joint between a large clay road
located a short distance to the west and the expanse of sand which opens
up before you to the east.  The clay road appears to lead through the
foothills towards the snowcapped mountain chain to the west.  Perhaps
there is a city or settlement in that direction.
   You cannot see any breaks in the horizon of the sand which fills your
vision as you look to the east, it seems to stretch forever.]],
	Exits = {
		east = 5029,
		west = 12068
	}
})
