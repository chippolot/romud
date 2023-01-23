Config.NewRoom({
	Id = 3001,
	Name = "The Reading Room",
	Desc = [[   You are in a small, simple room which is mostly empty, save a few
wooden desks and benches.  To the east you hear the bustle of the Temple
of Midgaard, a sharp contrast to the relative quiet of this peaceful
room.]],
	Exits = {
		east = 3002
	}
})
Config.NewRoom({
	Id = 3002,
	Name = "The Temple Of Midgaard",
	Desc = [[   You are in the southern end of the temple hall in the Temple of Midgaard.
The temple has been constructed from giant marble blocks, eternal in
appearance, and most of the walls are covered by ancient wall paintings
picturing Gods, Giants and peasants.
   Large steps lead down through the grand temple gate, descending the huge
mound upon which the temple is built and ends on the temple square below.
To the west, you see the Reading Room.  The donation room is in a small
alcove to your east.]],
	Exits = {
		north = 3055,
		east = 3064,
		south = 3006,
		west = 3001,
		down = 3006
	}
})
Config.NewRoom({
	Id = 3003,
	Name = "The Clerics' Inner Sanctum",
	Desc = [[   This is the inner sanctum.  A picture of the mighty Thor, is hanging on
the wall, just above the altar which is set against the western wall.  A well
in the middle of the floor leads down into darkness.  Vile smells waft from
the depths.]],
	Exits = {
		east = 3004,
		down = 7027
	}
})
Config.NewRoom({
	Id = 3004,
	Name = "The Bar Of Divination",
	Desc = [[   The bar is one of the finest in the land, lucky it is members only.  Fine
furniture is set all around the room.  A small sign is hanging on the wall.]],
	Exits = {
		south = 3005,
		west = 3003
	}
})
Config.NewRoom({
	Id = 3005,
	Name = "The Entrance To The Clerics' Guild",
	Desc = [[   The entrance hall is a small modest room, reflecting the true nature of
the Clerics.  The exit leads east to the temple square.  A small entrance to
the bar is in the northern wall.]],
	Exits = {
		north = 3004,
		east = 3006
	}
})
Config.NewRoom({
	Id = 3006,
	Name = "The Temple Square",
	Desc = [[   You are standing on the temple square.  Huge marble steps lead up to the
temple gate.  The entrance to the Clerics' Guild is to the west, and the old
Grunting Boar Inn, is to the east.  Just south of here you see the market
square, the center of Midgaard.]],
	Exits = {
		north = 3002,
		east = 3007,
		south = 3015,
		west = 3005
	}
})
Config.NewRoom({
	Id = 3007,
	Name = "The Entrance Hall Of The Grunting Boar Inn",
	Desc = [[   You are standing in the entrance hall of the Grunting Boar Inn.  The hall
has been wisely decorated with simple, functional furniture.  The heavy smell
of dust and aging paper drifts in from the Post Office to the north.  A small
staircase leads up to the reception and the bar is to the east.]],
	Exits = {
		north = 3063,
		east = 3008,
		west = 3006,
		up = 3009
	}
})
Config.NewRoom({
	Id = 3008,
	Name = "The Grunting Boar",
	Desc = [[   You are standing in the bar.  The bar is set against the northern wall, old
archaic writing, carvings and symbols cover its top.  A fireplace is built into
the western wall, and through the southeastern windows you can see the temple
square.  This place makes you feel like home.
A small sign with big letters is fastened to the bar.]],
	Exits = {
		west = 3007
	}
})
Config.NewRoom({
	Id = 3009,
	Name = "The Reception",
	Desc = [[   You are standing in the reception.  The staircase leads down to the
entrance hall.  An exit to the north leads to the Cryogenic Center.
There is a small sign on the counter.]],
	Exits = {
		north = 3065,
		down = 3007
	}
})
Config.NewRoom({
	Id = 3010,
	Name = "The Bakery",
	Desc = [[   You are standing inside the small bakery.  A sweet scent of Danish and
fine bread fills the room.  The bread and Danish are arranged in fine order
on the shelves, and seem to be of the finest quality.
A small sign is on the counter.]],
	Exits = {
		south = 3014
	}
})
Config.NewRoom({
	Id = 3011,
	Name = "The General Store",
	Desc = [[   You are inside the general store.  All sorts of items are stacked on shelves
behind the counter, safely out of your reach.
A small note hangs on the wall.]],
	Exits = {
		south = 3016
	}
})
Config.NewRoom({
	Id = 3012,
	Name = "The Weapon Shop",
	Desc = "   You are inside the weapon shop.  There is a small note on the counter.",
	Exits = {
		south = 3017
	}
})
Config.NewRoom({
	Id = 3013,
	Name = "Main Street",
	Desc = [[   You are at the end of the main street of Midgaard.  South of here is the
entrance to the Guild of Magic Users.  The street continues east towards the
market square.  The magic shop is to the north and to the west is the city
gate.]],
	Exits = {
		north = 3034,
		east = 3014,
		south = 3018,
		west = 3041
	}
})
Config.NewRoom({
	Id = 3014,
	Name = "Main Street",
	Desc = [[   You are on the main street passing through the City of Midgaard.  South of
here is the entrance to the Armory, and the bakery is to the north.  East of
here is the market square.]],
	Exits = {
		north = 3010,
		east = 3015,
		south = 3021,
		west = 3013
	}
})
Config.NewRoom({
	Id = 3015,
	Name = "Market Square",
	Desc = [[   You are standing on the market square, the famous Square of Midgaard.
A large, peculiar looking statue is standing in the middle of the square.
Roads lead in every direction, north to the temple square, south to the
common square, east and westbound is the main street.]],
	Exits = {
		north = 3006,
		east = 3016,
		south = 3026,
		west = 3014
	}
})
Config.NewRoom({
	Id = 3016,
	Name = "Main Street",
	Desc = [[   You are on the main street crossing through town.  To the north is the
general store, and the main street continues east.  To the west you see and
hear the market place, to the south a small door leads into the Pet Shop.]],
	Exits = {
		north = 3011,
		east = 3017,
		south = 3032,
		west = 3015
	}
})
Config.NewRoom({
	Id = 3017,
	Name = "Main Street",
	Desc = [[   The main street, to the north is the weapon shop and to the south is the
Guild of Swordsmen.  To the east you leave town and to the west the street
leads to the market square.]],
	Exits = {
		north = 3012,
		east = 3042,
		south = 3022,
		west = 3016
	}
})
Config.NewRoom({
	Id = 3018,
	Name = "The Entrance To The Mages' Guild",
	Desc = "   The entrance hall to this guild is a small, poor lighted room.",
	Exits = {
		north = 3013,
		south = 3019
	}
})
Config.NewRoom({
	Id = 3019,
	Name = "The Mages' Bar",
	Desc = [[   The bar is one of the weirdest in the land.  Mystical images float around
the air.  Illusions of fine furniture appear all around the room.]],
	Exits = {
		north = 3018,
		east = 3020
	}
})
Config.NewRoom({
	Id = 3020,
	Name = "The Mages' Laboratory",
	Desc = [[   This is the Magical Experiments Laboratory.  Dark smoke-stained stones
arch over numerous huge oaken tables, most of these cluttered with strange-
looking pipes and flasks.  The floor is covered with half-erased pentagrams
and even weirder symbols, and a blackboard in a dark corner has only been
partially cleaned, some painful-looking letters faintly visible.  A well in
the middle of the floor leads down into darkness.  Vile smells waft from the
depths.]],
	Exits = {
		west = 3019,
		down = 7018
	}
})
Config.NewRoom({
	Id = 3021,
	Name = "The Armory",
	Desc = [[   The armory with all kinds of armors on the walls and in the window.  You
see helmets, shields and chain mails.  To the north is the main street.
On the wall is a small note.]],
	Exits = {
		north = 3014
	}
})
Config.NewRoom({
	Id = 3022,
	Name = "The Entrance Hall To The Guild Of Swordsmen",
	Desc = [[   The entrance hall to the Guild of Swordsmen.  A place where one has to be
careful not to say something wrong (or right).  To the east is the bar and to
the north is the main street.]],
	Exits = {
		north = 3017,
		east = 3023
	}
})
Config.NewRoom({
	Id = 3023,
	Name = "The Bar Of Swordsmen",
	Desc = [[   The bar of swordsmen, once upon a time beautifully furnished.  But now the
furniture is all around you in small pieces.  To the south is the yard, and
to the west is the entrance hall.]],
	Exits = {
		south = 3024,
		west = 3022
	}
})
Config.NewRoom({
	Id = 3024,
	Name = "The Tournament And Practice Yard",
	Desc = [[   This is the practice yard of the fighters.  To the north is the bar.
A well leads down into darkness.]],
	Exits = {
		north = 3023,
		down = 7049
	}
})
Config.NewRoom({
	Id = 3025,
	Name = "The Eastern End Of Poor Alley",
	Desc = [[   You are at the poor alley.  South of here is the Grubby Inn and to the
east you see common square.  The alley continues further west.]],
	Exits = {
		east = 3026,
		south = 3049,
		west = 3045
	}
})
Config.NewRoom({
	Id = 3026,
	Name = "The Common Square",
	Desc = [[   The common square, people pass you, talking to each other.  To the west is
the poor alley and to the east is the dark alley.  To the north, this square
is connected to the market square.  From the south you notice a nasty smell.]],
	Exits = {
		north = 3015,
		east = 3027,
		south = 3031,
		west = 3025
	}
})
Config.NewRoom({
	Id = 3027,
	Name = "The Dark Alley",
	Desc = [[   The dark alley, to the west is the common square and to the south is the
Guild of Thieves.  The alley continues east.]],
	Exits = {
		east = 3046,
		south = 3028,
		west = 3026
	}
})
Config.NewRoom({
	Id = 3028,
	Name = "The Entrance Hall To The Guild Of Thieves",
	Desc = [[   The entrance hall to the thieves' and assassins' guild.  A place where you
can lose both your life and your money, if you are not careful.  To the north
is the dark alley and to the east is the thieves' bar.]],
	Exits = {
		north = 3027,
		east = 3029
	}
})
Config.NewRoom({
	Id = 3029,
	Name = "The Thieves' Bar",
	Desc = [[   The bar of the thieves.  Once upon a time this place was beautifully
furnished, but now it seems almost empty.  To the south is the yard, and to
the west is the entrance hall.
   (Maybe the furniture has been stolen?!)]],
	Exits = {
		south = 3030,
		west = 3028
	}
})
Config.NewRoom({
	Id = 3030,
	Name = "The Secret Yard",
	Desc = [[   The secret practice yard of thieves and assassins.  To the north is the
bar.  A well leads down into darkness.]],
	Exits = {
		north = 3029,
		down = 7044
	}
})
Config.NewRoom({
	Id = 3031,
	Name = "The Dump",
	Desc = [[   The dump, where the people from the city drop their garbage.  Through the
garbage you can see a large junction of pipes, looks like the entrance to the
sewer system.  North of here you see the common square.]],
	Exits = {
		north = 3026,
		down = 7031
	}
})
Config.NewRoom({
	Id = 3032,
	Name = "The Pet Shop",
	Desc = [[   The Pet Shop is a small crowded store, full of cages and animals of
various sizes.  There is a sign on the wall.]],
	Exits = {
		north = 3016
	}
})
Config.NewRoom({
	Id = 3033,
	Name = "Pet Shop Store",
	Desc = [[   This  is the small dark room in which the Pet shop keeps his pets.
It is vital that this room's virtual number is exactly one larger
than the Pet Shop number.]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 3034,
	Name = "The Magic Shop",
	Desc = [[   Behind the counter you see various items, neatly placed in racks,
presumably most of them are magic.]],
	Exits = {
		south = 3013
	}
})
Config.NewRoom({
	Id = 3041,
	Name = "Inside The West Gate Of Midgaard",
	Desc = [[   You are by two small towers that have been built into the city wall and
connected with a footbridge across the heavy wooden gate.  Main Street leads
east and Wall Road leads south from here.]],
	Exits = {
		east = 3013,
		south = 3043,
		west = 3053
	}
})
Config.NewRoom({
	Id = 3042,
	Name = "Inside The East Gate Of Midgaard",
	Desc = [[   You are by two small towers that have been built into the city wall and
connected with a footbridge across the heavy wooden gate.  Main Street leads
west from here.  To the south you see the Water Shop.]],
	Exits = {
		east = 3054,
		south = 3059,
		west = 3017
	}
})
Config.NewRoom({
	Id = 3043,
	Name = "Wall Road",
	Desc = [[   You are walking next to the western city wall.  The road continues further
south and the city gate is just north of here.]],
	Exits = {
		north = 3041,
		south = 3044
	}
})
Config.NewRoom({
	Id = 3044,
	Name = "Wall Road",
	Desc = [[   You are walking next to the western city wall.  Wall Road continues further
north and south.  A small, poor alley leads east.
Some letters have been written on the wall here.]],
	Exits = {
		north = 3043,
		east = 3045,
		south = 3048
	}
})
Config.NewRoom({
	Id = 3045,
	Name = "Poor Alley",
	Desc = [[   You are on Poor Alley, which continues further east.  You see the
city wall to the west.]],
	Exits = {
		east = 3025,
		west = 3044
	}
})
Config.NewRoom({
	Id = 3046,
	Name = "The Dark Alley At The Levee",
	Desc = [[   You are standing in the alley which continues east and west.  South of
here you see the levee.]],
	Exits = {
		east = 3047,
		south = 3050,
		west = 3027
	}
})
Config.NewRoom({
	Id = 3047,
	Name = "The Eastern End Of The Alley",
	Desc = [[   You are standing at the eastern end of the alley, the city wall is just
east, blocking any further movement.  A small warehouse is directly south of
here.]],
	Exits = {
		south = 3051,
		west = 3046
	}
})
Config.NewRoom({
	Id = 3048,
	Name = "Wall Road",
	Desc = [[   You are standing on the road next to the western city wall, which
continues north.  South of here is a bridge across the river.]],
	Exits = {
		north = 3044,
		south = 3052
	}
})
Config.NewRoom({
	Id = 3049,
	Name = "Grubby Inn",
	Desc = [[   You are inside the old Grubby Inn.  This place has not been cleaned for
several decades; vile smells make you dizzy.]],
	Exits = {
		north = 3025
	}
})
Config.NewRoom({
	Id = 3050,
	Name = "The Levee",
	Desc = [[   You are at the levee.  South of here you see the river gently flowing west.
The river bank is very low making it possible to enter the river.]],
	Exits = {
		north = 3046,
		south = 3204
	}
})
Config.NewRoom({
	Id = 3051,
	Name = "The Deserted Warehouse",
	Desc = [[   You are inside the warehouse.  The room is decorated with various old
items from ships.]],
	Exits = {
		north = 3047
	}
})
Config.NewRoom({
	Id = 3052,
	Name = "On The Bridge",
	Desc = [[   You are standing on the stone bridge crosses the river.  The bridge is
built out from the western city wall and the river flows west through an
opening in the wall ten feet below the bridge.]],
	Exits = {
		north = 3048,
		south = 3101
	}
})
Config.NewRoom({
	Id = 3053,
	Name = "Outside The West Gate Of Midgaard",
	Desc = [[   You are by two small towers that have been built into the city wall and
connected with a footbridge across the heavy wooden gate.  To the west you
can see the edge of a big forest.]],
	Exits = {
		east = 3041,
		west = 6093
	}
})
Config.NewRoom({
	Id = 3054,
	Name = "Outside The East Gate Of Midgaard",
	Desc = [[   You are by two small towers that have been built into the city wall and
connected with a footbridge across the heavy wooden gate.  To the east the
plains stretch out in the distance.]],
	Exits = {
		east = 3504,
		west = 3042
	}
})
Config.NewRoom({
	Id = 3055,
	Name = "By The Temple Altar",
	Desc = [[   You are by the temple altar in the northern end of the Temple of
Midgaard.  A huge altar made from white polished marble is standing
in front of you and behind it is a ten foot tall sitting statue of
Odin, the King of the Gods.
   To the north, steps lead out the back of the temple towards the
countryside.]],
	Exits = {
		north = 3060,
		south = 3002
	}
})
Config.NewRoom({
	Id = 3056,
	Name = "Odin's Store",
	Desc = [[   This is the small dark room in which Odin keeps the player items that he
takes care of.  It is vital that this room's virtual number is exactly one
larger than the room by the temple altar.]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 3059,
	Name = "Ye Olde Water Shoppe",
	Desc = [[   You are standing in the center of a small wooden shop whose walls are
covered with racks upon racks of water jugs.  Several large barrels with
spigots are stacked in the corner.]],
	Exits = {
		north = 3042
	}
})
Config.NewRoom({
	Id = 3060,
	Name = "Behind The Temple Altar",
	Desc = [[   You are on a dirt path leading away from the Temple Altar which is south
of here.  To the north, the path continues through the lush contryside of
Midgaard towards the Dragonhelm Mountains far off to the north.]],
	Exits = {
		north = 3061,
		south = 3055
	}
})
Config.NewRoom({
	Id = 3061,
	Name = "The Great Field Of Midgaard",
	Desc = [[   You are walking on a wide dirt path through the lush, green, fresh
Midgaard countryside.  You can see to the horizon to the north, east,
and west; the busy city of Midgaard lies to the south.  All around you
is healthy green grass and an occasional large oak tree.  The sun feels
wonderful on your face and a pleasant wind blows through your hair.  Birds
chirp quietly to themselves and you can smell the faint scent of flowers
and freshly cut grass.  You feel like you could lie down in the grass and
stay here forever, surrounded by powerful beauty in all directions.
   The path you are on continues north through the field and south back
to Midgaard.]],
	Exits = {
		north = 3062,
		south = 3060
	}
})
Config.NewRoom({
	Id = 3062,
	Name = "The Great Field Of Midgaard",
	Desc = [[   You are walking on a wide dirt path through the lush, green, fresh
Midgaard countryside.  You can see to the horizon to the north, east,
and west; the busy city of Midgaard lies to the south.  All around you
is healthy green grass and an occasional large oak tree.  The sun feels
wonderful on your face and a pleasant wind blows through your hair.  Birds
chirp quietly to themselves and you can smell the faint scent of flowers
and freshly cut grass.  You feel like you could lie down in the grass and
stay here forever, surrounded by powerful beauty in all directions.
   There is a strange structure on the eastern side of the path.  A small
dirt path splits off of the main path and leads off to the west.]],
	Exits = {
		north = 3066,
		east = 18601,
		south = 3061,
		west = 3067
	}
})
Config.NewRoom({
	Id = 3063,
	Name = "The Post Office",
	Desc = [[   You are in the central post office for Midgaard.  Piles of assorted mail
lay untouched in the corners, collecting cobwebs.  Several large crates have
been pried open by curious customs agents, and are now stacked along the west
wall, hiding plenty of 'WANTED' posters.
There is a sign posted on the wall here.]],
	Exits = {
		south = 3007
	}
})
Config.NewRoom({
	Id = 3064,
	Name = "The Midgaard Donation Room",
	Desc = [[   You are in a small, undecorated room just off of the main temple.  There
are a couple of small wooden benches here where people occasionally sit
while they wait for items to appear.  The temple is to the west.]],
	Exits = {
		west = 3002
	}
})
Config.NewRoom({
	Id = 3065,
	Name = "The Cryogenic Center",
	Desc = [[   You are standing in an impossible white sterile room with cylindrical
body-length canisters lined up against the walls.  The Reception is to the
south.]],
	Exits = {
		south = 3009
	}
})
Config.NewRoom({
	Id = 3066,
	Name = "The Great Field Of Midgaard",
	Desc = [[   You are walking on a wide dirt path through the lush, green, fresh
Midgaard countryside.  You can see to the horizon to the north, east,
and west; the busy city of Midgaard lies to the south.  All around you
is healthy green grass and an occasional large oak tree.  The sun feels
wonderful on your face and a pleasant wind blows through your hair.  Birds
chirp quietly to themselves and you can smell the faint scent of flowers
and freshly cut grass.  You feel like you could lie down in the grass and
stay here forever, surrounded by powerful beauty in all directions.
   The way north appears to be blocked by a large plot device and you cannot
see any way around it.]],
	Exits = {
		north = 0,
		south = 3062
	}
})
Config.NewRoom({
	Id = 3067,
	Name = "The Dirt Path",
	Desc = [[   You are walking along a narrow dirt path through the lush, green,
fresh Midgaard countryside.  You can see to the horizon to the north
and east; the busy city of Midgaard lies to the south.  All around
you is healthy green grass and an occasional large oak tree.  The sun
feels wonderful on your face and a pleasant wind blows through your
hair.  Birds chirp quietly to themselves and you can smell the faint
scent of flowers and freshly cut grass.  You feel like you could lie
down in the grass and stay here forever, surrounded by powerful beauty
in all directions.
   There is a large rusty gate sitting in a stone archway just to the
west.]],
	Exits = {
		east = 3062,
		west = 3601
	}
})
