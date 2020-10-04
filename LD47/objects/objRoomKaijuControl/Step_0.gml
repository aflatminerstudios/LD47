/// @description Insert description here
// You can write your code in this editor


timer++;
if (playing) {
  if (timer > maxTimer) {
    alarm[1] = 1; 
  }
} else {
  
  if (timer > preTime) {
    alarm[2] = 1; 
  }

  
}

if (instance_number(objTickerText) == 0) {
  
  scrScrollText(ticker, "Here is some text text!");
  
}