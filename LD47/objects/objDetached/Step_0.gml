/// @description Move
// You can write your code in this editor

var oldX = x;
var oldY = y;

x = x + lengthdir_x(speedPerFrame, internalAngle);
y = y + lengthdir_y(speedPerFrame, internalAngle);


var count = 0;

var tempSpeed = speedPerFrame;


while (place_meeting(x, y, objNoNoParent)) {
  count++;
  var collObject = instance_place(x, y, objNoNoParent);

  internalAngle = point_direction(collObject.x, collObject.y, x, y);

  x = x + lengthdir_x(tempSpeed, internalAngle);
  y = y + lengthdir_y(tempSpeed, internalAngle);
   
  if (count > 300) {
   count = 0;
   tempSpeed *= 2;
  }
}

if (abs(x) > room_width * 1.2 || abs(y) > room_height * 1.2) {
  instance_destroy(); 
}