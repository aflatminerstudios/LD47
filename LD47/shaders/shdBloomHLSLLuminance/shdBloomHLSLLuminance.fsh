/*-----------------------------------------------------------------------------
HLSL Bloom Shader 1 - Filter Lights: Draws everything unchanged to target 0 and
								     only light colours to target 1
Fragment Shader: Filter the lights
-----------------------------------------------------------------------------*/

struct PixelShaderInput {
	float4 Position	: SV_POSITION;
	float4 Color	: COLOR0;
	float2 Texcoord	: TEXCOORD0;
};

struct PixelShaderOutput {
	float4	base_col	: SV_TARGET0;
	float4	bloom_col	: SV_TARGET1;
};

uniform float	bloom_layer_intensity;
uniform float	bloom_layer_threshold;	// lum < threshold:						is drawn black
uniform float	bloom_layer_range;		// lum > threshold + range:				is drawn normally
										// threshold < lum < threshold + range:	is drawn darkened


PixelShaderOutput main(PixelShaderInput INPUT) {
	PixelShaderOutput OUTPUT;
	
	// Original Colour:
	float4 base_col = INPUT.Color * gm_BaseTextureObject.Sample(gm_BaseTexture, INPUT.Texcoord);
	OUTPUT.base_col	=  base_col ;

	// Bloom Colour:
	float lum		= dot(base_col.rgb, float3(0.229, 0.587, 0.114));
	float weight	= smoothstep(bloom_layer_threshold, bloom_layer_threshold + bloom_layer_range, lum);
	base_col.rgb	= lerp(0.0f.xxx, base_col.rgb, weight) * bloom_layer_intensity;
	OUTPUT.bloom_col = float4(10,0,0,1);

	return OUTPUT;
}
