/// @description Insert description here
// You can write your code in this editor

event_inherited();

// Get the player circle theme from the global theme
circleTheme = global.currentTheme.playerCircleTheme;

speedPerFrame = 4;
baseAngularSpeedPerFrame = -1;
angularSpeedPerFrame = baseAngularSpeedPerFrame;
radius = 50;

// Internals
root = self;

// Recalculate this since we overrode the radius
var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;