/// @description Insert description here
// You can write your code in this editor

var oldX = x;
var oldY = y;

x = root.x + lengthdir_x(distanceFromRoot, root.angle + angleFromRoot);
y = root.y + lengthdir_y(distanceFromRoot, root.angle + angleFromRoot);

internalAngle += angularSpeedPerFrame;
angle = internalAngle;
if(root) {
	angle += root.angle + angleDiffFromRoot;
}

image_angle = angle;


if (place_meeting(x, y, objNoNoParent)) {
  x = oldX;
  y = oldY;
  scrDetachAttachable(self.id);
}