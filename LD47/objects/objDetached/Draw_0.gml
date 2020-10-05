/// @description Insert description here
// You can write your code in this editor


shader_set(shd_bright_contrast);
shader_set_uniform_f(brightness, -0.5);
shader_set_uniform_f(contrast, 0.0);

// Inherit the parent event
event_inherited();

shader_reset();