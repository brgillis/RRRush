/// @description Control Menu

// Ease in the menu
back_alpha += (back_alpha_target - back_alpha) * menu_speed;
menu_x += (menu_x_target - menu_x) * menu_speed;
menu_y += (menu_y_target - menu_y) * menu_speed;

// Keyboard controls
if (menu_control)
{
	// Keep track of if the cursor moves at all, so we can later do common tasks if so
	var old_menu_cursor_x = menu_cursor_x;
	var old_menu_cursor_y = menu_cursor_y;
	
	if ((menu_cursor_y==global.MENU_NO_OPTION or menu_cursor_x==global.MENU_NO_OPTION) and
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
			menu_cursor_up();
		}
		if (key_repeat_down())
		{
			menu_cursor_down();
		}
		if (key_repeat_left())
		{
			menu_cursor_left();
		}
		if (key_repeat_right())
		{
			menu_cursor_right();
		}
		
		var is_confirming = key_pressed_confirm() and menu_cursor_y!=global.MENU_NO_OPTION
		var item = l_menu_rows[menu_cursor_y].l[menu_cursor_x];
	
		if (is_confirming and item.is_disabled)
		{
			// Give an error sound and disable control briefly
			audio_play_sound(snd_error, 0, false);
			menu_control = false;
			alarm_set(1, error_delay);
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
				menu_committed_x = global.MENU_CANCEL;
				menu_committed_y = global.MENU_CANCEL;	
			}
			
			// Play selection effects
			// ScreenShake(4,30);
			audio_play_sound(snd_menu_select, 0, false);
			
			// Disable menu control
			menu_control = false;
			
			// Set an alarm for when to execute selection
			alarm_set(0, commit_delay);
			
			// Set an alarm for any actions to take by children immediately
			alarm_set(3, 1);
		}
	}
	
	if ((menu_cursor_x!=old_menu_cursor_x) or (menu_cursor_y!=old_menu_cursor_y))
	{
		// Perform common tasks for when the cursor moves
		clamp_cursor();
		audio_play_sound(snd_cursor_move, 0, false);
	}
}