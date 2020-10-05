/// @description Insert description here
// You can write your code in this editor

if (fadeAmount != 0) {
  shader_set(shd_greyscale);
  shader_set_uniform_f(fade, fadeAmount);
}

draw_surface(application_surface, 0, 0);
if (fadeAmount != 0) {
  shader_reset();
}