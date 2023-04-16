//No06_RedSquare

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//on shadertoy https://www.shadertoy.com/view/dstXW2

shader_type canvas_item;
vec3 sdfSquare(vec2 uv, float size, vec2 offset) {
  float x = uv.x - offset.x;
  float y = uv.y - offset.y;
  float d = max(abs(x), abs(y)) - size;
  
  return d > 0. ? vec3(1.) : vec3(1., 0., 0.);
}


void fragment() {

  vec2 uv = FRAGCOORD.xy/(1.0/SCREEN_PIXEL_SIZE).xy; // <0, 1>
  uv -= 0.5; // <-0.5,0.5>
  uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y; // fix aspect ratio

  vec2 offset = vec2(0.0, 0.0);

  vec3 col = sdfSquare(uv, 0.2, offset);

  // Output to screen
  COLOR = vec4(col,1.0);
}