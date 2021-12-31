/// @description Draw Menu

draw_set_font(menu_font);
draw_set_halign(halign);
draw_set_valign(valign);

for (var i = 0; i < menu_num_items; i++)
{
	var text = l_menu_options[i];
	if (menu_cursor == i)
	{
		text = string_insert(sel_prefix, text, 0)
		text = string_insert(text, sel_suffix, 0)
		
		text_c1 = text_sel_c1;
		text_c2 = text_sel_c2;
		text_c3 = text_sel_c3;
		text_c4 = text_sel_c4;
	}
	else
	{		
		text_c1 = text_unsel_c1;
		text_c2 = text_unsel_c2;
		text_c3 = text_unsel_c3;
		text_c4 = text_unsel_c4;
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