// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function scrGameOverCleanup(controller)
///@param controller which controller called this
function scrGameOverCleanup(controller) {
  //Make it so player can't move
  with (objPlayer) {
    frozen = true; 
  }
  
  //Remove excess objects
  with (controller) {
    instance_destroy(); 
  }
  with (objTicker) {
    instance_destroy();
  }
  with (objTickerText) {
    instance_destroy(); 
  }  
  with (objDetached) {
    instance_destroy(); 
  }
  with (objNoNoParent) {
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
  instance = instance_create_layer(camX + 400, camY + 80, "UI", which);
  
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
  instance.sprite_index = global.currentTheme.gameOverWin;
  
}
///@function scrGameOverObstacle(controller)
///@param controller which controller called this
///@param won Did they win
function scrGameOverObstacle(controller, won) {
  
  instance = scrSpawnGameOver(self.id, objGameOver);
  scrGameOverCleanup(controller);

  
  
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
  
  instance.style = "Obstacle";
  instance.timer = controller.timer;
  instance.maxTimer = controller.maxTimer;
  instance.numAttached = numAttached;
  instance.bboxSize = bboxSize;
  instance.dist = dist;
  instance.totalSize = totalSize;
  instance.won = won;
  
  
  if (won) {
    instance.sprite_index = global.currentTheme.gameOverWin;  
  } else {
    instance.sprite_index = global.currentTheme.gameOverFail;
  }
  
}

//@function scrGameOverKaiju(controller, numAttached, totalSize, dist, bboxSize)      
///@param controller which controller called this
///@param totalAttached number of loops attached total during the round
///@param shipsDestroyed Furthest distance
///@param timeSurvived Time on clock on game over
function scrGameOverBulletBoss(controller, totalAttached, shipsDestroyed, timeSurvived) {
  
  instance = scrSpawnGameOver(self.id, objGameOver);
  scrGameOverCleanup(controller);
  instance.style = "BulletBoss";
  instance.numAttached = totalAttached; // Using this for total attached count during round
  instance.ships = shipsDestroyed; // Using this for ships destroyed
  instance.timer = timeSurvived; // Using this for time survived
  instance.sprite_index = global.currentTheme.gameOverWin;
  
}
