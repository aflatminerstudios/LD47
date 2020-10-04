/// @description Insert description here
// You can write your code in this editor

event_inherited();

// Get the player circle theme from the global theme
circleTheme = global.currentTheme.playerCircleTheme;

radius = 50;

// Recalculate this since we overrode the radius
var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;