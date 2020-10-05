// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Define the theme structure

// An overall theme (Stuck In The Loop, Stuck In The Loop, etc.)
ColorTheme = function(_name, _playerCircleTheme, _circleThemes, _backgroundColor, _backgroundImage,
											_nonoBomb, _nonoBullet, _nonoShip, _nonoSingleBlade, _nonoTurbine, _nonoWedge) constructor {
	name = _name;
	// CircleTheme
	playerCircleTheme = _playerCircleTheme
	// Array of CircleThemes
	circleThemes = _circleThemes;
	backgroundColor = _backgroundColor;
	backgroundImage = _backgroundImage;
	// Nono sprites
	nonoBomb = _nonoBomb;
	nonoBullet = _nonoBullet;
	nonoShip = _nonoShip;
	nonoSingleBlade = _nonoSingleBlade;
	nonoTurbine = _nonoTurbine;
	nonoWedge = _nonoWedge;
};

// A single circle
CircleTheme = function(_name, _mainSprite, _glowSprite, _colorAssistSprite, _trail) constructor {
	name = _name;
	mainSprite = _mainSprite;
	glowSprite = _glowSprite;
	colorAssistSprite = _colorAssistSprite;
	trail = _trail;
}

// Trail color/style
TrailTheme = function(_color, _lineWidth, _maxList) constructor {
	color = _color;
	lineWidth = _lineWidth;
	maxList = _maxList; // This is the max number of points in a trail
}

circleThemeTemplate = new CircleTheme(
	"Template",
	sprCircleBlue, // main sprite
	sprGlowBlue, // glow underneath
	sprInsertBlueHoop, // visual assist (inside circle)
	new TrailTheme(
		c_white, // trail color
		2, // trail width in pixels
		50, // maximum points on the trail
	),
);

trailThemeTemplate = new TrailTheme(
	c_white,
	2,
	50,
);


////////////////////////////////
// Stuck In The Loop Sub-Themes
playerCircleThemeLoop = new CircleTheme(
	"Player",
	sprCircleMultilines,
	sprGlowMultilines,
	noone,
	new TrailTheme(
		$00ffc0,
		2,
		50,
	),
);

circleThemeBlue = new CircleTheme(
	"Blue",
	sprCircleBlue,
	sprGlowBlue,
	sprInsertBlueHoop,
	new TrailTheme(
		$ff0934, // FYI, this shorthand format is BGR, not RGB!
		2,
		50,
	),
);

circleThemeCyan = new CircleTheme(
	"Cyan",
	sprCircleCyan,
	sprGlowCyan,
	sprInsertCyanCrescent,
	new TrailTheme(
		$ffff00,
		2,
		50,
	),
);

circleThemeOrange = new CircleTheme(
	"Orange",
	sprCircleOrange,
	sprGlowOrange,
	sprInsertOrangeFlower,
	new TrailTheme(
		$11a7ff,
		2,
		50,
	),
);

circleThemePink = new CircleTheme(
	"Pink",
	sprCirclePink,
	sprGlowPink,
	sprInsertPinkStar,
	new TrailTheme(
		$ff00ff,
		2,
		50,
	),
);

circleThemeYellow = new CircleTheme(
	"Yellow",
	sprCircleYellow,
	sprGlowYellow,
	sprInsertYellowSquare,
	new TrailTheme(
		$02fafa,
		2,
		50,
	),
);


/////////////////////////////////
// Stuck In The Bloop Sub-Themes
circleThemeBloopBlue = new CircleTheme(
	"Bloop Blue",
	sprCircleBloopBlue,
	noone,
	noone,
	new TrailTheme(
		$ffc000,
		2,
		50,
	),
);

circleThemeBloopCyan = new CircleTheme(
	"Bloop Cyan",
	sprCircleBloopCyan,
	noone,
	noone,
	new TrailTheme(
		$ffff00,
		2,
		50,
	),
);

circleThemeBloopNavy = new CircleTheme(
	"Bloop Navy",
	sprCircleBloopNavy,
	noone,
	noone,
	new TrailTheme(
		$db1500,
		2,
		50,
	),
);

