Config.NewRoom({
	Id = 901,
	Name = "On The Swift Flowing River",
	Desc = [[   As the river exits the city of Midgaard it picks up speed and whisks
you along high banks flanked by the trees of Haon-Dor.  As the city
fades in the east, you approach a gloomy forest to the west.]],
	Exits = {
		east = 3201,
		west = 902
	}
})
Config.NewRoom({
	Id = 902,
	Name = "The Riverbank",
	Desc = [[   The river is deep, and runs swiftly in an east-west direction.  To the
north the river eddies and enters a backwash where a small bank extends
down from a dark, thick stand of trees.  It doesn't look particulary
inviting however.]],
	Exits = {
		north = 6121,
		east = 901,
		west = 903
	}
})
Config.NewRoom({
	Id = 903,
	Name = "The Twisty Part Of The River",
	Desc = [[   The river twists and turns and nearly tosses you out of your boat.
The water is dark, cold, almost reptilian in sheen.  It seems almost
alive.  The river runs east and south.]],
	Exits = {
		east = 902,
		south = 904
	}
})
Config.NewRoom({
	Id = 904,
	Name = "The Scenic Route",
	Desc = [[   The dark forest of Haon-Dor recedes behind you to the northeast.
The river continues in a westerly direction toward the river delta,
where you can just make out a large island.]],
	Exits = {
		east = 903,
		west = 905
	}
})
Config.NewRoom({
	Id = 905,
	Name = "The Swift River Delta",
	Desc = [[   You are at the edge of the river delta, where the river empties
out on its way to the sea.  The water here is Black.  Deep.  Dark.
Deadly.  The tidal waves sweep you around and around up and down.]],
	Exits = {
		north = 912,
		east = 904,
		south = 907,
		west = 906
	}
})
Config.NewRoom({
	Id = 906,
	Name = "Near The Rocks",
	Desc = [[   You bob up and down in the waves comming dangerously close to some
large, jagged rocks on the eastern shore of an unusual looking island.
There is no way you could possibly land there without getting killed.]],
	Exits = {
		east = 905,
		south = 907
	}
})
Config.NewRoom({
	Id = 907,
	Name = "The South River Delta",
	Desc = [[   You are making your way along a channel in the river delta between
the island to the west and the shore to the south and east.  To the
south an aging broken down looking pier juts out from land and toward
the west the channel works it way close to the island as it moves around
its southern tip.]],
	Exits = {
		north = 906,
		east = 905,
		south = 908,
		west = 909
	}
})
Config.NewRoom({
	Id = 908,
	Name = "The Pier",
	Desc = [[   You float next to a crumbling pier long since neglected.
To the west the water gets sluggish and there are many weeds and
some seaweed floating about.]],
	Exits = {
		north = 907,
		west = 909
	}
})
Config.NewRoom({
	Id = 909,
	Name = "Mired In Seaweed",
	Desc = [[   The going is rough here.  The tide struggles with the normal flow
of the river and here near the edge of the sea there is a large
amount of growth.  To the west the channel passes the southern tip of
the island and heads for open waters.]],
	Exits = {
		north = 907,
		east = 908,
		west = 910
	}
})
Config.NewRoom({
	Id = 910,
	Name = "The Last Stop",
	Desc = [[   The delta meets the sea here.  To the west you see nothing but
ocean on the horizon.  Sea birds squawk noisily at your approach
and take flight from a nearby beach head on the island.  It looks
as though this could be the last stop for those heading out to sea.]],
	Exits = {
		north = 911,
		east = 909
	}
})
Config.NewRoom({
	Id = 911,
	Name = "The Beach Head",
	Desc = [[   This is a secluded looking beach on the southern tip of the island.
There isn't much to see here and there is no way to cross the steep
rocky cliffs that wall in this place.]],
	Exits = {
		south = 910
	}
})
Config.NewRoom({
	Id = 912,
	Name = "The North Channel",
	Desc = [[   The river splits as runs up against the island and a navigatble
channel slips off to the north and west.]],
	Exits = {
		north = 913,
		south = 905,
		west = 913
	}
})
Config.NewRoom({
	Id = 913,
	Name = "The North Channel",
	Desc = [[   The river current carries you swiftly westward as the channel
begins to narrow as it squeezes past the north end of the island.]],
	Exits = {
		east = 912,
		south = 912,
		west = 914
	}
})
Config.NewRoom({
	Id = 914,
	Name = "Near The Isle",
	Desc = [[   You are sitting just off a small landing on the island that
appears to be nothing more than a short path that leads to the
side of a hill.]],
	Exits = {
		east = 913,
		south = 915
	}
})
Config.NewRoom({
	Id = 915,
	Name = "The Lane Of The Lying",
	Desc = [[   Bodies lie everywhere.  Commoner, peasant, duke, duchess.  The Gods
will not hear you call here.  Hence they will not answer you.  To the
south the path ends at a dark cave entrance.
A sign has been posted beside the entrance.]],
	Exits = {
		north = 914,
		south = 916
	}
})
Config.NewRoom({
	Id = 916,
	Name = "The First Trial Of Minos",
	Desc = [[   Ah... you find yourself in Minos' battlefield playground.  
Minos loves to torture his people through these places.  He
collects the monsters of the world and puts them here.]],
	Exits = {
		east = 917
	}
})
Config.NewRoom({
	Id = 917,
	Name = "The Second Trial Of Minos",
	Desc = [[   Minos' voice reveberates from the four walls of this room:
'Get some rest and make sure you're healed.  You'll need it for
the next monster in my playground.  Or are you strong enough?'
   To the south is the entrance to the next challenge of Minos'
stronghold.]],
	Exits = {
		south = 918
	}
})
Config.NewRoom({
	Id = 918,
	Name = "The Third Trial Of Minos",
	Desc = [[   You go inside a red room.  Very red.  As if the Minos King used
them to disembowel his guests.  The path continues eastward.  You
see blue lights in that direction.]],
	Exits = {
		east = 919
	}
})
Config.NewRoom({
	Id = 919,
	Name = "The Fourth Trial Of Minos",
	Desc = [[   Minos must be a monster hacking machine.  You see a blue light
flicker on and off.  A voice crackles, 'WHY ARE YOU HERE!']],
	Exits = {
		south = 920
	}
})
Config.NewRoom({
	Id = 920,
	Name = "The Fifth Trial Of Minos",
	Desc = [[   This is General Woundwort's quarters.  Hraka abound.  The frayed
corpses of rabbits lie scattered about this hell-hole.  The General
is not a very neat person as you can tell.]],
	Exits = {
		east = 921
	}
})
Config.NewRoom({
	Id = 921,
	Name = "The Sixth Trial Of Minos",
	Desc = [[   Dare we surmise how many more rooms Minos has?  The paths appear to be
endless.  You shudder the sounds of death cries from the east.  A loud
voice bellows another warning: 'Leave now or face my wrath!'
There is a crawlway leading upwards at the far end of the room and
there is a fresh breeze comming from there.]],
	Exits = {
		south = 922,
		up = 924
	}
})
Config.NewRoom({
	Id = 922,
	Name = "The Final Trial Of Minos",
	Desc = [[   This is Minos' room.  What else did you expect?  The room is lavishly
decorated for this bovine king.  Everything is so opulent that it makes
your eyes bulge.  Survive and reap his fortune!  The only exit is a large
oak door in the east wall.]],
	Exits = {
		east = 923
	}
})
Config.NewRoom({
	Id = 923,
	Name = "The Royal Chamber",
	Desc = [[   The treasure room of Minos is dark save for your lantern.
Hopefully it has not been looted yet by the many legendary thieves
of Midgaard.  A clever looking secret passage leads upward from here.]],
	Exits = {
		up = 911
	}
})
Config.NewRoom({
	Id = 924,
	Name = "Above, On The Beach",
	Desc = [[   You sit amongst the rocks above a small beach at the southern
end of the island.  You could clamber down easy enough, but getting
back up would be another story.]],
	Exits = {
		down = 911
	}
})
