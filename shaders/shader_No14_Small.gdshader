//No14_GradientMergedShapes

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//ported with https://github.com/jayaarrgh/shadertoy2godot (with some hand fixing)
//on shadertoy https://www.shadertoy.com/view/mddSD2

shader_type canvas_item;
vec3 getBackgroundColor(vec2 uv) {
	uv = uv * 0.5 + 0.5; // remap uv from <-0.5,0.5> to <0.25,0.75>
	vec3 gradientStartColor = vec3(1., 0., 1.);
	vec3 gradientEndColor = vec3(0., 1., 1.);
	return mix(gradientStartColor, gradientEndColor, uv.y); // gradient goes from bottom to top
}

float sdCircle(vec2 uv, float r, vec2 offset) {
	float x = uv.x - offset.x;
	float y = uv.y - offset.y;

	return length(vec2(x, y)) - r;
}

float sdSquare(vec2 uv, float size, vec2 offset) {
	float x = uv.x - offset.x;
	float y = uv.y - offset.y;

	return max(abs(x), abs(y)) - size;
}

vec3 drawScene(vec2 uv) {
	vec3 col = getBackgroundColor(uv);
	float d1 = sdCircle(uv, 0.2, vec2(0., 0.));
	float d2 = sdSquare(uv, 0.2, vec2(0.2, 0));

	float res; // result
	res = min(d1, d2); // union

	res = step(0., res); // Same as res > 0. ? 1. : 0.;

	col = mix(vec3(1,0,0), col, res);
	return col;
}

void fragment() {

	vec2 uv = UV;
	uv.y=uv.y-0.5;
	uv.x=uv.x-0.5;

	vec3 col = drawScene(uv);

	COLOR = vec4(col,1.0); // Output to screen
}