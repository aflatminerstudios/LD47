/// @description Checks for key presses to go to other rooms

if (keyboard_check_pressed(vk_escape)) {
    room_goto(roomTitleScreen);
}
