// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function scrGameOverCleanup(controller)
///@param controller which controller called this
function scrGameOverCleanup(controller) {
  with (objPlayer) {
    frozen = true; 
  }
  with (controller) {
    instance_destroy(); 
  }
}

///@function scrGameOverKaiju(controller)
///@param controller which controller called this
///@param which which object to spanw
function scrSpawnGameOver(controller, which) {
  var camX = camera_get_view_x(view_camera[0]);
  var camY = camera_get_view_y(view_camera[0]);
  var camWidth = camera_get_view_width(view_camera[0]);
  var camHeight = camera_get_view_height(view_camera[0]);
  instance = instance_create_layer(camX + camWidth / 2, camY + camHeight / 2, "UI", which);

  return instance;
}

///@function scrGameOverKaiju(controller, numAttached, totalSize, dist, bboxSize)
///@param controller which controller called this
///@param numAttached number of loops attached
///@param dist Furthest distance
///@param bboxSize Containing Area
function scrGameOverKaiju(controller, numAttached, totalSize, dist, bboxSize) {
  
  instance = scrSpawnGameOver(self.id, objGameOver);
  scrGameOverCleanup(controller);
  instance.style = "Kaiju";
  instance.numAttached = numAttached;
  instance.totalSize = totalSize;
  instance.dist = dist;
  instance.bboxSize = bboxSize;
  
}

function scrPressMode() {
  room_goto(roomTitleScreen);
}

function scrPressReplay() {
  room_restart();
}

function scrPressTheme() {
  show_message("Go to theme select (special theme select screen?)");
}

