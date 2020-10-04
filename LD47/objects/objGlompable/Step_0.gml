/// @description Insert description here
// You can write your code in this editor

internalAngle += angularSpeedPerFrame;
if(internalAngle > 360)
	internalAngle -= 360;
if(internalAngle < 0)
	internalAngle += 360;
	
angle = internalAngle;
image_angle = angle;