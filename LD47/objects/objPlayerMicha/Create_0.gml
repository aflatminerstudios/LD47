/// @description Insert description here
// You can write your code in this editor

// Move this to a better location --  Micha TODO
global.colorBlindModeOn = true;

glowSprite = sprGlowYellow;

speedPerFrame = 4;

angle = 0;
baseAngularSpeedPerFrame = -1;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

radius = 50;

// Internals
root = self;

var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;