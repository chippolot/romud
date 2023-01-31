package mud

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

// Map of defending element to attacking element multiplier (by defending element level)
// = [DefElemLevel][DefElem][AtkElem]Mult
var ElementLookup = [][][]float64{
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