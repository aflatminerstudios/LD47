/// @description Insert description here
// You can write your code in this editor

event_inherited();
maxTimer = room_speed * 30;

startingGlompables = 25;
glompableSpawnTime = room_speed * 1.5;

shipsDestroyed = 0;
totalAttached = 0;


scrSpawnStartingGlompables(self.id);

var theText = "Live as long as you can!"; 
var tickerInstance = scrScrollText(ticker, theText);
canSpawnText = false;
tickerInstance.textOffset = room_width/2;