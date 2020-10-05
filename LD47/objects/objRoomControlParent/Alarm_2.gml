/// @description Zoom in
// You can write your code in this editor

  
zoom -= (zoomStart - zoomTarget) / zoomTime;
/*
var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

var tarX = objPlayerPlaceholder.x - (room_width * zoom)/2;
var tarY = objPlayerPlaceholder.y - (room_height * zoom)/2;

var dist = point_distance(curX, curY, tarX, tarY);
var dir = point_direction(curX, curY, tarX, tarY);

var numSteps = (zoomTime) - (timer - preTime);

var newX = lengthdir_x(dist/numSteps, dir);
var newY = lengthdir_y(dist/numSteps, dir);


var pct = (zoomStart - zoom)/(zoomStart - zoomTarget);

var newX = pct * tarX;//lerp(0, tarX, pct);
var newY = pct * tarY; //* (room_height/room_width);//lerp(0, tarY, pct);
*/

var newX = (objPlayerPlaceholder.x - room_width/2 * zoomTarget) * (timer - preTime) / zoomTime;
var newY = (objPlayerPlaceholder.y - room_height/2 * zoomTarget) * (timer - preTime) / zoomTime;

//show_debug_message(numSteps);
//show_debug_message(string(newX) + " . " + string(newY));
/*
show_debug_message(string(newX) + ", " + string(newY) + " : " + string(tarX) + ", " + string(tarY));
*/



camera_set_view_size(view_camera[0], room_width * zoom, room_height * zoom);
camera_set_view_pos(view_camera[0], newX, newY);
view_object = view_object;
//show_debug_message(zoom);
if (zoom <= zoomTarget) {    
  zoom = zoomTarget;
  camera_set_view_size(view_camera[0], room_width * zoom, room_height * zoom);     
  playing = true;  
  instance_create_layer(objPlayerPlaceholder.x, objPlayerPlaceholder.y, "Glompables", objPlayer);
  camera_set_view_pos(view_camera[0], objPlayer.x - (room_width * zoom)/2, objPlayer.y - (room_height * zoom)/2);
  camera_set_view_target(view_camera[0], objPlayer);
  with (objPlayerPlaceholder) {
    instance_destroy();
  }
  with (readyGo) {
    instance_destroy(); 
  }
  timer = 0;
}