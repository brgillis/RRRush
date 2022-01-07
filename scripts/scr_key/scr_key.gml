function key_down_left()
{
	/// Checks if any key signaling left is held down
	return keyboard_check(vk_left) || keyboard_check(ord("A"));
}

function key_pressed_left()
{
	/// Checks if any key signaling left is held down
	return keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
}

function key_released_left()
{
	/// Checks if any key signaling left is released this frame
	return keyboard_check_released(vk_left) || keyboard_check_released(ord("A"));
}

function key_down_right()
{
	/// Checks if any key signaling right is held down
	return keyboard_check(vk_right) || keyboard_check(ord("D"));
}

function key_pressed_right()
{
	/// Checks if any key signaling right is held down
	return keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
}

function key_released_right()
{
	/// Checks if any key signaling right is released this frame
	return keyboard_check_released(vk_right) || keyboard_check_released(ord("D"));
}

function key_down_down()
{
	/// Checks if any key signaling down is held down
	return keyboard_check(vk_down) || keyboard_check(ord("S"));
}

function key_pressed_down()
{
	/// Checks if any key signaling down is held down
	return keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
}

function key_released_down()
{
	/// Checks if any key signaling down is released this frame
	return keyboard_check_released(vk_down) || keyboard_check_released(ord("S"));
}

function key_down_up()
{
	/// Checks if any key signaling up is held down
	return keyboard_check(vk_up) || keyboard_check(ord("W"));
}

function key_pressed_up()
{
	/// Checks if any key signaling up is held down
	return keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
}

function key_released_up()
{
	/// Checks if any key signaling up is released this frame
	return keyboard_check_released(vk_up) || keyboard_check_released(ord("W"));
}

function key_down_confirm()
{
	/// Checks if any key signaling confirm is held down
	return keyboard_check(vk_space) || keyboard_check(vk_enter) || mouse_check_button(mb_left);
}

function key_pressed_confirm()
{
	/// Checks if any key signaling confirm is held down
	return keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left);
}

function key_released_confirm()
{
	/// Checks if any key signaling confirm is released this frame
	return keyboard_check_released(vk_space) || keyboard_check_released(vk_enter) || mouse_check_button_released(mb_left);
}

function key_down_cancel()
{
	/// Checks if any key signaling cancel is held down
	return keyboard_check(vk_tab) || keyboard_check(vk_shift) || mouse_check_button(mb_right);
}

function key_pressed_cancel()
{
	/// Checks if any key signaling cancel is held down
	return keyboard_check_pressed(vk_tab) || keyboard_check_pressed(vk_shift) || mouse_check_button_pressed(mb_right);
}

function key_released_cancel()
{
	/// Checks if any key signaling cancel is released this frame
	return keyboard_check_released(vk_tab) || keyboard_check_released(vk_shift) || mouse_check_button_released(mb_right);
}

function key_down_pause()
{
	/// Checks if any key signaling pause is held down
	return keyboard_check(vk_return) || keyboard_check(ord("P")) || mouse_check_button(mb_middle);
}

function key_pressed_pause()
{
	/// Checks if any key signaling pause is held down
	return keyboard_check_pressed(vk_return) || keyboard_check_pressed(ord("P")) || mouse_check_button_pressed(mb_middle);
}

function key_released_pause()
{
	/// Checks if any key signaling pause is released this frame
	return keyboard_check_released(vk_return) || keyboard_check_released(ord("P")) || mouse_check_button_released(mb_middle);
}