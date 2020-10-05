

function scrPressMode() {
  room_goto(roomTitleScreen);
}

function scrPressReplay() {
  room_restart();
}

function scrPressTheme() {
  show_message("Go to theme select (special theme select screen?)");
}

function scrToggleColorblind() {
  global.colorBlindModeOn = !global.colorBlindModeOn;
}