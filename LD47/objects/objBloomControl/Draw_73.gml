/// @description Reset shader and surface

if (shader_type >= 2) { // GLSL || HLSL
	shader_reset();
	surface_reset_target();
}