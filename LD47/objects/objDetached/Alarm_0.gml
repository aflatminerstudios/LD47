/// @description Insert description here
// You can write your code in this editor



var draw;
draw[0] = x + lengthdir_x(radius, angle);
draw[1] = y + lengthdir_y(radius, angle);

ds_list_add(list, draw);



if (ds_list_size(list) > circleTheme.trail.maxList) {
  ds_list_delete(list, 0);
  //ds_list_delete(yList, 0);
}


alarm[0] = stepsBetweenPoints;