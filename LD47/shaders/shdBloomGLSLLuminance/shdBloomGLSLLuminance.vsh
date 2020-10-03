/*-----------------------------------------------------------------------------
GLSL Bloom Shader 1 - Filter Lights: Draws everything unchanged to target 0 and
								     only light colours to target 1
Vertex Shader: Pass-through
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
Process:
- set the shader and the two render targets in draw begin event.
- Blur target 1.
- Draw target 0 with target 1 to the screen by
  the second bloom shader: bloom_blend.

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
float bloom_layer_intensity
	factor to darken or further brighten the colours above the threshold
float bloom_layer_threshold
	how bright a colour needs to be to be drawn to target 1
float bloom_layer_range
	lum < threshold:						is drawn black
	lum > threshold + range:				is drawn normally
	threshold < lum < threshold + range:	is drawn darkened
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------
-
*/

attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
