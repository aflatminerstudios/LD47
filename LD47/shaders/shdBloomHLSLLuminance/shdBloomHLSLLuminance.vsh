/*-----------------------------------------------------------------------------
HLSL Bloom Shader 1 - Filter Lights: Draws everything unchanged to target 0 and
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

struct VertexShaderInput {
	float4 Position	: POSITION;
	float4 Colour	: COLOR0;
	float2 Texcoord	: TEXCOORD0;
};

struct VertexShaderOutput {
	float4 Position	: SV_POSITION;
	float4 Colour	: COLOR0;
	float2 Texcoord	: TEXCOORD0;
};


VertexShaderOutput main(VertexShaderInput INPUT) {
	VertexShaderOutput OUTPUT;
	
	float4 matrixWVP	= mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], INPUT.Position);
	
	OUTPUT.Position	= matrixWVP;
	OUTPUT.Colour	= INPUT.Colour;
	OUTPUT.Texcoord	= INPUT.Texcoord; 
	return OUTPUT;
}
