/// @description When colliding with player, end level
// You can write your code in this editor

if (place_meeting(x, y, objPlayer)) {
  show_message("You finished the level!");
  room_goto(roomTitleScreen);
}