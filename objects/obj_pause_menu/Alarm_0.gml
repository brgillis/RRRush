/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case PauseMenuOption.RESUME: case MENU_CANCEL: default:
	set_game_state(old_game_state);
	instance_destroy();
	break;
	// TODO: Implement Continue option
case PauseMenuOption.RESTART:
	// Switch to level select menu
	room_transition(TransMode.RESTART);
	break;
case PauseMenuOption.MAIN_MENU:
	// Switch to level select menu
	room_transition(TransMode.GOTO, rm_title_menu);
	break;
case PauseMenuOption.QUIT:
	// Close the game
	game_end();
	break;
}