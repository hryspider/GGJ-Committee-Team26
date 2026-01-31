shader_type canvas_item;

global uniform float background_rotation;
global uniform float background_scale;
global uniform float background_speed;
global uniform float jitterscale;
global uniform float jitterrate;
global uniform float jitterstrength;
instance uniform vec4 primary_color : source_color = vec4(0.424, 0.754, 0.852, 1.);
instance uniform vec4 secondary_color : source_color = vec4(0.397, 0.595, 0.901, 1.);

vec2 rotate(vec2 uv, vec2 pivot, float angle)
{
	mat2 rotation = mat2(vec2(sin(angle), -cos(angle)),
						vec2(cos(angle), sin(angle)));
	
	uv -= pivot;
	uv = uv * rotation;
	uv += pivot;
	return uv;
}


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 pixel_coord = UV / TEXTURE_PIXEL_SIZE + vec2(4., 3.) * TIME;
	vec2 rotated_pixcoord = rotate(pixel_coord, vec2(0.,0.), radians(background_rotation));
	vec2 closest_grid = round(rotated_pixcoord / background_scale) * background_scale;
	float dist = distance(rotated_pixcoord, closest_grid);
	COLOR = mix(primary_color, secondary_color, step(0., sin((dist + TIME) * background_speed)));
	//COLOR = vec4(dist, 1., 1., 1.);
	//COLOR = vec4(distance(rotateduv, nearest_gridpoint) * background_scale * 2., 0., 0., 1.);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
