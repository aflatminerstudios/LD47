/// @description Checks for key presses to go to other rooms


//Only switch rooms after ready
if (ready) {
  if (scrIsRightPressed() || keyboard_check_pressed(ord("I"))) {
		if(targetView == "title")
			targetView = "instructions";
		else if(targetView == "credits")
			targetView = "title";
  } else if (scrIsLeftPressed() || keyboard_check_pressed(ord("C"))) {
		if(targetView == "instructions")
			targetView = "title";
		else if(targetView == "title")
			targetView = "credits";
  } else if (keyboard_check_pressed(ord("M"))) {
    room_goto(roomTestMicha);
  } else if (keyboard_check_pressed(ord("J"))) {
    room_goto(roomJohnTest);
  } else if (keyboard_check_pressed(ord("K"))) {
    room_goto(roomKaiju); 
  } else if (keyboard_check_pressed(ord("O"))) {
    room_goto(roomObstacle2); 
  } else if (keyboard_check_pressed(ord("B"))) {
    room_goto(roomBulletBoss); 
  } else if (keyboard_check_pressed(ord("T"))) {
    if(global.currentTheme == global.stuckInTheLoopTheme)
			global.currentTheme = global.stuckInTheBloopTheme;
		else if(global.currentTheme == global.stuckInTheBloopTheme)
			global.currentTheme = global.stuckInTheLooTheme;
		else if(global.currentTheme == global.stuckInTheLooTheme)
			global.currentTheme = global.stuckInTheLoopTheme;
  } else if (keyboard_check_pressed(ord("Y"))) {
    global.colorBlindModeOn = !global.colorBlindModeOn;
  } else if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    scrPlayGame(); 
  }
  /*else if (keyboard_check_pressed(vk_anykey)) {// || mouse_check_button_pressed(mb_any)) {
    room_goto(roomMainRoom);
  }*/
}

var activeCamera = view_camera[0];
/*if(global.aspectRatio == AspectRatio.FULL_SCREEN)
	activeCamera = view_camera[0];
else if(global.aspectRatio == AspectRatio.WIDE_SCREEN)
	activeCamera = view_camera[1];*/


var cameraX = camera_get_view_x(activeCamera);
var cameraY = camera_get_view_y(activeCamera);

var targetX = cameraX;
if(targetView == "title") {
	targetX = titleX;
} else if(targetView == "credits") {
	targetX = creditsX;
} else if(targetView == "instructions") {
	targetX = instructionsX;
}

var newCameraX = cameraX;

if (targetX != cameraX) {
  //show_debug_message(string(cameraX) + " to " + string(targetX));
	newCameraX = lerp(cameraX, targetX, 0.14);
	if(abs(newCameraX - targetX) < 2)
		newCameraX = targetX;
	camera_set_view_pos(activeCamera, newCameraX, cameraY);
}

var slideFactor = 1.5;
/*
layer_x("Credits", -slideFactor * newCameraX);
layer_x("Title", -slideFactor * (newCameraX - titleX) );
layer_x("Instructions", -slideFactor * (newCameraX - instructionsX));*/
