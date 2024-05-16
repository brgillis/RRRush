/// @description Draw text

// Determine the vertical offset of the text based on the image index
switch (image_index)
{
case 0:
case 1:
	y_offset = 0;
	break;
case 2:
case 3:
	y_offset = 4;
	break;
}

draw_self();

draw_set_font(fnt_gui_button);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_color(x + 0, y + y_offset, string(text),
			    text_c1,
				text_c2,
				text_c3,
				text_c4,
				1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);