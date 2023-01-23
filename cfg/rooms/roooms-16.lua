Config.NewRoom({
	Id = 1501,
	Name = "A Road Leading From The Bank",
	Desc = [[
   You find yourself on a small road leading away from the edge
of the River of Lost Souls.  The dark waters of the River can
be seen and heard just south of here.  Looking to the east and
west, you see only the walls of the rocky cliffs.  Off to the
north a strange path seems to lead straight into the depths of
the mountain.
]],
	Exits = {
		north = 1502,
		south = 5620
	}
})
Config.NewRoom({
	Id = 1502,
	Name = "A Long Road",
	Desc = [[
   You stand here in spiritual emptiness, beginning a long and dangerous
path.  Your honest submission has already been made, but the truth of your
heart has yet to be told.  Leave here now, and do not come back until
you have grown.
]],
	Exits = {
		north = 1503,
		south = 1501
	}
})
Config.NewRoom({
	Id = 1503,
	Name = "A Long Road",
	Desc = [[
   You stop for a moment, screaming in frustration.  Surely it was that one
sin that was avoidable, of all that you regret.  The hitting and the hurting
flash briefly before you.  Moments later the pain passes, and the straight
path reveals itself before you.
]],
	Exits = {
		south = 1502,
		north = 1504
	}
})
Config.NewRoom({
	Id = 1504,
	Name = "A Long Road",
	Desc = [[
   The road clears, the fog and pain of the first few steps left behind
you.  Despite the sudden clarity, your mind is still haunted, images of
an old woman kneeling in prayer, eyes closing, smiling and crying.
]],
	Exits = {
		north = 1505,
		south = 1503
	}
})
Config.NewRoom({
	Id = 1505,
	Name = "A Long Road",
	Desc = [[
   Looking ahead, you can see that the path you have been following will
soon come to an end, but something in the cold and the breeze tells you
that that will be only the beginning of the journey.
]],
	Exits = {
		north = 1506,
		south = 1504
	}
})
Config.NewRoom({
	Id = 1506,
	Name = "A Test for the Faithful",
	Desc = [[
   It is here finally that decisions must be made.  The first one that
confronts you is simple enough, to walk in the darkness, or to walk in
the light.  Only the depths of your soul can decide, but remember this
much: the same truth lies at the end of both paths.
]],
	Exits = {
		up = 1508,
		down = 1507
	}
})
Config.NewRoom({
	Id = 1507,
	Name = "Halls of the Forgotten",
	Desc = [[
   Even the darkest have a place on the road to the truth.  It is in this
place, so empty and forgotten, that God has chosen the worst, and brought
them close to Him for one last time.
]],
	Exits = {
		east = 1514,
		west = 1509,
		up = 1506
	}
})
Config.NewRoom({
	Id = 1508,
	Name = "Shahadah",
	Desc = [[
   It was written once, on an ancient parchment in a curious and flowing
script, that there is in fact no god but Allah, and that Muhammad was
the last of His Prophets.  With this recognition, all else became empty
and meaningless.
]],
	Exits = {
		east = 1524,
		west = 1519,
		down = 1506
	}
})
Config.NewRoom({
	Id = 1509,
	Name = "Earthly Evil",
	Desc = [[
   Whatever it carries, that rage converts into a weapon.  Wrath supplies
all with arms.  When an angry man thirsts for blood anything will serve
him for a spear.  Fury turns a stick into a cudgel.
]],
	Exits = {
		north = 1510,
		east = 1507
	}
})
Config.NewRoom({
	Id = 1510,
	Name = "Misguidance",
	Desc = [[
   Some have been brought here not for what they did, but what they
failed to do.  It is these, the poor souls that were presented the
fair evidence and rejected it with an honest mind, that deserve our
pity the most of all.
]],
	Exits = {
		south = 1509,
		north = 1511
	}
})
Config.NewRoom({
	Id = 1511,
	Name = "Temptation",
	Desc = [[
   Old tales tell of a conversation between the devil and the Prophet
Jesus: the devil offered him a kingdom, vast riches, the temptation of
a glorious near-death saved by his angels.  Even this Messenger of God
was forced to stop and think.  Imagine how hard it could be for the rest.
]],
	Exits = {
		north = 1512,
		south = 1510
	}
})
Config.NewRoom({
	Id = 1512,
	Name = "Hypocrisy",
	Desc = [[
   He called the populace to strict religious purity, rigidly enforcing
the times of prayer and the most correct forms of the words of the Muezzin.
All of this he strengthened by his most impeccable example, shunning all
riches and riding in tattered rags through his capital on the back of a
donkey.  Despite all this, remember.  Behind closed doors, all men are
hypocrites.
]],
	Exits = {
		north = 1513,
		south = 1511
	}
})
Config.NewRoom({
	Id = 1513,
	Name = "Hate",
	Desc = [[
   There is little in life much easier, and truthfully, little that is a
quicker ticket to damnation.  You give brief thanks that you have come to
the end of these trials, but your words are drowned out by something
much louder, a mechanical preaching that drowns your ears in anger.  You
hear a steady, repetitive litany of the same phrase, over and over again:
"I go the way history dictates with the blind assurance of a sleep-walker."
]],
	Exits = {
		south = 1512,
		north = 1529
	}
})
Config.NewRoom({
	Id = 1514,
	Name = "Spiritual Danger",
	Desc = [[
   Some evils are tangible, solid, so evident that they spit you right in
the face.  Others are more clever, more subtle, and it is these that present
the greatest danger.  Looking down the hall before you, a great fear fills
your heart, and a great, heavy longing.
]],
	Exits = {
		north = 1515,
		west = 1507
	}
})
Config.NewRoom({
	Id = 1515,
	Name = "The Fall",
	Desc = [[
   In the beginning, he was the best, the most beautiful of all the angels,
and God's most loved creation.  Look at your own beauty, human, and do what
he could not.  Look at your beauty, and learn to kneel!
]],
	Exits = {
		south = 1514,
		north = 1516
	}
})
Config.NewRoom({
	Id = 1516,
	Name = "Temptation",
	Desc = [[
   Temptation is the IF, the wondering, the second-guessing, the "I will
be a better man... if..."  And that if is usually taken, sitting alone,
listening to that voice, calling you, offering such an easy way, but such
a crooked one.
]],
	Exits = {
		north = 1517,
		south = 1515
	}
})
Config.NewRoom({
	Id = 1517,
	Name = "The Last Day",
	Desc = [[
   The din of a great battle shakes these halls, the moans of the earth
erupting at the shakings of the End Time.  Be ready for that day, be very
ready, for if you are not, he will claim you for one of his own.
]],
	Exits = {
		south = 1516,
		north = 1518
	}
})
Config.NewRoom({
	Id = 1518,
	Name = "Flame",
	Desc = [[
   Undescribable horror and pain, a blackness drowned out only by the
burning anguish, the inextinguishable fire coming not from some burning
wood or molten lava but from the brightness and pain of the horrible,
tortured souls that surround, everywhere you turn.
]],
	Exits = {
		north = 1531,
		south = 1517
	}
})
Config.NewRoom({
	Id = 1519,
	Name = "Earthly Light",
	Desc = [[
   To slip into evil is easy, but walking this path is the hardest of
all.  Even the four you will find here today have strayed from the line
at least once in their lives, and there are still some living who curse
the very sound of their names.  Despite all this, confront them now, and
let their actions serve as your example.
]],
	Exits = {
		north = 1520,
		east = 1508
	}
})
Config.NewRoom({
	Id = 1520,
	Name = "The Light of the Rashidun",
	Desc = [[
   Many believed that the Prophet would never die, but when the stark
evidence of his body confronted them, it soon became necessary to provide
for the future.  The four that came after are called the Rashidun, the
rightly-guided Caliphs that would spread the word and the light, and with
it forge one of history's greatest empires.
]],
	Exits = {
		north = 1521,
		south = 1519
	}
})
Config.NewRoom({
	Id = 1521,
	Name = "The Light of the Rashidun",
	Desc = [[
   The first Caliphs were chosen by consultation with a noble council
of elders, each of whom, hoping to lead the world of Islam alone, voted
to elect the one amongst them they thought was the weakest.  Each time,
they were wrong.  Each one was more noble, more upright than the one
before.
]],
	Exits = {
		north = 1522,
		south = 1520
	}
})
Config.NewRoom({
	Id = 1522,
	Name = "The Light of the Rashidun",
	Desc = [[
   Every majestic and happy tale must end, usually all too soon, and thus
it was with the golden age of the Caliphate.  The Rashidun were pure men,
good men, true to the path, but their followers soon began to bicker, and
civil war was on the horizon.
]],
	Exits = {
		south = 1521,
		north = 1523
	}
})
Config.NewRoom({
	Id = 1523,
	Name = "The Light of the Rashidun",
	Desc = [[
   The end of the Rashidun was the beginning of Schism.  The memories
of the Prophet and the living example of the Caliphs proved to be
insufficient example to the faithful.  Ali died, and some say that
with him the Caliphate died too, a martyr, his blood still flowing in
the nameless river.
]],
	Exits = {
		north = 1532,
		south = 1522
	}
})
Config.NewRoom({
	Id = 1524,
	Name = "Spritual Reward",
	Desc = [[
   Behold, Allah is the Provider, the most Generous.  He would not suffer
his believers to walk the path of light without guidance.  He provided the
Prophets, may peace be upon them, and in the examples of their own growth,
we shall find the truth of our own.
]],
	Exits = {
		north = 1525,
		west = 1508
	}
})
Config.NewRoom({
	Id = 1525,
	Name = "Creation",
	Desc = [[
   In the creation of the heavens and the earth, and in the alternation of
night and day, there are signs for men of sense; those that remember Allah
say: "Lord, You have not created this in vain!"
]],
	Exits = {
		north = 1526,
		south = 1524
	}
})
Config.NewRoom({
	Id = 1526,
	Name = "Revelation",
	Desc = [[
   The Angel Gabriel came to him and said: "Read!"  He replied: "But I
cannot!"  The order was repeated three times, until the Angel himself
said: "Read, in the name of your Lord who created man from clots of blood.
Praise be to God, Lord of the Universe."
]],
	Exits = {
		south = 1525,
		north = 1527
	}
})
Config.NewRoom({
	Id = 1527,
	Name = "Conversion",
	Desc = [[
   Unbelievers, I do not worship what you worship, nor do you worship
what I worship.  I shall never worship what you worship, nor will you
ever worship what I worship.  You have your own religion, and I have
mine.
]],
	Exits = {
		north = 1528,
		south = 1526
	}
})
Config.NewRoom({
	Id = 1528,
	Name = "Deliverance",
	Desc = [[
   The balance had been made, the soul placed in readiness, and the final
measurement taken.  For those that have come this far, surely this is the
day of immortality!
]],
	Exits = {
		north = 1534,
		south = 1527
	}
})
Config.NewRoom({
	Id = 1529,
	Name = "Repentance",
	Desc = [[
   God forgives those who commit evil in ignorance, for He is all-knowing
and wise.  But He will not forgive those who do evil, and when death comes
to them, say: "Now we repent!"  For those We have prepared a woeful scourge.
]],
	Exits = {
		up = 1535,
		east = 1530,
		south = 1513
	}
})
Config.NewRoom({
	Id = 1530,
	Name = "Pilgrimage",
	Desc = [[
   It is incumbent upon all Muslims to make the pilgrimage to Mecca once
in their lifetime, if they are able, and for those unfortunate enough to
follow the lives of the lower evils, such a pilgrimage with an open and
contrite heart shall absolve them of all.
]],
	Exits = {
		up = 1536,
		east = 1531,
		west = 1529
	}
})
Config.NewRoom({
	Id = 1531,
	Name = "Intercession",
	Desc = [[
   It is written that no one may intercede with God on behalf of another.
No prayers from another may save the soul of a doomed man; his only hope
is prayers of his own.
]],
	Exits = {
		up = 1537,
		south = 1518,
		west = 1530
	}
})
Config.NewRoom({
	Id = 1532,
	Name = "The Upper Reaches",
	Desc = [[
   You have traveled the righteous path, and you have faced the examples
of the true models of the Prophet.  Only the final journey awaits you;
live like this and you shall live forever.
]],
	Exits = {
		south = 1523,
		east = 1533,
		down = 1535
	}
})
Config.NewRoom({
	Id = 1533,
	Name = "The Upper Reaches",
	Desc = [[
   When the records of men's deeds are laid open, and heaven is stripped
bare; when Hell burns fiercely and Paradise is brought near: then each
soul shall know what it has done.
]],
	Exits = {
		east = 1534,
		west = 1532,
		down = 1536
	}
})
Config.NewRoom({
	Id = 1534,
	Name = "The Upper Reaches",
	Desc = [[
   You have traveled the righteous path, and your own journey has
imitated the evolution of the most perfect soul.  Only one final
path awaits you; die as the one in the room before, and your death
will mean nothing.
]],
	Exits = {
		south = 1528,
		west = 1533,
		down = 1537
	}
})
Config.NewRoom({
	Id = 1535,
	Name = "The Final Facing",
	Desc = [[
   The last of the darkness lies behind you; only the straight path
remains.  Go forth with a clean heart.  Only the penitent shall find
what they seek.
]],
	Exits = {
		east = 1536,
		up = 1532,
		down = 1529
	}
})
Config.NewRoom({
	Id = 1536,
	Name = "The Final Facing",
	Desc = [[
   The last of the darkness lies behind you; only the straight path
remains.  Go forth with a clean heart.  Only the penitent shall find
what they seek.
]],
	Exits = {
		north = 1538,
		west = 1535,
		east = 1537,
		up = 1533,
		down = 1530
	}
})
Config.NewRoom({
	Id = 1537,
	Name = "The Final Facing",
	Desc = [[
   The last of the darkness lies behind you; only the straight path
remains.  Go forth with a clean heart.  Only the penitent shall find
what they seek.
]],
	Exits = {
		west = 1536,
		up = 1534,
		down = 1531
	}
})
Config.NewRoom({
	Id = 1538,
	Name = "A Straight Path",
	Desc = [[
   The Compassionate, the Merciful, Sovereign of the Day of Judgment!
You alone we worship, and to You alone we turn for help.  Guide us to
the Straight Path, the path of those whom You have favored, not of
those who have gone astray.
]],
	Exits = {
		south = 1536,
		north = 1539
	}
})
Config.NewRoom({
	Id = 1539,
	Name = "Progression",
	Desc = [[
   Were We worn out by the First Creation?  Yet they are in doubt about
a new creation.  WE created man.  We know the promptings of his soul,
and are closer to him than his jugular vein.
]],
	Exits = {
		north = 1540,
		south = 1538
	}
})
Config.NewRoom({
	Id = 1540,
	Name = "Judgment",
	Desc = [[
   Undoubtedly the shortest path is the straightest one.  Only one more
step awaits before a final decision is made and a home given to you for
all eternity.
]],
	Exits = {
		north = 1541,
		south = 1539
	}
})
Config.NewRoom({
	Id = 1541,
	Name = "The Utmost Throne",
	Desc = [[
   You have come at last to the resting place of the most holy.  Startling
crystal clarity of vision has been granted to you; seven guardians rim
the periphery of the throne and all is bathed in a warm and clean light.
It is here that the final choice is to be made, and no defiance of yours
can change the outcome.
]],
	Exits = {
		south = 1540
	}
})
