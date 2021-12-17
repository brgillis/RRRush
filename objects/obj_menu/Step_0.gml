/// @description Control Menu

// Ease in the menu
menu_x += (menu_x_target - menu_x) / menu_speed;
menu_y += (menu_y_target - menu_y) / menu_speed;

// Keyboard controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_num_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor <0) menu_cursor = menu_num_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		// Move the menu back off the screen
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		// ScreenShake(4,30);
		menu_control = false; // Disable menu control
	}
}

// Execute choice once menu is off the screen
if (menu_x > gui_width+150) and (menu_committed != MainMenuOption.NONE)
{
	switch (menu_committed)
	{
	case MainMenuOption.NEW_GAME: default:
		// TODO: Start new game
		break;
	case MainMenuOption.CONTINUE:
		// TODO: Continue game
		break;
	case MainMenuOption.LEVEL_SELECT:
		// TODO: Level select
		break;
	case MainMenuOption.QUIT:
		// Close the game
		game_end();
		break;
	}
}