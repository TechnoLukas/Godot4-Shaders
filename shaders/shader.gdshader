//No01_CircleBlur

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links

shader_type canvas_item;

void fragment() {
	/*
	if (UV.x > 0.1)
		COLOR=vec4(vec3(1,1,1),1.);
	else
		COLOR=vec4(vec3(0,0,0),1.);*/
	

	//vec4 pixel_color = texture(TEXTURE, UV);
	//vec2 uv = FRAGCOORD.xy.xy/(1.0/SCREEN_PIXEL_SIZE).xy;
	//uv -=.5;
	//uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y;
	vec2 uv = UV;
	uv.y=uv.y-0.5;
	uv.x=uv.x-0.5;
	float d  = length(uv);
	float r = .3;
	float c = smoothstep(r,r-.1,d);
	COLOR=vec4(vec3(c),1.);
	
}