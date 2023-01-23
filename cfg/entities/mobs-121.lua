Config.NewEntity({
	Key = "mob12000",
	Keywords = {
		"judge",
		"adjudicator"
	},
	Name = "the adjudicator",
	RoomDesc = "An adjudicator is watching the games intently.",
	FullDesc = [[
The adjudicator is a retired gladiator and scars cover all exposed parts of
his body.  Although he is getting on in years, he remains healthy and fit.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "1d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "3d7+140",
		XPValue = 13000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12001",
	Keywords = {
		"scorekeeper"
	},
	Name = "the scorekeeper",
	RoomDesc = "A scorekeeper has one eye on his stopwatch and the other on a clipboard.",
	FullDesc = [[
The scorekeeper is a young man of about 25 years of age and is very intently
studying his clipboard.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 6,
			Damage = "1d4+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 7,
		AC = 15,
		HP = "3d5+80",
		XPValue = 2250
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12003",
	Keywords = {
		"spectator",
		"fan"
	},
	Name = "the spectator",
	RoomDesc = "A spectator is here watching the games.",
	FullDesc = "The spectator is filthy, half drunk and screaming his head off.",
	Flags = {
		"stationary"
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
		HP = "2d6+65",
		XPValue = 900
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob12004",
	Keywords = {
		"noble",
		"nobleman"
	},
	Name = "the nobleman",
	RoomDesc = "A nobleman stands here looking aloof.",
	FullDesc = [[
The nobleman is dressed in fine clothes and jewelry and has a very snobbish
attitude.  While he is getting old and his hair and beard are streaked with
gray, he is by no means an easy target.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "1d7+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "4d6+140",
		XPValue = 13000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12005",
	Keywords = {
		"slave"
	},
	Name = "the slave",
	RoomDesc = "A slave stands here, wishing that she was free.",
	FullDesc = [[
A very pretty young woman who was captured instead of being killed when
the Roman legions subjugated her land.
]],
	Flags = {
		"stationary"
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
		HP = "3d6+30",
		XPValue = 350
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob12006",
	Keywords = {
		"gladiator"
	},
	Name = "the gladiator",
	RoomDesc = "There is a gladiator standing here.",
	FullDesc = [[
A well muscled man who is very heavily armored and armed to the teeth.  He
lives for combat.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "1d8+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 19,
		HP = "4d7+150",
		XPValue = 19500
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12007",
	Keywords = {
		"driver"
	},
	Name = "the chariot driver",
	RoomDesc = "There is a chariot driver here.",
	FullDesc = [[
You see a very slight and small individual whose whole life is centered around
nothing but horses and speed.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "3d7+120",
		XPValue = 9000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12008",
	Keywords = {
		"coach",
		"trainer"
	},
	Name = "the coach",
	RoomDesc = "There is a coach standing here, going over last minute strategy.",
	FullDesc = [[
As you try to look over his shoulder and listen in on his mumbling,
he looks up at you and gives you a glare that chills you to the
bone.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "4d5+130",
		XPValue = 11000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12009",
	Keywords = {
		"healer"
	},
	Name = "the healer",
	RoomDesc = "A healer is standing here.",
	FullDesc = [[
You see a young man, still learning about magical healing, wearing a white 
coat and using a stethoscope.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 13,
			Damage = "1d7+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 14,
		AC = 18,
		HP = "2d7+170",
		XPValue = 18000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12010",
	Keywords = {
		"herbalist",
		"young",
		"lady",
		"beautiful"
	},
	Name = "the herbalist",
	RoomDesc = "There is a beautiful young lady here, carrying herbs to help the healer with.",
	FullDesc = [[
The herbalist is a very beautiful young lady who is about 22 years old.  She 
has deep brown eyes and shoulder-length chestnut hair.  Her body is perfectly 
proportioned and she stands about 5' 5" tall.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "1d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "3d4+110",
		XPValue = 8000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob12011",
	Keywords = {
		"shopkeeper"
	},
	Name = "Titus' shopkeeper",
	RoomDesc = "Titus' shopkeeper is here, minding the store.",
	FullDesc = [[
The shopkeeper is an older man in his middle to late fifties and looks like
he enjoys the quiet life.  There is a long scar running from the edge of his
mouth to his right ear, making it look like he is always smiling.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d8+12",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 21,
		HP = "4d10+400",
		XPValue = 80000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12012",
	Keywords = {
		"peddler"
	},
	Name = "the peddler",
	RoomDesc = "A poor peddler is standing here, trying to support his meager existence.",
	FullDesc = "You see a small, dirty man who doesn't look very healthy.  ",
	Flags = {
		"stationary",
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 3,
			Damage = "1d8+0",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 4,
		AC = 13,
		HP = "3d4+40",
		XPValue = 600
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12013",
	Keywords = {
		"page"
	},
	Name = "the page",
	RoomDesc = "A page stands here, waiting to run an errand.",
	FullDesc = [[
You see a young boy who looks very strong and very fast.  He has the look of
a scholar about him.
]],
	Flags = {
		"stationary"
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
		Level = 6,
		AC = 15,
		HP = "3d6+75",
		XPValue = 1600
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12014",
	Keywords = {
		"plaintiff"
	},
	Name = "the plaintiff",
	RoomDesc = "The plaintiff stands here, pleading his case.",
	FullDesc = "He looks pitiful.  Absolutely pitiful.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "2d6+3",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+140",
		XPValue = 12000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12015",
	Keywords = {
		"master"
	},
	Name = "the ticket master",
	RoomDesc = "A ticket master is here, looking at you expectantly.",
	FullDesc = [[
He seems to be waiting for you to either buy a ticket or to get out
of his way so that he can sell tickets to people that actually want
them.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "1d6+11",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 17,
		AC = 18,
		HP = "4d8+210",
		XPValue = 28000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12016",
	Keywords = {
		"vendor"
	},
	Name = "the stadium vendor",
	RoomDesc = "A stadium vendor is walking here, selling overpriced hotdogs and beer.",
	FullDesc = [[
The vendor is a scruffy looking man who isn't afraid of a fight and looks
like he has had just about enough of smart-mouthed spectators.  
]],
	Flags = {
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 7,
			Damage = "2d5+15",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 8,
		AC = 16,
		HP = "2d4+13000",
		XPValue = 3700
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12017",
	Keywords = {
		"citizen"
	},
	Name = "the citizen",
	RoomDesc = "A citizen of Rome is standing here.",
	FullDesc = "It appears to be your ordinary citizen going about his business.",
	Flags = {
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 4,
			Damage = "1d8+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 5,
		AC = 14,
		HP = "1d4+85",
		XPValue = 1000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12018",
	Keywords = {
		"gateguard",
		"guard"
	},
	Name = "the gateguard",
	RoomDesc = "A gateguard stands here, tending the gate.",
	FullDesc = "You see a strong, loyal public defender.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 10,
			Damage = "1d6+5",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 17,
		HP = "3d6+130",
		XPValue = 11000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12019",
	Keywords = {
		"soldier"
	},
	Name = "the soldier",
	RoomDesc = "A soldier on leave is walking around looking for entertainment.",
	FullDesc = [[
You see a member of one of the Emperor's elite legions.  He looks VERY strong.
You have this vague feeling that his entertainment isn't going to be a very
wholesome activity.
]],
	Flags = {
		"stayzone"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 16,
			Damage = "1d6+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 17,
		AC = 20,
		HP = "3d5+220",
		XPValue = 28000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12020",
	Keywords = {
		"emperor",
		"julius",
		"caesar"
	},
	Name = "Julius Caesar",
	RoomDesc = "Julius Caesar, the Emperor of Rome, is sitting here.",
	FullDesc = [[
You see a man who is dressed in the finest of clothes, has eaten the best of
foods and lived in the most opulent palace that Rome has ever known. 
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "3d7+15",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 27,
		AC = 26,
		HP = "10d5+650",
		XPValue = 150000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12021",
	Keywords = {
		"guard",
		"royal",
		"bodyguard"
	},
	Name = "the royal bodyguard",
	RoomDesc = "There is a royal bodyguard here, ready to die for the Emperor, if necessary.",
	FullDesc = [[
The bodyguard is dressed in the finest of armor and wields only the
deadliest of weapons.  He is very strong and would put up one hell
of a fight.  He has been trained to be suspicious of all but the
most innocent visitors, and likely to take offense of anyone with
less than pure intentions.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 18,
			Damage = "1d6+6",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 18,
		AC = 19,
		HP = "3d6+220",
		XPValue = 35000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12022",
	Keywords = {
		"judge",
		"justice"
	},
	Name = "the judge",
	RoomDesc = "A judge is standing here, reading a case.",
	FullDesc = [[
He seems to be quite interested in the case, perhaps you shouldn't
disturb him now, later would probably be a better time.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d7+11",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 21,
		AC = 20,
		HP = "20d5+260",
		XPValue = 50000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12023",
	Keywords = {
		"master",
		"scheduler"
	},
	Name = "the master scheduler",
	RoomDesc = "The master scheduler is here, writing in an appointment book.",
	FullDesc = [[
As you look at him, he looks up at you and asks, 'Do you have an
appointment?'  He waits for a few seconds and then asks, 'Would
you like one?'
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 17,
			Damage = "1d6+9",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 17,
		AC = 19,
		HP = "4d4+210",
		XPValue = 28000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12024",
	Keywords = {
		"slimeball",
		"slime",
		"ball",
		"green"
	},
	Name = "the slimeball",
	RoomDesc = "A green ball of slime is hanging over you, oozing downward.",
	FullDesc = "There is a green 'ball' of slime oozing from the coating on the walls.",
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d6+2",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 12,
		AC = 17,
		HP = "3d4+145",
		XPValue = 13000
	},
	Gender = 0
})
Config.NewEntity({
	Key = "mob12025",
	Keywords = {
		"froboz",
		"wizard"
	},
	Name = "Froboz",
	RoomDesc = "Froboz the wizard is standing here, working on a new spell.",
	FullDesc = [[
You see a middle-aged man whose knowledge of magic, both offensive and 
defensive, is legendary.  He literally glows with a pink aura.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d8+14",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 22,
		HP = "5d10+425",
		XPValue = 95000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12026",
	Keywords = {
		"titus",
		"andronicus"
	},
	Name = "Titus Andronicus",
	RoomDesc = "Titus Andronicus is standing here, polishing a few swords.",
	FullDesc = [[
As you look at him, he suddenly swings a newly sharpened sword
at you!  Watch out!
]],
	Flags = {
		"stationary",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d8+14",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 24,
		AC = 24,
		HP = "1d5+450",
		XPValue = 85000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12027",
	Keywords = {
		"senator"
	},
	Name = "the senator",
	RoomDesc = "A senator is here, waiting for debate to begin.",
	FullDesc = "He seems to be quite bored and is playing with the edge of his toga.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 9,
			Damage = "2d6+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 10,
		AC = 17,
		HP = "3d5+120",
		XPValue = 9000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12028",
	Keywords = {
		"bailiff"
	},
	Name = "the bailiff",
	RoomDesc = "The bailiff stands here, keeping order in the courtroom.",
	FullDesc = [[
He is a very stern man and insists on absolute quiet in his courtroom
unless the judge has given someone permisson to speak.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 15,
			Damage = "2d7+4",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 16,
		AC = 18,
		HP = "1d5+200",
		XPValue = 24000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12029",
	Keywords = {
		"defendant"
	},
	Name = "the defendant",
	RoomDesc = "The defendant stands here, pleading her case.",
	FullDesc = "She looks to be well organized and full of confidence.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 11,
			Damage = "2d7+1",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 11,
		AC = 18,
		HP = "3d6+130",
		XPValue = 11000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob12030",
	Keywords = {
		"jupiter",
		"king",
		"god"
	},
	Name = "Jupiter",
	RoomDesc = "Jupiter, King of the Gods, is watching over his realm here.",
	FullDesc = [[
He is the strongest of the Gods, and certainly no easy mark!  His powers
transcend the plane of the physical, and could easily kill an unprepared
mortal.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "8d6+50",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 34,
		AC = 29,
		HP = "20d15+950",
		XPValue = 550000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12031",
	Keywords = {
		"venus",
		"goddess"
	},
	Name = "Venus",
	RoomDesc = "Venus, the Goddess of Beauty and Knowledge, is resting here.",
	FullDesc = [[
Venus is probably one of the most beautiful women you have ever seen
if not THE most beautiful.  She is very powerful and tough under that
outer image of beauty.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "6d6+12",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 28,
		AC = 25,
		HP = "5d10+650",
		XPValue = 310000
	},
	Gender = 2
})
Config.NewEntity({
	Key = "mob12032",
	Keywords = {
		"mars",
		"god"
	},
	Name = "Mars",
	RoomDesc = "Mars, the God of War and State, is sitting down here.",
	FullDesc = [[
Mars is a tall God with burning, hateful eyes and a large scowl on
his face.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "8d6+14",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 27,
		AC = 28,
		HP = "15d10+630",
		XPValue = 200000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12033",
	Keywords = {
		"mercury",
		"messenger",
		"god"
	},
	Name = "Mercury",
	RoomDesc = "Mercury, the messenger of the Gods, is standing here.",
	FullDesc = "Mercury is a handsome, youthful God and wears a large grin on his face.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "4d6+8",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 26,
		AC = 29,
		HP = "5d10+550",
		XPValue = 155000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12034",
	Keywords = {
		"shopkeeper"
	},
	Name = "Froboz' shopkeeper",
	RoomDesc = "Froboz' shopkeeper is here, minding the store.",
	FullDesc = [[
The shopkeeper is an older man in his middle to late fifties and looks like
he enjoys the quiet life.  There is a long scar running from the edge of his
mouth to his right ear, making it look like he is always smiling.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "1d8+14",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 23,
		AC = 21,
		HP = "4d10+400",
		XPValue = 80000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12035",
	Keywords = {
		"executioner"
	},
	Name = "the executioner",
	RoomDesc = "The executioner stands here, waiting to torture some sorry soul.",
	FullDesc = [[
You see a burly man who is wearing a black hood that obscures his face.  He
has a very sadistic attitude and clearly loves his work.
]],
	Flags = {
		"stationary",
		"scavenger",
		"trashcollector",
		"aggro"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 19,
			Damage = "2d2+14",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 20,
		AC = 19,
		HP = "2d6+260",
		XPValue = 40000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12036",
	Keywords = {
		"baker"
	},
	Name = "the baker",
	RoomDesc = "The baker looks at you calmly, wiping flour from his face with one hand.",
	FullDesc = [[
A fat, nice looking baker.  But you can see that he has many scars on his
body.
]],
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "2d8+22",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "6d10+30000",
		XPValue = 80000
	},
	Gender = 1
})
Config.NewEntity({
	Key = "mob12037",
	Keywords = {
		"grocer"
	},
	Name = "the grocer",
	RoomDesc = "A grocer stands at the counter, with a slightly impatient look on his face.",
	FullDesc = "A tall grocer, who moves two 200 pounds bag of flour around on his shoulders.",
	Flags = {
		"stationary"
	},
	Attacks = {
		{
			Name = "Hit",
			ToHit = 20,
			Damage = "2d8+22",
			DamageType = "bludgeoning",
			VerbSingular = "hit",
			VerbPlural = "hits"
		}
	},
	Stats = {
		Level = 33,
		AC = 29,
		HP = "1d1+30000",
		XPValue = 80000
	},
	Gender = 1
})
