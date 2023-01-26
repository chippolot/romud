Config.NewEntity({
	Key = "mob18601",
	Keywords = {
		"pitbeast",
		"pit-beast"
	},
	Name = "the pit beast",
	RoomDesc = "The big, ugly pit-beast is standing here sizing you up.",
	FullDesc = [[
Ick... what a disgusting creature!  It is black and green and slimy
and it is drooling everywhere... looks mean too.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d5+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "4d6+42",
		XPValue = 1200,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob18602",
	Keywords = {
		"newbie",
		"monster"
	},
	Name = "the newbie monster",
	RoomDesc = "The newbie monster stands here looking confused.  Kill him!  Kill him!",
	FullDesc = [[
What an odd looking little beast.  He looks harmless, but you never can
tell.  He is only about 4 feet tall, but he pretty muscular looking...
maybe you should ask if he needs help?  Nah... kill him.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 1,
			Damage = "1d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 2,
		AC = 10,
		HP = "2d4+16",
		XPValue = 400,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18603",
	Keywords = {
		"dragon",
		"baby"
	},
	Name = "the baby dragon",
	RoomDesc = "Someone's little pet dragon has gotten loose, and is sniffing about here.",
	FullDesc = [[
Awwww... how cute!  A little baby dragon.  He's about 3 feet long and you
just want to cuddle him to death... no, you really want to kill him to tell
the truth.  But, remember, even a little dragon can be a big problem.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 13,
		HP = "1d4+50",
		XPValue = 1000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18604",
	Keywords = {
		"keeper",
		"guard",
		"monster"
	},
	Name = "the Newbie Guard",
	RoomDesc = "The Newbie Guard is here wondering where that dragon went.",
	FullDesc = [[
The Guard also had the job of taking care of the Alchemist's pet dragon,
but he doesn't seem to be doing a good job of it.  He looks at you and
says, 'Have you seen that dragon?  Master will have my head if I don't find
him.'
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "1d7+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "2d6+34",
		XPValue = 800,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18605",
	Keywords = {
		"alchemist",
		"newbie"
	},
	Name = "the Newbie Alchemist",
	RoomDesc = "The Newbie Alchemist is here trying to make something.",
	FullDesc = [[
He is a funny looking, furry little dude.  He looks really busy trying to
mix up a batch of something or other.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "4d6+38",
		XPValue = 1200,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob18606",
	Keywords = {
		"crawler",
		"creepy",
		"bug",
		"thing"
	},
	Name = "the creepy crawler",
	RoomDesc = "A creepy little crawling thing is scuttling along the floor at your feet.",
	FullDesc = [[
Yuck!  If they'd ever clean this place maybe it wouldn't attract vermin
like this disgusting, little, six-legged, brown bug.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 9,
		HP = "1d4+8",
		XPValue = 100,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob18607",
	Keywords = {
		"newbie",
		"zombie"
	},
	Name = "the zombiefied newbie",
	RoomDesc = "A VERY gaunt looking newbie... it looks like a zombie!",
	FullDesc = [[
This guy has been lost in here too long... it is more zombie than man
now.  You would feel sorry for it, but it is moving in to attack!
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 14,
		HP = "1d8+46",
		XPValue = 600,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob18608",
	Keywords = {
		"quasit",
		"imp",
		"thing"
	},
	Name = "the quasit",
	RoomDesc = "A funny little imp-like thing (a quasit perhaps?) is sneaking about here.",
	FullDesc = [[
Little green, vaguely humoniod shaped creature, with a long pointed tail.
It is hard to say because before you ever get a good look at it, it darts
back into the shadows.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 1,
			Damage = "1d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 12,
		HP = "1d10+30",
		XPValue = 300,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18609",
	Keywords = {
		"minotaur"
	},
	Name = "the massive Minotaur",
	RoomDesc = "The Great Minotaur is wondering just what you'll taste like.",
	FullDesc = [[
A massive man, with the head of a bull.  He looks as strong as bull too,
but not nearly as smart.  Actually, now that you consider it... he looks
a heck of a lot meaner than any bull you have ever seen... and he is
coming this way!
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "2d4+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 14,
		HP = "3d5+85",
		XPValue = 3000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18610",
	Keywords = {
		"spectre",
		"ghost"
	},
	Name = "the dark spectre",
	RoomDesc = "The dark spectre is lurking in the shadows.",
	FullDesc = [[
The soul of a long since passed on adventurer... it lurks here waiting for
a chance to bring death to any who cross its path.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "2d4+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 6,
		AC = 16,
		HP = "3d5+62",
		XPValue = 1600,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob18611",
	Keywords = {
		"newbie",
		"annoying",
		"jerk"
	},
	Name = "the annoying newbie",
	RoomDesc = "A newbie is here annoying the hell out of you.",
	FullDesc = [[
What a jerk!  He won't shut up, and he keeps making the most irritating
comments about everything.  Better silence him with cold, tempered steel
MUHAHAHAHAHAHAHAHAHAHA!
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "1d3+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 2,
		AC = 9,
		HP = "2d4+20",
		XPValue = 500,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18612",
	Keywords = {
		"newbie",
		"clueless",
		"moron"
	},
	Name = "the clueless newbie",
	RoomDesc = "A newbie is here looking terribly confused.",
	FullDesc = [[
What a moron!  Every question that is answered in the help files, he will
ask and he will probably ask 2 or 3 times too.  This guy just doesn't get
it, best put him out of his misery.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 0,
			Damage = "1d3+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 1,
		AC = 9,
		HP = "1d1+19",
		XPValue = 220,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18613",
	Keywords = {
		"newbie",
		"talkative"
	},
	Name = "the talkative newbie",
	RoomDesc = "A newbie is here talking a lot.",
	FullDesc = [[
Well, at least this gal seems pretty cool.  Talks a lot, but she's a
friendly, interesting sort.  Seems to have a clue what she's doing also,
unlike some others you might see.
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 2,
			Damage = "1d7+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 3,
		AC = 11,
		HP = "6d5+22",
		XPValue = 600,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob18614",
	Keywords = {
		"newbie",
		"lost"
	},
	Name = "the lost newbie",
	RoomDesc = "A newbie is here wandering about aimlessly.",
	FullDesc = [[
Hmmm... looks like he has been around a while, but he wandered a little
too far from home this time.  Don't think he knows quite where he is,
maybe you should help him out?
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 13,
		HP = "8d5+20",
		XPValue = 500,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob18615",
	Keywords = {
		"newbie",
		"smart"
	},
	Name = "the smart newbie",
	RoomDesc = "A newbie is here, and he looks quite sure of himself.",
	FullDesc = [[
Here is a guy who has it all together.  Nice equipment too, must have read
the help files, Eh?
]],
	Flags = {
		"usesequipment"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 5,
			Damage = "2d3+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 10,
		HP = "10d5+20",
		XPValue = 1000,
		Speed = 30,
		Str = 10,
		Dex = 10,
		Con = 10,
		Int = 10,
		Wis = 10,
		Cha = 10
	},
	Gender = 1
})
