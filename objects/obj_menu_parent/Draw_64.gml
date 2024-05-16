/// @description Draw Menu

// Draw the background

draw_set_color(back_color);
draw_set_alpha(back_alpha);
draw_rectangle(0,0,global.DISPLAY_WIDTH,global.DISPLAY_HEIGHT,false);
draw_set_alpha(1);

// Draw the menu options


for (var i = 0; i < menu_num_rows; i++)
{
	var row = l_menu_rows[i];
	var num_items = row.num_items;
	var num_labels = row.num_labels;
	
	for (var j = -num_labels; j < num_items; j++)
	{
		var align_shift = 0;
		if (j==-1) // If this is a label
		{
			var text = row.label;
			
			draw_set_halign(l_label_halign[i]);
			draw_set_valign(l_label_valign[i]);
			
			// Place labels close to items if they're right-aligned
			if (l_label_halign[i]==fa_right)
				var align_shift = 0.9
				
			var c_outline = l_c_label_outline[i];
			
			draw_set_font(l_label_font[i]);
			
			l_c_text = l_c_label;
		}
		else
		{
			var item = row.l[j];
			var text = item.text
			
			draw_set_halign(l_item_halign[i]);
			draw_set_valign(l_item_valign[i]);
			
			var c_outline = l_c_item_outline[i];
			
			draw_set_font(l_item_font[i]);
		
		
			if (menu_cursor_y == i and menu_cursor_x == j)
			{
				text = string_insert(sel_prefix, text, 0)
				text = string_insert(text, sel_suffix, 0)
		
				// Different color depending on if menu is currently controllable or not
				if (menu_control)
				{
					// Different color depending on if disabled or not
					if (not item.is_disabled)
					{
						l_c_text = l_c_text_sel;
					}
					else
					{
						l_c_text = l_c_text_dis_sel;
					}
				}
				else
				{
					// Different color depending on if disabled or not
					if (not item.is_disabled)
					{
						l_c_text = l_c_text_conf;
					}
					else
					{
						l_c_text = l_c_text_dis_sel;
					}
				}
			}
			else
			{		
				// Different color depending on if disabled or not
				if (not item.is_disabled)
				{
					l_c_text = l_c_text_unsel;
				}
				else
				{
					l_c_text = l_c_text_dis_unsel;
				}
			}
		}
		
		if (offset_labels)
			var label_offset = global_label_offset;
		else
			var label_offset = global_label_offset + num_labels - 1;
		
		var text_x = menu_x + (menu_item_width * (j + label_offset + align_shift));
		var text_y = menu_y - (menu_item_height * i * 1.5);
	
		// Draw the text with outline
		draw_text_color_outline(text_x, text_y, text, l_c_text, 1, 1, c_outline);
	}
	
}