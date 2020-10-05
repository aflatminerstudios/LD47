/// @description Insert description here
// You can write your code in this editor

if (room == roomTitleScreen) {
  if (!audio_is_playing(sndTitle)) {
    audio_stop_sound(sndTitle);
    audio_stop_sound(sndLoop);
    audio_stop_sound(sndBloop);
    audio_stop_sound(sndLoo);
    audio_play_sound(sndTitle, 50, true);
  }
} else if (room != roomInitialize) {

  if (!audio_is_playing(music)) {
    audio_stop_sound(sndTitle);
    audio_stop_sound(sndLoop);
    audio_stop_sound(sndBloop);
    audio_stop_sound(sndLoo);
    audio_play_sound(music, 50, true);
  }
}