/// @description When colliding with player, end level
// You can write your code in this editor

if (place_meeting(x, y, objPlayer)) {  
  with (objRoomControlParent) {    
    won = true; 
    alarm[1] = 1;
  }
}