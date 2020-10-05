

function scrPressMode() {
  room_goto(roomTitleScreen);
}

function scrPressReplay() {
  scrPlayGame();
}

function scrPressTheme() {
  with (objGameOver) {
    if (instance_number(objBtnLoop) == 0) {
      instance_create_depth(x + 310, y + 145, depth - 1, objBtnLoop);
      instance_create_depth(x + 310, y + 290, depth - 1, objBtnBloop);
      instance_create_depth(x + 310, y + 435, depth - 1, objBtnLoo);      
    
      scrSetSelectButtons();
    } else {
      with (objBtnLoop) {
        instance_destroy();
      }
      with (objBtnBloop) {
        instance_destroy();
      }
      with (objBtnLoo) {
        instance_destroy();
      }
    }
  }
}

function scrToggleColorblind() {
  global.colorBlindModeOn = !global.colorBlindModeOn;
  
  
  with (objBtnColorblind) {
    
    if (global.colorBlindModeOn) {
      sprite_index = sprColorBlindOn;
  
    } else {
      sprite_index = sprColorBlindOff;
    }

    pressedSprite = sprite_index;
    unpressedSprite = sprite_index;
  }
}