/// @description Initialize things
event_inherited();


//-----------------------------------------------------------------------------
#region SPRITE & SHADER
//-----------------------------------------------------------------------------

// Set shader type based on compile checks:
shader_type = 0 // 0: no shader | 1: GLSL ES | 2: GLSL | 3: HLSL
if (shaders_are_supported()) {
	if (shader_is_compiled(shdBloomHLSLLuminance))		shader_type = 3;
	else if (shader_is_compiled(shdBloomGLSLLuminance))	shader_type = 2;
	else if (shader_is_compiled(shdBloomFilterLuminance))	shader_type = 1;
}

shader_type = 1;

// Luminance shader for ...
switch (shader_type) {
	case 1: // GLSL ES
		shader_bloom_lum		= shdBloomFilterLuminance;
		u_bloom_threshold		= shader_get_uniform(shader_bloom_lum, "bloom_threshold");
		u_bloom_range			= shader_get_uniform(shader_bloom_lum, "bloom_range");
		break;
	case 2: // GLSL
		shader_bloom_lum		= shdBloomGLSLLuminance;
		u_bloom_layer_intensity	= shader_get_uniform(shader_bloom_lum, "bloom_layer_intensity");
		u_bloom_layer_threshold	= shader_get_uniform(shader_bloom_lum, "bloom_layer_threshold");
		u_bloom_layer_range		= shader_get_uniform(shader_bloom_lum, "bloom_layer_range");
		break;
	case 3: // HLSL
		shader_bloom_lum		= shdBloomHLSLLuminance;
		u_bloom_layer_intensity	= shader_get_uniform(shader_bloom_lum, "bloom_layer_intensity");
		u_bloom_layer_threshold	= shader_get_uniform(shader_bloom_lum, "bloom_layer_threshold");
		u_bloom_layer_range		= shader_get_uniform(shader_bloom_lum, "bloom_layer_range");
		break;		
}



if (shader_type >= 1) {
	shader_blur				= shdBlur2PassGaussLerpMRT;
	u_blur_steps			= shader_get_uniform(shader_blur, "blur_steps");
	u_sigma					  = shader_get_uniform(shader_blur, "sigma");
	u_blur_vector			= shader_get_uniform(shader_blur, "blur_vector");
	u_texel_size			= shader_get_uniform(shader_blur, "texel_size");

	shader_bloom_blend		= shdBloomBlendMRT;
	u_bloom_intensity		= shader_get_uniform(shader_bloom_blend, "bloom_intensity");
	u_bloom_darken			= shader_get_uniform(shader_bloom_blend, "bloom_darken");
	u_bloom_saturation		= shader_get_uniform(shader_bloom_blend, "bloom_saturation");
	u_bloom_texture			= shader_get_sampler_index(shader_bloom_blend, "bloom_texture");

	bloom_texture			= -1;
	srf_ping				= -1;
	srf_pong				= -1;

	gui_w					= display_get_gui_width();
	gui_h					= display_get_gui_height();

	app_w					= gui_w / 3;
	app_h					= gui_h / 3;

	texel_w					= 1 / app_w;
	texel_h					= 1 / app_h;

	application_surface_draw_enable(false);
}
#endregion
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#region UNIFORM SETTERS:
//-----------------------------------------------------------------------------
// create depth based shader controllers for GLSL & HLSL
if (shader_type >= 2) {
  scrCreateBloomMRTUniformSetter("ilyr_main", 1.3, 0.35, 0.1)
  scrCreateBloomMRTUniformSetter("alyr_bg1", 1.3, 0.35, 0.1)	
}
#endregion
