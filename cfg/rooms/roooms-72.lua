Config.NewRoom({
	Id = 7101,
	Name = "The Edge Of The Water",
	Desc = [[   The pool side is dimly lit up by your light.  You can see absolutely
nothing else nearby.  The darkness her seems enormously oppressive here.
The air is damp and the rock on which you stand is slippery.  The pool
seems too dark to make anything clear.  The pool seems to extend to the
east.  The rock can be climbed upwards from here.]],
	Exits = {
		east = 0,
		up = 7001
	}
})
Config.NewRoom({
	Id = 7102,
	Name = "Under The Mudhole",
	Desc = [[   You stand in a small room with a great big opening in the ceiling.  From
this opening there is mud dripping down in large lumps.  >YUCK<.  You can
smell the foul stench of the slimy sediment as you try not to get covered
by the falling sludge.  To the east there is an entryway leading out from
here and it seems absolutely impossible to force the muddy descent.]],
	Exits = {
		east = 7104
	}
})
Config.NewRoom({
	Id = 7103,
	Name = "Under The Dark Pit",
	Desc = [[   Nice place you found yourself in.  You stand in the middle of a room
with only two exits, up and east.  A tall ladder has been left here so
that you can climb up through the pit without the use of a rope.]],
	Exits = {
		east = 7105,
		down = 7301
	}
})
Config.NewRoom({
	Id = 7104,
	Name = "A Muddy Bend In The Sewer System",
	Desc = [[   You are standing in what looks like a bend in the pipe system of the
sewer.  The 'floor' is covered completely by mud!  This includes covering
your legs up to your knees as well.  The pipe leads west and south.]],
	Exits = {
		south = 7105,
		west = 7102
	}
})
Config.NewRoom({
	Id = 7105,
	Name = "A Junction In The Sewer Pipes",
	Desc = [[   You stand in the middle of what looks like a triple junction of pipes
going east, west and north.]],
	Exits = {
		north = 7104,
		west = 7103
	}
})
Config.NewRoom({
	Id = 7106,
	Name = "Down The Old Well",
	Desc = [[   You are dangling on the slippery sides of the old well leading down and
up.  The only secure point here is the metal bars that are cemented into the
sides, the ones that you cling frantically to so that you don't fall.  Who
knows how deep this well is?  The bars lead down and up and nowhere else.]],
	Exits = {
		up = 7016,
		down = 0
	}
})
Config.NewRoom({
	Id = 7107,
	Name = "The Northwestern Corner Of The Ledge",
	Desc = [[   You stand, swaying out from the ledge, with only a couple of inches of
safe, solid ledge under your feet.  The ledge continues to the east but not
back south.  It seems that the ledge is too narrow to turn on so you'll have
to continue forward.]],
	Exits = {
		east = 7114,
		south = 7108,
		down = 7280
	}
})
Config.NewRoom({
	Id = 7108,
	Name = "The Narrow Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.]],
	Exits = {
		north = 7107,
		east = 7191,
		south = 7109
	}
})
Config.NewRoom({
	Id = 7109,
	Name = "The Narrow Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.]],
	Exits = {
		north = 7108,
		east = 7191
	}
})
Config.NewRoom({
	Id = 7110,
	Name = "The Narrow Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.]],
	Exits = {
		north = 7109,
		east = 7191,
		south = 7111
	}
})
Config.NewRoom({
	Id = 7111,
	Name = "The Narrow Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.]],
	Exits = {
		north = 7108,
		east = 7191,
		south = 7112
	}
})
Config.NewRoom({
	Id = 7112,
	Name = "The Southwestern Corner Of The Ledge",
	Desc = [[   This seems like a ledge that is a little broader than the one just to
the north of here.  The ledge seems to lead around some sort of Abyss of
total darkness.  The ledge seems to have an odd-looking edge here.]],
	Exits = {
		north = 7111,
		east = 7116,
		south = 7113,
		down = 7280
	}
})
Config.NewRoom({
	Id = 7113,
	Name = "An Odd Intersection",
	Desc = [[   You stand in a rather odd intersection of pipes.  The pipes actually
don't resemble pipes anymore.  They look more like a real stone tunnel,
or a passageway hewn directly into the rock.  The ways from here lead
north, east and west.]],
	Exits = {
		north = 7112,
		east = 7123
	}
})
Config.NewRoom({
	Id = 7114,
	Name = "The Narrow Ledge Going East To West",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.]],
	Exits = {
		east = 7117,
		south = 7191
	}
})
Config.NewRoom({
	Id = 7115,
	Name = "Mid-Air",
	Desc = [[   You've just stepped into the most unlucky position in the whole of
CircleMUD.  The result of such a foolish act should be punished with
death, you know.  With an acceleration of approximately 9.82 meters
per second squared, you are now descending the Abyss.  What awaits you
at the bottom will continue to be a mystery.  Good-bye cruel world.]],
	Exits = {
		north = 7120,
		east = 7119,
		south = 7121,
		west = 7118,
		up = 7116
	}
})
Config.NewRoom({
	Id = 7116,
	Name = "The Broad Ledge",
	Desc = [[   You are standing on a ledge that seems quite a lot larger than the
rest of the ledges.  This one leads to the west and the east, plus it
has an exit going to the south.  Though you could jump into mid-air,
but it probably wouldn't be such a good idea.  The way south is in
utter darkness.]],
	Exits = {
		east = 7122,
		south = 7130,
		west = 7112
	}
})
Config.NewRoom({
	Id = 7117,
	Name = "The Northeastern Corner Of The Ledge",
	Desc = [[   You stand, swaying out from the ledge, with only a couple of inches of
safe, solid ledge under your feet.  The ledge continues to the west and
leads south from here into darkness.]],
	Exits = {
		south = 7118,
		west = 7114,
		down = 7281
	}
})
Config.NewRoom({
	Id = 7118,
	Name = "The Narrow Eastern Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.  And THAT is west of here
so watch your step.]],
	Exits = {
		south = 7119,
		west = 7115
	}
})
Config.NewRoom({
	Id = 7119,
	Name = "The Narrow Eastern Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.  And THAT is west of here
so watch your step.]],
	Exits = {
		south = 7120,
		west = 7115
	}
})
Config.NewRoom({
	Id = 7120,
	Name = "The Narrow Eastern Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.  And THAT is west of here
so watch your step.]],
	Exits = {
		south = 7121,
		west = 7115
	}
})
Config.NewRoom({
	Id = 7121,
	Name = "The Narrow Eastern Ledge",
	Desc = [[   You are in the process of walking all the way around the ledge since
there is no way of turning around on this all too narrow path.  There IS
another exit from here but that leads right into mid-air and with high
probability of a free fall session afterwards.  And THAT is west of here
so watch your step.  You also see a small opening to the east.]],
	Exits = {
		east = 7124,
		south = 7122,
		west = 7115
	}
})
Config.NewRoom({
	Id = 7122,
	Name = "The Southeastern Corner Of The Ledge",
	Desc = [[   This seems like a ledge that is a little broader than the one just to the
north of here.  The ledge seems to lead around some sort of abyss of total
darkness.]],
	Exits = {
		north = 7121,
		west = 7116,
		down = 7280
	}
})
Config.NewRoom({
	Id = 7123,
	Name = "Under The Pit",
	Desc = [[   You stand in a completely dark cavern leading west.  The wall looks
weird here.]],
	Exits = {
		west = 7113
	}
})
Config.NewRoom({
	Id = 7124,
	Name = "Under The Shaft",
	Desc = [[   A ladder leads up from here to the Shaft.  A small opening leads west
from here.]],
	Exits = {
		west = 7121,
		up = 7042
	}
})
Config.NewRoom({
	Id = 7130,
	Name = "The Sewer Line",
	Desc = [[   You are in a narrow part of the sewer.  Down the sewer continues and to
the north is the ledge.]],
	Exits = {
		north = 7116,
		down = 7222
	}
})
Config.NewRoom({
	Id = 7191,
	Name = "Mid-Air",
	Desc = [[   You've just stepped into the most unlucky position in the whole of
CircleMUD.  The result of such a foolish act should be punished with
death, you know.  With an acceleration of approximately 9.82 meters
per second squared, you are now descending the Abyss.  What awaits you
at the bottom will continue to be a mystery.  Good-bye cruel world.]],
	Exits = {
		north = 7110,
		east = 7109,
		south = 7111,
		west = 7108,
		up = 7114
	}
})
