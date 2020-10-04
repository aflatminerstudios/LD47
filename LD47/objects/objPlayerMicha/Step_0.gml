/// @description Insert description here
// You can write your code in this editor

// Move via keyboard arrows
var dirX = keyboard_check(vk_right) - keyboard_check(vk_left);
var dirY = keyboard_check(vk_down) - keyboard_check(vk_up);

var oldX = x;
var oldY = y;

x = x + dirX*speedPerFrame;
y = y + dirY*speedPerFrame;

if (place_meeting(x, y, objNoNoParent)) {
  x = oldX;
  y = oldY;
}


// Rotate some per frame
internalAngle = internalAngle + angularSpeedPerFrame
if(internalAngle > 360)
	internalAngle -= 360;
if(internalAngle < 0)
	internalAngle += 360;
	
angle = internalAngle;
image_angle = angle;
