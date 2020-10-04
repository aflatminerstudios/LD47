/// @description Finish level 

var numAttached = instance_number(objAttachable);
var totalSize = 0;
var dist = 0;
var left = objPlayerMicha.x - objPlayerMicha.sprite_width / 2;
var right = objPlayerMicha.x + objPlayerMicha.sprite_width / 2;
var top = objPlayerMicha.y - objPlayerMicha.sprite_height / 2;
var bottom = objPlayerMicha.y + objPlayerMicha.sprite_height / 2;

with (objAttachable) {
  totalSize += radius;
  
  var furthest = instance_furthest(x, y, objAttachable);
  var curDist = distance_to_object(furthest);
  if (distance_to_object(objPlayerMicha) > curDist) {
    furthest = objPlayerMicha; 
    curDist = distance_to_object(furthest) + sprite_width(objAttachable);    
  } else {
    curDist += furthest.radius * 2; 
  }
  if (curDist > dist) {
    dist = curDist; 
  }
  
  if (x - radius / 2 < left) {
    left = x - radius / 2; 
  }
  if (x + radius / 2 > right) {
    right = x + radius / 2; 
  }
  if (y - radius / 2 < top) {
    top = y - radius / 2; 
  }
  if (y + radius / 2 > bottom) {
    bottom =  y + radius / 2; 
  }
  
  
}


var bboxSize = (right - left) * (bottom - top);


show_message("Time's up!\nYou got " + string(numAttached) + " objects attached.\nYou had a total radius of " + string(totalSize) + "\nYou had a maximum distance of " + string(dist) + "\nYou had a total size of " + string(bboxSize));
room_goto(roomTitleScreen);

