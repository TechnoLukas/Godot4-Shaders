//No12_ShapesCombine

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//ported with https://github.com/jayaarrgh/shadertoy2godot (with some hand fixing)
//on shadertoy https://www.shadertoy.com/view/mdtSD2

shader_type canvas_item;
float sdfCircle(vec2 uv, float r, vec2 offset) {
	float x = uv.x - offset.x;
	float y = uv.y - offset.y;
  
	return length(vec2(x, y)) - r;  
}

float sdfSquare(vec2 uv, float size, vec2 offset) {
	float x = uv.x - offset.x;
	float y = uv.y - offset.y;

	return max(abs(x), abs(y)) - size;
}

vec3 drawScene(vec2 uv) {
	vec3 col = vec3(1);
	float circle = sdfCircle(uv, 0.1, vec2(0, 0));
	float square = sdfSquare(uv, 0.07, vec2(0.1, 0));
  
	col = mix(vec3(0, 0, 1), col, step(0., circle));
	col = mix(vec3(1, 0, 0), col, step(0., square));
  
	return col;
}

void fragment() {

	vec2 uv = UV;
	uv.y=uv.y-0.5;
	uv.x=uv.x-0.5;

	vec3 col = drawScene(uv);

	// Output to screen
	COLOR = vec4(col,1.0);
}