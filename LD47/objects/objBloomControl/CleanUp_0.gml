/// @description Free surfaces & enable application surface

if (shader_type == 0) exit;

if (surface_exists(srf_ping)) surface_free(srf_ping);
if (surface_exists(srf_pong)) surface_free(srf_pong);

application_surface_draw_enable(true);
gpu_set_tex_filter(false);