Config.NewRoom({
	Id = 5401,
	Name = "The Entrance To The Dancing Daemon Inn",
	Desc = [[
   You find yourself in an entrance foyer to the Dancing Daemon Inn.
Chrome plated stairs spiral up to the reception area.  To the south
you hear the sounds of merriment and drinking and from the west you
hear the bustling activity of New Thalos.
]],
	Exits = {
		south = 5403,
		west = 5421,
		up = 5402
	}
})
Config.NewRoom({
	Id = 5402,
	Name = "The Reception Area",
	Desc = [[
   You are now standing in the reception of New Thalos.  A huge mahogany
desk is here along with two sofas and a coffee table covered in magazines.
The plush carpeting under your feet is a nice change from the rugged paths
you are used to travelling.  A chrome stairway spirals downstairs to the
tavern of the Dancing Daemon Inn, and your future adventures in New Thalos.
]],
	Exits = {
		down = 5401
	}
})
Config.NewRoom({
	Id = 5403,
	Name = "The Dancing Daemon Inn",
	Desc = [[
   A huge circling wet-bar takes up most of the east end of the Daemon.  An
old mage reclines against the mirror behind the bar absentmindedly pouring
several drinks at once with his refined telekinesis.  The Lokettes, a local
band, are playing their usual gig on the stage.  The large booths along the
all are filled with people drinking and having a grand time.  You feel like
partying here.
The only obvious exit is to the north.
]],
	Exits = {
		north = 5401
	}
})
Config.NewRoom({
	Id = 5404,
	Name = "The Medina",
	Desc = [[
   You stand on the Medina, on the larger open areas in New Thalos.
People walk to and fro carrying on their day to day business.  The
Common Square of the people opens up to the south and the Medina
continues north.
]],
	Exits = {
		north = 5405,
		south = 5411
	}
})
Config.NewRoom({
	Id = 5405,
	Name = "The Medina",
	Desc = [[
   You are walking along a wide open expanse of road connecting
Market Square to the Common Square.  Panhandlers, beggars, and
other such riff-raff wander about hoping to catch those few who
with open hearts.  The Medina continues to the south and the
Market Square spreads out to the north.
]],
	Exits = {
		north = 5406,
		south = 5404
	}
})
Config.NewRoom({
	Id = 5406,
	Name = "Southern Market Square",
	Desc = [[
   The large square of markets fills your vision.  Strange sights and
sounds, those known only to the New Thalos market, barrage your senses.
The only hope of making any sense of what is going on here is to wander
around.  Market Square continues north, west, and east, with the Medina
trailing off th the south.
]],
	Exits = {
		north = 5407,
		east = 5408,
		south = 5405,
		west = 5409
	}
})
Config.NewRoom({
	Id = 5407,
	Name = "The Center Of Market Square",
	Desc = [[
   You are standing in the center of Market Square, the famous square
of New Thalos.  A large, peculiar looking statue is standing in the
middle of the square.  The square extends in every direction.
]],
	Exits = {
		north = 5416,
		east = 5418,
		south = 5406,
		west = 5410
	}
})
Config.NewRoom({
	Id = 5408,
	Name = "Southeastern Market Square",
	Desc = [[
   In this corner of the market some of the largest warriors in the land
tower over you.  It is easy to understand why they hang out here once you
notice the weapon shop and the armoury close by.  Perhaps you might stop
in and take a look at the wares these shops have to offer.
]],
	Exits = {
		north = 5418,
		east = 5530,
		south = 5537,
		west = 5406
	}
})
Config.NewRoom({
	Id = 5409,
	Name = "Southwestern Market Square",
	Desc = [[
   This area of the market seems relatively quiet, save the high pitch
banter of the shopkeepers attempting to lure you into their stores.
South you see the bread stand and west is the entrance to the general
store.
   The market's sprawl continues east and north of here.
]],
	Exits = {
		north = 5410,
		east = 5406,
		south = 5536,
		west = 5529
	}
})
Config.NewRoom({
	Id = 5410,
	Name = "Western Market Square",
	Desc = [[
   This area of the square seems a bit more subdued than the rest.
You notice that most of the outland adventurers mill around the
southern end of the market, while the townfolk seem to keep their
business in the northern end.
   West Main street begins here and heads for the gate, the market's 
expanse fills the other directions.
]],
	Exits = {
		north = 5415,
		east = 5407,
		south = 5409,
		west = 5427
	}
})
Config.NewRoom({
	Id = 5411,
	Name = "The Common Square",
	Desc = [[
   People pass by talking to each other, or rest their weary bones on this
grassy field.  You can hear faint sounds of the river to the south of you
as it passes through the city.  Ishtar drive heads east and west from here
and the Medina is to the north.  South lies the River Ishtar Bridge and the
southern gate.
]],
	Exits = {
		north = 5404,
		east = 5438,
		south = 5413,
		west = 5437
	}
})
Config.NewRoom({
	Id = 5412,
	Name = "Outside The Southern Gate Of New Thalos",
	Desc = [[
   You see before you the expanse of the Great Eastern Desert.
You have heard many tales of the Great Pyramid, the lost city
of Old Thalos and the friendly brass dragon that lies under the
desert.
   To the south lies the desert and the city of New Thalos is
to the north.
]],
	Exits = {
		north = 5414,
		south = 5040
	}
})
Config.NewRoom({
	Id = 5413,
	Name = "The Southern Bridge",
	Desc = [[
   Walking over the bridge you see the rushing waters of the River
Ishtar.  To the south you see the Southern Gate of New Thalos and
the Common Square stretches out to the north
]],
	Exits = {
		north = 5411,
		south = 5414,
		down = 5486
	}
})
Config.NewRoom({
	Id = 5414,
	Name = "Inside The South Gate Of New Thalos",
	Desc = [[
   Two large stone towers rise up to greet you with the massive iron
gate swinging on ornately crafted hinges and emblazoned with the crest
of New Thalos.  The makers of the city spared no expense in rebuilding
the defenses or their home.  The River Ishtar bridge lies to the north
and the desert to the south.
]],
	Exits = {
		north = 5413,
		south = 5412
	}
})
Config.NewRoom({
	Id = 5415,
	Name = "Northwestern Market Square",
	Desc = [[
   This corner of the market contains some of the most civilized folk
in New Thalos.  To the north lies the humble store of the merchant
Ahkeem, his weavings known to be the best in the city.  West of here
is the entrance to the First Royal Bank of New Thalos.
]],
	Exits = {
		north = 5515,
		east = 5416,
		south = 5410,
		west = 5522
	}
})
Config.NewRoom({
	Id = 5416,
	Name = "Northern Market Square",
	Desc = [[
   You stand in one of the most heavily used parts of town.  To the north
lies the Palace of New Thalos and the Casbah, east west and south of here
the busy market thrives with life.
]],
	Exits = {
		north = 5419,
		east = 5417,
		south = 5407,
		west = 5415
	}
})
Config.NewRoom({
	Id = 5417,
	Name = "Northeastern Market Square",
	Desc = [[
   Pandemonium.  Chaos.  Madness.  A few other choice words come to mind
as you gaze into this corner of the market.  The vegetable stand seems
quiet enough so you have to assume the noise comes from the Butchery.
You have to think for a while before you muster the will to enter this
shop.  The market continues to the south and west.
]],
	Exits = {
		north = 5516,
		east = 5523,
		south = 5418,
		west = 5416
	}
})
Config.NewRoom({
	Id = 5418,
	Name = "Eastern Market Square",
	Desc = [[
   You stand in the market of New Thalos, the gem of the desert.  The
market is the hub of the city, all trade and commerce of any significance
is carried on here.  The market spreads out in all directions save east,
here Main Street heads for the easter gate.
]],
	Exits = {
		north = 5417,
		east = 5428,
		south = 5408,
		west = 5407
	}
})
Config.NewRoom({
	Id = 5419,
	Name = "Sultan's Walk",
	Desc = [[
   This cobblestone road aides your journey through town.  Traveling north
will take you by the Palace and the Dancing Daemon Inn, and south will put
you on Market Square.
]],
	Exits = {
		north = 5420,
		south = 5416
	}
})
Config.NewRoom({
	Id = 5420,
	Name = "Sultan's Walk",
	Desc = [[
   This part of the road travels between one of the sturdy walls of
the Palace and the Dancing Daemon.  To the east you peer through a
small window into the Daemon, seeing many people dancing and drinking.
After you tend to your other chores you plan on visiting the Daemon.
   The walk continues north and south from here.
]],
	Exits = {
		north = 5421,
		south = 5419
	}
})
Config.NewRoom({
	Id = 5421,
	Name = "Sultan's Walk",
	Desc = [[
   The road here between the Palace and the Dancing Daemon Inn seems well
worn by the travel of horses, carts, and leather boots.  From the west you
hear the faint sound of trumpets announcing the arrival of some duke or
duchess to the Palace.  Safe haven awaits you to the east in the halls
of the Daemon, and Sultan's Walk continues north and south.
]],
	Exits = {
		north = 5422,
		east = 5401,
		south = 5420,
		west = 5559
	}
})
Config.NewRoom({
	Id = 5422,
	Name = "Sultan's Walk",
	Desc = [[
   The main road north from the square continues here, surrounded
by the walls of the Palace and the Daemon.  To the north you see
the heavily guarded gate and can make out faint sounds of trade
to the south.
]],
	Exits = {
		north = 5423,
		south = 5421
	}
})
Config.NewRoom({
	Id = 5423,
	Name = "Inside The Northern Gate Of New Thalos",
	Desc = [[
   Two large stone towers rise up to greet you with a massive iron
gate swinging between on ornately crafted hinges and emblazend with
the crest of New Thalos.  The makers of this city spared no costs
in rebuilding the defenses of their home.
   Sultan's Walk runs to the south and the Casbah stretches out east
and west.  To the north is wilderness.
]],
	Exits = {
		north = 5568,
		east = 5450,
		south = 5422,
		west = 5449
	}
})
Config.NewRoom({
	Id = 5424,
	Name = "Inside The West Gate Of New Thalos",
	Desc = [[
   Two large stone towers embedded in the wall loom over you.  The
massive iron gate, emblazoned with the crest of New Thalos, swings
easily on four ornately crafted hinges.  It is obvious the makers
of this city spared no expense in protecting their home.
   Main street heads towards the market eastward and the wilderness
beckons from the west.  To the south lies the entrance the Warriors'
Guild.
]],
	Exits = {
		east = 5425,
		south = 5527,
		west = 5570
	}
})
Config.NewRoom({
	Id = 5425,
	Name = "West Main Street",
	Desc = [[
   This is the main road traveling though the city.  To the south you
hear the hammering of the repair shop and to the north is the grassy
field known as Temple Square.  Main street continues east and west.
]],
	Exits = {
		north = 5521,
		east = 5426,
		south = 5528,
		west = 5424
	}
})
Config.NewRoom({
	Id = 5426,
	Name = "West Main Street",
	Desc = [[
   A foreman stands stand here watching over two construction workers
fixing a pothole.  The road here branches off north and south into
two alleys behind the stores of the market.  The main street continues
east and west from here.
]],
	Exits = {
		north = 5472,
		east = 5427,
		south = 5473,
		west = 5425
	}
})
Config.NewRoom({
	Id = 5427,
	Name = "West Main Street",
	Desc = [[
   You are strolling on the street between the bank and general store.
To the west you hear a roadcrew at work and to the east, the sounds of 
commerce taking place.  The air is filled with the smell of gold and
riches.
On the wall of the store is a poster.
]],
	Exits = {
		east = 5410,
		west = 5426
	}
})
Config.NewRoom({
	Id = 5428,
	Name = "East Main Street",
	Desc = [[
   Here on East Main, you smell the odor of freshly slaughtered meat
and, hear the pounding of new metal from the armory.  The Square is
to the west and a junction is to the East.  
]],
	Exits = {
		east = 5429,
		west = 5418
	}
})
Config.NewRoom({
	Id = 5429,
	Name = "East Main Street",
	Desc = [[
   You are on East Main Street.  To the North is the beginning
of Guildsman Row.  To the South is a dark alley.  The road also
continues to the East.
There is a small sign on a wire hanging across the junction.
]],
	Exits = {
		north = 5465,
		east = 5430,
		south = 5466,
		west = 5428
	}
})
Config.NewRoom({
	Id = 5430,
	Name = "East Main Street",
	Desc = [[
   As you walk by the mercenary guild a cold chill causes you to shiver
uncontrollably.  You see some shady looking characters lurking about the
entrance to this house of 'helpful' people.  Perhaps curiosity gets the
best of you, but you wonder what could be going on inside.  To the north
you see the open doors of the apothecary shop where one may buy many
magical livations.
   Main Street continues east and west from here.
]],
	Exits = {
		north = 5524,
		east = 5431,
		south = 5531,
		west = 5429
	}
})
Config.NewRoom({
	Id = 5431,
	Name = "East Main Street",
	Desc = [[
   The Main street through eastern New Thalos begins here and heads
westward towards the marketplace.  One of the main gates can be seen
to the east and Braheem's Magic Shop awaits your business to the north.
]],
	Exits = {
		north = 5525,
		east = 5432,
		west = 5430
	}
})
Config.NewRoom({
	Id = 5432,
	Name = "Inside the Eastern Gate of New Thalos",
	Desc = [[
   Two large stone towers imbedded in the wall loom over you.  The
massive iron gate, emblazened with the crest of New Thalos, swings
easily on four ornately crafted hinges.  It is obvious the makers
of this city spared no expense in protecting their home.
   Main street heads towards the market westward and the wilderness
beckons from the east.  To the north lies the entrance to the Mages'
Guild.
]],
	Exits = {
		north = 5526,
		east = 5569,
		west = 5431
	}
})
Config.NewRoom({
	Id = 5433,
	Name = "Cassandra's Catch Of The Day",
	Desc = [[
   Nothing in your life has prepared you for the odor which fills your
lungs.  Not wanting to offend the beautiful shopkeeper you hold your
tongue and quietly look over her selection.
]],
	Exits = {
		south = 5442
	}
})
Config.NewRoom({
	Id = 5434,
	Name = "West Ishtar Drive",
	Desc = [[
   This is the warehouse district of New Thalos.  Strong men walk back
and forth from the docks to the warehouse carrying large crates loading
and unloading the boats as they sail down the river.  To the north is
one of the entrances of the warehouse and West Ishtar leads east.
]],
	Exits = {
		north = 5541,
		east = 5435
	}
})
Config.NewRoom({
	Id = 5435,
	Name = "West Ishtar Drive",
	Desc = [[
   A few men walk by almost pushing you out of the way as they go about
their business of loading and unloading the boats.  An entrance to one
of the huge warehouses of New Thalos is to the north and the River Ishtar 
quietly flows by to the south.  Ishtar Drive continues east and west.
]],
	Exits = {
		north = 5542,
		east = 5436,
		west = 5434
	}
})
Config.NewRoom({
	Id = 5436,
	Name = "West Ishtar Drive",
	Desc = [[
   The cobblestone road is moist here, the trail of water heading down to
the boat ramp.  Catching your balance as you start to slide on the slick
pavement you grab on to the handrail someone has conveniently placed here.
   To the north is the Shipwright and Ishtar Drive continues east and west.
]],
	Exits = {
		north = 5543,
		east = 5437,
		south = 5444,
		west = 5435
	}
})
Config.NewRoom({
	Id = 5437,
	Name = "West Ishtar Drive",
	Desc = [[
   A cool breeze blows up off the river chilling the sweat otherwise
present on your skin.  Orders and sometimes curses can be heard from
the west in the direction of the warehouses.  The common square opens
up to the east and Ishtar Drive continues west.
]],
	Exits = {
		east = 5411,
		west = 5436
	}
})
Config.NewRoom({
	Id = 5438,
	Name = "East Ishtar Drive",
	Desc = [[
   Loud hammering and the sound of red hot iron cooling in water reaches 
your ears as you stand in front of the blacksmith.  A small boy runs up
to you with big eyes and, as you return his gaze, runs off down the road.
   The common square can be seen to the west and Ishtar Drive continues
to the east.
]],
	Exits = {
		north = 5545,
		east = 5440,
		west = 5411
	}
})
Config.NewRoom({
	Id = 5439,
	Name = "East Ishtar Drive",
	Desc = [[
   The wide road bordering the south of town continues to the east west
here, bordered only by the hay-loft to the north and the River Ishtar to
the south.
]],
	Exits = {
		east = 5441,
		west = 5440
	}
})
Config.NewRoom({
	Id = 5440,
	Name = "East Ishtar Drive",
	Desc = [[
   Small clumps of hay strewn about the ground alerts you to the fact
that you have reached the stables.  Arabian stallions as well as many
other  fine breeds of horses can be purchased for a price.  Ishtar Drive
continues east and west.
]],
	Exits = {
		north = 5546,
		east = 5439,
		west = 5438
	}
})
Config.NewRoom({
	Id = 5441,
	Name = "East Ishtar Drive",
	Desc = [[
   Even in broad daylight, you can hardly see into the back alley
that begins here and heads north.  Sounds of loud drunken folk and
the occasional screaming cat emenate from the direction.  Luckily
you have the choice of going east or west down the drive as well.
]],
	Exits = {
		north = 5469,
		east = 5442,
		west = 5439
	}
})
Config.NewRoom({
	Id = 5442,
	Name = "East Ishtar Drive",
	Desc = [[
   Your highly acute sense of smell reports you have reached the
entrance to the fish market.  Although renowned for it fresh catches
and wide selection of aquarian delicacies you wonder how much longer
you can endure the smell!  The River Ishtar flows alongside to the
south with the drive running along side it east to west.
]],
	Exits = {
		north = 5433,
		east = 5443,
		west = 5441
	}
})
Config.NewRoom({
	Id = 5443,
	Name = "East Ishtar Drive",
	Desc = [[
   The sound of squawking gulls and the smell of rotting fish gives you
a hint of your location.  The River Ishtar flows south of you, but looks
crystal clear, so it cannot be the source of this putrid smell.
Looking north you notice a small sign hanging over the dump.
]],
	Exits = {
		north = 5548,
		west = 5442
	}
})
Config.NewRoom({
	Id = 1,
	Name = "|                                                    ",
	Desc = [[
|              THE DUMP OF NEW THALOS                |
|                                                    |
|                                                    |
|                      -----                         |
|                                                    |
|             Enter at your own risk.                |
|                            -the management         |
|                                                    |
#====================================================#
]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 1,
	Name = "",
	Desc = [[
S
#5443
The Boat Ramp~
   This sloped slab of stone allows easy passage to and from the River
Ishtar.  Boats are moored to the docks here awaiting their masters to
return from the warehouses and the pubs.  The waters of the River Ishtar
lap at your feet to the south and Ishtar Drive is to the north.
]],
	Exits = {
		north = 5436,
		south = 5487
	}
})
Config.NewRoom({
	Id = 5444,
	Name = "The Boat Ramp",
	Desc = [[
   This sloped slab of stone allows easy passage to and from the River
Ishtar.  Boats are moored to the docks here awaiting their masters to
return from the warehouses and the pubs.  The waters of the River Ishtar
lap at your feet to the south and Ishtar Drive is to the north.
]],
	Exits = {
		north = 5436,
		south = 5487
	}
})
Config.NewRoom({
	Id = 5445,
	Name = "West Casbah",
	Desc = [[
   The air takes on a somber note as you stand before the entrance to the
jailhouse of New Thalos.  Hopefully you won't ever see this structure from
the inside.  The northwest tower stands here with a spiral staircase 
leading up.  The Avenue ends here, only exiting to the east.
]],
	Exits = {
		east = 5446,
		south = 5554,
		up = 5560
	}
})
Config.NewRoom({
	Id = 5446,
	Name = "West Casbah",
	Desc = [[
   You have almost reached the end of the Avenue in this direction, the 
number of guards in this part of town is nearly doubled.  To the north
the familiar city wall protects you from the wilderness.  Looking south
marble stairs rise towards the entrance of city hall surrounded by 
massive white pillars.
   The Avenue continues east and west from here.
]],
	Exits = {
		east = 5447,
		south = 5555,
		west = 5445
	}
})
Config.NewRoom({
	Id = 5447,
	Name = "The Casbah",
	Desc = [[
   The wall of the Palace curves south from here, a darkened alley runs
along it in that direction.  West of here you see the steps of the City
Hall and notice the increase in the number of guards.
   To the east the Avenue continues.
]],
	Exits = {
		east = 5448,
		south = 5459,
		west = 5446
	}
})
Config.NewRoom({
	Id = 5448,
	Name = "The Casbah",
	Desc = [[
   As you travel down the road towards towards the City Hall you look up
at the guards walking along the wall keeping watch.  South of you stands
the great walls of the Palace and the Avenue goes east and west.
]],
	Exits = {
		east = 5449,
		west = 5447
	}
})
Config.NewRoom({
	Id = 5449,
	Name = "The Casbah",
	Desc = [[
   The cobblestone pavement runs along the north wall here.  South of you
stand the great walls of the Palace and the Avenue goes east and west.
]],
	Exits = {
		east = 5423,
		west = 5448
	}
})
Config.NewRoom({
	Id = 5450,
	Name = "The Casbah",
	Desc = [[
   The activity here is only slightly less than chaotic.  Young boys run
to and fro with stern intent, and older gentleman swagger down the street
towards the Library.  To the west you can see the tall towers of the
northern gate, and the Avenue continues east.
]],
	Exits = {
		east = 5451,
		west = 5423
	}
})
Config.NewRoom({
	Id = 5451,
	Name = "The Casbah",
	Desc = [[
   Walking along the cobblestone path you feel secure with the walls of
the city towering over you.  You hear the scraping sounds of metal on
stone and look up to see a large, strong guard looking out to the north.
   To the east lies the intersection on Guildsman's Row and the northern
gate is a short walk to the west.
]],
	Exits = {
		east = 5452,
		west = 5450
	}
})
Config.NewRoom({
	Id = 5452,
	Name = "The Casbah",
	Desc = [[
   The din of the guilds assaults your senses as you reach this
intersection, the sound of hammering, the smell of tanned leather,
and the smoke rising from the smithy all rush up to greet you.
  The Avenue continues east and west from here and the Row leads
south.
]],
	Exits = {
		east = 5453,
		south = 5461,
		west = 5451
	}
})
Config.NewRoom({
	Id = 5453,
	Name = "The Casbah",
	Desc = [[
   You walk between the solid stone wall of the city and that of the
Masons' Guild.  Young children with their nannies walk around enjoying
the saftey of the city.
   The Avenue runs east and west from here.
]],
	Exits = {
		east = 5454,
		west = 5452
	}
})
Config.NewRoom({
	Id = 5454,
	Name = "The Casbah",
	Desc = [[
   You have almost reached the end of the Avenue in this direction.
Walking towards the north-east corner of the city you notice the
population density here is much less then the rest of the town.  A
few old men hobbling on canes and young men intent on studies are
the only travelers of the path to the library on a regular basis.
   The Avenue continues east and west from here.
]],
	Exits = {
		east = 5455,
		west = 5453
	}
})
Config.NewRoom({
	Id = 5455,
	Name = "The Casbah",
	Desc = [[
   The Avenue ends here, turning south to become Kali Row.  Traveling in
that direction will take you to the Library and the grand dance hall of
the city.
   The northeast tower of the wall is accessible here up a spiral staircase.
]],
	Exits = {
		south = 5456,
		west = 5454,
		up = 5563
	}
})
Config.NewRoom({
	Id = 5456,
	Name = "Kali Row",
	Desc = [[
   This is a small, newly added section of the town.  The city's Library
can be entered through the door to the west and the Casbah begins its
journey a little ways north of here.  The Row and the entrance to the
dancehall is to the south.
]],
	Exits = {
		north = 5455,
		south = 5457,
		west = 5552
	}
})
Config.NewRoom({
	Id = 5457,
	Name = "Kali Row",
	Desc = [[
   The short Row ends abruptly here at the entrance to the dance
hall of New Thalos.
   The entrance to the hall is to the west and the Row continues
northward.
]],
	Exits = {
		north = 5456,
		west = 5553
	}
})
Config.NewRoom({
	Id = 5458,
	Name = "Underground",
	Desc = "   The small passage continues north and south.",
	Exits = {
		north = 5479,
		south = 5481
	}
})
Config.NewRoom({
	Id = 5459,
	Name = "Alley",
	Desc = [[
   This is a dark alley running between the Palace and City Hall.  Not a
lot here, unless you're partial to spiders and rats.
]],
	Exits = {
		north = 5447,
		south = 5460
	}
})
Config.NewRoom({
	Id = 5460,
	Name = "Alley",
	Desc = "   The alley ends here.",
	Exits = {
		north = 5459,
		down = 5476
	}
})
Config.NewRoom({
	Id = 5461,
	Name = "Guildsman's Row",
	Desc = [[
   This Row is a hive of activity second only to the actual Market 
Square itself.  Along this row stands all the guilds of the working
class citizens of New Thalos, here all the items sold in the Square
are made.  Along this particular stretch of the row lie the Boyer/
Fletcher to the west and the Masons' to the east.
   The Row leads off to the south and East Casbah is to the north.
]],
	Exits = {
		north = 5452,
		east = 5557,
		south = 5462,
		west = 5556
	}
})
Config.NewRoom({
	Id = 5462,
	Name = "Guildsman's Row",
	Desc = [[
   The guilds continue here, to the west is the Weavers' Guild, and
to the east stands the Craftsmans' Guild.  The row of guilds continues
north and south from here.
]],
	Exits = {
		north = 5461,
		east = 5508,
		south = 5463,
		west = 5507
	}
})
Config.NewRoom({
	Id = 5463,
	Name = "Guildsman's Row",
	Desc = [[
   Only one guild offers its door to this stretch of the Row, the Tanners'
Guild, to the west.  To the east is a beautifully sculpted marble door
allowing entrance to the Museum of the Greater Gods.
   The Row of Guilds leads north and south.
]],
	Exits = {
		north = 5462,
		east = 5512,
		south = 5464,
		west = 5565
	}
})
Config.NewRoom({
	Id = 5464,
	Name = "Guildsman's Row",
	Desc = [[
   After the guilds were built the people of the city used some of the
extra space to erect a shrine to their patron saints.  The result of
this labor became the Museum of the Greater Gods.
   You may enter the sacred hall to the east.
]],
	Exits = {
		north = 5463,
		east = 5517,
		south = 5465
	}
})
Config.NewRoom({
	Id = 5465,
	Name = "Guildsman's Row",
	Desc = [[
   This small cramped road is worn with travel as apprentices to the
guilds run merchandise from the guildhouses to the shops on Market
Square.
   The guildhouses lie to the north and Main street is to the south.
]],
	Exits = {
		north = 5464,
		south = 5429
	}
})
Config.NewRoom({
	Id = 5466,
	Name = "Alley",
	Desc = [[
   Even with your light you cannot seem to penetrate the magical cloak of
darkness covering this alley.
]],
	Exits = {
		north = 5429,
		south = 5467
	}
})
Config.NewRoom({
	Id = 5467,
	Name = "Alley",
	Desc = [[
   Even with your light you cannot seem to penetrate the magical cloak of
darkness covering this alley.
]],
	Exits = {
		north = 5466,
		east = 5468,
		west = 5538
	}
})
Config.NewRoom({
	Id = 5468,
	Name = "Alley",
	Desc = [[
   Even with your light you cannot seem to penetrate the magical cloak of
darkness covering this alley.
]],
	Exits = {
		east = 5539,
		south = 5469,
		west = 5467
	}
})
Config.NewRoom({
	Id = 5469,
	Name = "Alley",
	Desc = [[
   Even with your light you cannot seem to penetrate the magical cloak of
darkness covering this alley.
]],
	Exits = {
		north = 5468,
		south = 5441
	}
})
Config.NewRoom({
	Id = 5470,
	Name = "Alley",
	Desc = [[
   This is a tiny corner in the alley.  The temple walls are north and
west.  You notice a fair amount of footprints to the east.
]],
	Exits = {
		east = 5471,
		south = 5472
	}
})
Config.NewRoom({
	Id = 5471,
	Name = "Alley",
	Desc = [[
   This is a dead end to the tiny alley.  There is an unusual amount of
wear apparent on the ground.
]],
	Exits = {
		west = 5470,
		down = 5479
	}
})
Config.NewRoom({
	Id = 5472,
	Name = "Alley",
	Desc = [[
   You are in a tiny ally between the temple and the bank.  You hear
some shouting and general roadwork to the south.  The ground is rough
and in need of repair.  In the road is a small pothole.
]],
	Exits = {
		north = 5470,
		south = 5426
	}
})
Config.NewRoom({
	Id = 5473,
	Name = "Alley",
	Desc = [[
   You are on a small alley between the repair shop and the general
store.  Nothing much here but small rodents and dust.
]],
	Exits = {
		north = 5426,
		south = 5474
	}
})
Config.NewRoom({
	Id = 5474,
	Name = "Alley",
	Desc = [[
   This is a small corner in the alley behind the warehouses and the guild
of warriors.  You notice some small scrapings to the west.
]],
	Exits = {
		north = 5473,
		east = 5475
	}
})
Config.NewRoom({
	Id = 5475,
	Name = "Alley",
	Desc = "   The alley ends here as do the footprints you had noticed earlier.",
	Exits = {
		west = 5474,
		down = 5482
	}
})
Config.NewRoom({
	Id = 5476,
	Name = "Underground",
	Desc = [[
   You are in a small underground passage beneath the city.  You see a
small glint of light from above and the passage continues south.
]],
	Exits = {
		south = 5477,
		up = 5460
	}
})
Config.NewRoom({
	Id = 5477,
	Name = "Underground",
	Desc = "   The passage continues north and south.",
	Exits = {
		north = 5476,
		south = 5478
	}
})
Config.NewRoom({
	Id = 5478,
	Name = "Underground",
	Desc = "   The tunnel branches here going north, east, and west.",
	Exits = {
		north = 5477,
		east = 5479,
		west = 5480
	}
})
Config.NewRoom({
	Id = 5479,
	Name = "Underground",
	Desc = [[
   The alley turns again here and heads south and west.  You notice a
small glint of light from above.
]],
	Exits = {
		south = 5458,
		west = 5478,
		up = 5471
	}
})
Config.NewRoom({
	Id = 5480,
	Name = "Underground",
	Desc = [[
   The passage ends here and you hear some low chanting from the west.
You also notice the clearing of dust on the ground but can't seem to
find any door in that direction.
]],
	Exits = {
		east = 5478
	}
})
Config.NewRoom({
	Id = 5481,
	Name = "Underground",
	Desc = "   The small passage continues north and south from here.",
	Exits = {
		north = 5458,
		south = 5482
	}
})
Config.NewRoom({
	Id = 5482,
	Name = "Underground",
	Desc = [[
   The small passage heads north and east from here.  You here the sounds
of the city above you.
]],
	Exits = {
		north = 5481,
		east = 5483,
		up = 5475
	}
})
Config.NewRoom({
	Id = 5483,
	Name = "Underground",
	Desc = [[
   The tunnel continues you west and east.  Hopefully you have a good sense
of direction.
]],
	Exits = {
		east = 5493,
		west = 5482
	}
})
Config.NewRoom({
	Id = 5484,
	Name = "River Ishtar",
	Desc = [[
   High above you on the top of the city wall guards look down to see if
you wish to exit the city via water.  To do so they must open the iron
grating in front  of you from above.  The horrid smell of the dump wafts
down from the shore.
]],
	Exits = {
		east = 5625,
		west = 5485
	}
})
Config.NewRoom({
	Id = 5485,
	Name = "River Ishtar",
	Desc = [[
   The gentle flow of the river carries you eastward, looking up you
see couples strolling along the road.  To the west you see the southern
bridge and to the east you see the iron grating protecting the city from
unwanted guests.
]],
	Exits = {
		east = 5484,
		west = 5486
	}
})
Config.NewRoom({
	Id = 5486,
	Name = "River Ishtar",
	Desc = [[
   You hear your voice echo as you float under the bridge above.  The
city construction crews have just recently finished the small ladder
giving common-folk easy access to the river.  To the west and east you
see the river flowing by the city.
]],
	Exits = {
		east = 5485,
		west = 5487,
		up = 5413
	}
})
Config.NewRoom({
	Id = 5487,
	Name = "River Ishtar",
	Desc = [[
   This part of the river seems alive with activity.  Boats moored to
the docks near the ramp north of here make navigation a bit more trying.
As the river flows eastward you can see the southern bridge in that
direction.
]],
	Exits = {
		north = 5444,
		east = 5486,
		west = 5488
	}
})
Config.NewRoom({
	Id = 5488,
	Name = "River Ishtar",
	Desc = [[
   The river flows through a huge iron grating from the wilderness
through the city.  Strong guards above await word to open the portal
should any citizen require exit or entry.
]],
	Exits = {
		east = 5487,
		west = 5624
	}
})
Config.NewRoom({
	Id = 5489,
	Name = "A Dark Passage",
	Desc = [[
   You seem to have stumbled into a small hand made passage.  The wall
to the west doesn't look quite right but searching it reveals no secret
doors.  The only exit it seems is east.
]],
	Exits = {
		east = 5490
	}
})
Config.NewRoom({
	Id = 5490,
	Name = "A Dark Passage",
	Desc = [[
   The small passage continues east and west from here.  Again you
notice something peculiar about the wall, this time to the north,
but you fail to find any secret doors.  Voices can be faintly heard
from the north.
]],
	Exits = {
		east = 5491,
		west = 5489
	}
})
Config.NewRoom({
	Id = 5491,
	Name = "A Dark Passage",
	Desc = "   The small passage continues west and east from here.",
	Exits = {
		east = 5492,
		west = 5490
	}
})
Config.NewRoom({
	Id = 5492,
	Name = "A Dark Passage",
	Desc = [[
   The small passage ends here for no apparent reason.  Looking around
you find a small ladder half buried in the dirt.  setting it up you find
a trap door in the ceiling.  The passage continues west from here.
]],
	Exits = {
		west = 5491,
		up = 5571
	}
})
Config.NewRoom({
	Id = 5493,
	Name = "Underground",
	Desc = "   The small passage continues west and east.",
	Exits = {
		east = 5494,
		west = 5483
	}
})
Config.NewRoom({
	Id = 5494,
	Name = "Underground",
	Desc = "   The small passage continues west and east.",
	Exits = {
		east = 5501,
		west = 5493
	}
})
Config.NewRoom({
	Id = 5501,
	Name = "Underground",
	Desc = "   The small passage continues west and east.",
	Exits = {
		east = 5502,
		west = 5494
	}
})
Config.NewRoom({
	Id = 5502,
	Name = "Underground",
	Desc = "   The small passage continues west and east.",
	Exits = {
		east = 5503,
		west = 5501
	}
})
Config.NewRoom({
	Id = 5503,
	Name = "Underground",
	Desc = "   The small passage continues west and east.",
	Exits = {
		east = 5489,
		west = 5502
	}
})
Config.NewRoom({
	Id = 5504,
	Name = "Clerics' Sanctum",
	Desc = [[
   You walk down the staircase into the silent inner sanctum.  Here sits
your guildmaster ready to assist you when the time is right.  The room
is completely silent.  The only obvious exit is back up the staircase
into the the Nectar.
]],
	Exits = {
		east = 5480,
		up = 5520
	}
})
Config.NewRoom({
	Id = 5505,
	Name = "The Chamber Of The High Priest",
	Desc = [[
   You have entered the chamber of the most holy man in New Thalos.  The
High Priest advises the Sultan on all matters in the world of the sacred.
From what you have heard however, this holy man has a bit of a temper,
and he doesn't look very happy that you've disturbed his prayers.
   The only obvious exit is south.
]],
	Exits = {
		south = 5509
	}
})
Config.NewRoom({
	Id = 5506,
	Name = "By The Altar",
	Desc = [[
   You are by the temple altar in the northern end of Temple of New
Thalos.  A huge altar made of highly polished black onyx is standing
in front of you.  Behind this altar sits a twelve foot tall statue of
Akbal, the highest god in all the lands.
]],
	Exits = {
		south = 5510
	}
})
Config.NewRoom({
	Id = 5507,
	Name = "The Weavers' Guild",
	Desc = [[
   Rows and rows of uncut cloth lie about waiting to be hemed up
into tailored clothes.  Cotten is brought in from the country side
and spun up into cloth and dyed different colors.  A young boy walks
in, grabs a pile of clothing and leaves.
]],
	Exits = {
		east = 5462
	}
})
Config.NewRoom({
	Id = 5508,
	Name = "The Craftsmans' Guild",
	Desc = [[
   You have entered a busy workshop filled with people running amok
with various tools and materials.  The air is tense with the rush to
complete various projects and creations.
]],
	Exits = {
		west = 5462
	}
})
Config.NewRoom({
	Id = 5509,
	Name = "Inside The Temple",
	Desc = [[
   The temple continues here, but not on such a grand scale.  The place
still looks immaculate.  To the north you see the chamber of the High
Priest and a sign on the door in BIG letters thats reads 'DO NOT DISTURB'
To the south is the entrance to the Clerics' Guild.
]],
	Exits = {
		north = 5505,
		east = 5510,
		south = 5513
	}
})
Config.NewRoom({
	Id = 5510,
	Name = "Inside The Temple",
	Desc = [[
   Huge marble pillars rise on either side of you and grab hold of
the ceiling.  Between each of these, fine softstone frescoes have
been carved depicting scenes from the religous history of New Thalos.
Rows of pews face forward giving their full attention to the pulpit
rising high above the ground.  The deep red carpeting underfoot shows
not a speck of wear or dirt.  It is obvious that New Thalonians take
religion seriously.
]],
	Exits = {
		north = 5506,
		east = 5511,
		south = 5514,
		west = 5509
	}
})
Config.NewRoom({
	Id = 5511,
	Name = "The Donation Room",
	Desc = [[
   This room is new to the temple, it was created during the hard times
that had struck the city in recent decades.  Luckily for them the Sultan
had been hoarding some of the basic neccesities for just such an occasion.
These days the donation room depends on the generosity of wealthy 
adventurers, and a curse on any that walk in to take everything.
]],
	Exits = {
		west = 5510
	}
})
Config.NewRoom({
	Id = 5512,
	Name = "The Museum Of The Greater Gods",
	Desc = [[
   Four large stone statues reside in the museum.  They were constructed
by the people of New Thalos to pay homage to the saints they believe to 
have saved all their lives.
   The museum continues to the south.
]],
	Exits = {
		south = 5517,
		west = 5463
	}
})
Config.NewRoom({
	Id = 5513,
	Name = "The Entrance To The Guild of Clerics",
	Desc = [[
   This hall pales in comparison to that of the main hall, but is
beautiful in its own right.  Shaven heads and brown robes can be
seen milling about quitely talking to each other.  North is back
inside the temple proper, and south is the entrance to the clerics'
bar.
]],
	Exits = {
		north = 5509,
		south = 5520
	}
})
Config.NewRoom({
	Id = 5514,
	Name = "The Temple Gates",
	Desc = [[
   You stand before the entrance way to the Temple of New Thalos.  Two
large wrought iron gates lie open before you.  Although they might not
ever be used the priests in the temple are ready to defend themselves,
should their city ever come under seige again.
]],
	Exits = {
		north = 5510,
		south = 5521,
		down = 5521
	}
})
Config.NewRoom({
	Id = 5515,
	Name = "Ahkeem's Stuff",
	Desc = [[
   You step into a shop swirling with smoke.  Ahkeem seems to have a
liking for things not of this world... very strange stuff indeed.
]],
	Exits = {
		south = 5415
	}
})
Config.NewRoom({
	Id = 5516,
	Name = "Vera's Veggies",
	Desc = [[
   This is a busy place.  Customers shuffle around, bartering for lower
prices on the wide selection of vegetables.  You can still hear your
mother telling you 'Eat your Veggies'.  That is probably why you are
spending time in the city of New Thalos and not with her.  But wait...
Vera looks just like your mother!
]],
	Exits = {
		south = 5417
	}
})
Config.NewRoom({
	Id = 5517,
	Name = "The Museum Of The Greater Gods",
	Desc = [[
   Four large stone statues reside in the museum.  They were constructed
by the people of New Thalos to pay homage to the saints they believe to 
have saved all their lives.
   The museum continues to the north.
]],
	Exits = {
		north = 5512,
		west = 5464
	}
})
Config.NewRoom({
	Id = 5518,
	Name = "The Base Of The Tower",
	Desc = [[
   You walk into a cold room whose only feature is an old wooden
staircase spirling up along the wall to a higher level.  Up these
stairs you are told awaits the old mage who may be able to help
you advance in your studies.
]],
	Exits = {
		east = 5519,
		south = 5525,
		up = 5549
	}
})
Config.NewRoom({
	Id = 5519,
	Name = "The Mages' Courtyard",
	Desc = [[
   You enter a small tiled courtyard with a small fountain in the middle.
Around the sides are four wrought iron benches with cushions where the
mages of the land sit and exchange ideas.  To the west stands a two-story
tower where the leader of the mages' guild performs his experiments.
]],
	Exits = {
		south = 5526,
		west = 5518
	}
})
Config.NewRoom({
	Id = 5520,
	Name = "Nectar Of The Gods",
	Desc = [[
   You are startled by the lavishness of this place.  From what you
know of clerics they are supposed to be humble people, giving all their
material goods to their cause.  Perhaps because only clerics are 
allowed to enter this bar they have condoned making it as comfortable
as possible.  In the corner stands a staircase leading down to the
meditaion chambers.
]],
	Exits = {
		north = 5513,
		down = 5504
	}
})
Config.NewRoom({
	Id = 5521,
	Name = "Temple Square",
	Desc = [[
   You are standing on the meeting grounds of those with holy
intentions.  Monks, bards, paladins and clerics mill around
either preaching or listening to their fellows preach.  Huge
marble steps lead up to the gates of the temple and Main Street
lies to the south.
]],
	Exits = {
		north = 5514,
		south = 5425,
		up = 5514
	}
})
Config.NewRoom({
	Id = 5522,
	Name = "The Bank",
	Desc = [[
   You stand in a large building decorated with black marble and red
satin.  Huge pillars support an arched ceiling far above your head.
You wonder at the skill the dwarves have for detail as you examine
the trim.  Fine silver seperates the polished blocks that make up the
floor.
]],
	Exits = {
		east = 5415
	}
})
Config.NewRoom({
	Id = 5523,
	Name = "The Butchery",
	Desc = [[
   This shop has the aroma of freshly slaughterd beasts.  You feel right
at home.  You see a fairly simple set up.  The corpses... er... selections
hang on hooks, still bleeding into catch pans that drain into a single
underground vat.  You wonder where that leads...
]],
	Exits = {
		west = 5417
	}
})
Config.NewRoom({
	Id = 5524,
	Name = "The Witch's Brew",
	Desc = [[
   The first thing you notice as you walk into this spacious shop is
the hundreds of candles that line the shelves.  The swirling mist that
surrounds your feet makes it seem that you have stepped into a gateway
to another plane.  A cluttered table stands near the far wall, opposite
the doorway.
]],
	Exits = {
		south = 5430
	}
})
Config.NewRoom({
	Id = 5525,
	Name = "Braheem's Magic Shop",
	Desc = [[
   You enter a shop crowded with bookshelves and clutterd with scrolls.
The owner seems to be hard at work on his latest magical creation.
You see a small sign on the wall.
]],
	Exits = {
		south = 5431
	}
})
Config.NewRoom({
	Id = 5526,
	Name = "The Entrance To The Mages' Tower",
	Desc = [[
   The entrance hall is a small poor lighted room.  It would seem its
only purpose is to house the powerful sorcerer standing here guarding 
the entrance.
]],
	Exits = {
		north = 5519,
		south = 5432
	}
})
Config.NewRoom({
	Id = 5527,
	Name = "The Entrance To The Guild of Warriors",
	Desc = "   This small hall is merely a check point to keep the unwanted out.",
	Exits = {
		north = 5424,
		south = 5534
	}
})
Config.NewRoom({
	Id = 5528,
	Name = "The Repair Shop",
	Desc = [[
   One of the most popular shops in New Thalos, this shop is always a
hive of activity.  It is almost inhuman the way one man can fix all
types of armour singlehandedly.  If you have an item in need of repair
simply give it to the man behind the counter.
There is a small sign on the counter.
]],
	Exits = {
		north = 5425
	}
})
Config.NewRoom({
	Id = 5529,
	Name = "The General Store",
	Desc = [[
   The new found wealth of this beautiful city is apearant in the exotic
items for sale here.  You wonder what would happen if you typed... LIST...
]],
	Exits = {
		east = 5409
	}
})
Config.NewRoom({
	Id = 5530,
	Name = "Abdul's Armour",
	Desc = [[
   The sound of hammering metal grows louder as you enter the armoury.
Young boys run to and fro carrying buckets of water and coal.  A few
dwarves work on sections of armour in the back of the shop, their
hammers working too fast to follow.  The walls are adorned in all of
Abdul's prize creations.  Here you can purchase suits of armour meant
to keep monsters from hacking you into little pieces.
A note on the wall beckons your attention.
]],
	Exits = {
		west = 5408
	}
})
Config.NewRoom({
	Id = 5531,
	Name = "The Mercenaries' Guild",
	Desc = [[
   This guild is frowned upon by most of the population of New Thalos,
but the laws of supply and demand are irresistable.  People come here
when they feel unable or are unwilling to fight their own battles.  For
a small fee you may hire a henchman.
]],
	Exits = {
		north = 5430,
		east = 5533
	}
})
Config.NewRoom({
	Id = 5532,
	Name = "The Mercenaries Guild",
	Desc = "   This is the storage room for the mercenaries to be hired.",
	Exits = {
	}
})
Config.NewRoom({
	Id = 5533,
	Name = "Entrance To The Thieves' Guild",
	Desc = [[
   This small, dark room has a single torch mounted in the wall for
light. There is a small wooden bench and a book lying on it.  The
assassin guarding the entrance from 'outsiders' stands as you walk
in.
]],
	Exits = {
		south = 5540,
		west = 5531
	}
})
Config.NewRoom({
	Id = 5534,
	Name = "The Whet Stone",
	Desc = [[
   Very large men with very large swords drink beer from very large mugs.
Everything in this room is BIG.  The large round tables are scuffed and
nicked from the numerous bar brawls that have sprung up.  It might be a
good idea to hold your tounge for a while as you soak up the atmosphere.
   There is an exit to the east where the master swordsman awaits pupils
to train with.
]],
	Exits = {
		north = 5527,
		east = 5535
	}
})
Config.NewRoom({
	Id = 5535,
	Name = "The Tournament And Practice Yard",
	Desc = [[
   This is a wide expanse of grass filled with dummies, punching bags
and swordpupils.  To the north you see a man dressed in black robes,
unlike his iron clad comrades, who you assume to be your master.
]],
	Exits = {
		east = 5474,
		west = 5534
	}
})
Config.NewRoom({
	Id = 5536,
	Name = "The Bread Stand",
	Desc = [[
   A small stand has been set up here, showing the shopkeep's humble
selection.  You notice he has added a few things to his list.
]],
	Exits = {
		north = 5409
	}
})
Config.NewRoom({
	Id = 5537,
	Name = "Igor's Implements Of Destruction",
	Desc = [[
   You can't help but shiver as you look at the selection of vicious
weapons.  Huge swords and wicked looking axes hang on pegs around the
room.  A dwarf sits at a bench in the back hammering away on his latest
creation.  It is here you can buy rare and exotic items not found in
other parts of the world.
A note catches your eye.
]],
	Exits = {
		north = 5408
	}
})
Config.NewRoom({
	Id = 5538,
	Name = "Ye Old Leather Shoppe",
	Desc = [[
   You are standing on a thick oriental rug surrounded on all sides by
racks of numerous leather goods.  A few women sit on leather cushions
sewing in some detail work on custom ordered jackets.
]],
	Exits = {
		east = 5467
	}
})
Config.NewRoom({
	Id = 5539,
	Name = "Smuggler's Inn",
	Desc = [[
   You are inside a filthy inn, that seemingly has been cleaned in
decades.  Poker tables line the walls and everyone stares at you as
you walk in, you don't feel very welcome.  The bar has numerous
knife holes in it and the bartender leans over waiting for your
order.
]],
	Exits = {
		west = 5468
	}
})
Config.NewRoom({
	Id = 5540,
	Name = "The Filthy Unicorn",
	Desc = [[
   A draft chills your bones as you enter, though you see no open
window or door.  Hooded figures lurk around in the shadows and speak
in low voices.  A flash of steel lets you know that weapons are in
great abundance in this crowd.  As you quickly check your beltpouch
you notice a small staircase leading down.
]],
	Exits = {
		north = 5533,
		down = 5547
	}
})
Config.NewRoom({
	Id = 5541,
	Name = "The Warehouse",
	Desc = [[
   You are standing in a large room used to store merchandise made in the
city before it is shipped off.  All the items here are made in New Thalos
and shipped to other parts of the land.
]],
	Exits = {
		east = 5542,
		south = 5434
	}
})
Config.NewRoom({
	Id = 5542,
	Name = "The Warehouse",
	Desc = [[
   Men walk to and fro counting crates and writing down their findings.
This area of the warehouse is used for storing the raw materials brought
in from areas outside the city.  These goods are then delivered to the
various guilds.  The export area of the warehouses is to the south.
]],
	Exits = {
		south = 5435,
		west = 5541
	}
})
Config.NewRoom({
	Id = 5543,
	Name = "The Shipwright",
	Desc = [[
   The wood under you feet creaks from years of being soaked in saltwater.
An old man with a curly, grey beard stand behind a small counter waiting
to take your order.  Behind him are mounted various model sailboats and
large fish.
]],
	Exits = {
		east = 5544,
		south = 5436
	}
})
Config.NewRoom({
	Id = 5544,
	Name = "The Drafting Room",
	Desc = [[
   The walls are covered with paper sketchings of hull designs.  This room
is used by the shipwright to build his creations on paper before making a
single cut in wood.
]],
	Exits = {
		west = 5543
	}
})
Config.NewRoom({
	Id = 5545,
	Name = "The Forge",
	Desc = [[
   Very much like the weaponsmith this man deals in the molding of metal.
It seems that most of his creations deal with horses.  On the walls you
see several horseshoes made of iron.  The room is hot, hotter than the
desert just south of here, and one wonders how the smithy can stand it.
]],
	Exits = {
		south = 5438
	}
})
Config.NewRoom({
	Id = 5546,
	Name = "The Royal Stables",
	Desc = [[
   Nothing you wouldn't expect is here.  Several stalls hold the
Sultan's choice Arabian Stallions, and each has their own trough
for drinking.  A small boy wanders in sometimes with a shovel to
remove the offensive by-product of such beasts.
]],
	Exits = {
		east = 5550,
		south = 5440
	}
})
Config.NewRoom({
	Id = 5547,
	Name = "The Secret Yard",
	Desc = [[
   This is a hidden yard known to only a few people in New Thalos.  Here
you may train in the arts of stealing, picking locks, and becoming almost
invisible.
   A small staircase leads back up to the Unicorn.
]],
	Exits = {
		south = 5490,
		up = 5540
	}
})
Config.NewRoom({
	Id = 5548,
	Name = "The Dump",
	Desc = [[
   This is the place where the people of the city dump their trash.  Due
to the constant winds blowing down the moutains the smell is usually blown
outside the walls and over the desert.
]],
	Exits = {
		south = 5443
	}
})
Config.NewRoom({
	Id = 5549,
	Name = "The Mage's Laboratory",
	Desc = [[
   You stand in the top of an old stone tower.  Along the walls hundreds
of potions, scroll, and wands lie in disaray.  The man you see before you
sits hunched over a small wooden table with two beakers of bubbling liquid
in front of him.  He looks up as you enter and smiles broadly.
]],
	Exits = {
		down = 5518
	}
})
Config.NewRoom({
	Id = 5550,
	Name = "The Hay Loft",
	Desc = [[
   Not as big as the ones you see on farms in the country, this hay loft
serves as a storage area for the horses in the stables.  The young boy
you saw with the shovel seems to have takes up residence on the second
story.
]],
	Exits = {
		west = 5546
	}
})
Config.NewRoom({
	Id = 5551,
	Name = "The Grand Entrance",
	Desc = [[
   Nowhere have you seen such an obscene display of wealth then in this 
corridor.  The shaggy carpeting under your feet makes it seem as if you
are walking on a cloud.  Platinum candelabras hang delicately from the
ceiling casting light on the ancient tapestries adorning the walls.  The
crick in your neck tells you that it is time to stop staring.  To the west
the numerous halls of the palace being and the gate lies to the east.
]],
	Exits = {
		north = 5561,
		east = 5559,
		south = 5558,
		west = 5606
	}
})
Config.NewRoom({
	Id = 5552,
	Name = "The Library",
	Desc = [[
   This building holds the vast collection of books and documents
that have been brought here by the commitee apointed to recover the
lost knowledge of Thalos.  Rows of shelves filled with book in every
condition line the walls.  The air has the aroma of old parchment
and glue.
]],
	Exits = {
		east = 5456
	}
})
Config.NewRoom({
	Id = 5553,
	Name = "The Dance Hall",
	Desc = [[
   You seem to have missed a huge party.  The janitors are here cleaning
up the confetti and pieces of food.  Hundreds of empty beer mugs on the 
tables surrounding the dance floor suggest that the citizens love their
drink.  There is still a banner on the wall.
]],
	Exits = {
		east = 5457
	}
})
Config.NewRoom({
	Id = 5554,
	Name = "The Jail",
	Desc = [[
   You are in jail.  For some reason, someone feels that you've screwed
up pretty bad and should be put away safely for a while.  
]],
	Exits = {
		north = 5445
	}
})
Config.NewRoom({
	Id = 5555,
	Name = "City Hall",
	Desc = [[
   You stand inside the administrative head of the city.  Here the
decisions regarding city policy are made.  Although the Sultan's
word is law, he usually spends his time on affairs outside the city
wall.
]],
	Exits = {
		north = 5446
	}
})
Config.NewRoom({
	Id = 5556,
	Name = "The Boyer/Fletchers' Guild",
	Desc = [[
   The walls in this room are covered with pegs that hold various types
of bows.  There are few people working here, lending to the fact that
the skills are rare to come by in the general populas.  A few boys are
busy in the corner preparing feathers for the fine shafts used in making
arrows.  Some Elven craftsmen are carefuly inspecting each bow as it is
finnished.
]],
	Exits = {
		east = 5461
	}
})
Config.NewRoom({
	Id = 5557,
	Name = "The Masons' Guild",
	Desc = [[
   There is no doubt that the Dwarves here know what they're doing.  They
have been invaluable in the building of this beautiful city.  Here they
are hard at work doing what they do best.  The hammers fly in a blur as
these talented craftsmen work the stone into ornate bricks, pillars, trim,
and many other forms.
]],
	Exits = {
		west = 5461
	}
})
Config.NewRoom({
	Id = 5558,
	Name = "The Guard House",
	Desc = [[
   You stand inside the southern of the two main guard houses.  The
stone interior has a spartan look to it, only the bare neccesities.
A few weapons are mounted on the walls in case they might be needed.
]],
	Exits = {
		north = 5551
	}
})
Config.NewRoom({
	Id = 5559,
	Name = "The Palace Gate",
	Desc = [[
   You stand before a magnificantly crafted gate wrought in solid gold.
You gape in awe at the splendor of the spirilng towers beyond the portal.
The ruler of all the eastern lands resides in this fine palace, and he is
not a poor man.  The grand entrance lies byond the gate, and Sultan's Walk
is to the east.
]],
	Exits = {
		east = 5421,
		west = 5551
	}
})
Config.NewRoom({
	Id = 5560,
	Name = "The Northwest Tower",
	Desc = [[
   You stand on one of the four towers guarding the city.  The view from
here is great!  To the west you see the tall mountains that make up the
divide between here and Midgaard.  The River Ishtar slowly flows from that
direction.  South you can see the entire city of New Thalos and the Great
Eastern Desert to the south.
]],
	Exits = {
		down = 5445
	}
})
Config.NewRoom({
	Id = 5561,
	Name = "The Guard House",
	Desc = [[
   You stand inside the northern of the two main guard houses.  Strong
guards are seated here, playing cards.  The stone interior is clean but
bare walled save the weapons and armor mounted in the walls.
   The only exit is south.
]],
	Exits = {
		south = 5551
	}
})
Config.NewRoom({
	Id = 5562,
	Name = "The Kitchen",
	Desc = [[
   Your footsteps echo off the stone tiles of the kitchen.  On the south
wall you see the large fire place and a huge copper pot bubbling merrily.
The chef is busy chopping up greens and other vegetables at the wooden
table for tonight's meal.  Servants scurry about grabbing utensils and
preparing fresh hares.
   A small door leads out into the hall northward and the doorway to the
dining hall is west.
]],
	Exits = {
		north = 5564,
		west = 5572
	}
})
Config.NewRoom({
	Id = 5563,
	Name = "The Northeast Tower",
	Desc = [[
   You stand on one of the four towers guarding the city.  To the north
you see the wide plains and then the forset.  South of here you see the
city and the Great Eastern Desert beyond.
]],
	Exits = {
		down = 5455
	}
})
Config.NewRoom({
	Id = 5564,
	Name = "A Hall",
	Desc = [[
   You are at the eastern end of the southern hallway.  A small servants'
entrance gives access to the kitchen and the hall continues west.
]],
	Exits = {
		south = 5562,
		west = 5573
	}
})
Config.NewRoom({
	Id = 5565,
	Name = "The Tanners' Guild",
	Desc = [[
   You first notice the pungent smell of freshly tanned leather goods as
you enter this strange place.  The next thing that grabs your attention
is the many colors that these people have transformed the beautiful
skins into.  The people are streaching the leather and cutting it into
the shapes they need.
You notice a small message on a wall.
]],
	Exits = {
		east = 5463
	}
})
Config.NewRoom({
	Id = 5566,
	Name = "A Hall",
	Desc = [[
   You have come to the eastern end of the northern hallway.  The only
exit is west except for the simple wooden door to the north.
There is a golden plaque above the door.
]],
	Exits = {
		north = 5567,
		west = 5575
	}
})
Config.NewRoom({
	Id = 5567,
	Name = "The Shrine Of Allah",
	Desc = [[
   As you step into this room you seem to leave the material plane.
The walls here are decorated with beautiful, multi-colored tiles.
There is a strange stillness about the air.  You sense the presence
of an all-mighty being.
]],
	Exits = {
		south = 5566
	}
})
Config.NewRoom({
	Id = 5568,
	Name = "Outside The Northern Gate Of New Thalos",
	Desc = [[
   You stand outside the gate of New Thalos.  The city lies to the south,
and wilderness to the north.
]],
	Exits = {
		north = 5682,
		south = 5423
	}
})
Config.NewRoom({
	Id = 5569,
	Name = "Outside The Eastern Gate Of New Thalos",
	Desc = [[
   You stand outside the protective walls of the city.  The massive iron
gate sits to the west and the unknown awaits you eastward.
]],
	Exits = {
		east = 5691,
		south = 5571,
		west = 5432
	}
})
Config.NewRoom({
	Id = 5570,
	Name = "Outside The West Gate Of New Thalos",
	Desc = [[
   You stand outside the city walls, the iron gate to the east.  The city
lies in that direction and the road to Midgaard lies west.
]],
	Exits = {
		east = 5424,
		west = 5619
	}
})
Config.NewRoom({
	Id = 5571,
	Name = "Outside The Wall",
	Desc = [[
   You are in a small clearing outside the east wall of the city.  The
ground seems well trodden but you can see no apparent exit save that
to the north.
]],
	Exits = {
		north = 5569
	}
})
Config.NewRoom({
	Id = 5572,
	Name = "The Grand Dining Hall",
	Desc = [[
   A long oaken table, coverd with silverware, plates, and a table cloth
with gold trim, dominates the room.  Although no diners occupy the room
as of yet, servants sprint about setting the table and placing condiments.
   The kitchen entrance is to the east, and two huge double doors open
into the hallway north.
]],
	Exits = {
		north = 5573,
		east = 5562
	}
})
Config.NewRoom({
	Id = 5573,
	Name = "A Hall",
	Desc = [[
   You stand at a T-crossing in the long hallways.  There are two large
double doors to the south.
]],
	Exits = {
		north = 5574,
		east = 5564,
		south = 5572,
		west = 5578
	}
})
Config.NewRoom({
	Id = 5574,
	Name = "A Hall",
	Desc = [[
   You stand at an intersection of the hallways.  Wooden corridors
lead off in all directions except west, the garden of the palace
can be entered there.
]],
	Exits = {
		north = 5575,
		east = 5606,
		south = 5573,
		west = 5579
	}
})
Config.NewRoom({
	Id = 5575,
	Name = "A Hall",
	Desc = [[
   You have come to a T-crossing on the hallways.  The wooden corridors
continue east, west and south.  There is a large iron door to the north.
]],
	Exits = {
		north = 5576,
		east = 5566,
		south = 5574,
		west = 5580
	}
})
Config.NewRoom({
	Id = 5576,
	Name = "The Entrance To The Dungeon",
	Desc = [[
   You enter a cold damp room with bare roughly hewn stone walls.
This room seems very out of place compared to the splendor of the
rest of the Palace.
   A large steel grating leads down into darkness, and an iron door
returns you to the hallway.
]],
	Exits = {
		south = 5575,
		down = 5592
	}
})
Config.NewRoom({
	Id = 5577,
	Name = "A Guest Room",
	Desc = [[
   This is a simple room used for visiting nobles.  A small dresser stands
on the east wall with a mirror hung right above it.  A queen sized bed made
up in satin sheets stands in the middle of the room against the south
wall under a window.  The only obvious exit is north back out into the 
hallway.
]],
	Exits = {
		north = 5578
	}
})
Config.NewRoom({
	Id = 5578,
	Name = "A Hall",
	Desc = [[
   The long hall continues here with a wooden door in the south wall.  On
the north wall hangs the picture of some forgotten nobleman who once ruled 
the land.
]],
	Exits = {
		east = 5573,
		south = 5577,
		west = 5583
	}
})
Config.NewRoom({
	Id = 5579,
	Name = "The Sultan's Garden",
	Desc = [[
   You have entered the Sultan's private gardens.  A light sweat breaks
out on your skin from the humidity here.  All around you are thousands of
exotic plants and flowers.  The sweet smell of jasmine and honeysuckle
reminds you of happier days at home.  Off to the north, through the palm
trees, you see a delicate white gazebo.
   A path leads out into the hallway and west towards the gazebo.
To your right stands a gold sign.
]],
	Exits = {
		east = 5574,
		west = 5584
	}
})
Config.NewRoom({
	Id = 5580,
	Name = "A Hall",
	Desc = [[
   The long stretch of hallway continues east and west from here.  The
small red carpet covering the centerline is always underfoot and an
occasional bench or potted plant lines the wall.
There is a door here to the north with a plaque mounted over it.
]],
	Exits = {
		north = 5581,
		east = 5575,
		west = 5585
	}
})
Config.NewRoom({
	Id = 5581,
	Name = "The Art Exhibit",
	Desc = [[
   You are standing in the Sultan's tribute to the finer virtues.
Large paintings hang from the walls displaying nature scenes, nudes,
and glorious victories in battle.  Strange scupltures rest on pedestals 
at each corner of the room and mirrors are placed in strategic locations
so the viewer may see an entire sculpture at a glance.
   Your eyes, however, are pulled towards a painting that dominates the
far wall.
]],
	Exits = {
		south = 5580
	}
})
Config.NewRoom({
	Id = 5582,
	Name = "A Guest Room",
	Desc = [[
   This is another room made up for visiting nobles.  There is a dresser
up against the eastern wall with a mirror above it and a queen sized bed,
made up in satin sheets, against the south wall.
]],
	Exits = {
		north = 5583
	}
})
Config.NewRoom({
	Id = 5583,
	Name = "A Hall",
	Desc = [[
   You have reached the western end of the southern hallway.  The only
exit is east except for the doors in the southern and western walls.
]],
	Exits = {
		east = 5578,
		south = 5582,
		west = 5588
	}
})
Config.NewRoom({
	Id = 5584,
	Name = "The Garden Gazebo",
	Desc = [[
   Walking through the gardens you come across a small white wooden
structure.  The sounds of birds, the smell of flowers, ahhh, paradise.
You believe that you have never been in a more peaceful setting.
]],
	Exits = {
		east = 5579
	}
})
Config.NewRoom({
	Id = 5585,
	Name = "A Hall",
	Desc = [[
   This is the western end of the northern hallway.  Two doors are set
in the walls here, one to the north, another to the west.
]],
	Exits = {
		north = 5586,
		east = 5580,
		west = 5590
	}
})
Config.NewRoom({
	Id = 5586,
	Name = "The Guard Room",
	Desc = [[
   You stand in a barren chamber lined with nothing but cots and
footlockers.  The guards come here when off duty to sleep, for
they may only leave the Palace grounds with special permission.
   The only exit is to the south.
]],
	Exits = {
		south = 5585
	}
})
Config.NewRoom({
	Id = 5587,
	Name = "The Guard Room",
	Desc = [[
   This is living quarters for the guards of the palace.  Barren compared
to the rest of the Palace, you see only cots and footlockers here.  On the
walls you see pictures of well known knights who have give a proud name to
the Sultan's Guard.
]],
	Exits = {
		north = 5588
	}
})
Config.NewRoom({
	Id = 5588,
	Name = "The Harem",
	Desc = [[
   This is the room where the Sultan keeps the beautiful women of his
Palace.  There are ten girls here lying about the room dressed in silks
you can almost see through.  In the western end of the room stands a
large mound of pillows and a beautiful young maiden sits perched atop.
It is unfortunate for you that only the Sultan is allowed in here.
]],
	Exits = {
		north = 5589,
		east = 5583,
		south = 5587
	}
})
Config.NewRoom({
	Id = 5589,
	Name = "A Small room",
	Desc = [[
   This is secret chamber allowing the Sultan direct access to his harem
at any time he chooses.
]],
	Exits = {
		north = 5590,
		south = 5588
	}
})
Config.NewRoom({
	Id = 5590,
	Name = "The Throne Room",
	Desc = [[
   You stand in the throne room of the mighty Sultan of New Thalos.  Guards
stand at attention near his side ready to make the ultimate sacrifice for
their beloved leader.  The gold inlaid throne studded with jewels stands
upon a mable dias.  The Sultan is not a man to be trifled with.
]],
	Exits = {
		north = 5591,
		east = 5585,
		south = 5589
	}
})
Config.NewRoom({
	Id = 5591,
	Name = "The Treasure Room",
	Desc = [[
   You have somhow managed to gain access to the treaure vault of the
Sultan.  The alarm sounding in the background tells you that you must
have tripped off some kind of alarm system.  It might be adviseable to
grab as much stuff as you possibly can and run for the door.
]],
	Exits = {
		south = 5590
	}
})
Config.NewRoom({
	Id = 5592,
	Name = "The Jailer's Room",
	Desc = [[
   Climbing down the old wooden ladder you enter a small cave like
room.  There is a small bench with some old magazines and a low
burning candle sitting off to one side.  A door is set into the
stone on the north wall, and the steel grating opens up above.
]],
	Exits = {
		east = 5593,
		up = 5576
	}
})
Config.NewRoom({
	Id = 5593,
	Name = "A Tunnel In The Dungeon",
	Desc = [[
   You stand in a roughly hewn stone tunnel with cells to the north and
south.  The tunnel continues east.
]],
	Exits = {
		north = 5598,
		east = 5594,
		south = 5602,
		west = 5492
	}
})
Config.NewRoom({
	Id = 5594,
	Name = "A Tunnel In The Dungeon",
	Desc = [[
   You stand in a roughly hewn stone tunnel with cells to the north and
south.  The tunnel continues east and west.
]],
	Exits = {
		north = 5599,
		east = 5595,
		south = 5603,
		west = 5593
	}
})
Config.NewRoom({
	Id = 5595,
	Name = "A Tunnel In The Dungeon",
	Desc = [[
   You stand in a roughly hewn stone tunnel with cells to the north and
south.  The tunnel continues east and west.
]],
	Exits = {
		north = 5600,
		east = 5596,
		south = 5604,
		west = 5594
	}
})
Config.NewRoom({
	Id = 5596,
	Name = "A Tunnel In The Dungeon",
	Desc = [[
   You stand in a roughly hewn stone tunnel with cells to the north and
south.  The tunnel continues west and you notice a small crack in the
stone to the east.
]],
	Exits = {
		north = 5601,
		east = 5597,
		south = 5605,
		west = 5595
	}
})
Config.NewRoom({
	Id = 5597,
	Name = "The Secret Cell",
	Desc = [[
   This room seems more like a lair than a cell.  Small bits of hay lie
strewn about the floor covering bones of unkown origin.  Spatterd blood
and tufts of grey hair lie matted in one corner.  As you turn to leave
you notice a pair of small red eyes peering at you from the darkness.
]],
	Exits = {
		west = 5596
	}
})
Config.NewRoom({
	Id = 5598,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		south = 5593
	}
})
Config.NewRoom({
	Id = 5599,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		south = 5594
	}
})
Config.NewRoom({
	Id = 5600,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		south = 5595
	}
})
Config.NewRoom({
	Id = 5601,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		south = 5596
	}
})
Config.NewRoom({
	Id = 5602,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		north = 5593
	}
})
Config.NewRoom({
	Id = 5603,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		north = 5594
	}
})
Config.NewRoom({
	Id = 5604,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		north = 5595
	}
})
Config.NewRoom({
	Id = 5605,
	Name = "The Cell",
	Desc = "   You are in a cold, cramped chamber with only one exit.",
	Exits = {
		north = 5596
	}
})
Config.NewRoom({
	Id = 5606,
	Name = "A Hall",
	Desc = [[
   You stand in a large cedar wood hall leading east and west.  On the
floor lies a thin and narrow purple rug.  The hall leads west inside the
Palace and east to the Grand Entrance.
]],
	Exits = {
		east = 5551,
		west = 5574
	}
})
Config.NewRoom({
	Id = 5607,
	Name = "A Path Through The Mountains",
	Desc = "   The narrow path turns here heading south and west.",
	Exits = {
		south = 5608,
		west = 5612
	}
})
Config.NewRoom({
	Id = 5608,
	Name = "A Path Through The Mountains",
	Desc = [[
   Travel is hard and slow as you almost have to climb around large
boulders strewn about the path.
]],
	Exits = {
		north = 5607,
		east = 5609
	}
})
Config.NewRoom({
	Id = 5609,
	Name = "The Edge Of The Ravine",
	Desc = [[
   The ground drops off below down to a rushing river.  A small rope
bridge sways to and fro in the wind giving you access to the other
side.
]],
	Exits = {
		east = 5610,
		west = 5608
	}
})
Config.NewRoom({
	Id = 5610,
	Name = "On A Rope Bridge",
	Desc = [[
   The small rope bridge shudders under your weight as you make your
way across the valley.
]],
	Exits = {
		east = 5628,
		west = 5609
	}
})
Config.NewRoom({
	Id = 5611,
	Name = "The Ledge Around The Valley",
	Desc = [[
   You are walking around a small ledge overlooking a large valley
deep within the eastern mountains.  The ledge turns north following
the shape of the valley and a steep trail continues to the east.
]],
	Exits = {
		north = 0,
		east = 5612
	}
})
Config.NewRoom({
	Id = 5612,
	Name = "A Path Through The Mountains",
	Desc = [[
   You are walking through a rock strewn path deep within the mountains
east of Midgaard.  The going is rough and you constantly twist your
ankle on the small stones lying about.
]],
	Exits = {
		east = 5607,
		west = 5611
	}
})
Config.NewRoom({
	Id = 5613,
	Name = "On The Eastern Edge Of The Mountains",
	Desc = [[
   You stand on the eastern edge of the eastern mountains.  The high
peaks lie to the west and rolling hills and plains open up to your
east.
]],
	Exits = {
		south = 5614,
		west = 5630
	}
})
Config.NewRoom({
	Id = 5614,
	Name = "In The Foothills",
	Desc = [[
   The path curves down the face of the mountain allowing you to
move up or down the face of this missive hunk of stone.
]],
	Exits = {
		north = 5613,
		east = 5615
	}
})
Config.NewRoom({
	Id = 5615,
	Name = "In The Foothills",
	Desc = [[
   The path curves down the face of the mountain allowing you to
move up or down as you please.
]],
	Exits = {
		south = 5616,
		west = 5614
	}
})
Config.NewRoom({
	Id = 5616,
	Name = "A Rocky Trail",
	Desc = [[
   The faint sound of a flowing river reaches your ears from the south and 
through the trees you can see water.  The path you are on continues north
and east from here.
]],
	Exits = {
		north = 5615,
		east = 5631,
		south = 5646
	}
})
Config.NewRoom({
	Id = 5617,
	Name = "On A Road",
	Desc = "   This long road continues to the east and south.",
	Exits = {
		east = 5618,
		south = 5634
	}
})
Config.NewRoom({
	Id = 5618,
	Name = "On A Road",
	Desc = "   The well kept road continues east and west from here.",
	Exits = {
		east = 5619,
		west = 5617
	}
})
Config.NewRoom({
	Id = 5619,
	Name = "On A Road",
	Desc = [[
   You stand on a well maintained road leading east towards New Thalos
and west towards the Eastern Mountains.  To the north you can see wide
plains stretching out as far as the eye can see.  South of you begins
a dark green forest.
]],
	Exits = {
		east = 5570,
		west = 5618
	}
})
Config.NewRoom({
	Id = 5620,
	Name = "The Headwaters Of The River Of Lost Souls",
	Desc = [[
   You are at the headwaters of what is oft called the darkest river
in the land.  Looking at the swampy water pooling in this rocky valley,
you can see why the water downstream is so dark.  The rock walls reach
up around you blocking all exits except that to the north up onto the
banks, and to the south where the river flows.
]],
	Exits = {
		north = 1501,
		south = 5635
	}
})
Config.NewRoom({
	Id = 5621,
	Name = "River Ishtar",
	Desc = [[
   The river calms a bit after being thrashed in the interior of
the mountain.  Although still deep within the rocks you can see
faint traces of green to the east.
]],
	Exits = {
		east = 5622,
		west = 5640
	}
})
Config.NewRoom({
	Id = 5622,
	Name = "River Ishtar",
	Desc = "   The river flows east and west through the hills.  ",
	Exits = {
		east = 5623,
		west = 5621
	}
})
Config.NewRoom({
	Id = 5623,
	Name = "River Ishtar",
	Desc = [[
   The river begins its decent out of the mountains now and continues
its flow to the east.
]],
	Exits = {
		east = 5645,
		west = 5622
	}
})
Config.NewRoom({
	Id = 5624,
	Name = "River Ishtar",
	Desc = [[
   The river flows under the wall of the city to the east and stretches
off towards high snow capped mountains far far to the west.
]],
	Exits = {
		east = 5488,
		west = 5650
	}
})
Config.NewRoom({
	Id = 5625,
	Name = "River Ishtar",
	Desc = [[
   The river flows out from the city down a long winding gully towards
the Sea of Dragons.  To the south of you lies the Great Eastern Desert
and north a wide open expanse of grass.  You can just barely make out
a road that seems to be traveling along side the river but the
banks are to steep for you to see very far.
]],
	Exits = {
		east = 5626,
		west = 5484
	}
})
Config.NewRoom({
	Id = 5626,
	Name = "River Ishtar",
	Desc = [[
   The river continues its descent down the lowlands flowing ever so
gently south.  It is hard to believe this is the same river that came
cascading down the mountainside.
]],
	Exits = {
		east = 5627,
		west = 5625
	}
})
Config.NewRoom({
	Id = 5627,
	Name = "River Ishtar",
	Desc = [[
   Small animals and herd animals can be heard in the distance, though 
you don't actually see any near the river.  Perhaps the steep slopes
pervent them from using the river.
]],
	Exits = {
		east = 5685,
		west = 5626
	}
})
Config.NewRoom({
	Id = 5628,
	Name = "The Edge Of The Ravine",
	Desc = [[
  You stand at the edge of a really long drop down.  A small rope
bridge has conviently been placed here to allow you access to the
other side of the bridge.  Unfortunately the wind seems to be kicking
up making the bridge sway slightly.  The path leads off through the
mountains to the east.
]],
	Exits = {
		east = 5629,
		west = 5610
	}
})
Config.NewRoom({
	Id = 5629,
	Name = "A Path Through The Mountains",
	Desc = [[
   The narrow path makes its way through the mountains east
and west.  You hear the squawking of a large bird over head
most likely a buzzard waiting for you to drop.
]],
	Exits = {
		east = 5630,
		south = 4050,
		west = 5628
	}
})
Config.NewRoom({
	Id = 5630,
	Name = "A Path Through The Mountains",
	Desc = [[
   A large boulder suddenly decides it wants to occupy the same space
you are currently standing in.
]],
	Exits = {
		east = 5613,
		west = 5629
	}
})
Config.NewRoom({
	Id = 5631,
	Name = "On A Road",
	Desc = "   The road you are on continues east and west.",
	Exits = {
		east = 5632,
		west = 5616
	}
})
Config.NewRoom({
	Id = 5632,
	Name = "On A Road",
	Desc = "   The road you are on continues east and west.",
	Exits = {
		east = 5633,
		west = 5631
	}
})
Config.NewRoom({
	Id = 5633,
	Name = "On A Road",
	Desc = "   The road you are on continues east and west.",
	Exits = {
		east = 5634,
		west = 5632
	}
})
Config.NewRoom({
	Id = 5634,
	Name = "On A Road",
	Desc = [[
   The road bends here toward the riverbank giving access to
the River Ishtar.  The road continues north and west from the
river bank.
]],
	Exits = {
		north = 5617,
		south = 5650,
		west = 5633
	}
})
Config.NewRoom({
	Id = 5635,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river flows south through a valley in the mountains.  You can see
a small village to the west.
]],
	Exits = {
		north = 5620,
		south = 5636
	}
})
Config.NewRoom({
	Id = 5636,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river flows south in the southern end of this wide valley.  The
walls of the valley close in to the south.
]],
	Exits = {
		north = 5635,
		south = 5637
	}
})
Config.NewRoom({
	Id = 5637,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river begins to speed up as it cascades down this mountain
crevice.  High above you a small rope bridge sways in the wind.
]],
	Exits = {
		north = 5636,
		south = 5638
	}
})
Config.NewRoom({
	Id = 5638,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river rapidly flows down this crack in the side of the mountain
to the south.  Hopefully you will hear any aproaching rapids.
]],
	Exits = {
		north = 5637,
		south = 5639
	}
})
Config.NewRoom({
	Id = 5639,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river seems to calm a bit as the crevase widens lessens
its stranglehold on the waters.  The river continues to the north 
through a crack and flows to the south.
]],
	Exits = {
		north = 5638,
		south = 5640
	}
})
Config.NewRoom({
	Id = 5640,
	Name = "A Split In The River",
	Desc = [[
   The waters of the river crash down upon a rock and split into
two bodies of water.  The river you are on continues its southern
course and the new river heads off to the east.  To your west you
notice that the rocks have split and crumbled as if torn asunder
by some massive force.  It looks impossible to traverse.  The River
of Lost Souls also continues to the north.
]],
	Exits = {
		north = 5639,
		east = 5621,
		south = 5641
	}
})
Config.NewRoom({
	Id = 5641,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river continues north and south from here through a water
eroded valley.
]],
	Exits = {
		north = 5640,
		south = 5642
	}
})
Config.NewRoom({
	Id = 5642,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river continues north and south from here through a water
eroded valley.
]],
	Exits = {
		north = 5641,
		south = 5643
	}
})
Config.NewRoom({
	Id = 5643,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river continues north and south from here through a water
eroded valley.
]],
	Exits = {
		north = 5642,
		south = 5644
	}
})
Config.NewRoom({
	Id = 5644,
	Name = "The River Of Lost Souls",
	Desc = [[
   The river makes a sharp bend here and heads south into a large
mountain and north through a valley.  On a ledge above you, and to
the west, you can see movement.
]],
	Exits = {
		north = 5643,
		south = 5005
	}
})
Config.NewRoom({
	Id = 5645,
	Name = "River Ishtar",
	Desc = [[
   The river widens here, no longer bounded by rock, and flows east
towards a plain.
]],
	Exits = {
		east = 5646,
		west = 5623
	}
})
Config.NewRoom({
	Id = 5646,
	Name = "River Ishtar",
	Desc = [[
   The river continues here east to east.  There is a landing area to
the north where you can gain access to the shore.
]],
	Exits = {
		north = 5616,
		east = 5647,
		west = 5645
	}
})
Config.NewRoom({
	Id = 5647,
	Name = "River Ishtar",
	Desc = [[
   The river meanders through the foothills of the eastern mountains.
The air is dryer on this side of the continental divide and it seems
a bit warmer.
]],
	Exits = {
		east = 5648,
		west = 5646
	}
})
Config.NewRoom({
	Id = 5648,
	Name = "River Ishtar",
	Desc = [[
   The river continues its journey eastward flowing through the
plains.  To the west you see the peaks of large snow capped
mountains and to the east you see the outline of a large city.
]],
	Exits = {
		east = 5649,
		west = 5647
	}
})
Config.NewRoom({
	Id = 5649,
	Name = "River Ishtar",
	Desc = "   The river flows east and west from here.",
	Exits = {
		east = 5650,
		west = 5648
	}
})
Config.NewRoom({
	Id = 5650,
	Name = "River Ishtar",
	Desc = [[
   The river slows as it widens and meanders through the lowlands.  A
small dock give access to the north shore.
]],
	Exits = {
		north = 5634,
		east = 5624,
		west = 5649
	}
})
Config.NewRoom({
	Id = 5652,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5653,
		east = 5657,
		south = 5655,
		west = 5658
	}
})
Config.NewRoom({
	Id = 5653,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5653,
		east = 5656,
		south = 5653,
		west = 5652
	}
})
Config.NewRoom({
	Id = 5654,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5655,
		east = 5640,
		south = 5657,
		west = 5658
	}
})
Config.NewRoom({
	Id = 5655,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5655,
		east = 5659,
		south = 5658,
		west = 5661
	}
})
Config.NewRoom({
	Id = 5656,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5656,
		east = 5660,
		south = 5659,
		west = 5655
	}
})
Config.NewRoom({
	Id = 5657,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5654,
		east = 5659,
		south = 5656,
		west = 5652
	}
})
Config.NewRoom({
	Id = 5658,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5655,
		east = 5659,
		south = 5655,
		west = 5655
	}
})
Config.NewRoom({
	Id = 5659,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5656,
		east = 5658,
		south = 5660,
		west = 5655
	}
})
Config.NewRoom({
	Id = 5660,
	Name = "In The Mountains",
	Desc = [[
   You are walking over rocks and stones through the mountains between 
the Ishtar and Dark rivers.
   It is funny how all the rocks look alike.
]],
	Exits = {
		north = 5653,
		east = 5660,
		south = 5655,
		west = 5659
	}
})
Config.NewRoom({
	Id = 5661,
	Name = "The Headwaters Of The Dark River",
	Desc = [[
   A large natural spring issues forth from the heart of the mountain
and flows west down the mountain.  It looks like there was a terrible
earthquake here not too long ago, and a path that leads eastwards
through the mountains is covered with rocks, making passage difficult.
]],
	Exits = {
		east = 5655,
		west = 5662
	}
})
Config.NewRoom({
	Id = 5662,
	Name = "On The Dark River",
	Desc = [[
   The river flows down the mountain through a large crevasse to the west
and up into the mountains east.
]],
	Exits = {
		east = 5661,
		west = 5663
	}
})
Config.NewRoom({
	Id = 5663,
	Name = "On The Dark River",
	Desc = [[
   The walls of this canyon tower overhead as the river continues east
and west from here.
]],
	Exits = {
		east = 5662,
		west = 5664
	}
})
Config.NewRoom({
	Id = 5664,
	Name = "On The Dark River",
	Desc = [[
   The walls of rock around you slowly shrink to ground level as the river 
flows out of the mountains and onto the plains.
]],
	Exits = {
		east = 5663,
		west = 5665
	}
})
Config.NewRoom({
	Id = 5665,
	Name = "On The Dark River",
	Desc = [[
   The river continues east and west from here out of the foothills
to the east down into the mountains south of here.
]],
	Exits = {
		east = 5664,
		south = 5666
	}
})
Config.NewRoom({
	Id = 5666,
	Name = "On The Dark River",
	Desc = [[
   The river, following a low spot in the foothills, bends and twists.
Tall mountains can be seen off to the south and east.
]],
	Exits = {
		north = 5665,
		south = 5667
	}
})
Config.NewRoom({
	Id = 5667,
	Name = "On The Dark River",
	Desc = "   The river makes a wide sweeping turn here into the mountain.",
	Exits = {
		north = 5666,
		west = 5668
	}
})
Config.NewRoom({
	Id = 5668,
	Name = "On The Dark River",
	Desc = [[
   The river flows west from here into the heart of the mountain and
east towards the foothills once more.
]],
	Exits = {
		east = 5667,
		west = 5669
	}
})
Config.NewRoom({
	Id = 5669,
	Name = "On The Dark River",
	Desc = [[
   You can barely make out what is ahead of you as the river flows
quietly through the passageway.
]],
	Exits = {
		east = 5668,
		south = 5670
	}
})
Config.NewRoom({
	Id = 5670,
	Name = "On The Dark River",
	Desc = [[
   The river slowly flows west towards the heart of the mountain.  There
are small cracks in the passage wall to the north where you might be able
to get up out of the water.
]],
	Exits = {
		north = 5673,
		east = 5669,
		west = 5671
	}
})
Config.NewRoom({
	Id = 5671,
	Name = "On The Dark River",
	Desc = [[
   The river continues east and west from here flowing south of a dark
ledge high above the water level.
]],
	Exits = {
		east = 5670,
		west = 5672
	}
})
Config.NewRoom({
	Id = 5672,
	Name = "On The Dark River",
	Desc = [[
   The river flows south through a narrowing part of the passage as it
progresses deeper into the mountain.
]],
	Exits = {
		east = 5671,
		south = 5006
	}
})
Config.NewRoom({
	Id = 5673,
	Name = "On A Small Ledge",
	Desc = [[
   You clamber out of the water up onto this narrow ledge to see if
it leads deeper into the mountain.  Unfortunately, the ledge is only
wide enough to rest upon for a while and there does not appear to be
any other exits other than rejoining the underground river.
]],
	Exits = {
		south = 5670
	}
})
Config.NewRoom({
	Id = 5682,
	Name = "On The Plains",
	Desc = [[
   You stand on an open expanse of grass extending in all directions.
To the south of you stand the might northern gates of New Thalos.  East
and west of you the grassy fields continue and north, in the distance,
you see a line of trees.
]],
	Exits = {
		north = 5683,
		east = 5682,
		south = 5568,
		west = 5682
	}
})
Config.NewRoom({
	Id = 5683,
	Name = "On The Plains",
	Desc = [[
   You stand on an open field of grass.  The forest to the north is
closer but still a good distance away.  To the south a small dirt
path has been trodden into the ground heading towards New Thalos.
]],
	Exits = {
		north = 5684,
		east = 5683,
		south = 5682,
		west = 5683
	}
})
Config.NewRoom({
	Id = 5684,
	Name = "The Edge Of The Forest",
	Desc = [[
   You stand at the edge of a huge forest.  The line of trees
continues as far as the eye can see to the east and west.  A
large expanse of grass spreads out to the south.
]],
	Exits = {
		east = 5684,
		south = 5683,
		west = 5684
	}
})
Config.NewRoom({
	Id = 5685,
	Name = "River Ishtar",
	Desc = [[
   The river broadens even more here and the waters become murky.
The smell of saltwater has reached you from the east.  The Dragon
Sea cannot be far away.  To the east you can see the faint outline
of a city and to the north you see a large expanse of grass.
]],
	Exits = {
		east = 5686,
		west = 5627
	}
})
Config.NewRoom({
	Id = 5686,
	Name = "The River Delta",
	Desc = [[
   This is where the river empties out into the Dragon Sea.  The backrush
of water has kicked up a lot of sand and the blue sea is stained where
the river empties.  Looking west all you can see is water... all the way
to the horizon.  North of here is a small dock you think you should be
able to reach with out too much trouble.  The river stretches off to the
west back towards New Thalos.
]],
	Exits = {
		east = 5687,
		west = 5685
	}
})
Config.NewRoom({
	Id = 5687,
	Name = "The Dragon Sea",
	Desc = [[
   You are on the clear blue seas of the Dragon Sea.  Water extends
in all directions as far as the eye can see.  Off in the distance
you think you might see a small dock to the north.
]],
	Exits = {
		north = 5688,
		east = 5687,
		south = 5687,
		west = 5686
	}
})
Config.NewRoom({
	Id = 5688,
	Name = "The Dragon Sea",
	Desc = [[
   The Dragon Sea comes up along the shore here.  The deep blue waters
rolling in and crashing against the beach.  To the north you see a 
small dock jutting out into the surf.
]],
	Exits = {
		north = 5696,
		east = 5697,
		south = 5687
	}
})
Config.NewRoom({
	Id = 5689,
	Name = "The Dragon Sea",
	Desc = [[
   You are on the clear blue seas of the Dragon Sea.  Water extends
in all directions as far as the eye can see.  Off in the distance
you think you might see a small dock to the west.
]],
	Exits = {
		north = 5689,
		east = 5698,
		south = 5696
	}
})
Config.NewRoom({
	Id = 5690,
	Name = "The Dragon Sea",
	Desc = [[
   You are on the clear blue seas of the Dragon Sea.  Water extends
in all directions as far as the eye can see.  Off in the distance
you think you might see a small dock to the west.
]],
	Exits = {
		north = 5698,
		east = 5690,
		south = 5697,
		west = 5696,
		down = 5699
	}
})
Config.NewRoom({
	Id = 5691,
	Name = "On A Road",
	Desc = [[
   The people of New Thalos take great pride in the services their
city may provide.  One of these services is the construction crews
the go to great lengths to keep all the roads in order.  Although
the taxes in New Thalos are higher then other cities in the realm
most of the money is used for the good of the people.
]],
	Exits = {
		east = 5692,
		west = 5569
	}
})
Config.NewRoom({
	Id = 5692,
	Name = "On A Road",
	Desc = [[
   You walk along a well used road with beautiful scenery.  To the north
tall pine trees form a wall that goes on for miles.  Between the road
and the trees lies a great expanse of grassy plains.  South of here, 
beyond the river, lies the Great Eastern Desert.  The road continues
east and west.
]],
	Exits = {
		east = 5693,
		west = 5691
	}
})
Config.NewRoom({
	Id = 5693,
	Name = "On A Road",
	Desc = [[
   The Dragon Sea can be seen to the east now spreading out to unknown
lands.  The road continues east and west.  To the south you hear the
sounds of boats traveling the River Ishtar delivering goods.
]],
	Exits = {
		east = 5694,
		west = 5692
	}
})
Config.NewRoom({
	Id = 5694,
	Name = "On A Road",
	Desc = [[
   This is the man land route through the land.  Merchants can bring
their goods to the coastline and have them ferried onto ships for
export.  Travel by foot west will take you through New Thalos up and
over the Eastern Mountains and down into Midgaard.
]],
	Exits = {
		east = 5695,
		west = 5693
	}
})
Config.NewRoom({
	Id = 5695,
	Name = "Near The Shore",
	Desc = [[
   The road ends here turning into a small dirt path leading down the
beach and onto a dock.  To the north and south you see the coastline
stretching out before you.  West of here the lowlands roll up into
huge snow capped mountains.
]],
	Exits = {
		east = 5696,
		west = 5694
	}
})
Config.NewRoom({
	Id = 5696,
	Name = "On A Dock",
	Desc = [[
   You stand on a simple wooden dock that acts as an extension of the
road to the west.  The dock seems to have been here for quite a long
time but is still sturdy.  A small ladder has been built on the eastern
end to allow easy access to and from ships.
]],
	Exits = {
		north = 5689,
		east = 5690,
		south = 5688,
		west = 5695
	}
})
Config.NewRoom({
	Id = 5697,
	Name = "The Dragon Sea",
	Desc = [[
   You are on the clear blue seas of the Dragon Sea.  Water extends in
all directions as far as the eye can see.  Off in the distance you think
you might see a small dock to the west.
]],
	Exits = {
		north = 5690,
		east = 5697,
		west = 5688
	}
})
Config.NewRoom({
	Id = 5698,
	Name = "The Dragon Sea",
	Desc = [[
   The ocean spreads out in all directions rolling gently.  In the
distance you can see an island on the horizon.  To the west you see
the mainland.
]],
	Exits = {
		north = 5698,
		east = 5698,
		south = 5690,
		west = 5689
	}
})
Config.NewRoom({
	Id = 5699,
	Name = "Under The dock",
	Desc = [[
   You are swiming underneath the dock.  You can see the four wooden
pylons that support the structure.  The murky water clouds you vision
as you gaze westward, but you think you can make out an iron grating
in that direction.
]],
	Exits = {
		west = 5700,
		up = 5698
	}
})
Config.NewRoom({
	Id = 5700,
	Name = "The Lair Of The Ixitxachitl",
	Desc = [[
   Blood swirls around in the water as the Ixitxachitl devours the 
last of its meal.  Swirling around quickly as you intrude upon his
meal the large sting ray attacks!
]],
	Exits = {
		east = 5699
	}
})
