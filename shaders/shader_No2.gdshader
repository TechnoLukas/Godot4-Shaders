//No02_WhiteRectMouse

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//on shadertoy https://www.shadertoy.com/view/dsdSW2

shader_type canvas_item;

uniform vec2 iMouse;

void fragment() {
	vec2 uv = UV;
	if(uv.x>iMouse.x && uv.y<iMouse.y)
		COLOR=vec4(1.,1.,1.,1.);
	else
		COLOR=vec4(0.,0.,0.,1.);
}