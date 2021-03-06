/// @description Finish level 

var numAttached = instance_number(objAttachable);
var totalSize = 0;
var dist = 0;
var left = objPlayer.x - objPlayer.radius / 2;
var right = objPlayer.x + objPlayer.radius / 2;
var top = objPlayer.y - objPlayer.radius / 2;
var bottom = objPlayer.y + objPlayer.radius / 2;

with (objAttachable) {
  totalSize += radius;
  
  var furthest = instance_furthest(x, y, objAttachable);
  var curDist = distance_to_object(furthest);
  
  if (numAttached == 1) {      
    curDist = 0;
    furthest = self.id; 
  }
  if (distance_to_object(objPlayer) > curDist) {
    furthest = objPlayer; 
    curDist = distance_to_object(furthest) + objPlayer.radius / 2;    
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

scrGameOverKaiju(self.id, numAttached, totalSize, dist, bboxSize);

