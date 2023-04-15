//No01_CircleBlur

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//on shadertoy https://www.shadertoy.com/view/mddSW2

shader_type canvas_item;
void fragment() {

	vec2 uv = FRAGCOORD.xy.xy/(1.0/SCREEN_PIXEL_SIZE).xy;

	uv -=.5;
	uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y;
	float d  = length(uv);
	float r = .3;

	float c = smoothstep(r,r-.1,d);

	//if (c<0.3) c = 0.; else c=1.;

	COLOR=vec4(vec3(c),1.);
}