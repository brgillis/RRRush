/// @description Control Menu

// Post-creation init tasks, if not already done
if (not init_finalized)
{
	menu_cursor_x = init_selected_x;
	menu_cursor_y = init_selected_y;
	
	back_alpha = back_alpha_start;
	menu_x = menu_x_start;
	menu_y = menu_y_start;
	
	back_alpha_target = back_alpha_end;
	menu_x_target = menu_x_end;
	menu_y_target = menu_y_end;

	menu_num_rows = array_length(ll_menu_options);
	global_label_offset = 0;
	for (var i = menu_num_rows-1; i >= 0; i--)
	{
		l_menu_num_cols[i] = array_length(ll_menu_options[i]);
		row_label = get_row_label(i)
		if (is_string(row_label))
		{
			l_menu_num_labels[i] = 1;
			// If at least one row has a label, offset all columns by one to allow room for a label column
			global_label_offset = 1;
		}
		else
		{
			l_menu_num_labels[i] = 0;
		}
	}
	
	menu_item_height = font_get_size(menu_font);
	
	init_finalized = true;
}

// Ease in the menu
back_alpha += (back_alpha_target - back_alpha) * menu_speed;
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
	
	if ((menu_cursor_y==MENU_NO_OPTION or menu_cursor_x==MENU_NO_OPTION) and
	    not (key_pressed_cancel() and allow_cancel))
	{
		if (key_repeat_up() or key_repeat_down() or key_repeat_left() or key_repeat_right() or
		    key_pressed_confirm())
		{
			menu_cursor_y = menu_num_rows-1;
			menu_cursor_x = 0;
		}
	}
	else
	{
		if (key_repeat_up())
		{
			menu_cursor_y++;
			if (menu_cursor_y >= menu_num_rows)
			{
				// Only wrap on key press, not repeat
				if (key_pressed_up())
					menu_cursor_y = 0;
				else
					menu_cursor_y--;
			}
		}
		if (key_repeat_down())
		{
			menu_cursor_y--;
			if (menu_cursor_y < 0)
			{
				// Only wrap on key press, not repeat
				if (key_pressed_down())
					menu_cursor_y = menu_num_rows-1;
				else
					menu_cursor_y++;
			}
		}
		if (key_repeat_left())
		{
			menu_cursor_x--;
			if (menu_cursor_x < 0)
			{
				// Only wrap on key press, not repeat
				if (key_pressed_left())
					menu_cursor_x = l_menu_num_cols[menu_cursor_y]-1;
				else
					menu_cursor_x++;
			}
		}
		if (key_repeat_right())
		{
			menu_cursor_x++;
			if (menu_cursor_x >= l_menu_num_cols[menu_cursor_y])
			{
				// Only wrap on key press, not repeat
				if (key_pressed_right())
					menu_cursor_x = 0;
				else
					menu_cursor_x--;
			}
		}
		
		is_confirming = key_pressed_confirm() and menu_cursor_y!=MENU_NO_OPTION
	
		if (is_confirming and not item_enabled(menu_cursor_y, menu_cursor_x))
		{
			// Give an error sound and disable control briefly
			audio_play_sound(snd_error, 0, false);
			menu_control = false;
			alarm_set(1,error_delay);
		}
		else if (is_confirming or (key_pressed_cancel() and allow_cancel))
		{
			// Move the menu back to its start position
			back_alpha_target = back_alpha_start;
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
			audio_play_sound(snd_menu_select, 0, false);
			
			// Disable menu control
			menu_control = false;
			
			// Set an alarm for when to execute selection
			alarm_set(0, commit_delay);
		}
	}
	
	if ((menu_cursor_x!=old_menu_cursor_x) or (menu_cursor_y!=old_menu_cursor_y))
	{
		// Perform common tasks for when the cursor moves
		clamp_cursor();
		audio_play_sound(snd_cursor_move, 0, false);
	}
}