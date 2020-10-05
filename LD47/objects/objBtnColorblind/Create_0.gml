/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


unpressedScript = scrToggleColorblind;


if (global.colorBlindModeOn) {
  sprite_index = sprColorBlindOn;
  
} else {
  sprite_index = sprColorBlindOff;
}

pressedSprite = sprite_index;
unpressedSprite = sprite_index;