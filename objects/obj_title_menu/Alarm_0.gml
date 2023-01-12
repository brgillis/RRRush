/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case MainMenuOption.NEW_GAME: default:
	obj_persistent.world_index = WorldSelectOption.WORLD_1;
	obj_persistent.stage_index = 0;
	obj_persistent.room_transition(TransMode.GOTO, rm_w1_s1, obj_title_screen.title_music);
	break;
case MainMenuOption.CONTINUE:
	// TODO: Playroom for testing now
	obj_persistent.room_transition(TransMode.GOTO, rm_test_stage, obj_title_screen.title_music);
	break;
case MainMenuOption.LEVEL_SELECT:
	// Switch to level select menu
	instance_create_layer(0,0,"Instances",obj_level_select_menu);
	instance_destroy();
	break;
case MainMenuOption.CONTROLS:
	// Switch to controls menu
	instance_create_layer(0,0,"Instances",obj_controls_menu);
	instance_destroy();
	break;
case MainMenuOption.QUIT:
	// Close the game
	game_end();
	break;
}