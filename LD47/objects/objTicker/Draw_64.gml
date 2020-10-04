/// @description Draw
// You can write your code in this editor

shader_set(shd_greyscale);
shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);
draw_sprite(sprite_index, image_index, x, y);
shader_reset();