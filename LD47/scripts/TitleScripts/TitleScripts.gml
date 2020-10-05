// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function scrSetThemOnController(type)
///@param type Which theme to set
function scrSetThemeOnController(type){

  with (objThemeModeControl) {
    theme = type;
  }
  
  with (objBtnModeSelect) {
    if (type == "Loo") {      
      onButton = onLoo;
      offButton = offLoo;
    } else {
      onButton = onBase;
      offButton = offBase;
    }
  }
  
  if (type == "Loop") {
    global.currentTheme = global.stuckInTheLoopTheme;
  } else if (type == "Loo") {
    global.currentTheme = global.stuckInTheLooTheme;
  } else {
    global.currentTheme = global.stuckInTheBloopTheme;
  }
  
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
      show_debug_message(type);
    }    
  }
  
  with (objBtnModeSelect) {
    if (type == m) {
      sprite_index = onButton;  
      show_debug_message(type + "XXXX");
      show_debug_message(string(sprite_index) + ", " + string(sprBtnModeFightersOn));
    } else {
      sprite_index = offButton;
      show_debug_message(type);
      show_debug_message(string(sprite_index) + ", " + string(sprBtnModeCollectOff) + ", " + string(sprBtnModeObstacleOff));
    }    
  }


  
}