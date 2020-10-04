/// @description Add point to list
// You can write your code in this editor

///ADDED BY JOHN

// Maybe could be make smoother on the circle end by always adding a replaceable temp point each frame 
//   and continue to make a perm point every stepsBetweenPoints. Might be weird to see the line become
//   straighter as it is replaced, though.  -- Micha TODO


var draw;
draw[0] = x + lengthdir_x(radius, angle);
draw[1] = y + lengthdir_y(radius, angle);

ds_list_add(list, draw);



if (ds_list_size(list) > circleTheme.trail.maxList) {
  ds_list_delete(list, 0);
  //ds_list_delete(yList, 0);
}


alarm[0] = stepsBetweenPoints;