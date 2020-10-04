/// @description Insert description here
// You can write your code in this editor

event_inherited();


root = noone;
distanceFromRoot = 0;
angleFromRoot = 0;
angleDiffFromRoot = 0;
// This is the instance that is next closer to the player on the branch
parentAttachable = noone;


///ADDED BY JOHN
dotColor = choose(c_red, c_green, c_blue, c_purple, c_orange);
dotColor = choose($00ffc0, $00ffff, $ff00ff, $fafa02, $3409ff, $ffa711);
dotColor = circleTheme.trailColor;
drawPointX = 0;
drawPointY = 0;
stepsBetweenPoints = 5;
alarm[0] = stepsBetweenPoints;
list = ds_list_create();
//yList = ds_list_create();
maxList = 50;
lineWidth = 2;