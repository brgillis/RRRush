/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case PauseMenuOption.RESUME: case global.MENU_CANCEL: default:
	set_game_state(old_game_state);
	audio_resume_sound(game_music);
	instance_destroy();
	break;
case PauseMenuOption.RESTART:
	// Switch to level select menu
	obj_persistent.room_transition(TransMode.RESTART);
	break;
case PauseMenuOption.MAIN_MENU:
	// Switch to level select menu
	obj_persistent.room_transition(TransMode.GOTO, rm_title_menu);
	break;
case PauseMenuOption.QUIT:
	// Close the game
	game_end();
	break;
}