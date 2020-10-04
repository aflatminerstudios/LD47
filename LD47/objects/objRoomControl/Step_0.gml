/// @description 
// You can write your code in this editor

if (keyboard_check_pressed(ord("A"))) {
  scrToggleGreyscale(); 
}

timer++;

if (instance_number(objTickerText) == 0) {
  
  scrScrollText(ticker, "Here is some text text!");
  
}