/// @description Draw Menu

draw_set_font(fnt_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_num_items; i++)
{
	var text = l_menu_options[i];
	if (menu_cursor == i)
	{
		text = string_insert("> ", text, 0)
		
		text_c1 = $0000B0;
		text_c2 = $0000B0;
		text_c3 = $000080;
		text_c4 = $000080;
	}
	else
	{
		text_c1 = $9090B0;
		text_c2 = $9090B0;
		text_c3 = $606080;
		text_c4 = $606080;
	}
	var text_x = menu_x;
	var text_y = menu_y - (menu_item_height * i * 1.5);
	
	// Draw the text with outline
	draw_text_color_outline(text_x, text_y, text,
				    text_c1,
					text_c2,
					text_c3,
					text_c4,
					1);
	
}