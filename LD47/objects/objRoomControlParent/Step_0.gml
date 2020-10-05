/// @description 
// You can write your code in this editor

if (keyboard_check_pressed(ord("A"))) {
  scrToggleGreyscale(); 
}

if (keyboard_check_pressed(vk_escape)) {
  room_goto(roomTitleScreen); 
}

timer++;


//show_debug_message(string(canSpawnText) + " alarm: " + string(alarm[5]));

if ((zoom <= zoomTarget) && canSpawnText) {
  var r = irandom_range(0, ds_list_size(textList) - 1);
  var theText = textList[| r];
  
  scrScrollText(ticker, theText);
  canSpawnText = false;
}

if (!playing) {
  
  if (timer > preTime) {
    alarm[2] = 1; 
  }
  
}

