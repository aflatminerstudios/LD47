/// @description Insert description here
// You can write your code in this editor

innerColor = choose($11cc11, $cc1111, $1111cc);
outerColor = choose($11ff11, $ff1111, $1111ff);
radius = irandom_range(10, 30)

angle = 0;

// This is only for the collision detection
image_xscale = (radius*2.0)/sprite_get_height(sprite_index);
image_yscale = (radius*2.0)/sprite_get_height(sprite_index);
