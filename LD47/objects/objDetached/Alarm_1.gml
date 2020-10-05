/// @description Insert description here
// You can write your code in this editor

if (created == 0) {
   var xx = x + lengthdir_x(sprite_width / 2, internalAngle);
   var yy = y + lengthdir_y(sprite_height / 2, internalAngle);
  
  
  var instance = instance_create_depth(xx, yy, depth - 1, objHit);
  instance.image_angle = internalAngle + 90;
  created++;
  skip = true;
  skipCount = 0;
}