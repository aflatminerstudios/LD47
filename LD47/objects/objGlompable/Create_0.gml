/// @description Insert description here
// You can write your code in this editor



circleTheme = 0; // Make enum that loads a struct from the color, or something -- Micha TODO
color = "yellow"; // Make enum
glowSprite = sprGlowYellow;

//radius = irandom_range(10, 30);
radius = choose(10, 20, 25, 30, 35, 40);



 // Set this to 0 if you want to keep it from rotating separately from what it is attached to
baseAngularSpeedPerFrame = -2;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

shouldUseGearRatios = true;
shouldReverseRotationWhenAttaching = true; // Is included automatically if the shouldUseGearRatios is true


// Internals
internalAngle = 0; // This is our own rotation, separate from the overall stack

angle = 0; // This is the overall rotation, after adding all effects together

var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;

