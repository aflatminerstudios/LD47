/// @description Setup Variables
// Setup Variables

ready = false;

//Ready to switch rooms after 1/2 second
alarm[0] = room_speed * 0.5;

//For target view
targetView = "title"; // "title, "credits", "instructions"


creditsX = 0;
titleX = 1600;
instructionsX = 1600;

show_debug_message("Title Screen");

music = sndTitle;
/*if (!audio_is_playing(music)) {
   audio_play_sound(music, 50, true);
}*/

audio_stop_sound(sndLoop);
audio_stop_sound(sndBloop);
audio_stop_sound(sndLoo);

alarm[1] = 1;

// Set up the BG based on the current theme
// This coud be moved to a script and called anytime inside a game mode
var colorBGLayerId = layer_get_id("Background");
var colorBGId = layer_background_get_id(colorBGLayerId);
layer_background_blend(colorBGId, global.currentTheme.backgroundImage);

var imageBGLayerId = layer_get_id("BackgroundImage");
var imageBGId = layer_background_get_id(imageBGLayerId);
layer_background_sprite(imageBGId, global.currentTheme.backgroundImage);
layer_background_htiled(imageBGId, true);
layer_background_vtiled(imageBGId, true);
