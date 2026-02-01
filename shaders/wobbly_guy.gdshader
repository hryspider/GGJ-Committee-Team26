shader_type canvas_item;

instance uniform float wobble_speed = 1.;
instance uniform float wobble_strength = 10.;
instance uniform float wobble_scale = 4.;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv_offset = vec2(sin(UV.y * wobble_scale + TIME * wobble_speed), 0.) * wobble_strength * TEXTURE_PIXEL_SIZE;
	COLOR = texture(TEXTURE, UV + uv_offset);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
