/// @description Control Menu

// Post-creation init tasks, if not already done
if (not init_finalized)
{
	menu_x = menu_x_start;
	menu_y = menu_y_start;
	menu_x_target = menu_x_end;
	menu_y_target = menu_y_end;

	menu_num_items = array_length_1d(l_menu_options);
	
	menu_item_height = font_get_size(menu_font);
	
	init_finalized = true;
}

// Ease in the menu
menu_x += (menu_x_target - menu_x) * menu_speed;
menu_y += (menu_y_target - menu_y) * menu_speed;

// Keyboard controls
if (menu_control)
{
	if (menu_cursor==MENU_NO_OPTION)
	{
		if (key_pressed_up())
		{
			menu_cursor = menu_num_items-1;
		}
		if (key_pressed_down())
		{
			menu_cursor = menu_num_items-2;
		}
	}
	else
	{
		if (key_pressed_up())
		{
			menu_cursor++;
			if (menu_cursor >= menu_num_items) menu_cursor = 0;
		}
		if (key_pressed_down())
		{
			menu_cursor--;
			if (menu_cursor < 0) menu_cursor = menu_num_items-1;
		}
	
		if (key_pressed_confirm() and menu_cursor!=MENU_NO_OPTION)
		{
			// Move the menu back off the screen
			menu_x_target = global.display_width+200;
			menu_committed = menu_cursor;
			// ScreenShake(4,30);
			menu_control = false; // Disable menu control
			alarm_set(0,commit_delay);
		}
	}
}