/// @description Insert description here
// You can write your code in this editor

shader_set(shd_greyscale);
shader_set_uniform_f(fade, fadeAmount);


draw_surface(application_surface, 0, 0);
shader_reset();