/// @description Checks for key presses to go to other rooms


//Only switch rooms after ready
if (ready) {
	if (keyboard_check_pressed(ord("M"))) {
    room_goto(roomTestMicha); 
  } else if (keyboard_check_pressed(vk_anykey)) {
    room_goto(roomMainRoom); 
  }
}