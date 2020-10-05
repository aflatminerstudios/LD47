/// @description Move
// You can write your code in this editor

var oldX = x;
var oldY = y;

x = x + lengthdir_x(speedPerFrame, internalAngle);
y = y + lengthdir_y(speedPerFrame, internalAngle);


var count = 0;

var tempSpeed = speedPerFrame;

var collObject = instance_place(x, y, objNoNoParent);
if (collObject != noone && collObject.object_index != objNoNoShip && collObject.object_index != objNoNoBullet) {
  while (place_meeting(x, y, objNoNoParent)) {
    count++;
    collObject = instance_place(x, y, objNoNoParent);
  
  
    internalAngle = point_direction(x, y, collObject.x, collObject.y);//, x, y);
  
    /*if (collObject.object_index == objNoNoTurbine) {
      show_debug_message(string(x) + ", " + string(y) + " : " + string(collObject.x) + " " + string(collObject.y));
      show_debug_message(internalAngle);
    }*/
  
    var xx = x + lengthdir_x(sprite_width / 2, internalAngle);
    var yy = y + lengthdir_y(sprite_height / 2, internalAngle);
  
    x = x + lengthdir_x(tempSpeed, internalAngle);
    y = y + lengthdir_y(tempSpeed, internalAngle);    
  
    if (count > 300) {
      count = 0;
      tempSpeed *= 2;
    }
  
    if (!skip) {
   
      var instance = instance_create_depth(xx, yy, depth - 1, objHit);
      instance.image_angle = internalAngle + 90;
      created++;
      skip = true;
      skipCount = 0;
    }
  }
}

if (skip) {
  skipCount++; 
  if (skipCount > maxSkipCount) {
    skip = false; 
  }
}


if (abs(x) > room_width * 1.2 || abs(y) > room_height * 1.2) {
  instance_destroy(); 
}
