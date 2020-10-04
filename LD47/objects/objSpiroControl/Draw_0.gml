/// @description Draw all the points
// You can write your code in this editor


with (objAttachable) {
  ///ADDED BY JOHN
  var isMaxSize = false;
  
  if (ds_list_size(list) >= maxList) {
    isMaxSize = true;
  }
  
  
  scrDrawPoints(list, dotColor, lineWidth, isMaxSize);  
}

