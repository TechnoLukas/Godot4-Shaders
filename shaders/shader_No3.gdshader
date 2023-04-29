//No03_WhiteCrossMouse

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//on shadertoy https://www.shadertoy.com/view/msdSW2

shader_type canvas_item;
uniform vec2 iMouse;
void fragment() {
	vec3 col = vec3(0,0,0);
	vec2 uv = UV;
	if ((uv.x <= iMouse.x+0.01)&&(uv.x >= iMouse.x-0.01)||(uv.y <= iMouse.y+0.01)&&(uv.y >= iMouse.y-0.01)){
		col=vec3(1);}
	COLOR = vec4(col,1.0);
}
