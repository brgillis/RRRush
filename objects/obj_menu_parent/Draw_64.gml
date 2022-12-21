/// @description Draw Menu

// Don't draw until initialization is finalized
if (not init_finalized)
{
	return;
}

// Draw the background

draw_set_color(back_color);
draw_set_alpha(back_alpha);
draw_rectangle(0,0,global.display_width,global.display_height,false);
draw_set_alpha(1);

// Draw the menu options

draw_set_font(menu_font);
draw_set_halign(halign);
draw_set_valign(valign);

for (var i = 0; i < menu_num_rows; i++)
{
	for (var j = 0; j < l_menu_num_cols[i]; j++)
	{
		var text = ll_menu_options[i][j];
		if (menu_cursor_y == i and menu_cursor_x == j)
		{
			text = string_insert(sel_prefix, text, 0)
			text = string_insert(text, sel_suffix, 0)
		
			// Different color depending on if menu is currently controllable or not
			if (menu_control)
			{
				// Different color depending on if disabled or not
				if (item_enabled(i, j))
				{
					text_c1 = text_sel_c1;
					text_c2 = text_sel_c2;
					text_c3 = text_sel_c3;
					text_c4 = text_sel_c4;
				}
				else
				{
					text_c1 = text_dis_sel_c1;
					text_c2 = text_dis_sel_c2;
					text_c3 = text_dis_sel_c3;
					text_c4 = text_dis_sel_c4;
				}
			}
			else
			{
				// Different color depending on if disabled or not
				if (item_enabled(i, j))
				{
					text_c1 = text_com_c1;
					text_c2 = text_com_c2;
					text_c3 = text_com_c3;
					text_c4 = text_com_c4;
				}
				else
				{
					text_c1 = text_dis_sel_c1;
					text_c2 = text_dis_sel_c2;
					text_c3 = text_dis_sel_c3;
					text_c4 = text_dis_sel_c4;
				}
			}
		}
		else
		{		
			// Different color depending on if disabled or not
			if (item_enabled(i, j))
			{
				text_c1 = text_unsel_c1;
				text_c2 = text_unsel_c2;
				text_c3 = text_unsel_c3;
				text_c4 = text_unsel_c4;
			}
			else
			{
				text_c1 = text_dis_unsel_c1;
				text_c2 = text_dis_unsel_c2;
				text_c3 = text_dis_unsel_c3;
				text_c4 = text_dis_unsel_c4;
			}
		}
		var text_x = menu_x + (menu_item_width * j);
		var text_y = menu_y - (menu_item_height * i * 1.5);
	
		// Draw the text with outline
		draw_text_color_outline(text_x, text_y, text,
					    text_c1,
						text_c2,
						text_c3,
						text_c4,
						1);
	}
	
}