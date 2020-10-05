/// @description Setup Variables
// Setup Variables

ready = false;

//Ready to switch rooms after 1/2 second
alarm[0] = room_speed * 0.5;

//For target view
targetView = "title"; // "title, "credits", "instructions"


creditsX = 0;
titleX = 400 + 100;
instructionsX = titleX + 400 + 100;

show_debug_message("Title Screen");

music = sndTitle;
if (!audio_is_playing(music)) {
   audio_play_sound(music, 50, true);
}

alarm[1] = 1;