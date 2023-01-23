Config.NewRoom({
	Id = 5201,
	Name = "The Grand Gate Of Thalos",
	Desc = [[   You stand in the archway of a gigantic stone archway.  The two
steel gates have been forced open and have rusted in place.  A hollow
gust of wind blows by you into the deserted, and seemingly destroyed,
city.]],
	Exits = {
		west = 5202
	}
})
Config.NewRoom({
	Id = 5202,
	Name = "Main Street",
	Desc = [[   This was once a magnificent street, but now is in total ruin.  The
streets are barren and windswept and the silence is unending.  To the south
you see a ruined cottage while north leads into a dark back alley.  Howls
and screams echo through the deserted city.]],
	Exits = {
		north = 5240,
		east = 5201,
		south = 5236,
		west = 5203
	}
})
Config.NewRoom({
	Id = 5203,
	Name = "Main Street",
	Desc = [[   This was once a magnificent street, but now is in total ruin.  The
streets are barren and windswept and the silence is unending.  On one
side is a collapsed house while on the other is the entrance to a large
ruined mansion.  Eerie sounds echo within the mansion.  Near the center of 
town you see a large domed building, relatively intact.]],
	Exits = {
		north = 5237,
		east = 5202,
		south = 5233,
		west = 5204
	}
})
Config.NewRoom({
	Id = 5204,
	Name = "A Garden Path",
	Desc = [[   A circular path surrounds a magnificent domed temple in the center
of the city.  Flowers have withered away and the once lush trees are bare.
Vines and ivy snake up the sides of the temple and entangle themselves
around your feet.  A sudden volley of howls pierces the air.]],
	Exits = {
		north = 5205,
		east = 5203,
		south = 5207,
		west = 5251
	}
})
Config.NewRoom({
	Id = 5205,
	Name = "A Garden Path",
	Desc = [[   A circular path surrounds a magnificent domed temple in the center
of the city.  Flowers have withered away and the once lush trees are bare.
Vines and ivy snake up the sides of the temple and entangle themselves
around your feet.]],
	Exits = {
		north = 5212,
		east = 5204,
		south = 5251,
		west = 5206
	}
})
Config.NewRoom({
	Id = 5206,
	Name = "A Garden Path",
	Desc = [[   A circular path surrounds a magnificent domed temple in the center
of the city.  Flowers have withered away and the once lush trees are bare.
Vines and ivy creep up the sides of the temple and entangle themselves 
around your feet.]],
	Exits = {
		north = 5205,
		east = 5251,
		south = 5207,
		west = 5208
	}
})
Config.NewRoom({
	Id = 5207,
	Name = "A Garden Path",
	Desc = [[   A circular path surrounds a magnificent domed temple in the center 
of the city.  Flowers have withered away and the once lush trees are bare.
Vines and ivy creep up the sides of the temple and entangle themselves 
around your feet.]],
	Exits = {
		north = 5251,
		east = 5204,
		south = 5213,
		west = 5206
	}
})
Config.NewRoom({
	Id = 5208,
	Name = "The Market Place",
	Desc = [[   You stand in the middle of a large square lined on each side with
baskets, carts, and stands of all shapes and sizes.  Abandoned, these
little shops still contain some of their goods once sold to a demanding
public.]],
	Exits = {
		north = 5226,
		east = 5206,
		south = 5221,
		west = 5209
	}
})
Config.NewRoom({
	Id = 5209,
	Name = "The Market Place",
	Desc = [[   You stand at the end of the market square.  Stands and carts line
each side, filled with remnants of fine foods and exquisite goods.]],
	Exits = {
		north = 5223,
		east = 5208,
		south = 5218
	}
})
Config.NewRoom({
	Id = 5210,
	Name = "A Side Street",
	Desc = [[   This small side street leads east and west into back alleys while
to the south you see the temple.  The incessant howling tears at your
mind.]],
	Exits = {
		east = 5244,
		south = 5211,
		west = 5229
	}
})
Config.NewRoom({
	Id = 5211,
	Name = "A Side Street",
	Desc = [[   You are in the common section of the city.  Ruined buildings made of
clay and stone is all the view has to offer.  Most of these homes are 
nothing but piles of rubble, but some look almost safe enough to venture
into.
   The street continues north and south and buildings line the street.]],
	Exits = {
		north = 5210,
		east = 5245,
		south = 5212,
		west = 5227
	}
})
Config.NewRoom({
	Id = 5212,
	Name = "A Side Street",
	Desc = [[   This small side street leads away from the garden path to the south.
Around you stand large piles or rubble where the houses of commoners
used to be.  A lone howl makes you worry greatly about your safety here.]],
	Exits = {
		north = 5211,
		east = 5238,
		south = 5205,
		west = 5228
	}
})
Config.NewRoom({
	Id = 5213,
	Name = "A Side Street",
	Desc = [[   This small side street leads south away from the temple into the
business section of town.  The destruction that leveled this city was not
biased; these important looking buildings have been almost totally
destroyed.  There is a hole in the wall of a very large structure to the
east.]],
	Exits = {
		north = 5207,
		east = 5233,
		south = 5214,
		west = 5222
	}
})
Config.NewRoom({
	Id = 5214,
	Name = "A Side Street",
	Desc = [[   This small side street is lined with the remains of once great
buildings.  To the west is a dark, foreboding structure while to the
east lies the entrance to a small tavern.  The street continues north
and south.]],
	Exits = {
		north = 5213,
		east = 5231,
		south = 5215,
		west = 5220
	}
})
Config.NewRoom({
	Id = 5215,
	Name = "A Side Street",
	Desc = [[   You are at the end of a long street leading to the center of the city.
A long dark alley runs east and west.]],
	Exits = {
		north = 5214,
		east = 5230,
		west = 5219
	}
})
Config.NewRoom({
	Id = 5216,
	Name = "Under A Ruined Watchtower",
	Desc = [[   You stand at the base of a tall watchtower built to protect the city
from invaders.  From the looks of things, it did not do a good job.]],
	Exits = {
		north = 5217,
		east = 5219,
		up = 5248
	}
})
Config.NewRoom({
	Id = 5217,
	Name = "A Back Alley",
	Desc = [[   This alley leads to the rear of what used to be a meat stand.  You wince
at the stench.  South is one of the city watchtowers.]],
	Exits = {
		north = 5218,
		south = 5216
	}
})
Config.NewRoom({
	Id = 5218,
	Name = "The Meat Stand",
	Desc = [[   A large stand has been set up here with metal hooks and wooden racks
in the background.  Hanging on the hooks are very small scraps of meat
and other game.  This stand is relatively empty, and a sudden burst of
howling and screaming makes you realize why this is so.]],
	Exits = {
		north = 5209,
		east = 5221,
		south = 5217
	}
})
Config.NewRoom({
	Id = 5219,
	Name = "A Back Alley",
	Desc = [[   A narrow alley leads east to a wider street and west to one of 
the city watchtowers.]],
	Exits = {
		east = 5215,
		west = 5216
	}
})
Config.NewRoom({
	Id = 5220,
	Name = "The Guild House",
	Desc = [[   You are standing in what once was this city's ONLY guild house.
Tables and chairs have been smashed and broken weapons lie strewn about
the floor as if some massive battle had taken place here.  Draped along 
the back wall is a tattered, jet-black banner with the symbol of the
Darkside set upon it.]],
	Exits = {
		east = 5214
	}
})
Config.NewRoom({
	Id = 5221,
	Name = "The Produce Stand",
	Desc = [[   A large cart sits here carrying rotted fruit and vegetables.  Flies 
swarm all about what seems to be the last remaining bits of food left
in the city.]],
	Exits = {
		north = 5208,
		west = 5218
	}
})
Config.NewRoom({
	Id = 5222,
	Name = "The Smithy",
	Desc = [[   In here you find tools and anvils used to make various weapons
and items.  The walls have been stripped clean and only a few incomplete
pieces of armor and weaponry are left.]],
	Exits = {
		east = 5213
	}
})
Config.NewRoom({
	Id = 5223,
	Name = "The Tapestry Stand",
	Desc = [[   Tattered and torn tapestries and rugs lie heaped in piles.  Fancy
robes and various articles of clothing are now just rags.  You stare at 
the strange piles for a long time until a piercing howl makes you
think these might be beds.]],
	Exits = {
		north = 5224,
		east = 5226,
		south = 5209
	}
})
Config.NewRoom({
	Id = 5224,
	Name = "A Back Alley",
	Desc = [[   A narrow alley leads north to one of the city watchtowers while
to the south there lies a market stand full of torn clothes and rugs.]],
	Exits = {
		north = 5225,
		south = 5223
	}
})
Config.NewRoom({
	Id = 5225,
	Name = "Under The Watchtower",
	Desc = [[   You stand under one of the city watchtowers built to protect
the city from invaders.  Obviously, it failed.]],
	Exits = {
		east = 5229,
		south = 5224,
		up = 5247
	}
})
Config.NewRoom({
	Id = 5226,
	Name = "The Jewellery Stand",
	Desc = [[   A table has been tipped over, spilling fine jewellery and gems
across the market place.  Most of these trinkets are battered and 
tarnished and few would have any value anymore.]],
	Exits = {
		south = 5208,
		west = 5223
	}
})
Config.NewRoom({
	Id = 5227,
	Name = "A Ruined Clay Dwelling",
	Desc = [[   This was once a very plain house with nothing more than a few chairs
and a bed.  A cold fireplace suggests that the city has been abandoned
for quite a while.  Almost nothing remains of this humble abode.]],
	Exits = {
		east = 5211
	}
})
Config.NewRoom({
	Id = 5228,
	Name = "A Collapsed Stone Dwelling",
	Desc = [[   This small house has completely collapsed upon itself leaving piles
of debris here and there.  A few rafters still stand with thatched straw
hanging down and a hot wind gusts through the hollow dwelling.]],
	Exits = {
		east = 5212
	}
})
Config.NewRoom({
	Id = 5229,
	Name = "A Back Alley",
	Desc = [[   A narrow alley leads west to one of the city watchtowers and east to
a small side street.]],
	Exits = {
		east = 5210,
		west = 5225
	}
})
Config.NewRoom({
	Id = 5230,
	Name = "An Abandoned Shop",
	Desc = [[   From the outside this place looks like an ordinary pile of rubble,
but inside these cramped quarters you discover what used to be a shop
filled with armor, weapons, and various other goods.  A small sign
flutters in the wind.]],
	Exits = {
		west = 5215
	}
})
Config.NewRoom({
	Id = 5231,
	Name = "The Tavern Of The Sun",
	Desc = [[   A glorious place in its prime, this tavern now lies in ruin; tables
and chairs are broken scattered, bottles and glasses shattered, and
a small performance stage crushed.  Musical instruments and personal
belongings lie under the rubble, but the people they once belonged to are 
not with them.  Looking up you see that the entire second floor and roof 
has fallen in, leaving a gaping hole above.]],
	Exits = {
		west = 5214
	}
})
Config.NewRoom({
	Id = 5232,
	Name = "The South Wing Of The City Hall",
	Desc = [[   You stand in a large room attached to this end of the hallway which 
leads back north to the reception area.  Pedestals and columns have fallen
and most of the valuable items have been taken, leaving worthless debris.
A few chairs have survived, as well as a large curved desk.  To the east
is a vine-covered archway leading out into a private courtyard.]],
	Exits = {
		north = 5233,
		east = 5235
	}
})
Config.NewRoom({
	Id = 5233,
	Name = "The City Hall",
	Desc = [[   This is the main reception area of Thalos' city hall.  The walls have
been charred and scored massively and debris is spread from wall to wall.
A large gaping hole in the west wall allows you to see out to one of
the city's side streets.  Obviously no one will be seeing you through today.  
Hallways lead south and east.]],
	Exits = {
		north = 5203,
		east = 5234,
		south = 5232,
		west = 5213
	}
})
Config.NewRoom({
	Id = 1,
	Name = "The East Wing Of The City Hall",
	Desc = [[   Here lies the remnants of a fancy office, possibly the mayor's.  A few
withered plants and broken pieces of furniture make this place anything
but fancy, though.  The only thing remaining intact here is a large
glass cabinet.  A long hallway leads west back to the reception area and
an ivy-covered archway leads south into a private courtyard.]],
	Exits = {
		south = 5235,
		west = 5233
	}
})
Config.NewRoom({
	Id = 5235,
	Name = "The Private Gardens And Courtyard Of Thalos",
	Desc = [[   What a shame that this mass destruction also touched this once
beautiful place.  The temple's garden path has nothing on this garden.
Flowers and trees have been smashed into the ground and lawn benches
thrown through walls.  A large marble fountain in the center of the
courtyard still stands, though, defying any attempts to destroy its
beauty.  Above stands the remnants of one of the watchtowers.  Archways 
north and west lead back into the city hall.]],
	Exits = {
		north = 5234,
		west = 5232
	}
})
Config.NewRoom({
	Id = 5236,
	Name = "A Small Guard House",
	Desc = [[   This was once the barracks for Thalos' Cityguards.  Now just an empty
shell, this small shack still stands guarding the entrance both to the
city and to the city hall.]],
	Exits = {
		north = 5202
	}
})
Config.NewRoom({
	Id = 5237,
	Name = "A Collapsed Home",
	Desc = [[   All that's left of this house is a few scattered piles of rubble
and a very large blast crater.  Obviously someone or something important 
was once housed here.  A shrieking howl chills your blood.]],
	Exits = {
		south = 5203
	}
})
Config.NewRoom({
	Id = 5238,
	Name = "A Tall Dwelling",
	Desc = [[   This seems to be the tallest structure remaining in the city.  At
one time this could have been an inn of some sort, but now it is just
a mess.  The back wall as been completely knocked down revealing an 
entrance into another building through yet another collapsed wall.
Between the two buildings are a few blast craters and boulders.  An old
set of wooden steps leads up to a creaking second floor.]],
	Exits = {
		east = 5239,
		west = 5212,
		up = 5246
	}
})
Config.NewRoom({
	Id = 5239,
	Name = "A Small Shack",
	Desc = [[   This cramped dwelling could not have housed more than one person.  Now
with the back wall missing, it could hold many more.  Looking around you
find broken shelves and workbenches with various vials and pouches spilling
contents all across the floor.  This was possibly the magic shop of the
city.  The doorway to the east is blocked, making the only exit back west.]],
	Exits = {
		west = 5238
	}
})
Config.NewRoom({
	Id = 5240,
	Name = "A Back Alley",
	Desc = [[   A narrow back alley goes south to main street and north towards
a watchtower.  A mass of howls catches you of guard.]],
	Exits = {
		north = 5241,
		south = 5202
	}
})
Config.NewRoom({
	Id = 5241,
	Name = "A Back Alley",
	Desc = [[   A narrow back alley leads north to one of the city watchtowers
and south towards main street.  To the west is a doorway to a small
house blocked by debris.]],
	Exits = {
		north = 5242,
		south = 5240
	}
})
Config.NewRoom({
	Id = 5242,
	Name = "Under A Watchtower",
	Desc = [[   You stand under a tall watchtower.  Narrow back alleys lead west and
south and a very weak looking ladder leads up into the tower.  Above you,
you hear the screams of tens of starving lamias!  Beware!]],
	Exits = {
		south = 5241,
		west = 5244,
		up = 5249
	}
})
Config.NewRoom({
	Id = 5243,
	Name = "A Bath House",
	Desc = [[   This was once the bath house for the commoners of the city.  Hot
steamy water still wells up from a hole in the floor.  Obviously there
is a hot spring located under the city (making the decision to put
a city here seem much more reasonable).  Closer inspection of the water
yields a dead body floating around in it, skin melted away from months
of floating in there.  The west wall has collapsed revealing another
collapsed house.]],
	Exits = {
		north = 5244,
		west = 5245
	}
})
Config.NewRoom({
	Id = 5244,
	Name = "A Back Alley",
	Desc = [[   A narrow back alley leads west to a small side street and east to one 
of the city watchtowers.  Great amounts of steam issue forth from the
building to the south.]],
	Exits = {
		east = 5242,
		south = 5243,
		west = 5210
	}
})
Config.NewRoom({
	Id = 5245,
	Name = "An Upright House",
	Desc = [[   This home is practically the only one around that is still standing.
Except for the massive hole in the east wall, everything else looks
intact, including the windows.  Great amounts of steam issue forth from
the hole in the east wall.]],
	Exits = {
		east = 5243,
		west = 5211
	}
})
Config.NewRoom({
	Id = 5246,
	Name = "On The Second Floor",
	Desc = [[   The minute you step off onto this floor you realize it was a mistake.
The old rotted floorboards suddenly give way and you fall down, impaling
yourself on jagged boards below.]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 5247,
	Name = "The North-West Watchtower",
	Desc = [[   You stand atop one of the city watchtowers.  The view is magnificent
from here and you can see all the way to the western mountains.  No wonder
this place stood for so long.]],
	Exits = {
		down = 5225
	}
})
Config.NewRoom({
	Id = 5248,
	Name = "The South-West Watchtower",
	Desc = [[   You stand atop one of the city watchtowers.  The view is magnificent
from here and you can see all the way to the western mountains.  To the
south the desert stretches to the horizon.  No wonder this place stood
for so long.]],
	Exits = {
		down = 5216
	}
})
Config.NewRoom({
	Id = 5249,
	Name = "The North-East Watchtower",
	Desc = [[   You stand atop one of the city watchtowers.  The view is magnificent
from here and you the desert sand stretches to the horizon.  No wonder
this place stood for so long.  The ladder leading down seems rotted in
some places!]],
	Exits = {
		down = 5250
	}
})
Config.NewRoom({
	Id = 5250,
	Name = "Under A Watchtower",
	Desc = [[   As you descend the ladder, the rotted rungs break, sending you quickly
to your demise far below on the city street.  Splat.]],
	Exits = {
	}
})
Config.NewRoom({
	Id = 5251,
	Name = "The Temple Of Thalos",
	Desc = [[   You stand within one of the most holy places in the realm.  This
stunning domed temple once housed the city's worshipers en masse.  
Unfortunately, it succumbed to the destruction brought on this city.
Long benches lie toppled and the altar desecrated.  Large chunks of stone
have fallen from the walls and roof, sending sunlight streaming in on
you.  A few books lie about, conveying to you a holy message in a
strange tongue.  
     Wind gusts through the four archways and howls and screams can be
heard from all parts of the city.]],
	Exits = {
		north = 5205,
		east = 5204,
		south = 5207,
		west = 5206
	}
})
