//No08_RedSquareFlying

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//ported with https://github.com/jayaarrgh/shadertoy2godot (with some hand fixing)
//on shadertoy https://www.shadertoy.com/view/dddXW2

shader_type canvas_item;
vec2 rotate(vec2 uv, float th) {
  return mat2(vec2(cos(th), sin(th)),vec2(-sin(th), cos(th))) * uv;
}

vec3 sdfSquare(vec2 uv, float size, vec2 offset) {
  float x = uv.x - offset.x;
  float y = uv.y - offset.y;
  vec2 rotated = rotate(vec2(x,y), TIME);
  float d = max(abs(rotated.x), abs(rotated.y)) - size;
  
  return d > 0. ? vec3(1.) : vec3(1., 0., 0.);
}

void fragment() {

  vec2 uv = FRAGCOORD.xy/(1.0/SCREEN_PIXEL_SIZE).xy; // <0, 1>
  uv -= 0.5; // <-0.5,0.5>
  uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y; // fix aspect ratio

  vec2 offset = vec2(cos(TIME)*0.3, sin(2.0*TIME)*0.3);

  vec3 col = sdfSquare(uv, 0.2, offset);

  // Output to screen
  COLOR = vec4(col,1.0);
}