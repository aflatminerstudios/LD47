/// @description Insert description here
// You can write your code in this editor

minShipsPerSecond = 0.2;
maxShipsPerSecond = 1.25;
maxShipsTime = 45*room_speed;
shipsPerSecond = minShipsPerSecond;

alarm[0] = irandom(room_speed*2);// room_speed/shipsPerSecond;