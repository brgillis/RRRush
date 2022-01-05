/// @description Control Menu

// Post-creation init tasks, if not already done
if (not init_finalized)
{
	menu_x = menu_x_start;
	menu_y = menu_y_start;
	menu_x_target = menu_x_end;
	menu_y_target = menu_y_end;

	menu_num_rows = array_length_1d(ll_menu_options);
	for (var i = menu_num_rows-1; i >= 0; i--)
	{
		l_menu_num_cols[i] = array_length_1d(ll_menu_options[i]);
	}
	
	menu_item_height = font_get_size(menu_font);
	
	init_finalized = true;
}

// Ease in the menu
menu_x += (menu_x_target - menu_x) * menu_speed;
menu_y += (menu_y_target - menu_y) * menu_speed;

function clamp_cursor_x() {
	/// Makes sure the menu cursor's x position is a valid value
	if (menu_cursor_x >= l_menu_num_cols[menu_cursor_y]) menu_cursor_x = l_menu_num_cols[menu_cursor_y]-1;
	if (menu_cursor_x < 0) menu_cursor_x = 0;
}

function clamp_cursor_y() {
	/// Makes sure the menu cursor's y position is a valid value
	if (menu_cursor_y >= menu_num_rows) menu_cursor_y = menu_num_rows-1;
	if (menu_cursor_y < 0) menu_cursor_y = 0;
}

function clamp_cursor() {
	/// Makes sure the menu cursor's x and y positions are valid values
	clamp_cursor_y();
	clamp_cursor_x();
}

// Keyboard controls
if (menu_control)
{
	// Keep track of if the cursor moves at all, so we can later do common tasks if so
	var old_menu_cursor_x = menu_cursor_x;
	var old_menu_cursor_y = menu_cursor_y;
	
	if (menu_cursor_y==MENU_NO_OPTION or menu_cursor_x==MENU_NO_OPTION) and not (key_pressed_cancel() and allow_cancel)
	{
		if (key_pressed_up() or key_pressed_left() or key_pressed_confirm())
		{
			menu_cursor_y = menu_num_rows-1;
			menu_cursor_x = 0;
		}
		if (key_pressed_down())
		{
			menu_cursor_y = menu_num_rows-2;
			menu_cursor_x = 0;
		}
		if (key_pressed_right())
		{
			menu_cursor_y = menu_num_rows-1;
			menu_cursor_x = 1;
		}
	}
	else
	{
		if (key_pressed_up())
		{
			menu_cursor_y++;
			if (menu_cursor_y >= menu_num_rows) menu_cursor_y = 0;
		}
		if (key_pressed_down())
		{
			menu_cursor_y--;
			if (menu_cursor_y < 0) menu_cursor_y = menu_num_rows-1;
		}
		if (key_pressed_left())
		{
			menu_cursor_x--;
			if (menu_cursor_x < 0) menu_cursor_x = l_menu_num_cols[menu_cursor_y]-1;
		}
		if (key_pressed_right())
		{
			menu_cursor_x++;
			if (menu_cursor_x >= l_menu_num_cols[menu_cursor_y]) menu_cursor_x = 0;
		}
	
		if (key_pressed_confirm() and menu_cursor_y!=MENU_NO_OPTION) or (key_pressed_cancel() and allow_cancel)
		{
			// Move the menu back to its start position
			menu_x_target = menu_x_start;
			menu_y_target = menu_y_start;
			
			// Note the selected item if confirm, or that we cancelled
			if key_pressed_confirm()
			{
				menu_committed_x = menu_cursor_x;
				menu_committed_y = menu_cursor_y;
			}
			else
			{
				menu_committed_x = MENU_CANCEL;
				menu_committed_y = MENU_CANCEL;	
			}
			
			// Play selection effects
			// ScreenShake(4,30);
			audio_play_sound(snd_menu_select,0,false);
			
			// Disable menu control
			menu_control = false;
			
			// Set an alarm for when to execute selection
			alarm_set(0,commit_delay);
		}
	}
	
	if ((menu_cursor_x!=old_menu_cursor_x) or (menu_cursor_y!=old_menu_cursor_y))
	{
		// Perform common tasks for when the cursor moves
		clamp_cursor();
		audio_play_sound(snd_cursor_move,0,false);
	}
}