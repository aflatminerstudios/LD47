/// @description Insert description here
// You can write your code in this editor

event_inherited();
maxTimer = room_speed * 20;

startingGlompables = 80;
glompableSpawnTime = room_speed * 2;

//Redefine zooming behavior
preTime = 1 * room_speed;
zoomTime = 2 * room_speed;
zoomStart = 1;
zoomTarget = (1/5);
zoom = zoomStart;
alarm[4] = preTime + zoomTime;

scrSpawnStartingGlompables(self.id);


ds_list_add(textList, "Get 'em!", "You can get more!", "More loops. Always more loops.", "Have you ever seen so many loops?");

var theText = "Collect as many loops as you can!"; 
var tickerInstance = scrScrollText(ticker, theText);
canSpawnText = false;
tickerInstance.textOffset = room_width/2;

won = true;