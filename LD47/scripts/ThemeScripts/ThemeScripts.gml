// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


// Define the theme structure

// An overall theme (Stuck In The Loop, Stuck In The Loop, etc.)
ColorTheme = function(_playerCircleTheme, _circleThemes) constructor {
	// CircleTheme
	playerCircleTheme = _playerCircleTheme
	// Array of CircleThemes
	circleThemes = _circleThemes 
};

// A single circle
CircleTheme = function(_mainSprite, _glowSprite, _colorAssistSprite, _trailColor) constructor {
	mainSprite = _mainSprite;
	glowSprite = _glowSprite;
	colorAssistSprite = _colorAssistSprite;
	trailColor = _trailColor;
}



////////////////////////////
// Stuck In The Loop Theme
playerCircleThemeLoop = new CircleTheme(
	sprCircleMultilines,
	sprGlowMultilines,
	noone,
	c_white
);

circleThemeBlue = new CircleTheme(
	sprCircleBlue,
	sprGlowBlue,
	sprInsertBlueHoop,
	c_blue
);

circleThemePink = new CircleTheme(
	sprCirclePink,
	sprGlowPink,
	sprInsertPinkStar,
	c_red
);

stuckInTheLoopTheme = new ColorTheme(
	playerCircleThemeLoop, 
	[
		circleThemeBlue, 
		circleThemePink
	]
);

////////////////////////////
// Stuck In The Bloop Theme


////////////////////////////
// Stuck In The Loo Theme


// Set up the global values
global.currentTheme = global.stuckInTheLoopTheme;
global.colorBlindModeOn = true;