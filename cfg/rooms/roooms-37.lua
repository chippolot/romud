Config.NewRoom({
	Id = 3601,
	Name = "The Great Chessboard Of Midgaard",
	Desc = [[   You stand in the archway of the Chessboard of Midgaard.  The giant
wooden gate is rusted open.
   A narrow dirt path leads eastwards into the thick grass and the
chessboard opens up to the west.]],
	Exits = {
		east = 3067,
		west = 3633
	}
})
Config.NewRoom({
	Id = 3602,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the Black Queen's Rook.]],
	Exits = {
		east = 3603,
		south = 3610
	}
})
Config.NewRoom({
	Id = 3603,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the Black Queen's Knight.]],
	Exits = {
		east = 3604,
		south = 3611,
		west = 3602
	}
})
Config.NewRoom({
	Id = 3604,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the Black Queen's Bishop.]],
	Exits = {
		east = 3605,
		south = 3612,
		west = 3603
	}
})
Config.NewRoom({
	Id = 3605,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the Black Queen.]],
	Exits = {
		east = 3606,
		south = 3613,
		west = 3604,
		down = 3666
	}
})
Config.NewRoom({
	Id = 3606,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the Black King.]],
	Exits = {
		east = 3607,
		south = 3614,
		west = 3605
	}
})
Config.NewRoom({
	Id = 3607,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the Black King's Bishop.]],
	Exits = {
		east = 3608,
		south = 3615,
		west = 3606
	}
})
Config.NewRoom({
	Id = 3608,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the Black King's Knight.]],
	Exits = {
		east = 3609,
		south = 3616,
		west = 3607
	}
})
Config.NewRoom({
	Id = 3609,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the Black King's Rook.]],
	Exits = {
		south = 3617,
		west = 3608
	}
})
Config.NewRoom({
	Id = 3610,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the Black Queen's Pawns.]],
	Exits = {
		north = 3602,
		east = 3611,
		south = 3618
	}
})
Config.NewRoom({
	Id = 3611,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the Black Queen's Pawns.]],
	Exits = {
		north = 3603,
		east = 3612,
		south = 3619,
		west = 3610
	}
})
Config.NewRoom({
	Id = 3612,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the Black Queen's Pawns.]],
	Exits = {
		north = 3604,
		east = 3613,
		south = 3620,
		west = 3611
	}
})
Config.NewRoom({
	Id = 3613,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the Black Queen's Pawns.]],
	Exits = {
		north = 3605,
		east = 3614,
		south = 3621,
		west = 3612
	}
})
Config.NewRoom({
	Id = 3614,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the Black King's Pawns.]],
	Exits = {
		north = 3606,
		east = 3615,
		south = 3622,
		west = 3613
	}
})
Config.NewRoom({
	Id = 3615,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the Black King's Pawns.]],
	Exits = {
		north = 3607,
		east = 3616,
		south = 3623,
		west = 3614
	}
})
Config.NewRoom({
	Id = 3616,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the Black King's Pawns.]],
	Exits = {
		north = 3608,
		east = 3617,
		south = 3624,
		west = 3615
	}
})
Config.NewRoom({
	Id = 3617,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the Black King's Pawns.]],
	Exits = {
		north = 3609,
		south = 3625,
		west = 3616
	}
})
Config.NewRoom({
	Id = 3618,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3610,
		east = 3619,
		south = 3626
	}
})
Config.NewRoom({
	Id = 3619,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3611,
		east = 3620,
		south = 3627,
		west = 3618
	}
})
Config.NewRoom({
	Id = 3620,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3612,
		east = 3621,
		south = 3628,
		west = 3619
	}
})
Config.NewRoom({
	Id = 3621,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3613,
		east = 3622,
		south = 3629,
		west = 3620
	}
})
Config.NewRoom({
	Id = 3622,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3614,
		east = 3623,
		south = 3630,
		west = 3621
	}
})
Config.NewRoom({
	Id = 3623,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3615,
		east = 3624,
		south = 3631,
		west = 3622
	}
})
Config.NewRoom({
	Id = 3624,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3616,
		east = 3625,
		south = 3632,
		west = 3623
	}
})
Config.NewRoom({
	Id = 3625,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  You can see a rusty gate
to the south.]],
	Exits = {
		north = 3617,
		south = 3633,
		west = 3624
	}
})
Config.NewRoom({
	Id = 3626,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3618,
		east = 3627,
		south = 3634
	}
})
Config.NewRoom({
	Id = 3627,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3619,
		east = 3628,
		south = 3635,
		west = 3626
	}
})
Config.NewRoom({
	Id = 3628,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3620,
		east = 3629,
		south = 3636,
		west = 3627
	}
})
Config.NewRoom({
	Id = 3629,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3621,
		east = 3630,
		south = 3637,
		west = 3628
	}
})
Config.NewRoom({
	Id = 3630,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3622,
		east = 3631,
		south = 3638,
		west = 3629
	}
})
Config.NewRoom({
	Id = 3631,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3623,
		east = 3632,
		south = 3639,
		west = 3630
	}
})
Config.NewRoom({
	Id = 3632,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  There is a rusty gate
a short distance to the east.]],
	Exits = {
		north = 3624,
		east = 3633,
		south = 3640,
		west = 3631
	}
})
Config.NewRoom({
	Id = 3633,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  There is a large rusty
gate to the east.]],
	Exits = {
		north = 3625,
		east = 3601,
		south = 3641,
		west = 3632
	}
})
Config.NewRoom({
	Id = 3634,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3626,
		east = 3635,
		south = 3642
	}
})
Config.NewRoom({
	Id = 3635,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3627,
		east = 3636,
		south = 3643,
		west = 3634
	}
})
Config.NewRoom({
	Id = 3636,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3628,
		east = 3637,
		south = 3644,
		west = 3635
	}
})
Config.NewRoom({
	Id = 3637,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3629,
		east = 3638,
		south = 3645,
		west = 3636
	}
})
Config.NewRoom({
	Id = 3638,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3630,
		east = 3639,
		south = 3646,
		west = 3637
	}
})
Config.NewRoom({
	Id = 3639,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3631,
		east = 3640,
		south = 3647,
		west = 3638
	}
})
Config.NewRoom({
	Id = 3640,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3632,
		east = 3641,
		south = 3648,
		west = 3639
	}
})
Config.NewRoom({
	Id = 3641,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  There is a rusty gate
to the north.]],
	Exits = {
		north = 3633,
		south = 3649,
		west = 3640
	}
})
Config.NewRoom({
	Id = 3642,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3634,
		east = 3643,
		south = 3650
	}
})
Config.NewRoom({
	Id = 3643,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3635,
		east = 3644,
		south = 3651,
		west = 3642
	}
})
Config.NewRoom({
	Id = 3644,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3636,
		east = 3645,
		south = 3652,
		west = 3643
	}
})
Config.NewRoom({
	Id = 3645,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3637,
		east = 3646,
		south = 3653,
		west = 3644
	}
})
Config.NewRoom({
	Id = 3646,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3638,
		east = 3647,
		south = 3654,
		west = 3645
	}
})
Config.NewRoom({
	Id = 3647,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3639,
		east = 3648,
		south = 3655,
		west = 3646
	}
})
Config.NewRoom({
	Id = 3648,
	Name = "A Black Square",
	Desc = "   You are standing on a black marble square.",
	Exits = {
		north = 3640,
		east = 3649,
		south = 3656,
		west = 3647
	}
})
Config.NewRoom({
	Id = 3649,
	Name = "A White Square",
	Desc = "   You are standing on a white marble square.",
	Exits = {
		north = 3641,
		south = 3657,
		west = 3648
	}
})
Config.NewRoom({
	Id = 3650,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the White Queen's Pawns.]],
	Exits = {
		north = 3642,
		east = 3651,
		south = 3658
	}
})
Config.NewRoom({
	Id = 3651,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the White Queen's Pawns.]],
	Exits = {
		north = 3643,
		east = 3652,
		south = 3659,
		west = 3650
	}
})
Config.NewRoom({
	Id = 3652,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the White Queen's Pawns.]],
	Exits = {
		north = 3644,
		east = 3653,
		south = 3660,
		west = 3651
	}
})
Config.NewRoom({
	Id = 3653,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the White Queen's Pawns.]],
	Exits = {
		north = 3645,
		east = 3654,
		south = 3661,
		west = 3652
	}
})
Config.NewRoom({
	Id = 3654,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the White King's Pawns.]],
	Exits = {
		north = 3646,
		east = 3655,
		south = 3662,
		west = 3653
	}
})
Config.NewRoom({
	Id = 3655,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the White King's Pawns.]],
	Exits = {
		north = 3647,
		east = 3656,
		south = 3663,
		west = 3654
	}
})
Config.NewRoom({
	Id = 3656,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of one of the White King's Pawns.]],
	Exits = {
		north = 3648,
		east = 3657,
		south = 3664,
		west = 3655
	}
})
Config.NewRoom({
	Id = 3657,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of one of the White King's Pawns.]],
	Exits = {
		north = 3649,
		south = 3665,
		west = 3656
	}
})
Config.NewRoom({
	Id = 3658,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the White Queen's Rook.]],
	Exits = {
		north = 3650,
		east = 3659
	}
})
Config.NewRoom({
	Id = 3659,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the White Queen's Knight.]],
	Exits = {
		north = 3651,
		east = 3660,
		west = 3658
	}
})
Config.NewRoom({
	Id = 3660,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the White Queen's Bishop.]],
	Exits = {
		north = 3652,
		east = 3661,
		west = 3659
	}
})
Config.NewRoom({
	Id = 3661,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the White Queen.]],
	Exits = {
		north = 3653,
		east = 3662,
		west = 3660,
		down = 3667
	}
})
Config.NewRoom({
	Id = 3662,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the White King.]],
	Exits = {
		north = 3654,
		east = 3663,
		west = 3661
	}
})
Config.NewRoom({
	Id = 3663,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the White King's Bishop.]],
	Exits = {
		north = 3655,
		east = 3664,
		west = 3662
	}
})
Config.NewRoom({
	Id = 3664,
	Name = "A Black Square",
	Desc = [[   You are standing on a black marble square.  This is usually the home
of the White King's Knight.]],
	Exits = {
		north = 3656,
		east = 3665,
		west = 3663
	}
})
Config.NewRoom({
	Id = 3665,
	Name = "A White Square",
	Desc = [[   You are standing on a white marble square.  This is usually the home
of the White King's Rook.]],
	Exits = {
		north = 3657,
		west = 3664
	}
})
Config.NewRoom({
	Id = 3666,
	Name = "The Black Treasury",
	Desc = [[   You are standing in the treasury of the Black Court.  Hopefully no one 
has looted the Crown's treasure.]],
	Exits = {
		up = 3605
	}
})
Config.NewRoom({
	Id = 3667,
	Name = "The White Treasury",
	Desc = [[   You are standing in the treasury of the White Court.  Hopefully no one 
has looted the Crown's treasure.]],
	Exits = {
		up = 3661
	}
})
