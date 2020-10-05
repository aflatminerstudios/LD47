/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

var oldX = x;
var oldY = y;

x = root.x + lengthdir_x(distanceFromRoot, root.angle + angleFromRoot);
y = root.y + lengthdir_y(distanceFromRoot, root.angle + angleFromRoot);

internalAngle += angularSpeedPerFrame;
if(internalAngle > 360)
	internalAngle -= 360;
if(internalAngle < 0)
	internalAngle += 360;
	
angle = internalAngle;
if(root) {
	angle += root.angle + angleDiffFromRoot;
}

// Everything above this point is identical to the parent event (as of Sunday night at 2am)

if (place_meeting(x, y, objNoNoShip)) {
  var collObject = instance_place(x, y, objNoNoShip);
  x = oldX;
  y = oldY;  
  scrDetachAttachable(self.id, collObject);
	instance_destroy(collObject);
	if(instance_exists(objRoomBulletBossControl))
		objRoomBulletBossControl.shipsDestroyed++;
} else if (place_meeting(x, y, objNoNoParent)) {
  var collObject = instance_place(x, y, objNoNoParent);
  x = oldX;
  y = oldY;  
  scrDetachAttachable(self.id, collObject);
}

