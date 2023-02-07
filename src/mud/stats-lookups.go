package mud

// Amount of XP needed for each level
var XPLookup = []int{
	0,
	0,
	9,
	25,
	50,
	86,
	163,
	275,
	428,
	628,
	881,
	1201,
	1586,
	2076,
	2661,
	3361,
	4191,
	5161,
	6281,
	7541,
	8961,
	10581,
	12441,
	14431,
	16671,
	19175,
	22125,
	25551,
	29485,
	33959,
	40848,
	48843,
	58017,
	68442,
	80190,
	94157,
	109932,
	127610,
	147287,
	169060,
	199603,
	233815,
	271880,
	313982,
	360305,
	413331,
	471750,
	535791,
	605683,
	681656,
	784124,
	899378,
	1028070,
	1170854,
	1328382,
	1506566,
	1702866,
	1918064,
	2152943,
	2408284,
	2738472,
	3104386,
	3507610,
	3949726,
	4432316,
	4969264,
	5554455,
	6189733,
	6876944,
	7617932,
	8543332,
	10017078,
	11611136,
	13330064,
	15178419,
	17160759,
	19390872,
	21777034,
	24324451,
	27038329,
	30244489,
	33925513,
	37947985,
	42325009,
	47069689,
	52195129,
	57962401,
	64166401,
	70821865,
	77943529,
	85546129,
	95284849,
	106934809,
	120578329,
	138917629,
	162754429,
	198412429,
	247099429,
	305234429,
	405234427,
}

// Amount of Job XP needed for each job level
// = [JobType][JobLevel]
var JobXPLookup = [][]int{
	// Novice
	{
		0,
		0,
		10,
		28,
		56,
		96,
		187,
		338,
		543,
		811,
		1151,
	},
	// First
	{
		0,
		0,
		30,
		73,
		131,
		207,
		323,
		503,
		723,
		995,
		1331,
		1851,
		2455,
		3154,
		3956,
		4904,
		6029,
		7697,
		9634,
		11860,
		14900,
		18888,
		24452,
		30724,
		37745,
		46859,
		58332,
		73622,
		90513,
		109083,
		132312,
		160671,
		197149,
		236865,
		279953,
		332370,
		394865,
		473025,
		557200,
		647604,
		755215,
		881130,
		1035071,
		1226852,
		1431203,
		1679555,
		1965767,
		2352138,
		2761933,
		3244025,
		3753621,
	},
	// Second
	{
		0,
		0,
		144,
		328,
		612,
		960,
		1563,
		2450,
		3546,
		5144,
		7684,
		11360,
		15650,
		20596,
		27275,
		36767,
		49537,
		63881,
		79886,
		100528,
		127962,
		163070,
		201647,
		243853,
		296561,
		363532,
		446220,
		535764,
		632433,
		750254,
		895175,
		1069376,
		1256053,
		1455637,
		1694254,
		1980620,
		2317767,
		2676202,
		3056578,
		3504263,
		4031252,
		4641498,
		5286234,
		6079769,
		7001579,
		8108337,
		9369292,
		10856596,
		12414253,
		14404885,
		16488271,
	},
}

