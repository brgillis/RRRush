/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case MainMenuOption.NEW_GAME: case MainMenuOption.CONTINUE: default:
	room_transition(TransMode.GOTO, rm_w1_parent);
	break;
	// TODO: Implement Continue option
case MainMenuOption.LEVEL_SELECT:
	// Switch to level select menu
	instance_create_layer(0,0,"Instances",obj_level_select_menu);
	instance_destroy();
	break;
case MainMenuOption.QUIT:
	// Close the game
	game_end();
	break;
}