/// @description Insert description here
// You can write your code in this editor

/// Draw based on pressed state

// Reset the current sprite in case we have changed isPressed somewhere else
// e.g. radio button's create or radio button's press
if(isPressed) {
  if(sprite_index != pressedSprite) {
    sprite_index = pressedSprite;
    image_index = 0;
  }
} else {
  if(sprite_index != unpressedSprite) {
    sprite_index = unpressedSprite;
    image_index = 0;
  }
}  

// Determine position and add offsets as appropriate
var xx = x;
var yy = y;
if(isPressed && useAutoPressAnimation) {
  xx += autopressOffsetX;
  yy += autopressOffsetY; 
}

draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, c_white, image_alpha);  

