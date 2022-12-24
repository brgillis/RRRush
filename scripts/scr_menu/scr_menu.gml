/// Constants, functions, and other utilities related to menus

/// Constants

// Value to indicate no option is selected
global.MENU_NO_OPTION = -1;

// Value to indicate the user cancelled out of the menu
global.MENU_CANCEL = -2;

/// Functions

function item_enabled(i, j) {
	// If j is -1, this is a label, so it's always enabled
	if(j==-1)
		return true;
	// If the array is of length zero, then no options have been set up to be disabled, hence this item is enabled
	if(array_length(ll_disabled_options)==0)
		return true;
	return not ll_disabled_options[i][j];
}

function get_row_label(i) {
	// If the array is of length zero, no rows have labels, so return 0 indicating this
	if(array_length(l_row_labels)==0)
		return false;
	else if is_string(l_row_labels[i])
		return l_row_labels[i];
	else
		return false;
}

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