/// @description Insert description here
// You can write your code in this editor
shader_set(shdBloom);

shader_set_uniform_f(u_intensity, 1.5);
draw_self();
shader_reset();
