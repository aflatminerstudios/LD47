/// @description Draw all the points
// You can write your code in this editor


with (objAttachable) {
  var isMaxSize = false;
  
  if (ds_list_size(list) >= circleTheme.trail.maxList) {
    isMaxSize = true;
  }
  
  scrDrawPoints(list, circleTheme.trail.color, circleTheme.trail.lineWidth, isMaxSize);  
}

with (objDetached) {
  var isMaxSize = false;
  
  if (ds_list_size(list) >= circleTheme.trail.maxList) {
    isMaxSize = true;
  }
  
  scrDrawPoints(list, circleTheme.trail.color, circleTheme.trail.lineWidth, isMaxSize);    
}