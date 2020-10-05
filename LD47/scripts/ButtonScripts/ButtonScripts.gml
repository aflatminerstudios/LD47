

function scrPressMode() {
  room_goto(roomTitleScreen);
}

function scrPressReplay() {
  room_restart();
}

function scrPressTheme() {
  with (objGameOver) {
    instance_create_depth(x - 200, y - 240, depth - 1, objBtnLoop);
    instance_create_depth(x, y - 240, depth - 1, objBtnBloop);
    instance_create_depth(x + 200, y - 240, depth - 1, objBtnLoo);
    scrSetSelectButtons();
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