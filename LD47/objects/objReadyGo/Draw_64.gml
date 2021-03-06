/// @description Draw on GUI layer
// You can write your code in this editor

if (objShaderControl.fadeAmount != 0) {
  shader_set(shd_greyscale);
  shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);    
}

draw_sprite(sprite_index, image_index, x, y);

if (objShaderControl.fadeAmount != 0) {
  shader_reset();
}