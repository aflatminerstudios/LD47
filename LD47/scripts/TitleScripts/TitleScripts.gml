// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function scrSetThemOnController(type)
///@param type Which theme to set
function scrSetThemeOnController(type){

  with (objThemeModeControl) {
    theme = type;
  }
  
  if (type == "Loop") {
    global.currentTheme = global.stuckInTheLoopTheme;
  } else if (type == "Loo") {
    global.currentTheme = global.stuckInTheLooTheme;
  } else {
    global.currentTheme = global.stuckInTheBloopTheme;
  }
  
  scrApplyTheme();
  
  scrSetSelectButtons();  
}

function scrSetModeOnController(type){
  with (objThemeModeControl) {
    mode = type;
  }
  scrSetSelectButtons();
}

function scrSetSelectButtons() {
  var t = objThemeModeControl.theme;
  var m = objThemeModeControl.mode;
  
  
  with (objBtnThemeSelect) {
    if (type == t) {
      sprite_index = onButton;  
    } else {
      sprite_index = offButton;      
    }    
  }
  
  with (objBtnModeSelect) {
    if (t == "Loo") {      
      onButton = onLoo;
      offButton = offLoo;
    } else {
      onButton = onBase;
      offButton = offBase;
    }
    if (type == m) {
      sprite_index = onButton;      
    } else {
      sprite_index = offButton;

    }    
  }
}

/// @function scrPlayGame()
function scrPlayGame() {
  var theme = objThemeModeControl.theme;
  var mode = objThemeModeControl.mode;
  var targetRoom = roomTitleScreen;
  
  if (mode == "Collector") {
    targetRoom = roomKaiju;
  } else if (mode == "Obstacle") {
    targetRoom = roomObstacle; 
  } else if (mode == "Fighters") {
    targetRoom = roomBulletBoss; 
  }
  
  
  room_goto(targetRoom);
}