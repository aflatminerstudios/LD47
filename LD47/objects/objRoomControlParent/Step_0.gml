/// @description 
// You can write your code in this editor

if (keyboard_check_pressed(ord("A"))) {
  scrToggleGreyscale(); 
}

if (keyboard_check_pressed(vk_escape)) {
  room_goto(roomTitleScreen); 
}

timer++;

if (instance_number(objTickerText) == 0) {
  
  scrScrollText(ticker, "Here is some text text!");
  
}

if (!playing) {
  
  if (timer > preTime) {
    alarm[2] = 1; 
  }
  
}