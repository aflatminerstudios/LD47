/// @description Insert description here
// You can write your code in this editor

speedPerFrame = 3;

angle = 0;
baseAngularSpeedPerFrame = -1;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

radius = 50;

var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;