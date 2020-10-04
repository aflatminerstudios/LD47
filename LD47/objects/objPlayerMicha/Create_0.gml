/// @description Insert description here
// You can write your code in this editor


// choose a random circle theme from the global theme
circleTheme = global.currentTheme.playerCircleTheme;

speedPerFrame = 4;

angle = 0;
baseAngularSpeedPerFrame = -1;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

radius = 50;

// Internals
root = self;
internalAngle = 0; // This is our own rotation, separate from the overall stack

var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;