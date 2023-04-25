//No09_GradientWhiteBlack

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//ported with https://github.com/jayaarrgh/shadertoy2godot (with some hand fixing)
//on shadertoy https://www.shadertoy.com/view/dsdXW2

shader_type canvas_item;
void fragment() {

	vec2 uv = UV;
	uv.y=uv.y-0.5;
	uv.x=uv.x-0.5;

    float interpolatedValue = mix(0.25, 1., uv.y);
    vec3 col = vec3(interpolatedValue);

    // Output to screen
    COLOR = vec4(col,1.0);
}