// Map of defending element to attacking element multiplier (by defending element level)
// = [DefElemLevel][DefElem][AtkElem]Mult
var DefenderElementModifierLookup = [][][]float64{
	// Level 1
	{
		{1, 1, 1, 1, 1, 1, 1, 1, 0.25, 1},                   // Neutral
		{1, 0.25, 1, 0.5, 1.75, 1, 1, 1, 1, 1},              // Water
		{1, 1, 1, 1.5, 0.5, 1.25, 1, 1, 1, 1},               // Earth
		{1, 1.5, 0.5, 0.25, 1, 1.25, 1, 1, 1, 1},            // Fire
		{1, 0.5, 1.5, 1, 0.25, 1.25, 1, 1, 1, 1},            // Wind
		{1, 1, 1, 1, 1, 0, 1, 0.5, 1, 0.5},                  // Poison
		{1, 0.75, 0.75, 0.75, 0.75, 0.75, 0, 1.25, 0.75, 1}, // Holy
		{1, 1, 1, 1, 1, 0.5, 1.25, 0, 0.75, 0},              // Shadow
		{0.25, 1, 1, 1, 1, 1, 1, 1, 1.25, 1},                // Ghost
		{1, 1, 1, 1.25, 1, -0.25, 1.5, -0.25, 1, 0},         // Undead
	},
	// Level 2
	{
		{1, 1, 1, 1, 1, 1, 1, 1, 0, 1},                        // Neutral
		{1, 0, 1, 0.25, 1.75, 0.75, 1, 1, 0.75, 0.75},         // Water
		{1, 1, 0.5, 1.75, 0.25, 1.25, 1, 1, 0.75, 0.75},       // Earth
		{1, 1.75, 0.25, 0, 1, 1.25, 1, 1, 0.75, 0.75},         // Fire
		{1, 0.25, 1.75, 1, 0, 1.25, 1, 1, 0.75, 0.75},         // Wind
		{1, 1, 1, 1, 1, 0, 1, 0.25, 0.75, 0.25},               // Poison
		{1, 0.5, 0.5, 0.5, 0.5, 0.5, -0.25, 1.5, 0.5, 1.25},   // Holy
		{1, 0.75, 0.75, 0.75, 0.75, 0.25, 1.5, -0.25, 0.5, 0}, // Shadow
		{0.25, 1, 1, 1, 1, 0.75, 1, 1, 1.5, 1},                // Ghost
		{1, 1, 1, 1.5, 1, -0.5, 1.75, -0.5, 1.25, 0},          // Undead
	},
	// Level 3
	{
		{1, 1, 1, 1, 1, 1, 1, 1, 0, 1},                           // Neutral
		{1, -0.25, 1, 0, 2, 0.5, 1, 1, 0.5, 0.5},                 // Water
		{1, 1, 0, 2, 0, 1, 1, 1, 0.5, 0.5},                       // Earth
		{1, 2, 0, -0.25, 1, 1, 1, 1, 0.5, 0.5},                   // Fire
		{1, 0, 2, 1, -0.25, 1, 1, 1, 0.5, 0.5},                   // Wind
		{1, 1, 1, 1, 1, 0, 1.25, 0, 0.5, 0},                      // Poison
		{1, 0.25, 0.25, 0.25, 0.25, 0.25, -0.5, 1.75, 0.25, 1.5}, // Holy
		{1, 0.5, 0.5, 0.5, 0.5, 0, 1.75, -0.5, 0.25, 0},          // Shadow
		{0, 1, 1, 1, 1, 0.5, 1, 1, 1.75, 1},                      // Ghost
		{1, 1.25, 1, 1.75, 1, -0.75, 2, -0.75, 1.5, 0},           // Undead
	},
	// Level 4
	{
		{1, 1, 1, 1, 1, 1, 1, 1, 0, 1},                           // Neutral
		{1, -0.5, 1, 0, 2, 0.25, 0.75, 0.75, 0.25, 0.25},         // Water
		{1, 1, -0.25, 2, 0, 0.75, 0.75, 0.75, 0.25, 0.25},        // Earth
		{1, 2, 0, -0.5, 1, 0.75, 0.75, 0.75, 0.25, 0.25},         // Fire
		{1, 0, 2, 1, -0.5, 0.75, 0.75, 0.75, 0.25, 0.25},         // Wind
		{1, 0.75, 0.75, 0.75, 0.75, 0, 1.25, -0.25, 0.25, -0.25}, // Poison
		{1, 0, 0, 0, 0, 0, -1, 2, 0, 1.75},                       // Holy
		{1, 0.25, 0.25, 0.25, 0.25, -0.25, 2, -1, 0, 0},          // Shadow
		{0, 1, 1, 1, 1, 0.25, 1, 1, 2, 1},                        // Ghost
		{1, 1.5, 0.5, 2, 1, -1, 2, -1, 1.75, 0},                  // Undead
	},
}

