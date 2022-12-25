/// Constants, functions, and other utilities related to menus

/// Structs

function MenuItem(_text, _is_disabled = false) constructor {
	text = _text;
	is_disabled = _is_disabled;
}

function MenuRow(_l = [], _label = false, _is_selectable = true) constructor {
	
	if (not is_array(_l))
	{
		if (is_string(_l))
			_l = new MenuItem(_l);
		l = [_l];
	}
	else
	{
		l = _l;
	}
	
	label = _label;
	is_selectable = _is_selectable;
	
	num_items = array_length(l);
	
	if is_string(label)
		num_labels =  1;
	else
		num_labels =  0;
}

/// Constants

// Value to indicate no option is selected
global.MENU_NO_OPTION = -1;

// Value to indicate the user cancelled out of the menu
global.MENU_CANCEL = -2;

/// Functions

function key_repeat(key_pressed, key_down) {
	if (key_pressed())
	{
		// Key has just been pressed, so set up for first repeat
		alarm_set(2, repeat_delay_first);
		allow_repeat_down = false;
		return true;
	}
	else if (key_down() and allow_repeat_down)
	{
		// Key is still held down after long enough to repeat	
		alarm_set(2, repeat_delay_after);
		allow_repeat_down = false;
		return true;
	}
}

function key_repeat_up() {
	return key_repeat(key_pressed_up, key_down_up);
}
function key_repeat_down() {
	return key_repeat(key_pressed_down, key_down_down);
}
function key_repeat_left() {
	return key_repeat(key_pressed_left, key_down_left);
}
function key_repeat_right() {
	return key_repeat(key_pressed_right, key_down_right);
}

function clamp_cursor_x() {
	/// Makes sure the menu cursor's x position is a valid value
	if (menu_cursor_x >= l_menu_rows[menu_cursor_y].num_items) menu_cursor_x = l_menu_rows[menu_cursor_y].num_items-1;
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

function menu_cursor_up() {
	menu_cursor_y++;
	if (menu_cursor_y >= menu_num_rows)
	{
		// Only wrap on key press, not repeat
		if (key_pressed_up())
			menu_cursor_y = 0;
		else
			menu_cursor_y--;
	}
	// If we've moved to an unselectable row, repeat until we reach a selectable row
	if (not l_menu_rows[menu_cursor_y].is_selectable)
		menu_cursor_up()
}

function menu_cursor_down() {
	menu_cursor_y--;
	if (menu_cursor_y < 0)
	{
		// Only wrap on key press, not repeat
		if (key_pressed_down())
			menu_cursor_y = menu_num_rows-1;
		else
			menu_cursor_y++;
	}
	// If we've moved to an unselectable row, repeat until we reach a selectable row
	if (not l_menu_rows[menu_cursor_y].is_selectable)
		menu_cursor_down()
}

function menu_cursor_left() {
	menu_cursor_x--;
	if (menu_cursor_x < 0)
	{
		// Only wrap on key press, not repeat
		if (key_pressed_left())
			menu_cursor_x = l_menu_rows[menu_cursor_y].num_items-1;
		else
			menu_cursor_x++;
	}
}

function menu_cursor_right() {
	menu_cursor_x++;
	if (menu_cursor_x >= l_menu_rows[menu_cursor_y].num_items)
	{
		// Only wrap on key press, not repeat
		if (key_pressed_right())
			menu_cursor_x = 0;
		else
			menu_cursor_x--;
	}
}