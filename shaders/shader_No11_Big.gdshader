//No10_GradientChanging

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//ported with https://github.com/jayaarrgh/shadertoy2godot (with some hand fixing)
//on shadertoy https://www.shadertoy.com/view/ddtSD2

shader_type canvas_item;
//No11_BlueCircle
float sdfCircle(vec2 uv, float r, vec2 offset) {
	float x = uv.x - offset.x;
	float y = uv.y - offset.y;

	return length(vec2(x, y)) - r;
}

vec3 drawScene(vec2 uv) {
	vec3 col = vec3(1);
	float circle = sdfCircle(uv, 0.1, vec2(0, 0));
  
	col = mix(vec3(0, 0, 1), col, step(0., circle));
  
	return col;
}

void fragment() {

	vec2 uv = FRAGCOORD.xy/(1.0/SCREEN_PIXEL_SIZE).xy; // <0, 1>
	uv -= 0.5; // <-0.5,0.5>
	uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y; // fix aspect ratio

	vec3 col = drawScene(uv);

	// Output to screen
	COLOR = vec4(col,1.0);
}