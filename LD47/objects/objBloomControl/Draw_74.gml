/// @description Do most of the shader work


if (shader_type == 0) exit; // no shader

// SET VALUES:
//-----------------------------------------------------------------------------
var blur_steps = 8;
var sigma			= 1;
var bloom_intensity	= 1.5;
var bloom_darken	= 1;
var bloom_saturation= 0.5;

if (shader_type == 1) { // GLSL ES
	var bloom_threshold = 0.5;
	var bloom_range		= 0.2;
}

// DRAW:
//-----------------------------------------------------------------------------

// 1st pass: Draw brights to bloom surface:
// AppSrf -> srf_ping
// GLSL ES only; GLSL & HLSL do this pass per layer using MRT
if (shader_type == 1) {
	shader_set(shader_bloom_lum);
		shader_set_uniform_f(u_bloom_threshold,		bloom_threshold);
		shader_set_uniform_f(u_bloom_range,			bloom_range);
	
		surface_set_target(srf_ping);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
}
	
// 2nd pass: blur horizontally
// srf_ping -> srf_pong
gpu_set_tex_filter(true);
shader_set(shader_blur);
	shader_set_uniform_f(u_blur_steps,		blur_steps);
	shader_set_uniform_f(u_sigma,			sigma);
	shader_set_uniform_f(u_blur_vector,		1, 0);
	shader_set_uniform_f(u_texel_size,		texel_w, texel_h);
	
	surface_set_target(srf_pong);
		draw_surface(srf_ping, 0, 0);
	surface_reset_target();
	
// 3rd pass: blur vertically
// srf_pong -> srf_ping
	shader_set_uniform_f(u_blur_vector,		0, 1);
	
	surface_set_target(srf_ping);
		draw_surface(srf_pong, 0, 0);
	surface_reset_target();
	
gpu_set_tex_filter(false);

// 4th pass: Blend bloom surface with app surface
// AppSrf & srf_ping -> screen
shader_set(shader_bloom_blend);
	shader_set_uniform_f(u_bloom_intensity, bloom_intensity);
	shader_set_uniform_f(u_bloom_darken, bloom_darken);
	shader_set_uniform_f(u_bloom_saturation, bloom_saturation);
	texture_set_stage(u_bloom_texture, bloom_texture);
	gpu_set_tex_filter_ext(u_bloom_texture, true);
	
  
	draw_surface_stretched(application_surface, 0, 0, gui_w, gui_h);
  
	
shader_reset();
//gpu_set_tex_filter(false);

