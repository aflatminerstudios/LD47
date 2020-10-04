// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


///@function scrDrawPoints(xList, yList, color)
///@param list List of x, y coords as 2-element arrays
///@param color color to draw
///@param lineWidth the width of the line
///@param isMaxSize is the list about to drop some points?
function scrDrawPoints(list, color, lineWidth, isMaxSize) {
  
  var start = 0;
  if (isMaxSize)
    start = 4;

  var oldAlpha = draw_get_alpha();

  for (var i = 0; i < start; i++) {
    draw_set_alpha((0.2 * (i + 1)));
    var point = list[| i];
    var nextPoint = list[| i + 1];
    //draw_point_color(point[0], point[1], color);
    draw_line_width_color(point[0], point[1], nextPoint[0], nextPoint[1], lineWidth, color, color);    
  }
  draw_set_alpha(oldAlpha);

  for (var i = start; i < ds_list_size(list) - 1; i++) {
    var point = list[| i];
    var nextPoint = list[| i + 1];
    //draw_point_color(point[0], point[1], color);
    draw_line_width_color(point[0], point[1], nextPoint[0], nextPoint[1], lineWidth, color, color);    
  }
}