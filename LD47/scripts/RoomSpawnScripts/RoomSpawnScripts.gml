// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function scrSpawnGlompables
///@description Spawn all random starting glompables
///@param controller which controller is spawning random glompables
function scrSpawnStartingGlompables(controller) {
  with (controller) {
    for (var i = 0; i < startingGlompables; i++) {
      scrSpawnRandomGlompable();    
    }
  }
}

function scrSpawnRandomGlompable() {
  
  var glomp = instance_create_layer(0, 0, "Glompables", objGlompable);
  
  var xCoord = irandom_range(3 + glomp.radius / 2, room_width - glomp.radius / 2 - 3);
  var yCoord = irandom_range(3 + glomp.radius / 2, room_height - glomp.radius / 2 - 3);
  with (glomp) {  
    while (!place_meeting(xCoord, yCoord, objCircleParent)) {
      xCoord = irandom_range(3 + glomp.radius / 2, room_width - glomp.radius / 2 - 3);
      yCoord = irandom_range(3 + glomp.radius / 2, room_height - glomp.radius / 2 - 3);
    }
  
    x = xCoord;
    y = yCoord;
  }
  
}