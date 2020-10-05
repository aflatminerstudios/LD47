/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Redefine random glompable spawns during level
glompableSpawnTime = room_speed * 3;
alarm[0] = glompableSpawnTime;
maxTimer = room_speed * 30;

//Redefine zooming behavior
preTime = 1 * room_speed;
zoomTime = 2 * room_speed;
zoomStart = 1;
zoomTarget = (1/3);
zoom = zoomStart;
alarm[4] = preTime + zoomTime;

if (placeholder != noone) {
  placeholder.x = 305;
  placeholder.y = 230;
}

won = false;