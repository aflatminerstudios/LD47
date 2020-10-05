/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Redefine random glompable spawns during level
glompableSpawnTime = room_speed * 2;
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

ds_list_add(textList, "Watch out!!!", "Don't run into things!", "Does it hurt being so good?", "It's over there! No, not there.", "Do you know where you're going?");

var theText = "Collect loops and get to the goal!"; 
var tickerInstance = scrScrollText(ticker, theText);
canSpawnText = false;
tickerInstance.textOffset = room_width/3;