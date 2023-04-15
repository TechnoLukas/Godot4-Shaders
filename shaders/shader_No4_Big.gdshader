//No04_ColorCirclePop

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//on shadertoy https://www.shadertoy.com/view/ddtXW2

shader_type canvas_item;
vec3 sdfCircle(vec2 uv, float r) {
    float x = uv.x;
    float y = uv.y;
    
    float d = length(vec2(x, y)) - r;
    
    return d > 0. ? vec3(0.) : 0.5 + 0.5 * cos(TIME + uv.xyx + vec3(0,2,4));
}

void fragment() {

  vec2 uv = FRAGCOORD.xy/(1.0/SCREEN_PIXEL_SIZE).xy; // <0,1>
  uv-=0.5;
  uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y; // fix aspect ratio
  vec3 col = sdfCircle(uv, abs(cos(TIME)*0.5)); // Call this function on each pixel to check if the coordinate lies inside or outside of the circle

  // Output to screen
  COLOR = vec4(col,1.0);
}