circleThemeBloopPink = new CircleTheme(
	"Bloop Pink",
	sprCircleBloopPink,
	noone,
	noone,
	new TrailTheme(
		$df00b8,
		2,
		50,
	),
);

circleThemeBloopPurple = new CircleTheme(
	"Bloop Purple",
	sprCircleBloopPurple,
	noone,
	noone,
	new TrailTheme(
		$ff99d5,
		2,
		50,
	),
);

circleThemeBloopWhite = new CircleTheme(
	"Bloop White",
	sprCircleBloopWhite,
	noone,
	noone,
	new TrailTheme(
		$ffefc0,
		2,
		50,
	),
);



///////////////////////////////
// Stuck In The Loo Sub-Themes
circleThemeLooBlack = new CircleTheme(
	"Loo Black",
	sprCircleLooBlack,
	sprGlowLoo,
	noone,
	new TrailTheme(
		$022033,
		2,
		50,
	),
);

circleThemeLooBrown = new CircleTheme(
	"Loo Brown",
	sprCircleLooBrown,
	sprGlowLoo,
	noone,
	new TrailTheme(
		$00517e,
		2,
		50,
	),
);

circleThemeLooOrange = new CircleTheme(
	"Loo Orange",
	sprCircleLooOrange,
	sprGlowLoo,
	noone,
	new TrailTheme(
		$22b7ff,
		2,
		50,
	),
);

circleThemeLooRed = new CircleTheme(
	"Loo Red",
	sprCircleLooRed,
	sprGlowLoo,
	noone,
	new TrailTheme(
		$1c4bac,
		2,
		50,
	),
);

circleThemeLooTan = new CircleTheme(
	"Loo Tan",
	sprCircleLooTan,
	sprGlowLoo,
	noone,
	new TrailTheme(
		$2c8bb7,
		2,
		50,
	),
);

circleThemeLooYellow = new CircleTheme(
	"Loo Yellow",
	sprCircleLooYellow,
	sprGlowLoo,
	noone,
	new TrailTheme(
		$02e4ff,
		2,
		50,
	),
);



// Full Theme definitions

global.stuckInTheLoopTheme = new ColorTheme(
	"Stuck In The Loop",
	playerCircleThemeLoop, 
	[
		circleThemeBlue,
		circleThemeCyan,
		circleThemeOrange,
		circleThemePink,
		circleThemeYellow,
	],
	$5b2c2b, // background color (behind the tiled background sprites)
	sprBackgroundLoop,
	sprNoBomb, 
	sprNoBullet, 
	sprNoShip, 
	sprNoSingleBlade,
	sprNoTurbine, 
	sprNoWedge,
);

////////////////////////////
// Stuck In The Bloop Theme
global.stuckInTheBloopTheme = new ColorTheme(
	"Stuck In The Bloop",
	//playerCircleThemeLoop, 
	circleThemeBloopWhite,
	[
		circleThemeBloopBlue,
		circleThemeBloopCyan,
		circleThemeBloopNavy,
		circleThemeBloopPink,
		circleThemeBloopPurple,
	],
	$230a06, // background color (behind the tiled background sprites)
	sprBackgroundBloop,
	sprNoBomb, 
	sprNoBullet, 
	sprNoShip, 
	sprNoSingleBlade,
	sprNoTurbine, 
	sprNoWedge,
);

////////////////////////////
// Stuck In The Loo Theme
global.stuckInTheLooTheme = new ColorTheme(
	"Stuck In The Loo",
// This theme is a duplicate of Stuck in the Loop -- Micha TODO
	//playerCircleThemeLoop, 
	circleThemeLooBlack,
	[
		circleThemeLooBrown,
		circleThemeLooOrange,
		circleThemeLooRed,
		circleThemeLooTan,
		circleThemeLooYellow,
	],
	$e8faff, // background color (behind the tiled background sprites)
	sprBackgroundLoo,
	sprNoBomb, 
	sprNoBullet, 
	sprNoShip, 
	sprNoSingleBlade,
	sprNoTurbine, 
	sprNoWedge,
);

// Set up the global values
global.currentTheme = global.stuckInTheLoopTheme;
global.colorBlindModeOn = true;