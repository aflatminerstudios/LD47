/// @description Insert description here
// You can write your code in this editor

innerColor = choose($11cc11, $cc1111, $1111cc, $11cccc, $cc11cc);
outerColor = choose($11ff11, $ff1111, $1111ff, $11ffff, $ff11ff);
radius = irandom_range(10, 30)

 // Set this to 0 if you want to keep it from rotating separately from what it is attached to
baseAngularSpeedPerFrame = -2;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

shouldGearRotateWhenAttaching = false;


// Internals
internalAngle = 0; // This is our own rotation, separate from the overall stack

angle = 0; // This is the overall rotation, after adding all effects together

var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;
