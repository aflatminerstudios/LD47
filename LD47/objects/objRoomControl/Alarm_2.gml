/// @description Zoom in
// You can write your code in this editor

  
zoom -= (zoomStart - zoomTarget) / zoomTime;

camera_set_view_size(view_camera[0], room_width * zoom, room_height * zoom);
camera_set_view_pos(view_camera[0], objPlayerPlaceholder.x - (room_width * zoom)/2, objPlayerPlaceholder.y - (room_height * zoom)/2);
view_object = view_object;
show_debug_message(zoom);
if (zoom <= zoomTarget) {    
  zoom = zoomTarget;
  camera_set_view_size(view_camera[0], room_width * zoom, room_height * zoom);     
  playing = true;  
  instance_create_layer(800, 600, "Glompables", objPlayer);
  camera_set_view_pos(view_camera[0], objPlayer.x - (room_width * zoom)/2, objPlayer.y - (room_height * zoom)/2);
  camera_set_view_target(view_camera[0], objPlayer);
  with (objPlayerPlaceholder) {
    instance_destroy();
  }
  timer = 0;
}