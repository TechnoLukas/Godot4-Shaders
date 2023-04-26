//No10_GradientChanging

//based on https://inspirnathan.com/posts/47-shadertoy-tutorial-part-1/
//see more info about shaders here --> https://github.com/TechnoLukas/My-favourite-shaders-links
//ported with https://github.com/jayaarrgh/shadertoy2godot (with some hand fixing)
//on shadertoy https://www.shadertoy.com/view/msdXW2

shader_type canvas_item;
vec3 getBackgroundColor(vec2 uv) {
    uv += 0.5; // remap uv from <-0.5,0.5> to <0,1>
    vec3 gradientStartColor = vec3(1., 0., cos(TIME));
    vec3 gradientEndColor = vec3(0., sin(TIME), 1.);
    return mix(gradientStartColor, gradientEndColor, uv.y); // gradient goes from bottom to top
}

void fragment() {

    vec2 uv = FRAGCOORD.xy/(1.0/SCREEN_PIXEL_SIZE).xy; // <0, 1>
    uv -= 0.5; // <-0.5,0.5>
    uv.x *= (1.0/SCREEN_PIXEL_SIZE).x/(1.0/SCREEN_PIXEL_SIZE).y; // fix aspect ratio

    vec3 col = getBackgroundColor(uv);

    // Output to screen
    COLOR = vec4(col,1.0);
}
