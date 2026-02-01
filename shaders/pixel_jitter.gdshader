shader_type canvas_item;

global uniform float jitterrate;
global uniform float jitterscale;
global uniform float jitterstrength;
instance uniform vec4 color : source_color = vec4(1.,1.,1.,1.);
instance uniform float localjitterscale = 1.;
instance uniform float localjitterrate = 1.;

float rand (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}

float rand (float v) {
    return fract(sin(v * 43758.5453123));
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 pixelUV = floor(UV / TEXTURE_PIXEL_SIZE) * TEXTURE_PIXEL_SIZE;
	float steppedTime = floor(TIME * jitterrate * localjitterscale);
	//float randtime = rand(steppedTime);
	vec2 uvOffset = vec2(
		sin(pixelUV.y * jitterscale + 10.+ steppedTime),
		sin(pixelUV.x * jitterscale + steppedTime)
	) * jitterstrength * TEXTURE_PIXEL_SIZE * localjitterscale;
	COLOR = texture(TEXTURE, pixelUV + uvOffset) * color;
	//COLOR = texture(TEXTURE, UV) * color;
	//COLOR = vec4(uvOffset, 0, COLOR.a);
	//COLOR = vec4(steppedTime / 20., 0., 0., 1.);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
