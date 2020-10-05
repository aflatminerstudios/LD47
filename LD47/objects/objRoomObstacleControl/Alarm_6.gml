/// @description Spawn arrow
// You can write your code in this editor

var dir = point_direction(objPlayer.x, objPlayer.y, objGoal.x, objGoal.y);

var xx = objPlayer.x + lengthdir_x(200, dir);
var yy = objPlayer.y + lengthdir_y(200, dir);

instance_create_layer(xx, yy, "UI", objFlashyArrow);

alarm[6] = room_speed * 10;