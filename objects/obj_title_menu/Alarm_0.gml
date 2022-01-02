/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case MainMenuOption.NEW_GAME: default:
	room_transition(TransMode.GOTO, rm_w1_parent);
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