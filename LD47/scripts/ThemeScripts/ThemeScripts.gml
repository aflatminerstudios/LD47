// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Define the theme structure

// An overall theme (Stuck In The Loop, Stuck In The Loop, etc.)
ColorTheme = function(_name, _playerCircleTheme, _circleThemes, _backgroundColor, _backgroundOverlay) constructor {
	name = _name;
	// CircleTheme
	playerCircleTheme = _playerCircleTheme
	// Array of CircleThemes
	circleThemes = _circleThemes;
	backgroundColor = _backgroundColor;
	backgroundOverlay = _backgroundOverlay;
	// Add Nono's -- Micha TODO
	// Nonobomb
	// Nonosingleblade
	// Nonoturbine
	// Nonowedge
	// Nonoship
	// Nonobullet
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
	sprCircleBlue,
	sprGlowBlue,
	sprInsertBlueHoop,
	new TrailTheme(
		c_white,
		2,
		50,
	),
);

trailThemeTemplate = new TrailTheme(
	c_white,
	2,
	50,
);

////////////////////////////
// Stuck In The Loop Theme
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

stuckInTheLoopTheme = new ColorTheme(
	"Stuck In The Loop",
	playerCircleThemeLoop, 
	[
		circleThemeBlue,
		circleThemeCyan,
		circleThemeOrange,
		circleThemePink,
		circleThemeYellow
	],
	c_black, // Set these from Jodi's theme docs -- Micha TODO
	sprBackgroundCheckerboard
);

////////////////////////////
// Stuck In The Bloop Theme
stuckInTheBloopTheme = new ColorTheme(
	"Stuck In The Bloop",
 // This theme is a duplicate of Stuck in the Loop -- Micha TODO
	playerCircleThemeLoop, 
	[
		circleThemeBlue,
		circleThemeCyan,
		circleThemeOrange,
		circleThemePink,
		circleThemeYellow
	],
	c_green,
	sprBackgroundCheckerboard
);

////////////////////////////
// Stuck In The Loo Theme
stuckInTheLooTheme = new ColorTheme(
	"Stuck In The Loo",
// This theme is a duplicate of Stuck in the Loop -- Micha TODO
	playerCircleThemeLoop, 
	[
		circleThemeBlue,
		circleThemeCyan,
		circleThemeOrange,
		circleThemePink,
		circleThemeYellow
	],
	c_yellow,
	sprBackgroundCheckerboard
);

// Set up the global values
global.currentTheme = global.stuckInTheLoopTheme;
global.colorBlindModeOn = true;