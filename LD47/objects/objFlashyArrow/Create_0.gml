/// @description Insert description here
// You can write your code in this editor


dir = point_direction(x, y, objGoal.x, objGoal.y);

image_angle = dir - 90;

flashTimeOff = room_speed / 3;
flashTimeOn = room_speed / 2;
lifeTime = room_speed * 3;

alarm[0] = lifeTime;
alarm[1] = flashTimeOn;

visible = true;
canEnd = false;