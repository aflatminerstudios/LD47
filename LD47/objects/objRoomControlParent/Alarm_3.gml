/// @description Play beep
// You can write your code in this editor

if (!playing && count < (preTime + zoomTime) / room_speed) {
  count++;
  audio_play_sound(sndBeep, 100, false);
  alarm[3] = room_speed;
}



