/// @description Insert description here
// You can write your code in this editor


// These should be set during the changeover from objGlompable to objAttachable
innerColor = c_white;
outerColor = c_white;
radius = 20;

 // Set this to 0 if you want to keep it from rotating separately from what it is attached to
baseAngularSpeedPerFrame = 4;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

internalAngle = 0; // This is our own rotation, separate from the overall stack

root = noone;
distanceFromRoot = 0;
angleFromRoot = 0;
angleDiffFromRoot = 0;
// Add parent attachable (or player) to determine if it's been knocked off -- Micha TODO
// This is the instance that is next closer to the player on the branch
parentAttachable = noone;




angle = 0; // This is the overall rotation, after adding all effects together

// This will need to be updated/transferred from objGlompable
var scale = (radius*2.0)/sprite_get_width(sprite_index);
image_xscale = scale;
image_yscale = scale;


///ADDED BY JOHN
dotColor = choose(c_red, c_green, c_blue, c_purple, c_orange);
dotColor = choose($00ffc0, $00ffff, $ff00ff, $fafa02, $3409ff, $ffa711);
drawPointX = 0;
drawPointY = 0;
stepsBetweenPoints = 5;
alarm[0] = stepsBetweenPoints;
list = ds_list_create();
//yList = ds_list_create();
maxList = 50;
lineWidth = 2;