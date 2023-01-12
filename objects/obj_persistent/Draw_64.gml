/// @description Draw black fade over screen

if (mode != TransMode.OFF)
{
	// Draw a black rectangle over the screen, with alpha set to percent
    draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0,0,global.DISPLAY_WIDTH,global.DISPLAY_HEIGHT,false);
	draw_set_alpha(1);
}
