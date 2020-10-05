/// @description Draw
// You can write your code in this editor

if (objShaderControl.fadeAmount != 0) {
  shader_set(shd_greyscale);
  shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);
}
draw_sprite(global.currentTheme.hudTickerBG, image_index, x, y);

if (objShaderControl.fadeAmount != 0) {
  shader_reset();
}