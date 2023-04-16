//No06_RedSquare
shader_type canvas_item;
vec3 sdfSquare(vec2 uv, float size, vec2 offset) {
	float x = uv.x - offset.x;
	float y = uv.y - offset.y;
	float d = max(abs(x), abs(y)) - size;
	return d > 0. ? vec3(1.) : vec3(1., 0., 0.);
}


void fragment() {
	vec2 uv = UV;
	uv.y=uv.y-0.5;
	uv.x=uv.x-0.5;
	vec2 offset = vec2(0.0, 0.0);
	vec3 col = sdfSquare(uv, 0.2, offset);
	COLOR = vec4(col,1.0);
}