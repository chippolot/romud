Config.NewRoom({
	Id = 3301,
	Name = "A Scraggly Trail",
	Desc = [[   This trail slopes up and away from the main road to 
the west.  At points the trail seems to fade into 
obscurity against the grey stone and near-grey mountain 
grass prevalent here.  The trail leads generally eastward 
and up higher into the rocky ground.  There is a sign 
here, seemingly out-of-place in this rough country.]],
	Exits = {
		east = 3302,
		west = 3501
	}
})
Config.NewRoom({
	Id = 3302,
	Name = "A Scraggly Trail",
	Desc = [[   What could barely be called a trail leads west back 
down the mountainside, and down into a very small valley 
where a small house sits in the middle of a well-groomed 
yard.  The door to the house is open and inviting, 
welcoming you for a visit.]],
	Exits = {
		west = 3301,
		down = 3303
	}
})
Config.NewRoom({
	Id = 3303,
	Name = "A Groomed Path",
	Desc = [[   You are standing in the western end of a very, very 
small valley, just about room enough for the one house 
standing to your east.  You can see from here that the 
door to the cozy cottage is open and inviting, but the 
interior seems very dark.  A path bordered by shrubberies 
leads up to the structure, and ends where you are 
standing; right by the easiest path back up into the 
mountains.]],
	Exits = {
		east = 3304,
		up = 3302
	}
})
Config.NewRoom({
	Id = 3304,
	Name = "Outside A House",
	Desc = [[   The path you are on leads from the front door of the
cottage to your east, to the edge of the small valley
to the west.  The building seems quiet...almost too
quiet.  A small voice in the back of your head, the
same voice that has saved your life on countless
occasions, seems to be telling you that something is
very, very wrong here.]],
	Exits = {
		east = 3305,
		west = 3303
	}
})
Config.NewRoom({
	Id = 3305,
	Name = "The Smithery",
	Desc = [[   Devastation greets your eyes.
   The forge has been blasted apart, along with most of 
the back door.  Hammers, tongs, and anvils lie about in 
one gigantic mess, and the smith's bed smoulders yet.  
This place has been utterly wrecked and blasted apart, by 
more than one man you would think from all the tracks in 
the dust...]],
	Exits = {
		east = 3306,
		west = 3304
	}
})
Config.NewRoom({
	Id = 3306,
	Name = "A Small Garden",
	Desc = [[   This garden was probably once kept orderly and weedless.
Unfortunately, it seems someone has been careless with a
fireball.  There is nothing here now but blast-marks and
ashes, and the remains of a trail leading to the east edge
of this tiny valley.]],
	Exits = {
		east = 3307,
		west = 3305
	}
})
Config.NewRoom({
	Id = 3307,
	Name = "Mountain Ridge",
	Desc = [[   You are standing on a ridge in the mountains, just east
of a very small valley.  You spot a tiny cottage sitting 
in the center of the valley, and the ridge continues 
south.  Looking at the sheer drops to the north and west, 
you consider not taking those directions.]],
	Exits = {
		south = 3308,
		west = 3306
	}
})
Config.NewRoom({
	Id = 3308,
	Name = "The Mountain Ridge",
	Desc = [[    The mountain range continues north from here, and 
widens out into a small plateau just to your south.  Going
east and west from here would be a bad idea, considering 
the steepness of the drop.  From this height, you have a 
fairly good panoramic view to the south, including what 
appears to be a small mountain village to your south and 
west, and a tall, ominous peak westwards from here.]],
	Exits = {
		north = 3307,
		south = 3309
	}
})
Config.NewRoom({
	Id = 3309,
	Name = "The Diverging Paths",
	Desc = [[   You are standing on a small plateau in the mountains, 
just south of a ridge that leads northwards through the 
rocky area.  To the east, south, and west are gentle 
slopes leading down into different areas of the mountains.
   A giant, dark peak looks down over you to the west, 
looking quite spooky indeed!]],
	Exits = {
		north = 3308,
		east = 3342,
		south = 3310,
		west = 3360
	}
})
Config.NewRoom({
	Id = 3310,
	Name = "A Steep Slope",
	Desc = [[   This slopes leads down and to the west from here.  Up 
above, you see a plateau at the southern end of a long 
mountain ridge.  Surpisingly, there seems to be signs of 
traffic in this area, leading into the large depression 
here.  The going looks somewhat dangerous, and you decide 
to exercise a little caution.]],
	Exits = {
		north = 3309,
		west = 3311,
		up = 3309
	}
})
Config.NewRoom({
	Id = 3311,
	Name = "A Small Plateau",
	Desc = [[   You are standing upon another mini-plateau, bordered by
a sheer wall of rock to the north.  You can climb up the 
slope to the east, or continue along the flat area to the 
west.  Another slope leads downwards to the south, looking
unsafe but climbable.]],
	Exits = {
		east = 3310,
		south = 3315,
		west = 3312
	}
})
Config.NewRoom({
	Id = 3312,
	Name = "A Small Plateau",
	Desc = [[   This plateau ends here, with a steep drop-off to the 
south, and a solid wall of rock to the north.  Eastwards 
the plateau continues, and you think you can climb up the 
steep rocky slope just west of here.  You are afforded a 
good view of the lower regions of this depression, and you
think you spot what might be a cave south and down from 
here...]],
	Exits = {
		east = 3311,
		west = 3313
	}
})
Config.NewRoom({
	Id = 3313,
	Name = "A Rocky Slope",
	Desc = [[   This slope is fairly treacherous, but looks to be 
somewhat safer to the north.  East the slope leads down 
to a small plateau that also looks considerably safer 
than your other choices.  The shale under your feet 
slips badly, and you are almost thrown off balance; 
this is no place to be without mountaineering equipment.]],
	Exits = {
		north = 3314,
		east = 3312
	}
})
Config.NewRoom({
	Id = 3314,
	Name = "The Overlook",
	Desc = [[   You are standing on a point outcropping with a 
beautiful view of the mountains to the north.  Far 
below, you see what appears to be a foot-path climb 
up to the central mountain, a peak that looks dark 
and disturbing.  You get very bad vibes from that 
mountain for some reason, and it doesn't seem like 
a very good idea to try to find a way to get there.
   The only safe way to leave this overlook is to 
the south.]],
	Exits = {
		south = 3313
	}
})
Config.NewRoom({
	Id = 3315,
	Name = "A Rocky Slope",
	Desc = [[    You slip and slide your way across the steep ground, 
trying desperately to keep your balance.  You can climb 
up to a small plateau to the north from here, or carefully
head down to the floor of the depression to the west.  
You're not sure which is safer...]],
	Exits = {
		north = 3311,
		west = 3316
	}
})
Config.NewRoom({
	Id = 3316,
	Name = "The Depression Floor",
	Desc = [[   A small path leads south here, away from the rocky 
slope leading up to the east.  A small spring burbles 
here, evidently the cause of much of the traffic.  
Looking up, you see sheer rock walls surrounding much 
of the depression, making an effective fortress of
this place.]],
	Exits = {
		east = 3315,
		south = 3317
	}
})
Config.NewRoom({
	Id = 3317,
	Name = "The Depression Floor",
	Desc = [[   The small path you are standing on leads north, and
east into what appears to be a large cave hollowed out
of the mountainside.  The whole place seems quiet, too
quiet in fact.  Your little adventurer's intuition is
busily warning you of traps.]],
	Exits = {
		north = 3316,
		east = 3318
	}
})
Config.NewRoom({
	Id = 3318,
	Name = "A Cave Entrance",
	Desc = [[   A cave leads into the heart of the mountainside, well-
lit by sconces upon the walls.  A large rock sits by 
the side here, near a small firepit.  Debris litters the 
area; rabbit bones, half of a broken whetstone, and random
litter.  The ground is devoid of grass, and well trodden 
by many pairs of boots.  Strange that someone should live 
so deep in the mountains...]],
	Exits = {
		east = 3319,
		west = 3317
	}
})
Config.NewRoom({
	Id = 3319,
	Name = "A Cave Passageway",
	Desc = [[   You are near the entrance of the cave.  The outside 
light streams in from the west, accompanied by a slight 
breeze, making the flames in the sconces flutter a bit
and throw stange shadows upon the walls.  This passageway 
heads north and south from here, each way seeming dark and
stuffy compared to outdoors.  From the tracks in the 
floor, you guess that the north is the more used.]],
	Exits = {
		north = 3320,
		south = 3332,
		west = 3318
	}
})
Config.NewRoom({
	Id = 3320,
	Name = "A Cave Passageway",
	Desc = [[   The passage turns here, one end leading south, towards 
the cave's entrance, and east -- that much deeper into the
mountain.  The light sconces keep the area bright enough 
to see, but not nearly bright enough for you to be quite 
comfortable in this strange place.  From far off you hear 
the echoes of what sound to be voices.]],
	Exits = {
		east = 3321,
		south = 3319
	}
})
Config.NewRoom({
	Id = 3321,
	Name = "A Cave Passageway",
	Desc = [[   This twisty passage leads east and west from here.  
Eastwards you hear the unmistakable sounds of low 
voices.  The echoes seem to be playing funny effects 
on you, however, and you are not sure  from how far 
off these voices might be coming.]],
	Exits = {
		east = 3322,
		west = 3320
	}
})
Config.NewRoom({
	Id = 3322,
	Name = "A Cave Passageway",
	Desc = [[   The passage you are standing in turns west and south 
from here.  One of the sconces here is out, making this 
area extremely dark and hard to see in.  You do see lights
from the south, however, seemingly brighter than the 
sconces you've seen along the walls so far.]],
	Exits = {
		south = 3323,
		west = 3321
	}
})
Config.NewRoom({
	Id = 3323,
	Name = "A Cave Passageway",
	Desc = [[   This is a T-intersection in the cave passageway, the 
north leading back towards the cave's entrance (you 
think!), the west leading towards a well-lighted area.  
Eastwards the passageway continues into the shadowy 
recesses of the mountain uninvitingly.  The echoes of 
voices are confusing you a bit, and you are not sure 
whether you should try to remain quiet or not.]],
	Exits = {
		north = 3322,
		east = 3325,
		west = 3324
	}
})
Config.NewRoom({
	Id = 3324,
	Name = "A Cave",
	Desc = [[   Many sconces line the walls here, casting light on 
some weapon racks and chests of armor.  Everything
is neat, orderly, and actually well-dusted.  Someone
cares for these items...frequently it seems.]],
	Exits = {
		east = 3323
	}
})
Config.NewRoom({
	Id = 3325,
	Name = "A Cave Passageway",
	Desc = [[   The passageway you are in leads south and west from 
here.  Many large stones and rocks are on the floor of the
cave, making walking difficult in the dim light from the 
sconces on the walls.  You hear the continued echo of 
voices, seemingly fainter now.  Must be the strange 
acoustics of this place...]],
	Exits = {
		south = 3326,
		west = 3323
	}
})
Config.NewRoom({
	Id = 3326,
	Name = "A Cave Passageway",
	Desc = [[   The cave twists around like a coiled snake, leading 
east and north from here.  You begin to wonder if your 
orientations are still correct.  That worries you for
some reason.]],
	Exits = {
		north = 3325,
		east = 3327
	}
})
Config.NewRoom({
	Id = 3327,
	Name = "A Cave Passageway",
	Desc = [[   You can head north and west through the cave passageways
here, both ways dimly lit by the ever-present sconces on 
the walls.  The echoes you heard earlier seem to be getting
louder, and seem to be coming from the northern passage.  
You feeled a bit chilled from the cooled cave air and 
shiver a bit in the faint whisper of a breeze.  This place 
is a little too eerie and dark to be comfortable in.]],
	Exits = {
		north = 3328,
		west = 3326
	}
})
Config.NewRoom({
	Id = 3328,
	Name = "A Cave Passageway",
	Desc = [[   The echoes are growing louder, and seem to be coming 
from the northern end of this corridor.  Southwards you 
see the tunnel continue right before yet another bend in 
the passagway.  You spot a small piece of red cloth torn 
against a sharp rock jutting out from the passage's side.  
It looks like silk, very nice in fact.]],
	Exits = {
		north = 3329,
		south = 3327
	}
})
Config.NewRoom({
	Id = 3329,
	Name = "A Cave Passageway",
	Desc = [[   The main passageway leads south from here, and a smaller
cave tunnel leads away to the west.  Two large boulders 
sit against the wall, wiped clean of dirt and grime.  A 
paper food wrapper has been trodden under several pairs of 
feet here; at best guess, you'd say this would probably be 
a guard post.]],
	Exits = {
		south = 3328,
		west = 3330
	}
})
Config.NewRoom({
	Id = 3330,
	Name = "The End Of The Passageway",
	Desc = [[   The cave passageway ends abruptly here to the north in a
large wooden door set into the stone walls.  The craftsmanship
is superb!  You can also head back to the main passage to the
west, where there seems to be more light than here.  An echo
from down the passage makes you wonder for a moment if you are
being followed, but you see nothing there...]],
	Exits = {
		north = 3331,
		east = 3329
	}
})
Config.NewRoom({
	Id = 3331,
	Name = "A Cavern",
	Desc = [[   This natural cavern has been turned into a combination 
office/storeroom.  A small brook rushes through the south 
wall, and flows back into the west wall through a tiny 
hole.  Boxes and crates are stacked against the walls, and 
a beat up oaken desk stands near the door stacked with 
papers written upon by an unsteady hand.  Some large 
lanterns keep the place very well lighted.]],
	Exits = {
		south = 3330
	}
})
Config.NewRoom({
	Id = 3332,
	Name = "A Cave Passageway",
	Desc = [[   You are standing south of the main entrance to this 
cave.  The passage you are in continues south, very badly 
lit along its length by the sconces lining the walls 
every fifteen feet or so.  From somewhere deep in the 
recesses of the cave, you hear a faint, rhythmic thumping 
sound distorted by the passage's strange acoustics.]],
	Exits = {
		north = 3319,
		south = 3333
	}
})
Config.NewRoom({
	Id = 3333,
	Name = "A Cave Passageway",
	Desc = [[   You are standing at the southern bend of this passage,
able to head east and north from here.  The rock around you
echoes the sound of far-off pounding to you, making the
place seem somehow alive, with a heartbeat.  This place
is fairly eerie, now that you come to think of it.]],
	Exits = {
		north = 3332,
		east = 3334
	}
})
Config.NewRoom({
	Id = 3334,
	Name = "A Cave Passageway",
	Desc = [[   The passageway makes a U-turn here, heading north and
westwards to the other side of the 'U'.  The air seems
humid and hard to breathe.  Some algae grows near the
floor in the slick spots, giving a definite subtle smell
of rot to the air.]],
	Exits = {
		north = 3335,
		west = 3333
	}
})
Config.NewRoom({
	Id = 3335,
	Name = "A Cave Passageway",
	Desc = [[   The tunnel twists to the south and east from here, 
its dark length seemingly dismal and lifeless.  A faint 
thumping sound reverberates from the walls, making you 
perk your ears for the direction of the noise.]],
	Exits = {
		east = 3336,
		south = 3334
	}
})
Config.NewRoom({
	Id = 3336,
	Name = "A Cave Passageway",
	Desc = [[   This area darker than the rest of the passageway, due
to the fact that the sconces along the walls stop abruptly
here.  The way to the south is completely dark, in direct
contrast to the tunnels to the west.  You peer hard to the
south, but can make out nothing in the impenetrable 
darkness.  And still that distant thumping impinges on 
your consciousness...]],
	Exits = {
		south = 3337,
		west = 3335
	}
})
Config.NewRoom({
	Id = 3337,
	Name = "A Cave Passageway",
	Desc = [[   You are standing in a north-south tunnel carved 
naturally through the stone of the mountain.  To the 
north the tunnel is lighted by sconces along the wall, 
banishing the deep, deep darkness you now stand in.  To 
the south you can see nothing.  A deep thumping noise 
seems to be getting louder and louder as you stand here, 
coming from somewhere deep inside.]],
	Exits = {
		north = 3336,
		south = 3338
	}
})
Config.NewRoom({
	Id = 3338,
	Name = "A Cave Passageway",
	Desc = [[   The passageway switches directions again in the dark 
gloom of the mountain, heading to the north and east from 
here.  As you round the corner, a trick of the acoustics 
make the deep thrumming and pounding you've been hearing 
sound as if its coming from two feet away!  Very unsettling.]],
	Exits = {
		north = 3337,
		east = 3339
	}
})
Config.NewRoom({
	Id = 3339,
	Name = "A Cave Passageway",
	Desc = [[   The tunnel weaves around, twisting to the north and 
west here.  The darkness around you is near total.  Ahead, 
you hear the sounds of something metal banging against 
stone.  Could someone be mining out the tunnel, perhaps?]],
	Exits = {
		north = 3340,
		west = 3338
	}
})
Config.NewRoom({
	Id = 3340,
	Name = "A Cave Passageway",
	Desc = [[   A glimmer of light to the east alerts you to the fact
that something is going on in the tunnel nearby.  The south
exit of the tunnel leads off into complete darkness.  All
around on the ground are piles of earth and stone, making
you have to wend through the tunnel carefully.  Hmm.]],
	Exits = {
		east = 3341,
		south = 3339
	}
})
Config.NewRoom({
	Id = 3341,
	Name = "The End Of The Passage",
	Desc = [[   The tunnel stops abruptly here at a fissure in the stone.
All around on the ground are rocks and gravel, mined from
the fissure in an attempt to widen it enough for passage.
A few pieces of paper litter and wrappers tells you that
the work here is relatively recent.]],
	Exits = {
		west = 3340
	}
})
Config.NewRoom({
	Id = 3342,
	Name = "A Rocky Slope",
	Desc = [[   This treacherous slope leads ever-downward quite a ways,
down to a valley where there seems to be a small village!  
What a village is doing this far from civilization, and how
they survive you've no idea.  From the smoke wafting from 
some of the chimneys, it looks like this place is still 
inhabited as well.
   Now if you can only get down this slope without breaking
an ankle...]],
	Exits = {
		east = 3343,
		west = 3309
	}
})
Config.NewRoom({
	Id = 3343,
	Name = "A Rocky Slope",
	Desc = [[   You're slipping and sliding across this slope, trying to
get to your destination without breaking your leg or falling
and shattering your head.  Below, you spot some movement in
the village, giving proof the place is not a ghost-town.
   The main road of the village starts at the bottom of 
the slope just to the east, and the slope continues west
and up far, far up the mountain.]],
	Exits = {
		east = 3344,
		west = 3342
	}
})
Config.NewRoom({
	Id = 3344,
	Name = "Main Road",
	Desc = [[   This place leaves you very unimpressed.  And bored.  
You are definitely bored by this place.  The people are 
listless, going about their daily chores with a slowness 
that pains your eyes.  A slope to the west climbs up the 
mountainside, and two open shops made of wood and stone 
are to your north and south.  East-wards this road continues.
   There is a small sign here.]],
	Exits = {
		north = 3345,
		east = 3347,
		south = 3346,
		west = 3343
	}
})
Config.NewRoom({
	Id = 3345,
	Name = "The Mountain Tavern",
	Desc = [[   Hmm.  Looks like there's no one here, not even an bartender.
Evidently you've come during off hours, since no bar could be
THIS dull.  The walls are decorated with mounted animal heads
and arrows and longbows and other hunting equipment/trophies.
All of it looks rather plain.]],
	Exits = {
		south = 3344
	}
})
Config.NewRoom({
	Id = 3346,
	Name = "The General Store",
	Desc = [[   A bored shopkeeper waves an idle hand towards his stock
of stuff.  Browse, type list, buy, sell, whatever...]],
	Exits = {
		north = 3344
	}
})
Config.NewRoom({
	Id = 3347,
	Name = "Main Road",
	Desc = [[   Nothing is going on in this section of village either.  To the
east is an actual road intersection, and to the west you see one
of the ends of this road.  A large grassy area to the south is
fenced off for a horse corral.]],
	Exits = {
		east = 3349,
		south = 3348,
		west = 3344
	}
})
Config.NewRoom({
	Id = 3348,
	Name = "The Corral",
	Desc = [[   Many horses look up at you when you enter this corral.
The horses are kept in by a big wooden fence, which they
seem quite happy to been kept in by.  You don't see anyone
around taking care of these horses, but someone is probably
close by.]],
	Exits = {
		north = 3347
	}
})
Config.NewRoom({
	Id = 3349,
	Name = "The Intersection",
	Desc = [[   You are standing in an intersection deep in the heart
of Stanneg by the Mountains.  In fact, this is the ONLY
intersection anywhere in Stanneg by the Mountain it 
appears.
   There are some buildings to the north, and south, and
east, and west.  None particularly stand out from the 
others.]],
	Exits = {
		north = 3350,
		east = 3356,
		south = 3354,
		west = 3347
	}
})
Config.NewRoom({
	Id = 3350,
	Name = "A Small Road",
	Desc = [[   This road runs north through Stanneg by the Mountains, 
if through would be the operative word for such a motley 
collection of buildings.  Westwards is a small, open-roofed
building that appears to be a farmer's market.  The road 
you are on continues north, and comes to an intersection 
just south of here.]],
	Exits = {
		north = 3352,
		south = 3349,
		west = 3351
	}
})
Config.NewRoom({
	Id = 3351,
	Name = "The Farmer's Market",
	Desc = [[   One farmer's wife stands here, waiting for someone to
buy the food her family has grown.  She looks bored, but
not unhappy... no competition!]],
	Exits = {
		east = 3350
	}
})
Config.NewRoom({
	Id = 3352,
	Name = "A Small Road",
	Desc = [[   The small, north-south road running through Stanneg
by the Mountains ends here, curving to become the front
walk of a private home to the east.  The road runs south
from this house, towards the center of the village.]],
	Exits = {
		east = 3353,
		south = 3350
	}
})
Config.NewRoom({
	Id = 3353,
	Name = "A Private Home",
	Desc = [[   The interior of this home is simple and rustic.  A 
ladder leads up to the loft, where the sleeping pallets 
are tucked away.  A wood-burning stove keeps the place 
well heated and cozy.  A homemade rocking chair stands 
crooked in the corner, draped with a old looking afghan.  
This home is a nice place, very comfortable.]],
	Exits = {
		west = 3352
	}
})
Config.NewRoom({
	Id = 3354,
	Name = "A Small Road",
	Desc = [[   The road ends here, leading up to a stone house
to the south.  Smoke rises from the chimney in a dark
stream, and the windows are frosted over with humidity.
North, you see the main intersection of Stanneg.]],
	Exits = {
		north = 3349,
		south = 3355
	}
})
Config.NewRoom({
	Id = 3355,
	Name = "A Private Home",
	Desc = [[   This home strikes you as unbearable warm and uncomfortable.
The fireplace is going at a full-bonfire, a mammoth stack of
firewood beside it against the wall.  The decorations seem
somewhat spartan and plain; a landscape, an old hunting 
bow... nothing much of interest.]],
	Exits = {
		north = 3354
	}
})
Config.NewRoom({
	Id = 3356,
	Name = "Main Road",
	Desc = [[   The main road through Stanneg ends here at a large well
that leads deep, deep into the earth.  To the north of the 
well is a large building, with a large WELCOME mat outside 
its front door.  Westwards you see the a road intersection 
in the center of the tiny village.  Around you is a rocky 
terrain in the middle of this mountain range...not very 
many places else to go.]],
	Exits = {
		north = 3357,
		west = 3349
	}
})
Config.NewRoom({
	Id = 3357,
	Name = "Stanneg Inn",
	Desc = [[   This is a plainly decorated room, the main room of the
Stanneg Inn.  A large arch to the west leads to a common
room where food and drink can be ordered, and a set of
rickety wooden stairs lead up to the rooms are.  A thread-
bare rug lies in the middle of the floor, evidently well-
loved by a cat or two from the quantity of hair on it.]],
	Exits = {
		south = 3356,
		west = 3358,
		up = 3359
	}
})
Config.NewRoom({
	Id = 3358,
	Name = "The Common Room",
	Desc = [[   A large fireplace warms this room in great waves of
heat, to combat the chill drafts eminating from the windows
on the west and north sides of this room.  A few benches
and tables are clustered in the center of the room, for
the use of the locals.  Fairly plain, for a frequented
gathering place.]],
	Exits = {
		east = 3357
	}
})
Config.NewRoom({
	Id = 3359,
	Name = "The Reception",
	Desc = [[   A hall leads away to the west lined with small brown
doors.  A small table has a ledger on it, seemingly
almost unused.  The hall is plain and without any 
decoration, except for a nice painting of (what else)
a mountain hanging above the stairs that lead back
down to the inn proper.]],
	Exits = {
		down = 3357
	}
})
Config.NewRoom({
	Id = 3360,
	Name = "A Rocky Slope",
	Desc = [[   This slope is fairly shallow and easy to walk on, 
despite the loose shale and gravel.  To the east is a high 
ridge you could stand on, and to the west is a flat area 
near two trails leading up and down into the mountains.  
High above you, to your west, is that ominous, dark peak, 
which seems to radiating a sense of hopelessness...]],
	Exits = {
		east = 3309,
		west = 3361
	}
})
Config.NewRoom({
	Id = 3361,
	Name = "A Ledge",
	Desc = [[   This ledge overlooks a small path that leads up and 
down from here.  Below, you see the path head down to a 
large flat area where a small cottage lies nestled in the 
mountains, smoke rising from it in a curling line.  Above, 
the path seems to head towards that dark peak piercing the 
sky.  You notice a few boot-tracks in the earth, seemingly 
to lead down towards the cottage.]],
	Exits = {
		east = 3360,
		up = 3364,
		down = 3362
	}
})
Config.NewRoom({
	Id = 3362,
	Name = "Outside Of A Cottage",
	Desc = [[   Now that you approach closer to the cottage, you notice 
that the smoke is not coming from the chimney, but rather 
the gutted ruins of the building.  Something torched this 
place, badly.  You see no signs of life among the wreckage.
You can enter one of the particularly large holes in the 
wall to the west, with caution.]],
	Exits = {
		west = 3363,
		up = 3361
	}
})
Config.NewRoom({
	Id = 3363,
	Name = "The Torched Cottage",
	Desc = [[   This whole place is smouldering still from whatever 
decided to try to burn it to the ground.  On the floor 
near the center of the ruined structure is the burnt and 
dessicated corpse of a man, outstretched and blackened.  
There's not much to see here; whatever decided to destroy 
this place did it very well.]],
	Exits = {
		east = 3362
	}
})
Config.NewRoom({
	Id = 3364,
	Name = "A Mountain Trail",
	Desc = [[   This mountain trail leads straight up into the evil 
looking mountains.  High above you, one mountain peak 
seems to radiate danger and fear, and the trail seems 
to be leading straight up to it.  You wonder if it is 
wise to continue this way...
   The trail goes even higher up to the west, and back 
down to the west.]],
	Exits = {
		west = 3365,
		down = 3361
	}
})
Config.NewRoom({
	Id = 3365,
	Name = "A Mountain Trail",
	Desc = [[   The trail leads up even higher into the mountains to the
west here.  You shiver as the cold mountain air washes over
you, and your back prickles as you wonder if anything lives
up here, or anything _dangerous_ for that matter.  Maybe 
heading back down to the east would be a good idea...]],
	Exits = {
		east = 3364,
		west = 3366
	}
})
Config.NewRoom({
	Id = 3366,
	Name = "A Mountain Trail",
	Desc = [[   The trail leads up the side of the tallest mountain in 
the range -- the one that sticks up into the dark sky like
a monument to death and futility.  The trail leads back to 
safety to the east, and goes even higher to the west.]],
	Exits = {
		east = 3365,
		west = 3367
	}
})
Config.NewRoom({
	Id = 3367,
	Name = "Near The Peak",
	Desc = [[   This is as close to the peak as you're going to get, 
unless you use that tiny, tiny path leading up to your 
north.  Up the side of the mountain you see a great cave 
hollowed out, the inside pitch black.  The path leads down 
the mountains to your east, which seems to be the best 
place to go.]],
	Exits = {
		north = 3368,
		east = 3366
	}
})
Config.NewRoom({
	Id = 3368,
	Name = "A Small, Dangerous Path",
	Desc = [[   This path leads up, up, up the side of the mountain, to 
the evil-seeming cave.  It also heads down to the south--a 
lot safer place to be.  In fact, you hear footsteps above 
your head...]],
	Exits = {
		south = 3367,
		up = 3369
	}
})
Config.NewRoom({
	Id = 3369,
	Name = "A Small, Dangerous Path",
	Desc = [[   Unfortunately, you realize too late that this bigger 
ledge that leads north to the darkened cave is an ideal 
spot for an ambush.  This ledge gives you a beautiful 
panoramic view of the entire mountain range, however.  
Breathtaking!]],
	Exits = {
		north = 3370,
		down = 3368
	}
})
Config.NewRoom({
	Id = 3370,
	Name = "The Cave Entrance",
	Desc = [[   You are standing in the entrance of a simply huge cave!
The size is stunning!  All around the entrance are burnt 
bones and various types of wooden and metal debris.  Giant 
claw marks are all along the ground, leading back deeper 
into the cave.
   Two tunnels lead off from here, one up, one down.  There
are claw marks leading in either direction.]],
	Exits = {
		south = 3369,
		up = 3371,
		down = 3374
	}
})
Config.NewRoom({
	Id = 3371,
	Name = "A Sloping Tunnel",
	Desc = [[   The tunnels slopes up to the north deeper into the 
mountain.  A rather gusty breeze riffles your clothing 
from ahead somewhere.  The claw marks in the stone floor 
continue up the passage, through the darkness.]],
	Exits = {
		north = 3372,
		down = 3370
	}
})
Config.NewRoom({
	Id = 3372,
	Name = "A Sloping Tunnel",
	Desc = [[   The tunnel continues its slope upwards, and the wind 
blows at you even stronger yet.  The claw tracks in the 
stone stop abruptly here, where there seems to be a lot
of unearthed dirt and stone around, heaped upon the floor.  
You feel uneasy about this place.]],
	Exits = {
		north = 3373,
		south = 3371
	}
})
Config.NewRoom({
	Id = 3373,
	Name = "The Pit",
	Desc = [[  You fall through the illusionary floor.

  You hit the poisoned spikes below.

  You die very slowly of bloodloss, your head impaled at 
an awkward angle.

  




]],
	Exits = {
		south = 3372
	}
})
Config.NewRoom({
	Id = 3374,
	Name = "A Sloping Tunnel",
	Desc = [[   This tunnel slopes deep, down into the mountain's heart.
The air feels still and uncomfortably warm, despite the 
closeness of the cave's entrance above you.  There's a 
deep, musky odor in the air, and the giant claw marks 
continue downwards.]],
	Exits = {
		up = 3370,
		down = 3375
	}
})
Config.NewRoom({
	Id = 3375,
	Name = "A Sloping Tunnel",
	Desc = [[   A bright light greets your eyes from the north, in 
direct contrast to the darkness of the tunnel overhead.  
You break  out in a sweat due to the overwhelming warmth 
of the air.  The musky odor has grown quite intense, 
drowning out everything else in the air and making it hard 
to breathe.  Something in your gut begins squirming 
uncomfortably as you wonder what's ahead...]],
	Exits = {
		north = 3376,
		up = 3374
	}
})
Config.NewRoom({
	Id = 3376,
	Name = "The Lair",
	Desc = [[   This place is huge!!!  It should be considering the 
dragon's great bulk.  However, instead of seeing the 
customary carnage and mound of gold that one is accustomed 
to seeing in a dragon lair, this one is decorated subtly 
with tapestries and drapes, and other comforts of human 
life.  There is even a huge-dragon sized bed -- undoubtedly 
conjured to life by its elder dragon owner.]],
	Exits = {
		south = 3375
	}
})
