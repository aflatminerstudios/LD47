/// @description Check timer
// You can write your code in this editor

event_inherited()

if (playing) {
  if (timer > maxTimer) {
    alarm[1] = 1; 
  }
} else {
  
  if (timer > preTime) {
    alarm[2] = 1; 
  }
  
}