// Determines damage modification multiplier when attacking entity of specified size with weapon type
// = [Size][WeaponType]Mult
var DefenderSizeModifierLookup = [][]float64{
	{1, 1, 0.75, 0.75, 0.75, 0.75, 0.5, 0.75, 1, 1, 0.75, 1, 1, 0.75, 0.75}, // Small
	{1, 0.75, 1, 0.75, 0.75, 1, 0.75, 1, 1, 1, 1, 1, 0.75, 1, 1},            // Medium
	{1, 0.5, 0.75, 1, 1, 1, 1, 1, 1, 0.75, 0.75, 0.5, 0.5, 0.75, 0.5},       //Large
}

// Converts Speed enum to number of cells that entity can traverse per second
var CellsPerSecondSpeedLookup = []float64{
	0,    //Immovable
	2.5,  // Very Slow
	3.33, // Slow
	6.66, // Fast
	10,   // Very Fast
}

// TODO: Jobs: Remove
/*
// Job type to MaxHP modifier lookup
var JobMaxHPModifierLookup = map[JobTypeMask]float64{
	JobType_Novice:     0.0,
	JobType_Swordman:   0.7,
	JobType_Archer:     0.5,
	JobType_Thief:      0.5,
	JobType_Acolyte:    0.4,
	JobType_Merchant:   0.4,
	JobType_Mage:       0.3,
	JobType_Knight:     1.5,
	JobType_Hunter:     0.85,
	JobType_Crusader:   1.1,
	JobType_Wizard:     0.55,
	JobType_Sage:       0.75,
	JobType_Bard:       0.75,
	JobType_Dancer:     0.75,
	JobType_Blacksmith: 0.9,
	JobType_Alchemist:  0.9,
	JobType_Assassin:   1.1,
	JobType_Rogue:      0.85,
	JobType_Priest:     0.75,
	JobType_Monk:       0.9,
}

// Job type to MaxSP modifier lookup
var JobMaxSPModifierLookup = map[JobTypeMask]float64{
	JobType_Novice:     1.0,
	JobType_Swordman:   2.0,
	JobType_Archer:     2.0,
	JobType_Thief:      2.0,
	JobType_Acolyte:    5.0,
	JobType_Merchant:   3.0,
	JobType_Mage:       6.0,
	JobType_Knight:     3.0,
	JobType_Hunter:     4.0,
	JobType_Assassin:   4.0,
	JobType_Priest:     8.0,
	JobType_Blacksmith: 4.0,
	JobType_Wizard:     9.0,
	JobType_Crusader:   4.7,
	JobType_Bard:       6.0,
	JobType_Dancer:     6.0,
	JobType_Rogue:      5.0,
	JobType_Monk:       4.7,
	JobType_Alchemist:  4.0,
	JobType_Sage:       7.0,
}

// Job type to CarryingCapacity modifier lookup
var JobCarryingCapacityModifierLookup = map[JobTypeMask]int{
	JobType_Novice:     0,
	JobType_Swordman:   800,
	JobType_Archer:     600,
	JobType_Thief:      400,
	JobType_Acolyte:    400,
	JobType_Merchant:   800,
	JobType_Mage:       200,
	JobType_Knight:     800,
	JobType_Hunter:     700,
	JobType_Assassin:   400,
	JobType_Priest:     600,
	JobType_Blacksmith: 1000,
	JobType_Wizard:     400,
	JobType_Crusader:   800,
	JobType_Bard:       700,
	JobType_Dancer:     700,
	JobType_Rogue:      400,
	JobType_Monk:       600,
	JobType_Alchemist:  1000,
	JobType_Sage:       400,
}
*/
